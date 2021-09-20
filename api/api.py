import requests
import os
import yaml
import enum


"""module to make API calls to REDCap"""


class PostAPI:
    """decorator class for wrapping and making api calls to REDCap"""

    def __init__(self, func):
        self.func = func
        self.token = None
        self.url = None
        self.get_config_info()

    def __call__(self, *args, **kwargs):
        # get specific post parameters being sought
        post = self.func(*args, **kwargs)

        # add token to post parameters
        post['token'] = self.token

        # make request
        request = requests.post(self.url, data=post)

        # check response code, throw error if necessary
        self.parse_api_response(request)

        # return json data from API call
        return request.json()

    def get_config_info(self) -> None:
        config_file = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'config.yaml')
        with open(config_file, 'r') as f:
            config_data = yaml.load(f, Loader=yaml.FullLoader)
        self.token = config_data['api']['token']
        self.url = config_data['api']['url']

    def log_api_response(self):
        # todo: create log?
        pass

    @staticmethod
    def parse_api_response(request):
        if request.status_code == 200:
            pass
        elif request.status_code == 400:
            # todo: build logger
            ValueError(f"{request.status_code}: {request.reason}")
        elif request.status_code == 401:
            ValueError(f"Error {request.status_code}: API token is missing or incorrect.")
        elif request.status_code == 403:
            PermissionError(f"Error {request.status_code}: You do not have permissions to use the API.")
        elif request.status_code == 404:
            ValueError(f"Error {request.status_code}: The URI you requested is invalid or the resource does not exist.")
        elif request.status_code == 406:
            ValueError(f"Error {request.status_code}: The data being imported was formatted incorrectly.")
        elif request.status_code == 500:
            ConnectionError(f"Error {request.status_code}: The server encountered an error processing your request.")
        elif request.status_code == 501:
            ValueError(f"Error {request.status_code}: The requested method is not implemented.")


@PostAPI
def export_arms(*arms: str, data_format: str = 'json'):
    post = {
        'content': 'arm',
        'returnFormat': 'json'
    }
    if len(arms) > 1:
        post = _helper_to_add_key_values_to_post_dict('arms', list(arms), post)
        # for idx, arm in enumerate(arms):
        #     post[f'arms[{idx}]'] = arm
    return post


@PostAPI
def export_events(*arms: str, post_format: str = 'json', data_format: str = 'json'):
    post = {
        'content': 'event',
        'format': post_format,
        'returnFormat': data_format
    }
    if len(arms) > 1:
        post = _helper_to_add_key_values_to_post_dict('arms', list(arms), post)
        # for idx, arm in enumerate(arms):
        #     post[f'arms[{idx}]'] = arm
    return post


@PostAPI
def export_field_names(*fields: str, post_format: str = 'json', data_format: str = 'json'):
    """This method returns a list of the export/import-specific version of field names for all fields (or for one field,
    if desired) in a project. This is mostly used for checkbox fields because during data exports and data imports,
    checkbox fields have a different variable name used than the exact one defined for them in the Online Designer and
    Data Dictionary, in which *each checkbox option* gets represented as its own export field name in the following
    format: field_name + triple underscore + converted coded value for the choice. For non-checkbox fields, the export
    field name will be exactly the same as the original field name. Note: The following field types will be
    automatically removed from the list returned by this method since they cannot be utilized during the data import
    process: 'calc', 'file', and 'descriptive'.

    The list that is returned will contain the three following attributes for each field/choice: 'original_field_name',
    'choice_value', and 'export_field_name'. The choice_value attribute represents the raw coded value for a checkbox
    choice. For non-checkbox fields, the choice_value attribute will always be blank/empty. The export_field_name
    attribute represents the export/import-specific version of that field name."""
    post = {
        'content': 'exportFieldNames',
        'format': post_format,
        'returnFormat': data_format
    }
    if len(fields) > 1:
        post = _helper_to_add_key_values_to_post_dict('fields', list(fields), post)
        # for idx, field in enumerate(fields):
        #     post[f'fields[{idx}]'] = field
    return post


@PostAPI
def export_file(record_id: str, field_name: str, event: enum.Enum, repeat_instance: str, data_format: str = 'json'):
    """This method allows you to download a document that has been attached to an individual record for a File Upload
    field. Please note that this method may also be used for Signature fields (i.e. File Upload fields with 'signature'
    validation type).

    Note about export rights: Please be aware that Data Export user rights will be applied to this API request. For
    example, if you have 'No Access' data export rights in the project, then the API file export will fail and return an
    error. And if you have 'De-Identified' or 'Remove all tagged Identifier fields' data export rights, then the API
    file export will fail and return an error *only if* the File Upload field has been tagged as an Identifier field. To
    make sure that your API request does not return an error, you should have 'Full Data Set' export rights in the
    project."""
    post = {
        'content': 'file',
        'action': 'export',
        'record': record_id,
        'field': field_name,
        'event': event,
        'repeat_instance': repeat_instance,
        'returnFormat': data_format
    }
    return post


@PostAPI
def export_form_event_mapping(*arms: str, post_format: str = 'json', data_format: str = 'json'):
    post = {
        'content': 'formEventMapping',
        'format': post_format
    }
    if len(arms) > 1:
        post = _helper_to_add_key_values_to_post_dict('arms', list(arms), post)
        # for idx, arm in enumerate(arms):
        #     post[f'arms[{idx}]'] = arm
    return post


