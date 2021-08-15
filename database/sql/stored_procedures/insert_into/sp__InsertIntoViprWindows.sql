CREATE PROCEDURE sp__InsertIntoViprWindows
    @window SMALLINT,
    @lower_voxel SMALLINT,
    @upper_voxel SMALLINT,
    @subject VARCHAR(255),
    @visit_name VARCHAR(255),
    @time_point TINYINT,
    @vessel VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- get subject id
    DECLARE @subject_id INT;
    EXEC sp__GetSubjectId @subject, @subject_id OUTPUT;

    -- get visit id
    DECLARE @visit_id INT;
    EXEC sp__GetVisitId @visit_name, @visit_id OUTPUT;

    -- get time point id
    DECLARE @time_point_id INT;
    EXEC sp__GetTimePointId @time_point, @time_point_id OUTPUT;

    -- get vessel id
    DECLARE @vessel_id INT;
    EXEC sp__GetVesselId @vessel, @vessel_id OUTPUT;

    -- insert into table
    INSERT INTO dbo.ViprWindows
    VALUES(
        @window,
        @lower_voxel,
        @upper_voxel,
        @subject_id,
        @visit_id,
        @time_point_id,
        @vessel_id
    );
END