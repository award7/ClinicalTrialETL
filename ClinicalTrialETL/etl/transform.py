import pandas as pd
import numpy as np
import os
from datetime import datetime
from ClinicalTrialETL.etl.utils import get_default_staging_location
from numpy import nan
from math import log
import abc


class BaseCleaner(metaclass=abc.ABCMeta):
    def __init__(self):
        self.df = None

    def to_int(self, cols: list) -> None:
        self.df[cols] = self.df[cols].fillna(0.0).astype(int)

    def to_float(self, cols: list) -> None:
        self.df[cols] = self.df[cols].apply(pd.to_numeric, downcast='float', errors='coerce')

    def to_str(self, cols: list) -> None:
        self.df[cols] = self.df[cols].astype(str)

    def to_title_case(self, cols: list) -> None:
        self.df[cols] = self.df[cols].str.title()

    def to_sentence_case(self, cols: list) -> None:
        self.df[cols] = self.df[cols].str.capitalize()

    def to_lower_case(self, cols: list) -> None:
        self.df[cols] = self.df[cols].str.lower()

    def to_upper_case(self, cols: list) -> None:
        self.df[cols] = self.df[cols].str.upper()

    def to_datetime(self, cols: list, date_format: str = '%m/%d/%Y') -> None:
        self.df[cols] = self.df[cols].apply(pd.to_datetime)
        # self.df[cols] = self.df[cols].dt.strftime(date_format)

    def fill_na(self) -> None:
        """
        replace blank entries with nan
        """
        self.df = self.df.replace(r'^\s*$', nan, regex=True)

    def str2na(self) -> None:
        """
        replace user-input variations of nan with nan
        :return: None
        """

        self.df = self.df.replace(r'^[nN]\W?[aA]$', nan, regex=True)

    def get_columns(self, substring: str) -> list:
        """
        return all columns with a given substring

        :param df:
        :param substring:
        :return:
        """
        return [col for col in self.df.columns.to_list() if substring in col]

    def transform_subject_id(self) -> None:
        # make standardized study id
        col = 'record_id'
        if not pd.api.types.is_string_dtype(self.df[col]):
            self.df[col] = self.df[col].astype(str)
        self.df[col] = self.df[col].apply('0361_{:0>4}'.format)
        self.df.rename(columns={col: 'subject_id'}, inplace=True)

    @abc.abstractmethod
    def df2csv(self) -> None:
        return

    @abc.abstractmethod
    def csv2df(self) -> None:
        return

    @staticmethod
    @abc.abstractmethod
    def get_persistent_columns() -> None:
        return

    # todo: add validations


