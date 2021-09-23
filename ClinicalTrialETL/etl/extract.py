from ClinicalTrialETL.redcap_api import api
import pandas as pd
import os
from datetime import datetime
from ClinicalTrialETL.etl.utils import get_drives_windows, get_default_staging_location

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

    # validate the export content being requested
    export_content_mapping = _get_export_content_mapping()

    if export_content not in export_content_mapping.keys():
        raise ValueError(f'Invalid value for export_content: {export_content}. '
                         f'Options include {export_content_mapping.keys()}')

    # validate file_name or set to default
    FILE_EXT = 'csv'
    if file_name is not None:
        if not isinstance(file_name, str):
            raise TypeError(f'Invalid value for file_name: {file_name}. Value must be a string.')

        # change file to .csv, if needed
        fname, ext = os.path.splitext(file_name)[-1]
        if ext != f'.{FILE_EXT}':
            print('Converting file name to .csv')
            file_name = f'{fname}.{FILE_EXT}'
    else:
        # timestamp format YYYYMMDD_HHMMSS
        timestamp = datetime.now().strftime('%Y%m%d_%I%M%S')
        file_name = f'irb_2019_0361_{export_content}_raw_{timestamp}.{FILE_EXT}'

    # determine staging location
    if raw_staging_location is not None:
        if not os.path.exists(raw_staging_location):
            raise NotADirectoryError(raw_staging_location)
    else:
        raw_staging_location = get_default_staging_location(bucket='raw')

    # export from redcap
    json_data = export_content_mapping[export_content](**kwargs)
    df = pd.DataFrame.from_records(json_data)

    # save file
    df.to_csv(os.path.join(raw_staging_location, file_name))

    # do xcom_push if ti != None
    if ti is not None:
        ti.xcom_push(key='file_name', value=file_name)
        ti.xcom_push(key='raw_staging_location', value=raw_staging_location)


def _get_export_content_mapping():
    return {
        'arms': api.export_arms,
        'events': api.export_events,
        'field_names': api.export_field_names,
        'file': api.export_file,
        'form_event_mapping': api.export_form_event_mapping,
        'logging': api.export_logging,
        'records': api.export_records,
    }


