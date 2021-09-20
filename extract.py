from api import api
import pandas as pd
import os
from sys import platform
from datetime import datetime
from utils import get_drives_windows


"""module for extracting data in the ETL process"""


def extact_redcap_data(ti: object = None, export_content: str = 'records', file_name: str = None,
                       staging_location: str = None, **kwargs) -> tuple:
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
    :param staging_location: path to staging area to save raw data. If staging_location is None, the staging_location
    defaults to the users desktop location. Default = None.
    :type staging_location: str
    :param kwargs: key-value pairs of api parameters to supply to the api call specified by export_content.
    """

    export_content_options = [
        'arms' 
        'events' 
        'field_names',
        'file',
        'form_event_mapping',
        'logging',
        'records'
    ]
    if export_content not in export_content_options:
        raise ValueError(f'Invalid value for export_content: {export_content}.\nOptions include {export_content_options}')

    if file_name is not None and not isinstance(file_name, str):
        raise TypeError(f'Invalid value for file_name: {file_name}. Value must be a string.')

    # timestamp format YYYYMMDD_HHMMSS
    timestamp = datetime.now().strftime('%Y%m%d_%I%M%S')
    file_ext = 'csv'
    fname = f'irb_2019_0361_{export_content}_raw_{timestamp}.{file_ext}'

    # determine staging location
    if staging_location is None:
        # determine computer platform (i.e. type)
        # todo: do similar for mac/linux
        if platform == 'win32':
            drives = get_drives_windows()
            server_drive = 'L:'
            if server_drive not in drives:
                # todo: raise Exception(f'Server {server_drive} not available')
                pass
            # todo: change default to L:/bucket
            staging_location = os.path.join("C:/", "Users", os.getlogin(), "Desktop")

    # export from redcap
    json_data = getattr(api, f'export_{export_content}')()
    df = pd.DataFrame.from_records(api.export_records(**kwargs))

    # save file
    df.to_csv(os.path.join(staging_location, fname))

    # do xcom_push if ti != None
    if ti is not None:
        ti.xcom_push(key='file_name', value=file_name)
        ti.xcom_push(key='staging_location', value=staging_location)
