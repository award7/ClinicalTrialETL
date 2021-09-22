CREATE PROCEDURE sp__InsertIntoViprTimeResolvedData
    @voxel SMALLINT,
    @flow_5 NUMERIC(2,14),
    @flow_10 NUMERIC(2,14),
    @flow_15 NUMERIC(2,14),
    @flow_20 NUMERIC(2,14),
    @flow_25 NUMERIC(2,14),
    @flow_30 NUMERIC(2,14),
    @flow_35 NUMERIC(2,14),
    @flow_40 NUMERIC(2,14),
    @flow_45 NUMERIC(2,14),
    @flow_50 NUMERIC(2,14),
    @flow_55 NUMERIC(2,14),
    @flow_60 NUMERIC(2,14),
    @flow_65 NUMERIC(2,14),
    @flow_70 NUMERIC(2,14),
    @flow_75 NUMERIC(2,14),
    @flow_80 NUMERIC(2,14),
    @flow_85 NUMERIC(2,14),
    @flow_90 NUMERIC(2,14),
    @flow_95 NUMERIC(2,14),
    @flow_100 NUMERIC(2,14),
    @subject VARCHAR(255),
    @visit_name VARCHAR(255),
    @time_point TINYINT
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

    -- insert into table
    INSERT INTO
    VALUES (
        @voxel,
        @flow_5,
        @flow_10,
        @flow_15,
        @flow_20,
        @flow_25,
        @flow_30,
        @flow_35,
        @flow_40,
        @flow_45,
        @flow_50,
        @flow_55,
        @flow_60,
        @flow_65,
        @flow_70,
        @flow_75,
        @flow_80,
        @flow_85,
        @flow_90,
        @flow_95,
        @flow_100,
        @flow,
        @subject_id,
        @visit_id,
        @time_point_id
    );
END