from ClinicalTrialETL.redcap_api import api


"""module for extracting data in the ETL process"""


def extract_redcap_data(staging_table: str, conn_id: str, export_content: str = 'records', *args, **kwargs) -> None:
    """
    Extract raw data from REDCap

    :param kwargs: key-value pairs of redcap_api parameters to supply to the redcap_api call specified by export_content.
    """

    # validate the export content being requested
    export_content_mapping = _get_export_content_mapping()

    if export_content not in export_content_mapping.keys():
        raise ValueError(f'Invalid value for export_content: {export_content}. '
                         f'Options include {export_content_mapping.keys()}')

    # export from redcap
    data = export_content_mapping[export_content](*args, **kwargs)

    # load to staging table
    sql = 'INSERT INTO {0}({1}) VALUES ({2})'
    sql = sql.format(staging_table, ','.join(data[0].keys()), ','.join('%s' for x in range(0, len(data[0]))))

    for entry in data:
        values = tuple(entry.get(key, None) for key in entry.keys())
        # cur.execute(sql, values)


def _get_export_content_mapping():
    return {
        'arms': api.export_arms,
        'events': api.export_events,
        'field_names': api.export_field_names,
        'file': api.export_file,
        'form_event_mapping': api.export_form_event_mapping,
        'logging': api.export_logging,
        'metadata': api.export_metadata,
        'records': api.export_records,
    }
