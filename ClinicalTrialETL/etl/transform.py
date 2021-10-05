import pandas as pd
import os
from datetime import datetime
from ClinicalTrialETL.etl.utils import get_default_staging_location
from numpy import nan


class BaseCleaner:
    def __init__(self):
        self.df = None

    def to_int(self, cols: list) -> None:
        self.df[cols] = self.df[cols].apply(pd.to_numeric, downcast='integer', errors='coerce')

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
        self.df[cols] = self.df[cols].dt.strftime(date_format)

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


class CleanDemographicsData(BaseCleaner):
    def __init__(self):
        super().__init__()
        self.df = None
        self.df_survey = None
        self.df_yogtt004 = None

    def __call__(self, *args, **kwargs):
        # create df's
        self.df_survey = self.read_demo_survey(ti=kwargs['ti'])
        self.df_yogtt004 = self.read_yogtt004(ti=kwargs['ti'])

        # remove '_survey' from column names for merging
        self.df_survey.columns = [col.replace('_survey', '') for col in self.df_survey.columns.to_list()]

        # todo: merge the two 'complete' columns into one

        # merge
        self.df = pd.concat([self.df_survey, self.df_yogtt004], axis=0, ingore_index=True)

        # replace blank entries with nan
        self.fill_na()

        # replace user-input variations of nan with nan
        self.str2na()

        # replace any middle names with just the initial
        self.df['m_name_demo'] = self.df['m_name_demo'].str.get(0)

        # todo: split name2_demo (i.e. parent name) to f_name and l_name columns

        # capitalize proper nouns
        # self.capitalize_proper_nouns()

        # make email all lower case
        # cols = ['email1_demo', 'email2_demo']
        # self.df[cols] = self.df[cols].apply(lambda x: x.lower())

        # reformat dates to mm/dd/yyyy
        cols = [
            'date_demo',
            'version_date_demo',
            'birth_date_demo',
            'completed_date_demo'
        ]
        self.df[cols] = pd.to_datetime(self.df[cols])
        self.df[cols] = self.df[cols].dt.strftime('%m/%d/%Y')

        # todo: convert state name to 2-letter state code
        # todo: apply regex to remove extraneous whitespaces
        # todo: format phone number
        # todo: ensure db has proper code mapping for race, ethnicity, etc.

    def capitalize_proper_nouns(self):
        cols = [
            'f_name_demo',
            'm_name_demo',
            'l_name_demo',
            'address1_demo',
            'city1_demo',
            'address2_demo',
            'city2_demo'
        ]
        self.df[cols] = self.df[cols].appply(lambda x: x.title())

    def read_demo_survey(self, ti: object) -> pd.DataFrame:
        path = ti.xcom_pull(key='raw_staging_location', task_ids='')
        file_name = ti.xcom_pull(key='file_name', task_ids='')
        return pd.read_csv(os.path.join(path, file_name))

    def read_yogtt004(self, ti: object) -> pd.DataFrame:
        path = ti.xcom_pull(key='raw_staging_location', task_ids='')
        file_name = ti.xcom_pull(key='file_name', task_ids='')
        return pd.read_csv(os.path.join(path, file_name))