@PostAPI
def export_logging(log_type: str = 'all', user: str = None, record_id: str = None, dag: str = None,
                   begin_time: str = None, end_time: str = None, data_format: str = 'json',
                   error_format: str = 'json'):
    """This method allows you to export the logging (audit trail) of all changes made to this project, including data
    exports, data changes, project metadata changes, modification of user rights, etc.

    :param log_type: You may choose event type to fetch result for specific event type. Options: 'all', 'data_export',
        'manage_design', 'user_role_cud', 'record_cud', 'record_create', 'record_updated', 'record_deleted',
        'record_locking_esignatures', 'page_views'. Default: 'all'. *Note: when returning 'all', it excludes page views.

    :param user: To return only the events belong to specific user (referring to existing username), provide a user. If
        not specified, it will assume all users.

    :param record_id: To return only the events belong to specific record (referring to existing record name), provide
        a record. If not specified, it will assume all records. This parameter is available only when event is related
        to record.

    :param dag: To return only the events belong to specific DAG (referring to group_id), provide a dag. If not
        specified, it will assume all dags.

    :param begin_time: To return only the events that have been logged *after* a given date/time, provide a timestamp in
        the format YYYY-MM-DD HH:MM (e.g., '2017-01-01 17:00' for January 1, 2017 at 5:00 PM server time). If not
        specified, it will assume no begin time. If only a date is passed, the time will default to
        12:00 AM server time.

    :param end_time: To return only records that have been logged *before* a given date/time, provide a date or a
        timestamp in the format YYYY-MM-DD HH:MM (e.g., '2017-01-01 17:00' for January 1, 2017 at 5:00 PM server time).
        If not specified, it will use the current server time. If only a date is passed, the time will default to
        11:59 PM server time.

    :param data_format: Specifies the format that data are returned. Options: 'csv', 'json', 'xml'. Default: 'json'.

    :param error_format: Specifies the format of error messages. If you do not pass in this flag, it will select the
        default format for you passed based on the 'data_format' flag you passed in. Options: 'csv', 'json', 'xml'.
        Default: 'json'.
    """

    log_types = ['all', 'data_export', 'manage_design', 'user_role_cud', 'record_cud', 'record_create',
                 'record_updated', 'record_deleted', 'record_locking_esignatures', 'page_views']

    if log_type not in log_types:
        ValueError(f"Export Logging: Invalid log type f{log_type}")

    # todo: check for user in list of users
    # todo: check that record_id exists in project
    # todo: check dag

    post = {
        'content': 'log',
        'format': data_format,
        'logType': log_type,
        'returnFormat': error_format
    }
    return post


