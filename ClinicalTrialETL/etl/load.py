from airflow.providers.microsoft.mssql.hooks.mssql import MsSqlHook
import csv

"""loading functions for loading processed data production tables"""


# wrappers
def load_csv2db(func):
    def wrapper(*args, **kwargs):
        with open(args[1]) as csv_file:
            csv_reader = csv.reader(csv_file)
            columns = next(csv_reader)
            table = func(*args, **kwargs)
            sql = """INSERT INTO {0}({1}) VALUES ({2})"""
            sql = sql.format(table, ','.join(columns), ','.join('%s' for i in range(0, len(columns))))
            hook = MsSqlHook(mssql_conn_id=args[0])
            conn = hook.get_conn()
            conn.autocommit(True)
            cur = conn.cursor()
            for data in csv_reader:
                cur.execute(sql, tuple(data))
    return wrapper


@load_csv2db
def load_anthropometrics(conn_id: str, csv_path: str, *args, **kwargs):
    return "Anthropometrics"


def load_arterial_spin_labeling_data(conn_id: str, csv_path: str, *args, **kwargs) -> str:
    sql = ''
    return sql


def load_biosamples():
    pass


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
    pass


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
    pass


def load_pattern_comparison_data():
    pass


def load_pedsql_data():
    pass


def load_screening_blood_chemistries():
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


class InsertData:

    def __init__(self):  # , db_object: DB):
        self.cur = None  # db_object.cur

    def __del__(self):
        self.cur.close()

    def insert_arterial_spin_labeling_data(self, data_dict: dict) -> None:
        sql = """EXEC sp__InsertIntoArterialSpinLabeling (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,
                    ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"""
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_biosamples(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoBiosamples (?,?,?,?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_body_measurements_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoBodyMeasurementsData (?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_cerebrovascular_reactivity_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoCerebrovascularReactivityData (?,?,?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_complete_blood_count_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoCompleteBloodCountData (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_dexa_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoDexaData (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_heart_rate_recovery_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoHeartRateRecoveryData (?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_maximal_oxygen_uptake_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoMaximalOxygenUptakeData ('?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_ogtt_blood_chemistries(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoOgttBloodChemistries (?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_screening_blood_chemistries(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoScreeningBloodChemistries (?,?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_screening_vitals_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoScreeningVitalsData (?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_subjects(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoSubjects (?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_submaximal_exercise_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoSubmaximalExerciseData (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_vipr_heart_rate_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoViprHeartRateData (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_vipr_time_averaged_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoViprTimeAveragedData (?,?,?,?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_vipr_time_resolved_data(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoViprTimeResolvedData (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_vipr_windows(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoViprWindows (?,?,?,?,?,?,?)"
        params = list(data_dict.values())
        self._exec(sql, params)

    def insert_into_visits(self, data_dict: dict) -> None:
        sql = "EXEC sp__InsertIntoVisits"
        params = list(data_dict.values())
        self._exec(sql, params)

    def _exec(self, sql: str, params: list) -> None:
        self.cur.execute(sql, params)


class SqlDb:

    def main(self):
        pass
        # # from database.stored_procedures import Procedures
        #
        # # get db info
        # stream = connect.get_db_info()
        #
        # # parse the info into respective dicts
        # db_info = stream['db']
        # personnel_info = stream['personnel']
        #
        # # connect to db
        # conn = connect.connect_db(db_info)
        # cur = connect.get_cursor(conn)
        # connect.check_db(cur, db_info)
        #
        # # change this ad hoc to specify the specific db to use
        # cur.execute("""USE phd_sandbox""")
        #
        # # create any necessary tables
        # # order is important due to fk constraints
        # tbl = Tables(conn, cur)
        #
        # ## these tables are critical for most other tables
        # tbl.subjects_tbl()
        # tbl.visits_tbl()
        #
        # ## these tables have default values to insert following creation
        # tbl.studies_tbl()
        # tbl.visit_names_tbl()
        # tbl.personnel_tbl()
        # tbl.freezers_tbl()
        # tbl.freezer_shelves_tbl()
        # tbl.grid_locations_tbl()
        # tbl.box_colors_tbl()
        # tbl.vessels_tbl()
        # tbl.statuses_tbl()
        # tbl.timepoints_tbl()
        # tbl.tube_colors_tbl()
        #
        # ## all other tables
        # tbl.biosamples_tbl()
        # tbl.brain_volumes_tbl()
        # tbl.cbc_data_tbl()
        # tbl.cvr_data_tbl()
        # tbl.dexa_tbl()
        # tbl.hrr_data_tbl()
        # tbl.ogtt_blood_chemistries()
        # tbl.screening_vitals_tbl()
        # tbl.screening_blood_chemistries_tbl()
        # tbl.submax_exercise_data()
        # tbl.vipr_heart_rate_data_tbl()
        # tbl.vipr_time_averaged_data_tbl()
        # tbl.vipr_time_resolved_data_tbl()
        # tbl.vipr_windows_tbl()
        # tbl.vo2_tbl()
        #
        # # load default values into certain tables
        # # proc = Procedures(cur)
        # # proc.insert_default_studies()
        # # proc.insert_default_box_colors()
        # # proc.insert_default_freezers()
        # # proc.insert_default_freezer_shelves()
        # # proc.insert_default_grid_locations()
        # # proc.insert_default_personnel(personnel_info)
        # # proc.insert_default_visit_names()
        # # proc.insert_default_statuses()
        # # proc.insert_default_time_points()
        # # proc.insert_default_tube_colors()
        # # proc.insert_default_vessels()
        #
        #
        #
        # # row = cur.fetchone()
        # # while row:
        # #     print(row[0])
        # #     row = cur.fetchone()
        # cur.commit()
        #
        #
        # # close connection
        # cur.close()
        # conn.close()


class LoadREDCap:
    def __init__(self, df):
        self.df = df

    def load_to_yogtt004(self):
        pass

    def load_to_yogtt005(self):
        # get fields from med hx survey form
        # get fields from med hx yogtt form
        # insert from survey form to yogtt form
        pass

    def load_to_yogtt006(self):
        pass

    def load_to_yogtt007(self):
        pass

    def load_to_yogtt008(self):
        pass
