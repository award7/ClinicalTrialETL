import pandas as pd


# decorators
def _read_file_to_df(file_name: str):
    pass


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


def add_na():
    pass


def calculate_par_met_hours():
    pass


def calculate_bmi():
    pass


def calculate_hip_waist_ratio():
    pass


def calculate_homa_ir():
    pass


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
