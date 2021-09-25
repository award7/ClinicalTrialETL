import pandas as pd
import os
from datetime import datetime
from ClinicalTrialETL.etl.utils import get_default_staging_location
from ClinicalTrialETL.redcap_api.api import Events, Forms


# decorators
def parse_raw(func):
    def wrapper(*args, **kwargs):
        ti = kwargs['ti']

        # read raw file into df
        raw_staging_location = ti.xcom_pull(key='raw_staging_location', task_ids='extract.extract-redcap-data-full')
        raw_file_name = ti.xcom_pull(key='file_name', task_ids='extract.extract-redcap-data-full')
        df = pd.read_csv(os.path.join(raw_staging_location, raw_file_name))

        # call wrapped function
        file_name = kwargs['file_name']
        df = func(df, *args, **kwargs)

        # save modified df to proc location
        proc_staging_location = ti.xcom_pull(key='proc_staging_location',
                                             task_ids='transform.set-proc-staging-location')
        df.to_csv(os.path.join(proc_staging_location, kwargs['file_name']), index=False)

        # xcom_push file name
        ti.xcom_push(key='file_name', value=file_name)

    return wrapper


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


# parsing functions
@parse_raw
def parse_prescreening_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    return df


@parse_raw
def parse_consent_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """

    :param df:
    :return:
    """
    return df


@parse_raw
def parse_demographics_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    return df


@parse_raw
def parse_medical_history_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """
    Parse any data relevant to medical history, including MRI screening questionnaire and concomitant medications

    :param df:
    :return:
    """
    return df


@parse_raw
def parse_tanner_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    return df


@parse_raw
def parse_par_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    return df


@parse_raw
def parse_screening_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    return df


@parse_raw
def parse_eligibility_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    return df


@parse_raw
def parse_cognitive_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """
    Parse the visit encounter details
    :param df:
    :return:
    """
    return df


@parse_raw
def parse_mri_structural_visit_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """
    Parse the visit encounter details (e.g. fasting duration, scans that were completed, etc.), not the actual MRI
    analysis

    :param df:
    :return:
    """
    return df


@parse_raw
def parse_ogtt_visit_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """
    Parse the visit encounter details (e.g. fasting duration, scans that were completed, etc.), not the actual MRI
    analysis

    :param df:
    :return:
    """
    return df


@parse_raw
def parse_deviation_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """

    :param df:
    :return:
    """
    return df


@parse_raw
def parse_adverse_event_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """

    :param df:
    :return:
    """
    return df


@parse_raw
def parse_note_to_file_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """

    :param df:
    :return:
    """
    return df


@parse_raw
def parse_visit_note_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """

    :param df:
    :return:
    """
    return df


@parse_raw
def parse_dexa_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """

    :param df:
    :return:
    """
    return df


