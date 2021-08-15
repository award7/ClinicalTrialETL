"""load preprocessed data in db"""


# from database.stored_procedures import Procedures

# get db info
stream = connect.get_db_info()

# parse the info into respective dicts
db_info = stream['db']
personnel_info = stream['personnel']

# connect to db
conn = connect.connect_db(db_info)
cur = connect.get_cursor(conn)
connect.check_db(cur, db_info)

# change this ad hoc to specify the specific db to use
cur.execute("""USE phd_sandbox""")

# create any necessary tables
# order is important due to fk constraints
tbl = Tables(conn, cur)

## these tables are critical for most other tables
tbl.subjects_tbl()
tbl.visits_tbl()

## these tables have default values to insert following creation
tbl.studies_tbl()
tbl.visit_names_tbl()
tbl.personnel_tbl()
tbl.freezers_tbl()
tbl.freezer_shelves_tbl()
tbl.grid_locations_tbl()
tbl.box_colors_tbl()
tbl.vessels_tbl()
tbl.statuses_tbl()
tbl.timepoints_tbl()
tbl.tube_colors_tbl()

## all other tables
tbl.biosamples_tbl()
tbl.brain_volumes_tbl()
tbl.cbc_data_tbl()
tbl.cvr_data_tbl()
tbl.dexa_tbl()
tbl.hrr_data_tbl()
tbl.ogtt_blood_chemistries()
tbl.screening_vitals_tbl()
tbl.screening_blood_chemistries_tbl()
tbl.submax_exercise_data()
tbl.vipr_heart_rate_data_tbl()
tbl.vipr_time_averaged_data_tbl()
tbl.vipr_time_resolved_data_tbl()
tbl.vipr_windows_tbl()
tbl.vo2_tbl()

# load default values into certain tables
# proc = Procedures(cur)
# proc.insert_default_studies()
# proc.insert_default_box_colors()
# proc.insert_default_freezers()
# proc.insert_default_freezer_shelves()
# proc.insert_default_grid_locations()
# proc.insert_default_personnel(personnel_info)
# proc.insert_default_visit_names()
# proc.insert_default_statuses()
# proc.insert_default_time_points()
# proc.insert_default_tube_colors()
# proc.insert_default_vessels()



# row = cur.fetchone()
# while row:
#     print(row[0])
#     row = cur.fetchone()
cur.commit()


# close connection
cur.close()
conn.close()
