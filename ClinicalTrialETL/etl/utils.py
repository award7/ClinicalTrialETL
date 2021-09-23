import sys
import os


def get_drives_windows() -> list:
    """
    Get available drives on a windows platform and return in a typical, human readable format

    :return: list of drive names
    :rtype: list
    """

    import win32api
    drives = win32api.GetLogicalDriveStrings()
    drives = drives.split('\000')[:-1]
    return [drive.replace('\\', '') for drive in drives]


def get_default_staging_location(bucket: str = 'root') -> str:
    """
    Get the default staging location for data depending upon the host os used (only support Windows and Linux)

    :param bucket: used to specify whether to obtain the root /bucket/[study] directory, the /bucket/[study]/raw
        directory, or the /bucket/[study]/proc directory. Default = 'root'.
    :type bucket: str
    :return: file path to staging location
    :rtype: str
    """

    BUCKET_PATH = "bucket/2019_0361"
    server_location = get_server_location()

    if bucket == 'root':
        staging_location = os.path.join(server_location, BUCKET_PATH)
    else:
        # append subdirectory to path
        staging_location = os.path.join(server_location, BUCKET_PATH, bucket)

    return staging_location


def get_server_location() -> str:
    # determine computer platform (i.e. type)
    if sys.platform == 'win32':
        drives = get_drives_windows()
        server_drive = 'L:'
        if server_drive not in drives:
            raise Exception(f'Server {server_drive} not available')
        return server_drive
    elif sys.platform == 'linux':
        return "/mnt/hgfs"