@PostAPI
def export_records(records: list = None, fields: list = None, forms: list = None, events: list = None,
                   raw_or_label: str = 'raw', raw_or_label_headers: str = 'raw', export_checkbox_label: bool = False,
                   export_survey_fields: bool = False, export_dags: bool = False, filter_logic: str = None,
                   date_range_begin: str = None, date_range_end: str = None, csv_delimiter: str = 'comma',
                   decimal_char: str = None, return_type: str = 'flat', data_format: str = 'json',
                   error_format: str = 'json'):
    """This method allows you to export a set of records for a project.

    :param records: An array of record names specifying specific records you wish to pull. If 'None', all records will
        be pulled. Default: 'None'.

    :type records: list

    :param fields: An array of field names specifying specific fields you wish to pull. If 'None', all fields will be
        pulled. Default: 'None'.

    :type fields: list

    :param forms: An array of form names you wish to pull records for. If 'None', then all forms will be pulled.
        Default: 'None'

    :type forms: list

    :param events: An array of unique event names that you wish to pull records for. If 'None', all events will be
    pulled. Default: 'None'. *Note: only for longitudinal projects.

    :type events: list

    :param raw_or_label: Export the raw coded values or labels for the options of multiple choice fields. Options:
        'raw', 'label'. Default: 'raw'.

    :type raw_or_label: str

    :param raw_or_label_headers: For the CSV headers, export the variable/field names (raw) or the field labels (label).
        Options: 'raw', 'label'. Default: 'raw'. *Note: for 'csv' format 'flat' type only.

    :type raw_or_label_headers: str

    :param export_checkbox_label: Specifies the format of checkbox field values specifically when exporting the data as
        labels (i.e., when raw_or_label=label) in flat format (i.e., when return_type=flat). When exporting labels, by
        default (if export_checkbox_label=false), all checkboxes will either have a value 'Checked' if they are checked
        or 'Unchecked' if not checked. But if export_checkbox_label is set to true, it will instead export the
        checkbox value as the checkbox option's label (e.g., 'Choice 1') if checked or it will be blank/empty (no value)
        if not checked. If raw_or_label=false or if return_type=eav, then the export_checkbox_label flag is ignored.
        (The export_checkbox_label parameter is ignored for return_type=eav because 'eav' type always exports checkboxes
        differently anyway, in which checkboxes are exported with their true variable name (whereas the 'flat' type
        exports them as variable___code format), and another difference is that 'eav' type *always* exports checkbox
        values as the choice label for labels export, or as 0 or 1 (if unchecked or checked, respectively) for raw
        export.). Default: False.

    :type export_checkbox_label: bool

    :param export_survey_fields: Specifies whether or not to export the survey identifier field
        (e.g., 'redcap_survey_identifier') or survey timestamp fields (e.g., instrument+'_timestamp') when surveys are
        utilized in the project. If set to 'true', it will return the redcap_survey_identifier field and also the survey
        timestamp field for a particular survey when at least one field from that survey is being exported. *NOTE: If
        the survey identifier field or survey timestamp fields are imported via API data import, they will simply be
        ignored since they are not real fields in the project but rather are pseudo-fields. Default: False.

    :type export_survey_fields: bool

    :param export_dags: Specifies whether or not to export the 'redcap_data_access_group' field when data access groups
        are utilized in the project. *NOTE: This flag is only viable if the user whose token is being used to make the
        API request is *not* in a data access group. If the user is in a group, then this flag will revert to its
        default value. Default: False.

    :type export_dags: bool

    :param filter_logic: String of logic text (e.g., [age] > 30) for filtering the data to be returned by this API
        method, in which the API will only return the records (or record-events, if a longitudinal project) where the
        logic evaluates as TRUE. *NOTE: if the filter logic contains any incorrect syntax, the API will respond with an
        error message.

    :type filter_logic: str

    :param date_range_begin: A timestamp to return only records that have been created or modified after a given
        date/time. Format is YYYY-MM-DD HH:MM:SS (e.g., '2017-01-01 00:00:00' for January 1, 2017 at
        midnight server time). If 'None', it will assume no begin time. Default: 'None'.

    :type date_range_begin: str

    :param date_range_end: A timestamp to return only records that have been created or modified before a given
        date/time. Format is YYYY-MM-DD HH:MM:SS (e.g., '2017-01-01 00:00:00' for January 1, 2017 at
        midnight server time). If 'None', it will assume no end time. Default: 'None'.

    :type date_range_end: str

    :param csv_delimiter: Set the delimiter used to separate values in the CSV data file. Options: 'comma', 'tab',
        'semicolon', 'pipe', or 'caret'. Default: 'comma'. *NOTE: for CSV format only.

    :type csv_delimiter: str

    :param decimal_char: If specified, force all numbers into same decimal format. You may choose to force all data
        values containing a decimal to have the same decimal character, which will be applied to all calc fields and
        number-validated text fields. Options: 'comma', 'dot'.  If 'None', numbers will be exported using the fields'
        native decimal format.

    :type decimal_char: str

    :param return_type: Specifies the method in which returned data is modeled. 'flat' option outputs one record per
        row. 'eav' option outputs one data point per row. *Note: For non-longitudinal studies, the fields will be
        record, field_name, value. For longitudinal studies, the fields will be record, field_name, redcap_event_name.
        Options: 'flat', 'eav'. Default: 'flat'.

    :type return_type: str

    :param data_format: Specifies the format that data are returned. Options: 'csv', 'json', 'xml'. Default: 'json'.

    :type data_format: str

    :param error_format: Specifies the format of error messages. If you do not pass in this flag, it will select the
        default format for you passed based on the 'data_format' flag you passed in. Options: 'csv', 'json', 'xml'.
        Default: 'json'.

    :type error_format: str
    """

    post = {
        'content': 'record',
        'rawOrLabel': raw_or_label,
        'rawOrLabelHeaders': raw_or_label_headers,
        'exportCheckboxLabel': str(export_checkbox_label),
        'exportSurveyFields': str(export_survey_fields),
        'exportDataAccessGroups': str(export_dags),
        'type': return_type,
        'returnFormat': error_format,
        'format': data_format
    }

    # add filter logic, if passed
    if filter_logic is not None:
        post['filterLogic'] = filter_logic

    # add date begin, if passed
    if date_range_begin is not None:
        post['dateRangeBegin'] = date_range_begin

    # add date end, if passed
    if date_range_end is not None:
        post['dateRangeEnd'] = date_range_end

    # translate the csv_delimiter arg to the appropriate string for the API call
    # note: don't need to translate 'tab'
    if csv_delimiter.lower() == 'comma':
        csv_delimiter = ','
    elif csv_delimiter.lower() == 'semicolon':
        csv_delimiter = ';'
    elif csv_delimiter.lower() == 'pipe':
        csv_delimiter = '|'
    elif csv_delimiter.lower() == 'caret':
        csv_delimiter = '^'
    post['csvDelimiter'] = csv_delimiter

    # translate the decimal_char arg to the appropriate string for the API call
    if decimal_char is not None:
        if decimal_char == 'comma':
            decimal_char = ','
        elif decimal_char == 'dot':
            decimal_char = '.'
        post['decimalCharacter'] = decimal_char

    # add specific records, if passed
    if records is not None:
        post = _helper_to_add_key_values_to_post_dict('records', records, post)

    # add specific fields, if passed
    if fields is not None:
        post = _helper_to_add_key_values_to_post_dict('fields', fields, post)

    # add specific forms, if passed
    if forms is not None:
        post = _helper_to_add_key_values_to_post_dict('forms', forms, post)

    # add specific events, if passed
    if events is not None:
        post = _helper_to_add_key_values_to_post_dict('events', events, post)

    return post