class CleanDemographicsData(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        """
        Clean and process demographics data

        :param args:
        :param kwargs: keyword arguments
        :return: None
        """

        # read df
        self.csv2df(**kwargs)

        # replace blank entries with nan
        self.fill_na()

        # replace user-input variations of nan with nan
        self.str2na()

        # apply transforms
        self.transform_subject_id()
        self.transform_age()
        self.transform_sex()
        self.transform_race()
        self.transform_ethnicity()

        # keep only necessary columns
        cols = self.get_persistent_columns()
        self.df = self.df.filter(cols)

        # write cleaned data to proc location
        self.df2csv(**kwargs)

        ti = kwargs['ti']
        path = ti.xcom_pull(key='staging_location', task_ids='initialization.set-proc-staging-location')
        file_name = kwargs['proc_file_name']
        return os.path.join(path, file_name)

    def df2csv(self, **kwargs) -> None:
        # pass the keys and task_ids as kwargs
        # todo: set the key and task_ids variables
        ti = kwargs['ti']
        path = ti.xcom_pull(key='staging_location', task_ids='initialization.set-proc-staging-location')
        file_name = kwargs['proc_file_name']
        self.df.to_csv(os.path.join(path, file_name), index=False)

    def csv2df(self, **kwargs) -> None:
        # pass the keys and task_ids as kwargs
        ti = kwargs['ti']
        path = ti.xcom_pull(key='staging_location', task_ids=kwargs['raw_task_id'])
        file_name = ti.xcom_pull(key='file', task_ids=kwargs['raw_task_id'])
        self.df = pd.read_csv(os.path.join(path, file_name))

    def transform_age(self) -> None:
        self.df.rename(columns={'age_scr_data': 'age'}, inplace=True)

    def transform_race(self) -> None:
        # for some unknown reason, the REDCap API returns values for checkbox fields for each record regardless if the
        # record has no other data for that form. To join the data, we need to get the indexes of records that completed
        # the `_survey` and place the associated values in the `_demo` field
        self.df.loc[self.df['demographics_survey_complete'] == 2, 'race2_demo___0'] = self.df['race2_demo_survey___0']
        self.df.loc[self.df['demographics_survey_complete'] == 2, 'race2_demo___1'] = self.df['race2_demo_survey___1']
        self.df.loc[self.df['demographics_survey_complete'] == 2, 'race2_demo___2'] = self.df['race2_demo_survey___2']
        self.df.loc[self.df['demographics_survey_complete'] == 2, 'race2_demo___3'] = self.df['race2_demo_survey___3']
        self.df.loc[self.df['demographics_survey_complete'] == 2, 'race2_demo___4'] = self.df['race2_demo_survey___4']
        self.df.loc[self.df['demographics_survey_complete'] == 2, 'race2_demo___99'] = self.df['race2_demo_survey___99']
        self.map_race()

    def transform_dob(self) -> None:
        conditions = [~pd.isna(self.df['birth_date_demo']), ~pd.isna(self.df['birth_date_demo_survey'])]
        self.df['dob'] = np.select(conditions, [self.df['birth_date_demo'], self.df['birth_date_demo_survey']])
        self.df['dob'] = self.df['dob'].apply(pd.to_datetime)

    def transform_ethnicity(self) -> None:
        # since we are combining alike data from two forms, we will fill in the data for one form from the other form
        self.df['ethnicity2_demo'].fillna(self.df['ethnicity2_demo_survey'], inplace=True)
        self.map_ethnicity()

    def transform_sex(self) -> None:
        # since we are combining alike data from two forms, we will fill in the data for one form from the other form
        self.df['gender_demo'].fillna(self.df['gender_demo_survey'], inplace=True)
        self.map_sex()

    def transform_zip_code(self) -> None:
        conditions = [~pd.isna(self.df['zip2_demo']), ~pd.isna(self.df['zip2_demo_survey'])]
        self.df['zip_code'] = np.select(conditions, [self.df['zip2_demo'], self.df['zip2_demo_survey']])
        self.df['zip_code'] = self.df['zip_code'].astype(str)
        self.df['zip_code'] = self.df['zip_code'].str[0:5]

    @staticmethod
    def get_persistent_columns(**kwargs) -> list:
        # these are the columns remaining following processing
        return [
            # 'record_id',
            'subject_id',
            'age',
            'sex',
            'race',
            'ethnicity'
            # 'zip_code'
        ]

    @staticmethod
    def get_race_mapping() -> dict:
        return {
            0: 'American Indian or Alaska Native',
            1: 'Asian',
            2: 'Black or African American',
            3: 'Native Hawaiian or Other Pacific Islander',
            4: 'White or Caucasian',
            99: 'Unknown or Not Reported',
            100: 'Multiracial'
        }

    def map_race(self):
        mapping = self.get_race_mapping()
        # sum the values for the race fields. If >1, then that indicates `Multiracial`
        cols = [
            'race2_demo___0',
            'race2_demo___1',
            'race2_demo___2',
            'race2_demo___3',
            'race2_demo___4',
            'race2_demo___99'
        ]
        self.df['race_tally'] = self.df[cols].sum(axis=1)
        self.df.loc[self.df['race_tally'] > 1, 'race2_demo___100'] = 1
        conditions = [
            self.df['race2_demo___0'].eq(1),
            self.df['race2_demo___1'].eq(1),
            self.df['race2_demo___2'].eq(1),
            self.df['race2_demo___3'].eq(1),
            self.df['race2_demo___4'].eq(1),
            self.df['race2_demo___99'].eq(1),
            self.df['race2_demo___100'].eq(1)
        ]

        # if a record is indicated as multiracial, then set the other race fields to 0
        self.df.loc[
            self.df['race_tally'] > 1, ['race2_demo___0',
                                        'race2_demo___1',
                                        'race2_demo___2',
                                        'race2_demo___3',
                                        'race2_demo___4',
                                        'race2_demo___99'
                                        ]
        ] = 0

        # `map` the value to the race
        self.df['race'] = np.select(conditions, mapping.values(), default=np.nan)

    @staticmethod
    def get_sex_mapping() -> dict:
        return {
            0: 'Male',
            1: 'Female'
        }

    def map_sex(self):
        mapping = self.get_sex_mapping()
        self.df['sex'] = self.df['gender_demo'].map(mapping)

    @staticmethod
    def get_ethnicity_mapping() -> dict:
        return {
            0: 'Hispanic',
            1: 'Non-Hispanic',
            99: 'Unknown or Not Reported'
        }

    def map_ethnicity(self):
        mapping = self.get_ethnicity_mapping()
        self.df['ethnicity'] = self.df['ethnicity2_demo'].map(mapping)


class CleanBmiGrowthChart(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        self.csv2df()
        self.delete_extra_header_row()

        # type casting
        float_cols = self.get_float_columns()
        self.to_float(float_cols)
        int_cols = self.get_int_columns(float_cols)
        self.to_int(int_cols)

        # map sexes
        self.map_sexes()

        return self.df

    def csv2df(self) -> None:
        self.df = pd.read_csv('https://www.cdc.gov/growthcharts/data/zscore/bmiagerev.csv')

    def df2csv(self) -> None:
        return

    @staticmethod
    def get_persistent_columns(**kwargs) -> None:
        return

    def delete_extra_header_row(self) -> None:
        # there's a row of headers to denote the different sex. Remove it
        idx = 219
        self.df.drop(idx, axis=0, inplace=True)

    @staticmethod
    def get_sex_mapping() -> dict:
        return {
            1: 'Male',
            2: 'Female'
        }

    def map_sexes(self) -> None:
        mapping = self.get_sex_mapping()
        self.df['Sex_'] = self.df['Sex'].map(mapping)
        self.df['Sex'] = self.df['Sex_']
        self.df.drop('Sex_', axis=1, inplace=True)

    def get_float_columns(self) -> list:
        to_ignore = ['Sex']
        return [col for col in self.df.columns.to_list() if col not in to_ignore]

    def get_int_columns(self, float_cols: list) -> list:
        return [col for col in self.df.columns.to_list() if col not in float_cols]


class CleanZScoreTable(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        self.csv2df()
        self.df.dropna(inplace=True)

    def csv2df(self):
        self.df = pd.read_excel('https://statpage.sandiego.edu', skiprows=5)

    def df2csv(self) -> None:
        return

    @staticmethod
    def get_persistent_columns(**kwargs) -> None:
        return

    def delete_extra_header_row(self):
        idx = 56
        self.df.drop(idx, inplace=True)


class CleanScreeningData(BaseCleaner):
    def __init__(self, *args, **kwargs):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        self.csv2df(**kwargs)
        cols = self.df.columns.to_list()
        cols = self.get_persistent_columns(cols=cols)
        self.df = self.df.filter(cols)

        # todo: join `dob` and 'sex` columns from demographics

        self.fill_na()
        self.str2na()

        # type casting
        float_cols = self.get_float_columns()
        int_cols = self.get_int_columns(float_cols)
        int_cols.remove('date_scr_data')
        self.to_int(int_cols)
        self.to_float(float_cols)
        self.to_datetime(['date_scr_data'])

        self.transform_subject_id()

        self.df2csv(**kwargs)

    def df2csv(self, **kwargs) -> None:
        # pass the keys and task_ids as kwargs
        # todo: set the key and task_ids variables
        ti = kwargs['ti']
        path = ti.xcom_pull(key='', task_ids='')
        file_name = ti.xcom_pull(key='', task_ids='')
        self.df.to_csv(os.path.join(path, file_name))

    def csv2df(self, **kwargs) -> None:
        # pass the keys and task_ids as kwargs
        # todo: set the key and task_ids variables
        ti = kwargs['ti']
        path = ti.xcom_pull(key='', task_ids='')
        file_name = ti.xcom_pull(key='', task_ids='')
        self.df = pd.read_csv(os.path.join(path, file_name))

    @staticmethod
    def get_persistent_columns(**kwargs) -> list:
        to_ignore = [
            'redcap_event_name',
            'redcap_repeat_instrument',
            'redcap_repeat_instance',
            'version_scr_data',
            'version_date_scr_data',
            'age_scr_data',
            'sex_scr_data',
            'pregnancy_scr_data',
            'completed_date_scr_data',
            'pi_sig_scr_data',
            'pi_date_scr_data',
            'upload_scr_data',
            'yogtt009_screening_visit_data_collection_form_complete',
            'vo2_abs_scr_data',
            'vo2_rel_scr_data',
            'vo2_plateau_scr_data',
            'vo2_hr_scr_data',
            'vo2_rer_scr_data',
            'completed_by_scr_data'
        ]
        cols = kwargs['cols']
        return [col for col in cols if col not in to_ignore]

    def get_int_columns(self, float_cols: list) -> list:
        return [col for col in self.df.columns.to_list() if col not in float_cols]

    @staticmethod
    def get_float_columns() -> list:
        return ['height_scr_data',
                'weight_scr_data',
                'hba1c1_scr_data',
                'hba1c2_scr_data',
                'hba1c3_scr_data',
                'wcc_scr_data',
                'rcc_scr_data',
                'hb_scr_data',
                'rdwcv_scr_data',
                'rdwsd_scr_data',
                'relneutro_scr_data',
                'relimmgran_scr_data']

    def transform_homa_ir(self) -> None:
        self.df['homa_ir'] = (self.df['insulin_scr_data'] * self.df['glucose3_scr_data']) / 405

    def transform_bmi(self) -> None:
        self.df['bmi'] = self.df['weight_scr_data'] / ((self.df['height_scr_data'] / 100) ** 2)

    def transform_bmi_zscore(self) -> None:
        # todo: finish method

        # todo: move this to a yaml
        bmi_growth_chart_df = pd.read_csv(
            'https://raw.githubusercontent.com/award7/ClinicalTrialETL/dev/ClinicalTrialETL/references/bmi_growth_chart.csv')

        # todo: get percentile
        # todo: clean z-table (https://statpage.sandiego.edu/tables.xls) and post on github?
        # todo: refactor to use pd and timedelta to calculate age at time of visit
        age = (self.df['date_scr_data'].dt.year - self.df['dob'].dt.year) * 12 + \
              self.df['date_scr_data'].dt.month - self.df['dob'].dt.month + 0.5

        df = pd.DataFrame

        def calc_z(bmi, L, M, S) -> float:
            if L == 0:
                return log(bmi / M) / S
            else:
                return (((bmi / M) ** L) - 1) / (L * S)

        df['Z'] = df[['bmi', 'L', 'M', 'S']].apply(lambda x: calc_z(x['bmi'], x['L'], x['M'], x['S']), axis=1)

    def transform_waist2hip_ratio(self) -> None:
        self.df['waist_hip_ratio'] = self.df['waist_scr_data'] / self.df['hip_scr_data']

    def transform_sbp_zscore(self) -> None:
        pass

    def transform_dbp_zscore(self) -> None:
        pass

    def transform_map_zscore(self) -> None:
        pass


class CleanMriStructuralData(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        self.csv2df(**kwargs)
        cols = self.get_persistent_columns()
        self.df = self.df.filter(cols)

        self.fill_na()
        self.str2na()

        cols = self.df.columns.to_list()
        cols = [col for col in cols if col not in ('date_mri', 'payment_mri')]
        self.to_int(cols)

    def csv2df(self, **kwargs) -> None:
        ti = kwargs['ti']
        path = ti.xcom_pull(key='staging_location', task_ids=kwargs['raw_task_id'])
        file_name = ti.xcom_pull(key='file', task_ids=kwargs['raw_task_id'])
        self.df = pd.read_csv(os.path.join(path, file_name))

    def df2csv(self, **kwargs) -> None:
        ti = kwargs['ti']
        path = ti.xcom_pull(key='staging_location', task_ids='initialization.set-proc-staging-location')
        file_name = kwargs['proc_file_name']
        self.df.to_csv(os.path.join(path, file_name), index=False)

    @staticmethod
    def get_persistent_columns(**kwargs) -> list:
        return [
            'record_id',
            'date_mri',
            'hr1_mri',
            'co21_mri',
            'spo21_mri',
            'resp1_mri',
            'sbp1_mri',
            'dbp1_mri',
            'map1_mri',
            'hr2_mri',
            'co22_mri',
            'spo22_mri',
            'resp2_mri',
            'sbp2_mri',
            'dbp2_mri',
            'map2_mri',
            'payment_mri'
        ]

    def remove_currency_symbol(self) -> None:
        # todo: apply to `payment_mri`
        return


class CleanOgttVisitData(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        return

    def csv2df(self) -> None:
        return

    def df2csv(self) -> None:
        return

    @staticmethod
    def get_persistent_columns() -> None:
        return


class CleanCognitiveData(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        return

    def csv2df(self) -> None:
        return

    def df2csv(self) -> None:
        return

    @staticmethod
    def get_persistent_columns() -> None:
        return


class CleanMedicalHistoryData(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        return

    def csv2df(self) -> None:
        return

    def df2csv(self) -> None:
        return

    @staticmethod
    def get_persistent_columns() -> None:
        return


class CleanParData(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        return

    def csv2df(self) -> None:
        return

    def df2csv(self) -> None:
        return

    @staticmethod
    def get_persistent_columns() -> None:
        return


class CleanSubjectOffStudyData(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        return

    def csv2df(self) -> None:
        return

    def df2csv(self) -> None:
        return

    @staticmethod
    def get_persistent_columns() -> None:
        return


class CleanDexaData(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        return

    def csv2df(self) -> None:
        return

    def df2csv(self) -> None:
        return

    @staticmethod
    def get_persistent_columns() -> None:
        return


class CleanVo2MaxData(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None

    def __call__(self, *args, **kwargs):
        return

    def csv2df(self) -> None:
        return

    def df2csv(self) -> None:
        return

    @staticmethod
    def get_persistent_columns() -> None:
        return


def create_event_form_field_mapping(ti: object = None, *args, **kwargs) -> None:
    """

    """

    # get file names
    mapping_file = ti.xcom_pull(key='file_name', task_ids='extract.extract-form-event-mapping')
    fields_file = ti.xcom_pull(key='file_name', task_ids='extract.extract-field-names')
    metadata_file = ti.xcom_pull(key='file_name', task_ids='extract.extract-redcap-metadata')

    # get file location
    mapping_path = ti.xcom_pull(key='raw_staging_location', task_ids='extract.extract-form-event-mapping')
    fields_path = ti.xcom_pull(key='raw_staging_location', task_ids='extract.extract-field-names')
    metadata_path = ti.xcom_pull(key='raw_staging_location', task_ids='extract.extract-redcap-metadata')

    # read files into dataframes
    mapping = pd.read_csv(os.path.join(mapping_path, mapping_file))
    fields = pd.read_csv(os.path.join(fields_path, fields_file))
    metadata = pd.read_csv(os.path.join(metadata_path, metadata_file))

    # rename columns for subsequent merging
    metadata = metadata.rename(columns={'form_name': 'form'})
    fields = fields.rename(columns={"original_field_name": "field_name"})

    # merge dataframes into one
    df = metadata.merge(mapping, on='form', how='left')
    df = fields.merge(df, on='field_name', how='left')

    # drop columns
    df.drop(['section_header', 'choice_value'], axis=1, inplace=True)

    # rearrange columns
    cols = df.columns.to_list()
    order = ['arm_num', 'unique_event_name', 'form', 'field_name', 'export_field_name', 'field_type']
    other_cols = [col for col in cols if col not in order]
    order += other_cols
    df = df[order]

    # because the REDCap API does not export a nice, full metadata listing, certain export fields are not associated
    # with an arm, event, or form*. So we need to do some workarounds to establish these associations.
    # *Note: it appears to only be [form]_complete fields, so we'll match on that

    # find export_field_name with an nan for form
    missing_forms = df[df['form'].isna()]
    # fill in the form by dropping '_complete' from the 'field_name'
    missing_forms.loc[missing_forms['form'].isna(), 'form'] = missing_forms['field_name'].str.replace('_complete', '')

    # save file
    save_location = ti.xcom_pull(key='proc_staging_location', task_ids='transform.set-proc-staging-location')
    file_name = 'irb_2019_0361_metadata.csv'
    df.to_csv(os.path.join(save_location, file_name), index=False)

    # xcom push the file_name and save_location
    if ti is not None:
        ti.xcom_push(key='file_name', value=file_name)
        ti.xcom_push(key='location', value=save_location)


def remove_old_files(ti: object = None, n_days: int = -7, key: str = None, task_ids: list = None, *args,
                     **kwargs) -> None:
    """
    remove files from directory (e.g. /bucket) that are older than n days old
    """

    # get path to staging location
    if ti is not None:
        path = ti.xcom_pull(key=key, task_ids=task_ids)

    # get unique paths and cast to string
    path = str(set(path))

    # find all files in path
    for root, directories, files in os.walk(path, topdown=False):
        for file in files:
            # get file last modified time and compare to today date
            file_details = os.stat(os.path.join(root, file))
            age = datetime.fromtimestamp(file_details.st_mtime) - datetime.today()

            # remove if more than n days different
            if age.days <= n_days:
                os.remove(os.path.join(root, file))


def calculate_par_met_hours():
    pass


def calculate_bmi_zscore(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    # parameters: dob, visit_date, sex, bmi
    # """
    # Calculate the BMI z-score and percentile for each subject
    #
    # https://www.cdc.gov/growthcharts/percentile_data_files.htm
    # https://www.cdc.gov/growthcharts/data/zscore/bmiagerev.csv
    #
    # df_cdc = pd.DataFrame('cdc_growth_data.csv')
    #
    # # calculate the age with month precision at time of visit
    # dob = datetime.strptime(dob, '%m/%d/%Y')
    # visit_date = datetime.strptime(visit_date, '%m/%d/%Y')
    # age = (visit_date.year - dob.year) * 12 + visit_date.month - dob.month
    #
    # # get M, S, Z regression coefficients
    # M = df_cdc.loc[(df_cdc['age_(months)'] == age) & (df_cdc['sex'] == sex)]['M'].values
    # S = df_cdc.loc[(df_cdc['age_(months)'] == age) & (df_cdc['sex'] == sex)]['S'].values
    # Z = np.round(math.log(bmi / M) / S, 2)
    #
    # if Z > 0:
    #     fname_ztable = 'ztable_positive.csv'
    #     if len(str(Z)[1:-1]) < 4:
    #         zx = 'zx0'
    #     else:
    #         zx = 'zx' + str(Z)[-2]
    # else:
    #     fname_ztable = 'ztable_negative.csv'
    #     if len(str(Z)[1:-1]) < 5:
    #         zx = 'zx0'
    #     else:
    #         zx = 'zx' + str(Z)[-2]
    #
    # zy = str(Z)[1:-2]
    #
    # # save file
    # path_ztable = os.path.join('C:/Users', username, 'Box\PHI_Data-A1760-Schrage\IRB_2019_0361\data', fname_ztable)
    # df_ztable = pd.read_csv(path_ztable)
    # percentile = df_ztable.loc[df_ztable['zy'] == zy][zx].values
    # return Z, percentile
    return df


def _state_abbreviation_mapping() -> dict:
    return {
        "Alabama": "AL",
        "Alaska": "AK",
        "Arizona": "AZ",
        "Arkansas": "AR",
        "California": "CA",
        "Colorado": "CO",
        "Connecticut": "CT",
        "Delaware": "DE",
        "Florida": "FL",
        "Georgia": "GA",
        "Hawaii": "HI",
        "Idaho": "ID",
        "Illinois": "IL",
        "Indiana": "IN",
        "Iowa": "IA",
        "Kansas": "KS",
        "Kentucky": "KY",
        "Louisiana": "LA",
        "Maine": "ME",
        "Maryland": "MD",
        "Massachusetts": "MA",
        "Michigan": "MI",
        "Minnesota": "MN",
        "Mississippi": "MS",
        "Missouri": "MO",
        "Montana": "MT",
        "Nebraska": "NE",
        "Nevada": "NV",
        "New Hampshire": "NH",
        "New Jersey": "NJ",
        "New Mexico": "NM",
        "New York": "NY",
        "North Carolina": "NC",
        "North Dakota": "ND",
        "Ohio": "OH",
        "Oklahoma": "OK",
        "Oregon": "OR",
        "Pennsylvania": "PA",
        "Rhode Island": "RI",
        "South Carolina": "SC",
        "South Dakota": "SD",
        "Tennessee": "TN",
        "Texas": "TX",
        "Utah": "UT",
        "Vermont": "VT",
        "Virginia": "VA",
        "Washington": "WA",
        "West Virginia": "WV",
        "Wisconsin": "WI",
        "Wyoming": "WY",
        "District of Columbia": "DC",
        "American Samoa": "AS",
        "Guam": "GU",
        "Northern Mariana Islands": "MP",
        "Puerto Rico": "PR",
        "United States Minor Outlying Islands": "UM",
        "U.S. Virgin Islands": "VI",
    }


# decorators
def read_proc_file(task_id):
    def decorator(func):
        def wrapper(*args, **kwargs):
            ti = kwargs['ti']
            proc_staging_location = ti.xcom_pull(key='proc_staging_location',
                                                 task_ids='transform.set-proc-staging-location')
            file_name = ti.xcom_pull(key='file_name', task_ids=task_id)
            print(f'task_id: {task_id}')
            df = pd.read_csv(os.path.join(proc_staging_location, file_name))

            df = func(df, *args, **kwargs)

            proc_staging_location = ti.xcom_pull(key='proc_staging_location',
                                                 task_ids='transform.set-proc-staging-location')
            df.to_csv(os.path.join(proc_staging_location, file_name), index=False)

        return wrapper

    return decorator


def set_proc_staging_location(ti: object = None, *args, **kwargs) -> None:
    """
    xcom_push the proc_staging_location

    :param ti: task instance object from airflow
    :type ti: object
    """
    proc_staging_location = get_default_staging_location(bucket='proc')
    ti.xcom_push(key='staging_location', value=proc_staging_location)
