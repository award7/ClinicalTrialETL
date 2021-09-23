import pandas as pd
import os
from datetime import datetime


# decorators
def read_file_to_df(func):
    def wrapper(*args, **kwargs):
        ti = kwargs['ti']
        # todo: make an airflow task to mkdir a proc_staging >> cp raw file to there >> transform...
        proc_staging_location = ti.xcom_pull(key='proc_staging_location', task_ids=['mkdir_proc_staging'])
        file_name = ti.xcom_pull(key='file_name', task_ids=['extract'])
        df = pd.read_csv(os.path.join(proc_staging_location, file_name))
        df = func(df, *args, **kwargs)
        df.to_csv(os.path.join(proc_staging_location, file_name))
    return wrapper


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


@read_file_to_df
def calculate_bmi(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    df['bmi'] = df['weight_scr_data'] / ((df['height_scr_data'] / 100) ** 2)
    return df


@read_file_to_df
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


@read_file_to_df
def calculate_hip_waist_ratio(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    df['hip_waist_ratio'] = df['hip_scr_data'] / df['waist_scr_data']
    return df


@read_file_to_df
def calculate_homa_ir(df: pd.DataFrame, *args, **kwargs) -> pd.DataFrame:
    df['homa_ir'] = (df['insulin_scr_data'] * df['glucose3_scr_data']) / 405
    return df


# 2021/09/10: these are all queries xD  move or ignore these
def get_opened_survey_count(df: pd.DataFrame) -> pd.DataFrame:
    return df['record_id'].unique().size


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