@PostAPI
def import_records(data: dict, records: list = None, overwrite: bool = False, auto_number: bool = False,
                   data_type: str = 'flat', date_format: str = 'YMD', return_content: str = 'count',
                   csv_delimiter: str = 'comma', data_format: str = 'json', error_format: str = 'json'):

    post = {
        'content': 'record',
        'data': data,
        'type': data_type,
        'forceAutoNumber': str(auto_number),
        'returnContent': return_content,
        'format': data_format,
        'returnFormat': error_format,
        'dateFormat': date_format
    }

    # translate overwrite argument to the appropriate string for the API call
    if overwrite is False:
        overwrite_str = 'normal'
    else:
        overwrite_str = 'overwrite'
    post['overwriteBehavior'] = overwrite_str

    # translate the csv_delimiter arg to the appropriate string for the API call
    # note: don't need to translate 'tab'
    if csv_delimiter.lower() == 'comma':
        csv_delimiter = ','
    elif csv_delimiter.lower() == 'semicolon':
        csv_delimiter = ';'
    elif csv_delimiter.lower() == 'pipe':
        csv_delimiter = '|'
    elif csv_delimiter.lower() == 'caret':
        csv_delimiter = '^'
    post['csvDelimiter'] = csv_delimiter

    # add specific records, if passed
    if records is not None:
        post = _helper_to_add_key_values_to_post_dict('records', records, post)

    return post


def _helper_to_add_key_values_to_post_dict(key_basename: str, values_list: list, post_dict: dict) -> dict:
    for idx, value in enumerate(values_list):
        post_dict[f'{key_basename}[{idx}]'] = value
    return post_dict


class Events(enum.Enum):
    """enum class for easy identification of available events in the REDCap project"""
    prescreening_arm_1 = 1
    screening_arm_1 = 2
    cognitive_testing_arm_1 = 3
    mri_structural_vis_arm_1 = 4
    ogttmri_visit_arm_1 = 5
    dexa_data_arm_1 = 6
    concomitant_medica_arm_1 = 7
    deviations_arm_1 = 8
    adverse_events_arm_1 = 9
    note_to_file_arm_1 = 10
    visit_note_arm_1 = 11
    subject_off_study_arm_1 = 12
    rescreening_arm_1 = 13
    recognitive_testin_arm_1 = 14
    remri_structural_v_arm_1 = 15
    reogttmri_visit_arm_1 = 16
    redexa_data_arm_1 = 17


class Forms(enum.Enum):
    """enum class for easy identification of available forms in the REDCap project"""
    insulin_resistance_in_adolescents_survey = 1
    office_use = 2
    eassent = 3
    econsent = 4
    saved_consents = 5
    demographics_survey = 6
    medical_history_survey = 7
    mri_survey = 8
    tanner_survey = 9
    par_survey = 10
    yogtt002_screening_visit_checklist = 11
    yogtt003_informed_consenthippa_authorization_docum = 12
    yogtt004_demographics = 13
    yogtt005_medical_history = 14
    yogtt006_mri_safety_questionnaire = 15
    yogtt007_3_day_physical_activity_recall = 16
    yogtt008_tanner_questionnaire = 17
    yogtt009_screening_visit_data_collection_form = 18
    yogtt010_eligibility_criteria_form = 19
    yogtt011_cognitive_study_visit_protocol_checklist = 20
    yogtt012_mri_structural_visit_checklist = 21
    yogtt013_ogtt_mri_study_visit_protocol_checklist = 22
    yogtt015_concomitant_medication_tracking_log = 23
    yogtt016_deviation_tracking_log = 24
    yogtt017_adverse_event_tracking_log = 25
    yogtt018_note_to_file = 26
    yogtt019_visit_note = 27
    yogtt020_subject_off_study = 28
    dexa_data = 29
    insulin_data = 30
    cognitive_scores = 31
    internal_audit_review_form = 32


