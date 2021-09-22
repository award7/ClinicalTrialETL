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