@parse_raw
def parse_internal_audit_data(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    """

    :param df:
    :return:
    """
    return df


def create_event_form_field_mapping(ti: object = None, *args, **kwargs) -> None:
    """

    """

    # get file names
    mapping_file = ti.xcom_pull(key='file_name', task_ids='extract.extract-form-event-mapping')
    fields_file = ti.xcom_pull(key='file_name', task_ids='extract.extract-field-names')
    metadata_file = ti.xcom_pull(key='file_name', task_ids='extract.extract-redcap_metadata')

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
    df = df.merge(fields, on='field_name', how='left')

    # drop columns
    df.drop(['section_header', 'choice_value'], axis=1, inplace=True)

    # rearrange columns
    cols = df.columns.to_list()
    order = ['arm_num', 'unique_event_name', 'form', 'field_name', 'export_field_name', 'field_type']
    other_cols = [col for col in cols if col not in order]
    order += other_cols
    df = df[order]

    # save file
    save_location = ti.xcom_pull(key='proc_staging_location', task_ids='transform.set-proc-staging-location')
    file_name = 'irb_2019_0361_metadata.csv'
    df.to_csv(os.path.join(save_location, file_name), index=False)

    # xcom push the file_name and save_location
    if ti is not None:
        ti.xcom_push(key='file_name', value=file_name)
        ti.xcom_push(key='location', value=save_location)


# def _save_parsed_data(df: pd.DataFrame, file_name: str, xcom_filename_key: str, ti: object = None) -> None:
#     proc_staging_location = get_default_staging_location(bucket='proc')
#     df.to_csv(os.path.join(proc_staging_location, file_name))
#     ti.xcom_push(key=xcom_filename_key, value=file_name)


def set_column_to_int(df: pd.DataFrame, columns: list) -> pd.DataFrame:
    for col in columns:
        df[col] = df[col].apply(pd.to_numeric, downcast='integer', errors='coerce')
    return df


def set_column_to_float(df: pd.DataFrame, columns: list) -> pd.DataFrame:
    for col in columns:
        df[col] = df[col].apply(pd.to_numeric, downcast='float', errors='coerce')
    return df


def set_column_to_str():
    pass


def set_column_to_datetime(df: pd.DataFrame, columns: list) -> pd.DataFrame:
    df[columns] = df[columns].apply(pd.to_datetime)
    return df


def add_na():
    pass


def calculate_par_met_hours():
    pass


def calculate_bmi(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    df['bmi'] = df['weight_scr_data'] / ((df['height_scr_data'] / 100) ** 2)
    return df


def calculate_bmi_zscore(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    # parameters: dob, visit_date, sex, bmi
    """
    Calculate the BMI z-score and percentile for each subject

    https://www.cdc.gov/growthcharts/percentile_data_files.htm

    :param df:
    :param args:
    :param kwargs:
    :return:
    """

    # todo: put this on github and read into df
    df_cdc = pd.DataFrame('cdc_growth_data.csv')

    # calculate the age with month precision at time of visit
    dob = datetime.strptime(dob, '%m/%d/%Y')
    visit_date = datetime.strptime(visit_date, '%m/%d/%Y')
    age = (visit_date.year - dob.year) * 12 + visit_date.month - dob.month

    # get M, S, Z regression coefficients
    M = df_cdc.loc[(df_cdc['age_(months)'] == age) & (df_cdc['sex'] == sex)]['M'].values
    S = df_cdc.loc[(df_cdc['age_(months)'] == age) & (df_cdc['sex'] == sex)]['S'].values
    Z = np.round(math.log(bmi / M) / S, 2)

    if Z > 0:
        fname_ztable = 'ztable_positive.csv'
        if len(str(Z)[1:-1]) < 4:
            zx = 'zx0'
        else:
            zx = 'zx' + str(Z)[-2]
    else:
        fname_ztable = 'ztable_negative.csv'
        if len(str(Z)[1:-1]) < 5:
            zx = 'zx0'
        else:
            zx = 'zx' + str(Z)[-2]

    zy = str(Z)[1:-2]

    # save file
    path_ztable = os.path.join('C:/Users', username, 'Box\PHI_Data-A1760-Schrage\IRB_2019_0361\data', fname_ztable)
    df_ztable = pd.read_csv(path_ztable)
    percentile = df_ztable.loc[df_ztable['zy'] == zy][zx].values
    return Z, percentile


def calculate_hip_waist_ratio(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    df['hip_waist_ratio'] = df['hip_scr_data'] / df['waist_scr_data']
    return df


def calculate_homa_ir(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    df['homa_ir'] = (df['insulin_scr_data'] * df['glucose3_scr_data']) / 405
    return df


# 2021/09/10: these are all queries xD  move or ignore these
@read_proc_file('transform.parse-prescreening-data')
def get_opened_survey_count(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    # return df['record_id'].unique().size
    return df


def get_completed_survey_count(df: pd.DataFrame) -> pd.DataFrame:
    return df.loc[df['insulin_resistance_in_adolescents_survey_complete'] == '2'].shape[0]


def get_consent_count(df: pd.DataFrame) -> pd.DataFrame:
    return df.loc[df['consent_status_consent'] == '1'].shape[0]


def get_screening_count(df: pd.DataFrame) -> pd.DataFrame:
    return df.loc[df['completed_date_scr'].notna()].shape[0]


def get_eligible_screen_count(df: pd.DataFrame) -> pd.DataFrame:
    return df.loc[df['qualify_scr'] == '1'].shape[0]


def get_ineligible_screen_count(df: pd.DataFrame) -> pd.DataFrame:
    return df.loc[df['qualify_scr'] == '0'].shape[0]


def get_cognitive_visit_count(df: pd.DataFrame) -> pd.DataFrame:
    return df.loc[df['date_cog'].notna()].shape[0]


def get_1hr_mri_visit_count(df: pd.DataFrame) -> pd.DataFrame:
    return df.loc[df['date_mri'].notna()].shape[0]


def get_1hr_mri_visit_asl_count(df: pd.DataFrame) -> pd.DataFrame:
    return df.loc[df['asl_mri'] == '1'].shape[0]


def get_1hr_mri_visit_vipr_count(df: pd.DataFrame) -> pd.DataFrame:
    return df.loc[df['vipr_mri'] == '1'].shape[0]


def get_1hr_mri_visit_t1_count(df: pd.DataFrame) -> pd.DataFrame:
    # todo: get proper field name
    return df.loc[df['madni3t_mri'] == '1'].shape[0]


def get_ogtt_visit_count(df: pd.DataFrame) -> pd.DataFrame:
    return df.loc[df['date_ogtt'].notna()].shape[0]


def get_tanner_score(df: pd.DataFrame, include_ineligilbe: bool = False) -> pd.DataFrame:
    # todo: do filter logic to account for males and females
    # filter males vs. females, get average tanner scores
    # males = 0
    # females = 1
    filtered_for_positive_responses = df.loc[(df['gender_demo_survey'] == '0') |
                                             (df['gender_demo_survey'] == '1') |
                                             (df['gender_demo'] == '0') |
                                             (df['gender_demo'] == '1')]
    males = df['record_id'].loc[(df['gender_demo_survey'] == '0') |
                                (df['gender_demo'] == '0') &
                                (df['qualify_scr'] == '1')].unique()
    average_male_tanner_score = males['']
    females = ''
    average_female_tanner_score = ''
    average_tanner_score_both_sexes = ''
    return df.loc[df['vipr_mri'] == '1'].shape[0]


def get_screening_glucose(df: pd.DataFrame) -> pd.DataFrame:
    return df[['record_id', 'glucose3_scr_data']].loc[df['glucose3_scr_data'].notna()]


def get_screening_insulin(df: pd.DataFrame) -> pd.DataFrame:
    return df[['record_id', 'insulin_scr_data']].loc[df['insulin_scr_data'].notna()]