# these classes contain fields that are of interest for analysis purposes. Likely to remove them from this module...
class Fields:

    def __init__(self):
        pass

    def cbc(self):
        fields = [
            'date_scr_data',
            'yn_eligible',
            'age_scr_data',
            'sex_scr_data',
            'wcc_scr_data',
            'rcc_scr_data',
            'hb_scr_data',
            'htc_scr_data',
            'mcv_scr_data',
            'mchc_scr_data',
            'rdwcv_scr_data',
            'rdwsd_scr_data',
            'platelet_scr_data',
            'absneutro_scr_data',
            'absimmgran_scr_data',
            'abslymph_scr_data',
            'absmono_scr_data',
            'abseosin_scr_data',
            'absbaso_scr_data',
            'nucrbc_scr_data',
            'relneutro_scr_data',
            'relimmgran_scr_data',
            'rellymph_scr_data',
            'relmono_scr_data',
            'releosin_scr_data',
            'relbaso_scr_data',
        ]
        return fields

    def demographics(self):
        fields = [
            'date_scr_data',
            'yn_eligible',
            'subj_id_eligible',
            'age_scr_data',
            'birth_date_demo',
            'sex_scr_data',
            'ethnicity2_demo',
            'race2_demo',
            'height_scr_data',
            'weight_scr_data',
            'waist_scr_data',
            'hip_scr_data',
            'male_genitalia1_tanner',
            'male_genitalia2_tanner',
            'female_gentalia1_tanner',
            'female_gentalia2_tanner',
            'hr4_scr_data',
            'sbp4_scr_data',
            'dbp4_scr_data',
            'map4_scr_data',
            'spo24_scr_data',
            'glucose3_scr_data',
            'insulin_scr_data',
            'hba1c3_scr_data',
            'hb_scr_data',
            'cholesterol3_scr_data',
            'hdl3_scr_data',
            'ldl3_scr_data',
            'trigs3_scr_data'
        ]
        return fields

    def dexa(self):
        fields = [
            'date_dexa',
            'yn_eligible',
            'age_scr_data',
            'sex_scr_data',
            'trunk1_dexa',
            'trunk2_dexa',
            'trunk3_dexa',
            'trunk4_dexa',
            'trunk5_dexa',
            'android1_dexa',
            'android2_dexa',
            'android3_dexa',
            'android4_dexa',
            'android5_dexa',
            'gynoid1_dexa',
            'gynoid2_dexa',
            'gynoid3_dexa',
            'gynoid4_dexa',
            'gynoid5_dexa',
            'total1_dexa',
            'total2_dexa',
            'total3_dexa',
            'total4_dexa',
            'total5_dexa',
            'vat_vol_dexa',
            'vat_mass_dexa',
        ]
        return fields

    def med_hx(self):
        fields = [
            'head_yn_hx',
            'head_specify_hx',
            'head_date_hx',
            'head_current_hx',
            'head_rx_hx',
            'neck_yn_hx',
            'neck_specify_hx',
            'neck_date_hx',
            'neck_current_hx',
            'neck_rx_hx',
            'asthma_yn_hx',
            'asthma_date_hx',
            'asthma_current_hx',
            'asthma_rx_hx',
            'asthma_ex_yn_hx',
            'asthma_ex_date_hx',
            'asthma_ex_current_hx',
            'asthma_ex_rx_hx',
            'osa_yn_hx',
            'osa_date_hx',
            'osa_current_hx',
            'osa_rx_hx',
            'lung_yn_hx',
            'lung_specify_hx',
            'lung_date_hx',
            'lung_current_hx',
            'lung_rx_hx',
            'resp_other_yn_hx',
            'resp_other_specify_hx',
            'resp_other_date_hx',
            'resp_other_current_hx',
            'resp_other_rx_hx',
            'cad_yn_hx',
            'cad_date_hx',
            'cad_current_hx',
            'cad_rx_hx',
            'pad_yn_hx',
            'pad_date_hx',
            'pad_current_hx',
            'pad_rx_hx',
            'mi_yn_hx',
            'mi_date_hx',
            'mi_current_hx',
            'mi_rx_hx',
            'valve_yn_hx',
            'valve_date_hx',
            'valve_current_hx',
            'valve_rx_hx',
            'chf_yn_hx',
            'chf_date_hx',
            'chf_current_hx',
            'chf_rx_hx',
            'heart_surg_yn_hx',
            'heart_surg_specify_hx',
            'heart_surg_date_hx',
            'heart_surg_current_hx',
            'heart_surg_rx_hx',
            'stroke_yn_hx',
            'stroke_date_hx',
            'stroke_current_hx',
            'stroke_rx_hx',
            'htn_yn_hx',
            'htn_date_hx',
            'htn_current_hx',
            'htn_rx_hx',
            'choles_yn_hx',
            'choles_date_hx',
            'choles_current_hx',
            'choles_rx_hx',
            'cv_other_yn_hx',
            'cv_other_specify_hx',
            'cv_other_date_hx',
            'cv_other_current_hx',
            'cv_other_rx_hx',
            'gi_yn_hx',
            'gi_specify_hx',
            'gi_date_hx',
            'gi_current_hx',
            'gi_rx_hx',
            'liver_yn_hx',
            'liver_specify_hx',
            'liver_date_hx',
            'liver_current_hx',
            'liver_rx_hx',
            'hepatic_other_yn_hx',
            'hepatic_other_specify_hx',
            'hepatic_other_date_hx',
            'hepatic_other_current_hx',
            'hepatic_other_rx_hx',
            'musculo_yn_hx',
            'musculo_specify_hx',
            'musculo_date_hx',
            'musculo_current_hx',
            'musculo_rx_hx',
            'clot_yn_hx',
            'clot_specify_hx',
            'clot_date_hx',
            'clot_current_hx',
            'clot_rx_hx',
            'blood_yn_hx',
            'blood_specify_hx',
            'blood_date_hx',
            'blood_current_hx',
            'blood_rx_hx',
            'coag_yn_hx',
            'coag_specify_hx',
            'coag_date_hx',
            'coag_current_hx',
            'coag_rx_hx',
            'hemo_other_yn_hx',
            'hemo_other_specify_hx',
            'hemo_other_date_hx',
            'hemo_other_current_hx',
            'hemo_other_rx_hx',
            'glycemia_yn_hx',
            'glycemia_specify_hx',
            'glycemia_date_hx',
            'glycemia_current_hx',
            'glycemia_rx_hx',
            'diabetes_yn_hx',
            'diabetes_specify_hx',
            'diabetes_date_hx',
            'diabetes_current_hx',
            'diabetes_rx_hx',
            'endo_other_yn_hx',
            'endo_other_specify_hx',
            'endo_other_date_hx',
            'endo_other_current_hx',
            'endo_other_rx_hx',
            'kidney_yn_hx',
            'kidney_specify_hx',
            'kidney_date_hx',
            'kidney_current_hx',
            'kidney_rx_hx',
            'renal_other_yn_hx',
            'renal_other_specify_hx',
            'renal_other_date_hx',
            'renal_other_current_hx',
            'renal_other_rx_hx',
            'pcos_yn_hx',
            'pcos_date_hx',
            'pcos_current_hx',
            'pcos_rx_hx',
            'repro_other_yn_hx',
            'repro_other_specify_hx',
            'repro_other_date_hx',
            'repro_other_current_hx',
            'repro_other_rx_hx',
            'chest_yn_hx',
            'chest_specify_hx',
            'chest_date_hx',
            'chest_current_hx',
            'chest_rx_hx',
            'abdo_yn_hx',
            'abdo_specify_hx',
            'abdo_date_hx',
            'abdo_current_hx',
            'abdo_rx_hx',
            'neuro_yn_hx',
            'neuro_specify_hx',
            'neuro_date_hx',
            'neuro_current_hx',
            'neuro_rx_hx',
            'neuro_other_yn_hx',
            'neuro_other_specify_hx',
            'neuro_other_date_hx',
            'neuro_other_current_hx',
            'neuro_other_rx_hx',
            'autism_yn_hx',
            'autism_date_hx',
            'autism_current_hx',
            'autism_rx_hx',
            'intellect_yn_hx',
            'intellect_date_hx',
            'intellect_current_hx',
            'intellect_rx_hx',
            'add_yn_hx',
            'add_date_hx',
            'add_current_hx',
            'add_rx_hx',
            'anxiety_yn_hx',
            'anxiety_date_hx',
            'anxiety_current_hx',
            'anxiety_rx_hx',
            'depress_yn_hx',
            'depress_date_hx',
            'depress_current_hx',
            'depress_rx_hx',
            'psych_other_yn_hx',
            'psych_other_specify_hx',
            'psych_other_date_hx',
            'psych_other_current_hx',
            'psych_other_rx_hx',
            'auto_yn_hx',
            'auto_specify_hx',
            'auto_date_hx',
            'auto_current_hx',
            'auto_rx_hx',
            'immune_other_yn_hx',
            'immune_other_specify_hx',
            'immune_other_date_hx',
            'immune_other_current_hx',
            'immune_other_rx_hx',
            'allergies_yn_hx',
            'allergies_specify_hx',
            'allergies_date_hx',
            'allergies_current_hx',
            'allergies_rx_hx',
            'wound_yn_hx',
            'wound_specify_hx',
            'wound_date_hx',
            'wound_current_hx',
            'wound_rx_hx',
            'other_yn_hx',
            'other_specify_hx',
            'other_date_hx',
            'other_current_hx',
            'other_rx_hx',
            'nicotine_use_hx',
            'nicotine_quit_hx',
            'nicotine_years_hx',
            'nicotine_use_yr_hx',
            'nicotine_use_month_hx',
            'heart_surgery_mri_form',
            'head_brain_surgery_mri_form',
            'eye_surgery_mri_form',
            'ear_surgery_mri_form',
            'back_surgery_mri_form',
            'endo_mri_form',
            'other_surgery_mri_form',
            'other_surgery_specify_mri_form',
            'metal1_mri_form',
            'metal2_mri_form',
            'metal3_mri_form',
            'metal4_mri_form',
            'implant1_mri_form',
            'implant2_mri_form',
            'implant3_mri_form',
            'implant4_mri_form',
            'implant5_mri_form',
            'implant6_mri_form',
            'implant7_mri_form',
            'implant8_mri_form',
            'implant9_mri_form',
            'implant10_mri_form',
            'implant11_mri_form',
            'other_implant_mri_form',
            'implant_specify_mri_form',
            'metal_eye_mri_form',
            'movement_disorder_mri_form',
            'allergies_mri_form',
            'asthma_mri_form',
            'pain_rx_mri_form',
            'claustrophobia_mri_form',
            'apnea_mri_form',
            'cmtrt',
            'cmindc',
            'cmdose',
            'cmdosu',
            'cmdosuoth',
            'cmdosfrq',
            'cmdosfrqoth',
            'cmstdtc',
            'cmendtc',
            'cmstrf',
            'cmenrf',
        ]
        return fields

    def par(self):
        fields = [
            'day1_par',
            'day1_time1_activity_par',
            'day1_time1_intensity_par',
            'day1_time2_activity_par',
            'day1_time2_intensity_par',
            'day1_time3_activity_par',
            'day1_time3_intensity_par',
            'day1_time4_activity_par',
            'day1_time4_intensity_par',
            'day1_time5_activity_par',
            'day1_time5_intensity_par',
            'day1_time6_activity_par',
            'day1_time6_intensity_par',
            'day1_time7_activity_par',
            'day1_time7_intensity_par',
            'day1_time8_activity_par',
            'day1_time8_intensity_par',
            'day1_time9_activity_par',
            'day1_time9_intensity_par',
            'day1_time10_activity_par',
            'day1_time10_intensity_par',
            'day1_time11_activity_par',
            'day1_time11_intensity_par',
            'day1_time12_activity_par',
            'day1_time12_intensity_par',
            'day1_time13_activity_par',
            'day1_time13_intensity_par',
            'day1_time14_activity_par',
            'day1_time14_intensity_par',
            'day1_time15_activity_par',
            'day1_time15_intensity_par',
            'day1_time16_activity_par',
            'day1_time16_intensity_par',
            'day1_time17_activity_par',
            'day1_time17_intensity_par',
            'day1_time18_activity_par',
            'day1_time18_intensity_par',
            'day1_time19_activity_par',
            'day1_time19_intensity_par',
            'day1_time20_activity_par',
            'day1_time20_intensity_par',
            'day1_time21_activity_par',
            'day1_time21_intensity_par',
            'day1_time22_activity_par',
            'day1_time22_intensity_par',
            'day1_time23_activity_par',
            'day1_time23_intensity_par',
            'day1_time24_activity_par',
            'day1_time24_intensity_par',
            'day1_time25_activity_par',
            'day1_time25_intensity_par',
            'day1_time26_activity_par',
            'day1_time26_intensity_par',
            'day1_time27_activity_par',
            'day1_time27_intensity_par',
            'day1_time28_activity_par',
            'day1_time28_intensity_par',
            'day1_time29_activity_par',
            'day1_time29_intensity_par',
            'day1_time30_activity_par',
            'day1_time30_intensity_par',
            'day1_time31_activity_par',
            'day1_time31_intensity_par',
            'day1_time32_activity_par',
            'day1_time32_intensity_par',
            'day1_time33_activity_par',
            'day1_time33_intensity_par',
            'day1_time34_activity_par',
            'day1_time34_intensity_par',
            'day2_par',
            'day2_time1_activity_par',
            'day2_time1_intensity_par',
            'day2_time2_activity_par',
            'day2_time2_intensity_par',
            'day2_time3_activity_par',
            'day2_time3_intensity_par',
            'day2_time4_activity_par',
            'day2_time4_intensity_par',
            'day2_time5_activity_par',
            'day2_time5_intensity_par',
            'day2_time6_activity_par',
            'day2_time6_intensity_par',
            'day2_time7_activity_par',
            'day2_time7_intensity_par',
            'day2_time8_activity_par',
            'day2_time8_intensity_par',
            'day2_time9_activity_par',
            'day2_time9_intensity_par',
            'day2_time10_activity_par',
            'day2_time10_intensity_par',
            'day2_time11_activity_par',
            'day2_time11_intensity_par',
            'day2_time12_activity_par',
            'day2_time12_intensity_par',
            'day2_time13_activity_par',
            'day2_time13_intensity_par',
            'day2_time14_activity_par',
            'day2_time14_intensity_par',
            'day2_time15_activity_par',
            'day2_time15_intensity_par',
            'day2_time16_activity_par',
            'day2_time16_intensity_par',
            'day2_time17_activity_par',
            'day2_time17_intensity_par',
            'day2_time18_activity_par',
            'day2_time18_intensity_par',
            'day2_time19_activity_par',
            'day2_time19_intensity_par',
            'day2_time20_activity_par',
            'day2_time20_intensity_par',
            'day2_time21_activity_par',
            'day2_time21_intensity_par',
            'day2_time22_activity_par',
            'day2_time22_intensity_par',
            'day2_time23_activity_par',
            'day2_time23_intensity_par',
            'day2_time24_activity_par',
            'day2_time24_intensity_par',
            'day2_time25_activity_par',
            'day2_time25_intensity_par',
            'day2_time26_activity_par',
            'day2_time26_intensity_par',
            'day2_time27_activity_par',
            'day2_time27_intensity_par',
            'day2_time28_activity_par',
            'day2_time28_intensity_par',
            'day2_time29_activity_par',
            'day2_time29_intensity_par',
            'day2_time30_activity_par',
            'day2_time30_intensity_par',
            'day2_time31_activity_par',
            'day2_time31_intensity_par',
            'day2_time32_activity_par',
            'day2_time32_intensity_par',
            'day2_time33_activity_par',
            'day2_time33_intensity_par',
            'day2_time34_activity_par',
            'day2_time34_intensity_par',
            'day3_par',
            'day3_time1_activity_par',
            'day3_time1_intensity_par',
            'day3_time2_activity_par',
            'day3_time2_intensity_par',
            'day3_time3_activity_par',
            'day3_time3_intensity_par',
            'day3_time4_activity_par',
            'day3_time4_intensity_par',
            'day3_time5_activity_par',
            'day3_time5_intensity_par',
            'day3_time6_activity_par',
            'day3_time6_intensity_par',
            'day3_time7_activity_par',
            'day3_time7_intensity_par',
            'day3_time8_activity_par',
            'day3_time8_intensity_par',
            'day3_time9_activity_par',
            'day3_time9_intensity_par',
            'day3_time10_activity_par',
            'day3_time10_intensity_par',
            'day3_time11_activity_par',
            'day3_time11_intensity_par',
            'day3_time12_activity_par',
            'day3_time12_intensity_par',
            'day3_time13_activity_par',
            'day3_time13_intensity_par',
            'day3_time14_activity_par',
            'day3_time14_intensity_par',
            'day3_time15_activity_par',
            'day3_time15_intensity_par',
            'day3_time16_activity_par',
            'day3_time16_intensity_par',
            'day3_time17_activity_par',
            'day3_time17_intensity_par',
            'day3_time18_activity_par',
            'day3_time18_intensity_par',
            'day3_time19_activity_par',
            'day3_time19_intensity_par',
            'day3_time20_activity_par',
            'day3_time20_intensity_par',
            'day3_time21_activity_par',
            'day3_time21_intensity_par',
            'day3_time22_activity_par',
            'day3_time22_intensity_par',
            'day3_time23_activity_par',
            'day3_time23_intensity_par',
            'day3_time24_activity_par',
            'day3_time24_intensity_par',
            'day3_time25_activity_par',
            'day3_time25_intensity_par',
            'day3_time26_activity_par',
            'day3_time26_intensity_par',
            'day3_time27_activity_par',
            'day3_time27_intensity_par',
            'day3_time28_activity_par',
            'day3_time28_intensity_par',
            'day3_time29_activity_par',
            'day3_time29_intensity_par',
            'day3_time30_activity_par',
            'day3_time30_intensity_par',
            'day3_time31_activity_par',
            'day3_time31_intensity_par',
            'day3_time32_activity_par',
            'day3_time32_intensity_par',
            'day3_time33_activity_par',
            'day3_time33_intensity_par',
            'day3_time34_activity_par',
            'day3_time34_intensity_par',
        ]
        return fields

    def vo2(self):
        fields = [
            'vo2_scr',
            'vo2_plateau_scr',
            'vo2_hr_scr',
            'vo2_rer_scr',
            'vo2_abs_scr_data',
            'vo2_rel_scr_data',
            'vo2_plateau_scr_data',
            'vo2_hr_scr_data',
            'vo2_rer_scr_data'
        ]
        return fields


