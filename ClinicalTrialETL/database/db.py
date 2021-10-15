import pyodbc
import yaml
import os
from itertools import product


# helper method for multiple classes
def _read_yaml(info: str) -> dict:
    directory = os.path.dirname(os.path.realpath(__file__))
    yml = os.path.join(directory, 'info.yaml')
    with open(yml, 'r') as f:
        stream = yaml.load(f, Loader=yaml.FullLoader)
    return stream['info']


class DB:

    def __init__(self):
        db_info = _read_yaml("info")

        self.conn = self.connect_db(db_info)
        self.cur = self.get_cursor()

        # check if db exists
        self.check_db(db_info)

        # set the db to use
        self.set_db(db_info)

    def __del__(self):
        self.conn.commit()
        self.cur.close()
        self.conn.close()

    def check_db(self, db_info) -> None:
        self.cur.execute("""
                        SELECT name 
                        FROM master.dbo.sysdatabases 
                        WHERE name = (?);
                        """, (db_info['name'],))
        data = self.cur.fetchall()

        # throw error if database does not exist
        # TODO: create db??
        if not data:
            Exception(f"Database '{db_info['name']}' does not exist.")

    @staticmethod
    def connect_db(db_info: dict) -> pyodbc.Connection:
        try:
            conn = pyodbc.connect(f"Driver={db_info['driver']};"
                                  f"Server={db_info['server']};"
                                  f"uid={db_info['username']};"
                                  f"pwd={db_info['password']};"
                                  "Trusted_Connection=yes;",
                                  timeout=0)
            conn.autocommit = True
            print('Successfully connected to SQL Server')
            return conn

        except pyodbc.Error as e:
            ConnectionError(e)
            print('Failed to connect to SQL Server')

    def get_cursor(self) -> pyodbc.Connection.cursor:
        return self.conn.cursor()

    def set_db(self, db_info: dict) -> None:
        self.cur.execute(f"USE {db_info['name']}")

    def _init_db(self) -> None:
        # get all sql files to create db
        root_path = os.path.join(os.path.realpath(__file__), 'sql')
        sp_files = os.path.join(os.path.realpath(__file__), 'stored_procedures')
        paths = [root_path, sp_files]

        # create tables, pk, and fk
        for path in paths:
            files = os.listdir(path)
            for file in files:
                full_file = os.path.join(path, file)
                with open(full_file, 'r') as sql_file:
                    self.cur.execute(sql_file.read())


class GetId:

    def __init__(self, db_object):
        self.cur = db_object.cur

    def __del__(self):
        self.cur.close()

    def get_box_color_id(self, color: str) -> int:
        sql = "EXEC sp__GetBoxColorId ?"
        params = tuple(color)
        return self._exec(sql, params)[0]

    def _exec(self, sql: str, params: tuple) -> list:
        self.cur.execute(sql, params)
        return self.cur.fetchall()