class CleanScreeningData(BaseCleaner):
    def __init__(self, *args, **kwargs):
        super().__init__()
        self.df = None
        self.raw_staging_location = None
        self.proc_staging_location = None

    def __call__(self, *args, **kwargs):
        ti = kwargs['ti']

        # todo: pass keys and task_ids as kwargs??
        self.raw_staging_location = ti.xcom_pull(key='raw_staging_location', task_ids='')
        self.proc_staging_location = ti.xcom_pull(key='proc_staging_location', task_ids='')

        # todo: read csv to df

        # todo: convert columns to appropriate data types
        date_columns = self.get_columns('date')

        # todo: apply filters

        # todo: apply transforms

        # todo: save cleaned df to proc location

    def clean_screening_data(self, *args, **kwargs) -> pd.DataFrame:
        # todo: do xcom_pull for y-ogtt-002 csv and y-ogtt-009 csv file names and locations

        df_yogtt002 = pd.DataFrame({'foo': 'bar'})
        df_yogtt009 = pd.DataFrame({'foo': 'bar'})

        # convert columns to int
        # get columns that need conversion for df_yogtt002
        lst = df_yogtt002.columns.to_list()
        to_ignore = ['redcap_event_name', 'redcap_repeat_instrument', 'redcap_repeat_instance', 'last_food_scr',
                     'duration_scr', 'upload_scr']
        substring = 'date'
        date_cols = [col for col in lst if substring in col]
        to_ignore = to_ignore + date_cols
        cols = [x for x in lst if x not in to_ignore]
        df_yogtt002[cols] = df_yogtt002[cols].apply(pd.to_numeric, downcast='integer', errors='coerce')

        # get columns that need conversion for df_yogtt002
        lst = df_yogtt009.columns.to_list()
        to_ignore = ['redcap_event_name',
                     'redcap_repeat_instrument',
                     'redcap_repeat_instance',
                     'height_scr_data',
                     'weight_scr_data',
                     'hba1c1_scr_data',
                     'hba1c2_scr_data',
                     'hba1c3_scr_data',
                     'wcc_scr_data',
                     'rcc_scr_data',
                     'hb_scr_data',
                     'rdwsd_scr_data',
                     'rdwcv_scr_data',
                     'vo2_abs_scr_data',
                     'vo2_rel_scr_data',
                     'vo2_plateau_scr_data',
                     'vo2_rer_scr_data',
                     'completed_by_scr_data',
                     'upload_scr_data'
                     ]
        date_cols = [col for col in lst if substring in col]
        to_ignore = to_ignore + date_cols
        cols = [x for x in lst if x not in to_ignore]
        df_yogtt002[cols] = df_yogtt002[cols].apply(pd.to_numeric, downcast='integer', errors='coerce')

        # todo: convert columns to float

        # remove records that never made it to in-person screening
        df_yogtt002 = df_yogtt002[df_yogtt002['yogtt002_screening_visit_checklist_complete'] > 0]
        df_yogtt009 = df_yogtt009[df_yogtt009['yogtt009_screening_visit_data_collection_form_complete'] > 0]

        return df_yogtt002

    def filter_completed(self) -> None:
        pass

    def calculate_homa_ir(self) -> None:
        pass


class CleanMriStructuralData(BaseCleaner):
    def __init__(self):
        self.df = None


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


def clean_demographics_data(df_survey: pd.DataFrame, df_form: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    # remove '_survey' from column names for merging
    df_survey.columns = [col.replace('_survey', '') for col in df_survey.columns.to_list()]

    # merge
    df = pd.concat([df_survey, df_form], axis=0, ingore_index=True)

    # remove non-completed forms
    # todo: merge the two 'complete' columns into one
    df = df[df['yogtt004_demographics_complete'] == '2']

    # replace blank entries with nan
    df = df.replace(r'^\s*$', nan, regex=True)

    # replace user-input variations of nan with nan
    df = df.replace(r'^[nN]\W?[aA]$', nan, regex=True)

    # replace any middle names with just the initial
    df['m_name_demo'] = df['m_name_demo'].str.get(0)

    # todo: split name2_demo (i.e. parent name) to f_name and l_name columns

    # capitalize proper nouns
    cols = [
        'f_name_demo',
        'm_name_demo',
        'l_name_demo',
        'address1_demo',
        'city1_demo',
        'address2_demo',
        'city2_demo'
    ]
    df[cols] = df[cols].appply(lambda x: x.title())

    # make email all lower case
    cols = ['email1_demo', 'email2_demo']
    df[cols] = df[cols].apply(lambda x: x.lower())

    # reformat dates to mm/dd/yyyy
    cols = [
        'date_demo',
        'version_date_demo',
        'birth_date_demo',
        'completed_date_demo'
    ]
    df[cols] = pd.to_datetime(df[cols])
    df[cols] = df[cols].dt.strftime('%m/%d/%Y')

    # convert state name to 2-letter state code
    # todo: apply regex to remove extraneous whitespaces

    # todo: format phone number

    # todo: ensure db has proper code mapping for race, ethnicity, etc.
    return df


def calculate_par_met_hours():
    pass


def calculate_bmi(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    df['bmi'] = df['weight_scr_data'] / ((df['height_scr_data'] / 100) ** 2)
    return df


def calculate_bmi_zscore(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    # parameters: dob, visit_date, sex, bmi
    # """
    # Calculate the BMI z-score and percentile for each subject
    #
    # https://www.cdc.gov/growthcharts/percentile_data_files.htm
    #
    # :param df:
    # :param args:
    # :param kwargs:
    # :return:
    # """
    #
    # # todo: put this on github and read into df
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


def calculate_hip_waist_ratio(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    df['hip_waist_ratio'] = df['hip_scr_data'] / df['waist_scr_data']
    return df


def calculate_homa_ir(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    df['homa_ir'] = (df['insulin_scr_data'] * df['glucose3_scr_data']) / 405
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
    ti.xcom_push(key='proc_staging_location', value=proc_staging_location)