class FieldsIrb0361(Fields):

    def __init__(self):
        super().__init__()

    def counts(self):
        fields = [
            # include fields for bloods
            'fgre_mri',
            'cal_mri',
            't1_mri',
            'asl_mri',
            'vipr_mri',
            'flair_mri',
            'swan_mri',
            'dwi_mri',
            'aps_hydi_mri',
            'mps_hydi_mri',
            'cubet2_mri',
            'madni_ogtt',
            'asl1_ogtt',
            'vipr1_ogtt',
            'asl2_ogtt',
            'vipr2_ogtt',
            'asl3_ogtt',
            'vipr3_ogtt',
            'asl4_ogtt',
            'vipr4_ogtt',
            'asl5_ogtt',
            'vipr5_ogtt'
        ]
        return fields

    def ogtt_duration(self):
        fields = [
            'ogtt_completed_ogtt',
            'ogtt_duration_ogtt'
        ]
        return fields

    def ogtt_vitals(self):
        fields = [
            'hr1_ogtt',
            'hr2_ogtt',
            'hr3_ogtt',
            'hr4_ogtt',
            'hr5_ogtt',
            'hr6_ogtt',
            'hr7_ogtt',
            'hr8_ogtt',
            'hr9_ogtt',
            'hr10_ogtt',
            'sbp1_ogtt',
            'sbp2_ogtt',
            'sbp3_ogtt',
            'sbp4_ogtt',
            'sbp5_ogtt',
            'sbp6_ogtt',
            'sbp7_ogtt',
            'sbp8_ogtt',
            'sbp9_ogtt',
            'sbp10_ogtt',
            'dbp1_ogtt',
            'dbp2_ogtt',
            'dbp3_ogtt',
            'dbp4_ogtt',
            'dbp5_ogtt',
            'dbp6_ogtt',
            'dbp7_ogtt',
            'dbp8_ogtt',
            'dbp9_ogtt',
            'dbp10_ogtt',
            'map1_ogtt',
            'map2_ogtt',
            'map3_ogtt',
            'map4_ogtt',
            'map5_ogtt',
            'map6_ogtt',
            'map7_ogtt',
            'map8_ogtt',
            'map9_ogtt',
            'map10_ogtt',
            'co21_ogtt',
            'co22_ogtt',
            'co23_ogtt',
            'co24_ogtt',
            'co25_ogtt',
            'co26_ogtt',
            'co27_ogtt',
            'co28_ogtt',
            'co29_ogtt',
            'co210_ogtt',
            'resp1_ogtt',
            'resp2_ogtt',
            'resp3_ogtt',
            'resp4_ogtt',
            'resp5_ogtt',
            'resp6_ogtt',
            'resp7_ogtt',
            'resp8_ogtt',
            'resp9_ogtt',
            'resp10_ogtt',
            'spo21_ogtt',
            'spo22_ogtt',
            'spo23_ogtt',
            'spo24_ogtt',
            'spo25_ogtt',
            'spo26_ogtt',
            'spo27_ogtt']

