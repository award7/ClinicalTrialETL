from airflow.providers.microsoft.mssql.hooks.mssql import MsSqlHook
import csv

"""load preprocessed data into db and update REDCap forms"""


def load_csv2db(func):
    def wrapper(*args, **kwargs):
        with open(kwargs['csv_path']) as csv_file:
            csv_reader = csv.reader(csv_file)
            next(csv_reader)
            hook = MsSqlHook(mssql_conn_id=kwargs['conn_id'])
            conn = hook.get_conn()
            conn.autocommit(True)
            cur = conn.cursor()
            sql = func(*args, **kwargs)
            for data in csv_reader:
                cur.execute(sql, tuple(data))
    return wrapper


def load_arterial_spin_labeling_data(conn_id: str, csv_path: str, *args, **kwargs) -> str:
    # todo: finish
    return """sp__InsertIntoArterialSpinLabelingData @"""


def load_biosamples():
    pass


@load_csv2db
def load_anthropometrics(conn_id: str, csv_path: str, *args, **kwargs):
    return """sp__InsertIntoAnthropometrics @subject=%s, @visit_name=%s, @height=%s, @weight=%s, @body_mass_index=%s, @hip_circumference=%s, @waist_circumference=%s, @waist_hip_ratio=%s, @tanner_stage=%s"""


def load_brain_volumes():
    pass


def load_brief_data():
    pass


def load_cbcl_data():
    pass


def load_cerebrovascular_reactivity_data():
    pass


def load_complete_blood_count_data(conn_id: str = None, csv_path: str = None, *args, **kwargs):
    return """sp__InsertIntoCompleteBloodCountData """


def load_dccs_data():
    pass


def load_dexa_data():
    return """sp__InsertIntoDexaData"""


def load_dkefs_data():
    pass


def load_flanker_data():
    pass


def load_heart_rate_recovery_data():
    pass


def load_list_sort_data():
    pass


def load_maximal_oxygen_uptake_data():
    pass


def load_ogtt_blood_chemistries():
    # todo: combine sql table with ogtt vitals (and vipr?)
    return """sp__InsertIntoOgttBloodChemsitries"""


def load_pattern_comparison_data():
    pass


def load_pedsql_data():
    pass


def load_screening_blood_chemistries():
    # todo: combine wtih vitals?
    pass


def load_screening_vitals_data():
    pass


@load_csv2db
def load_subjects(conn_id: str = None, csv_path: str = None, *args, **kwargs):
    # pass conn_id: str, csv_path: str, as kwargs
    return """sp__InsertIntoSubjects @subject=%s, @age=%s, @sex=%s, @race=%s, @ethnicity=%s, @study='2019-0361'"""


def load_submaximal_exercise_data():
    pass


def load_time_points(conn_id: str = None, csv_path: str = None, *args, **kwargs):
    return """sp__InsertIntoTimePoints @subject=%s, @visit_name=%s, @time_point_label=%s"""


def load_vipr_heart_rate_data():
    pass


def load_vipr_time_averaged_data():
    pass


def load_vipr_time_resolved_data():
    pass


def load_vipr_windows():
    pass


def load_visits(conn_id: str = None, csv_path: str = None, *args, **kwargs):
    return """sp__InsertIntoVisits @subject=%s, @visit_name=%s, @visit_date=%s"""


def load_wasii_data():
    pass


def load_wraml_data():
    pass


def load_redcap_yogtt004(self):
    pass


def load_redcap_yogtt005(self):
    # get fields from med hx survey form
    # get fields from med hx yogtt form
    # insert from survey form to yogtt form
    pass


def load_redcap_yogtt006(self):
    pass


def load_redcap_yogtt007(self):
    pass


def load_redcap_yogtt008(self):
    pass