class InsertDefaultValues:

    def __init__(self, cursor):
        self.cur = cursor

    def __del__(self):
        self.cur.close()

    def insert_default_box_colors(self) -> None:
        sql = "sp__InsertDefaultValuesBoxColors @color=%s"
        colors = [
            'Green',
            'Red',
            'Yellow'
        ]
        self.cur.executemany(sql, colors)

    def insert_default_ethnicities(self) -> None:
        sql = "sp__InsertDefaultValuesEthnicities @ethnicity=%s"
        ethnicities = [
            'Hispanic',
            'Non-Hispanic',
            'Unknown or Not Reported'
        ]
        self.cur.executemany(sql, ethnicities)

    def insert_default_freezers(self) -> None:
        sql = "sp__InsertDefaultValuesFreezers @name=%s, @number=%s"
        freezers = list([
            ('-80', 14)
        ])
        self.cur.executemany(sql, freezers)

    def insert_default_freezer_shelves(self) -> None:
        sql = "sp__InsertDefaultValuesFreezerShelves @shelf_number=%s"
        shelf_numbers = [(val,) for val in list(range(1, 6))]
        self.cur.executemany(sql, shelf_numbers)

    def insert_default_grid_locations(self) -> None:
        """standard freezer boxes in the lab are 10x10"""
        sql = "sp__InsertDefaultValuesGridLocations @location=%s"
        cols = [chr(n) for n in range(65, 75)]
        grid = [("".join(map(str, x)),) for x in product(cols, range(1, 11))]
        self.cur.executemany(sql, grid)

    def insert_default_personnel(self) -> None:
        # todo: fix params 2 vs. 1
        sql = "sp__InsertDefaultValuesPersonnel @first_name=%s, @last_name=%s"
        first_names = []
        last_names = []
        personnel_info = _read_yaml("personnel")
        for person in personnel_info:
            first_names.append(personnel_info[person]['first_name'])
            last_names.append(personnel_info[person]['last_name'])
        name_pairs = list(zip(first_names, last_names))
        self.cur.executemany(sql, name_pairs)

    def insert_default_races(self) -> None:
        sql = "sp__InsertDefaultValuesRaces @race=%s"
        races = [
            'American Indian or Alaska Native',
            'Asian',
            'Black or African American',
            'Native Hawaiian or Other Pacific Islander',
            'White or Caucasian',
            'Multiracial',
            'Unknown or Not Reported'
        ]
        self.cur.executemany(sql, races)

    def insert_default_sexes(self) -> None:
        sql = "sp__InsertDefaultValuesSexes @sex=%s"
        sexes = [
            'Male',
            'Female'
        ]
        self.cur.executemany(sql, sexes)

    def insert_default_statuses(self) -> None:
        sql = "sp__InsertDefaultValuesStatuses @status=%s"
        statuses = [
            'In',
            'Out',
            'Analyzed',
            'Destroyed'
        ]
        self.cur.executemany(sql, statuses)

    def insert_default_studies(self) -> None:
        sql = "sp__InsertDefaultValuesStudies @study=%s"
        studies = [
            '2019-0361',
            '2019-0838'
        ]
        self.cur.executemany(sql, studies)

    def insert_default_time_points(self) -> None:
        sql = "sp__InsertDefaultValuesTimePointLabels @label=%s"
        labels = ['0', '5', '10', '15', '20', '30', '45', '60']
        self.cur.executemany(sql, labels)

    def insert_default_tube_colors(self) -> None:
        sql = "sp__InsertDefaultValuesTubeColors @color=%s"
        colors = [
            'Green',
            'Red',
            'Yellow'
        ]
        self.cur.executemany(sql, colors)

    def insert_default_vessels(self) -> None:
        sql = "sp__InsertDefaultValuesVessels @vessel=%s"
        vessels = [
            'ICA_l',
            'ICA_r',
            'MCA_l',
            'MCA_r',
            'ACA_l',
            'ACA_r',
            'VA_l',
            'VA_r',
            'BA',
            'PCA_l',
            'PCA_r',
            'SSS',
            'SS',
            'TS',
            'nTS'
        ]
        self.cur.executemany(sql, vessels)

    def insert_default_visit_names(self) -> None:
        sql = "sp__InsertDefaultValuesVisitNames @visit_name=%s"
        names = [
            'Screening',
            'ReScreening',
            'Cognitive',
            'ReCognitive',
            'Structural',
            'ReStructural',
            'OGTT',
            'ReOGTT',
            'Hypercapnia',
            'ReHypercapnia',
            'SubmaximalExercise',
            'ReSubmaximalExercise'
            'DEXA',
            'ReDEXA',
            'VO2max',
            'ReVO2max'
        ]
        self.cur.executemany(sql, names)

if __name__ == '__main__':
    # connect to db, build if needed
    db = DB()

    # insert default values if needed
    proc = InsertDefaultValues(db)
    proc.insert_default_box_colors()
    proc.insert_default_ethnicities()
    proc.insert_default_freezer_shelves()
    proc.insert_default_freezers()
    proc.insert_default_grid_locations()
    proc.insert_default_personnel()
    proc.insert_default_races()
    proc.insert_default_sexes()
    proc.insert_default_statuses()
    proc.insert_default_studies()
    proc.insert_default_time_points()
    proc.insert_default_tube_colors()
    proc.insert_default_vessels()
    proc.insert_default_visit_names()
