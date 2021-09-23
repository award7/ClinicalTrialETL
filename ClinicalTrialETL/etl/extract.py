from ClinicalTrialETL.redcap_api import api
import pandas as pd
import os
from sys import platform
from datetime import datetime
from ClinicalTrialETL.etl.utils import get_drives_windows

"""module for extracting data in the ETL process"""


def extract_redcap_data(ti: object = None, export_content: str = 'records', file_name: str = None,
                        raw_staging_location: str = None, **kwargs) -> None:
    """
    Extract raw data from REDCap

    :param ti: Airflow task instance object. Used for performing xcom_push. A default value of None is provided so that
        the function can run independently of Airflow. Default=None.
    :type ti: object
    :param export_content: specific type of content to export from REDCap. Options include 'arms', 'events',
        'field_names', 'file', 'form_event_mapping', 'logging', 'records'. Default='records'.
    :param file_name: output file name. If None, the output file name is
        'irb_2019_0361_{export_content}_raw_{timestamp}.csv', where export_content is the value of export_content
        parameter and timestamp is the current date and time formatted as YYYYMMDD_HHMMSS. Default=None.
    :type file_name: str
    :param raw_staging_location: path to staging area to save raw data. If staging_location is None, the staging_location
    defaults to the users desktop location. Default = None.
    :type raw_staging_location: str
    :param kwargs: key-value pairs of redcap_api parameters to supply to the redcap_api call specified by export_content.
    """

    export_content_mapping = {
        'arms': api.export_arms,
        'events': api.export_events,
        'field_names': api.export_field_names,
        'file': api.export_file,
        'form_event_mapping': api.export_form_event_mapping,
        'logging': api.export_logging,
        'records': api.export_records,
    }

    if export_content not in export_content_mapping.keys():
        raise ValueError(f'Invalid value for export_content: {export_content}. '
                         f'Options include {export_content_mapping.keys()}')

    file_ext = 'csv'
    if file_name is not None:
        if not isinstance(file_name, str):
            raise TypeError(f'Invalid value for file_name: {file_name}. Value must be a string.')

        # change file to .csv, if needed
        fname, ext = os.path.splitext(file_name)[-1]
        if ext != f'.{file_ext}':
            print('Converting file name to .csv')
            file_name = f'{fname}.{file_ext}'
    else:
        # timestamp format YYYYMMDD_HHMMSS
        timestamp = datetime.now().strftime('%Y%m%d_%I%M%S')
        file_name = f'irb_2019_0361_{export_content}_raw_{timestamp}.{file_ext}'

    # determine staging location
    if raw_staging_location is None:
        # determine computer platform (i.e. type)
        # todo: do similar for mac/linux
        if platform == 'win32':
            drives = get_drives_windows()
            server_drive = 'L:'
            if server_drive not in drives:
                # todo: raise Exception(f'Server {server_drive} not available')
                pass
            # todo: change default to L:/bucket
            raw_staging_location = os.path.join("C:/", "Users", os.getlogin(), "Desktop")
        elif platform == 'linux':
            raw_staging_location = os.path.join('/home', os.getlogin(), 'Desktop')

    # export from redcap
    json_data = export_content_mapping[export_content](**kwargs)
    df = pd.DataFrame.from_records(json_data)

    # save file
    df.to_csv(os.path.join(raw_staging_location, file_name))

    # do xcom_push if ti != None
    if ti is not None:
        ti.xcom_push(key='file_name', value=file_name)
        ti.xcom_push(key='staging_location', value=raw_staging_location)
