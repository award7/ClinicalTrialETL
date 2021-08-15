CREATE PROCEDURE sp__InsertIntoViprTimeAveragedData
    @voxel SMALLINT,
    @cross_sectional_area NUMERIC(18,16),
    @diameter NUMERIC(18,16),
    @mean_velocity NUMERIC(18,16),
    @max_velocity NUMERIC(18,16),
    @flow_per_heart_cycle NUMERIC(18,16),
    @wall_shear_stress NUMERIC(18,16),
    @pulsatility_index NUMERIC(18,16),
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
    INSERT INTO dbo.ViprTimeAveragedData
    VALUES(
        @voxel,
        @cross_sectional_area,
        @diameter,
        @mean_velocity,
        @max_velocity,
        @flow_per_heart_cycle,
        @wall_shear_stress,
        @pulsatility_index,
        @subject_id,
        @visit_id,
        @time_point_id,
        @vessel_id
    );
END