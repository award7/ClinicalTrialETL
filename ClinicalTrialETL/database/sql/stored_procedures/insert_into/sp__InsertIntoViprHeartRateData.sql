CREATE PROCEDURE sp__InsertIntoViprHeartRateData
    @heart_rate_5 NUMERIC(14,12),
    @heart_rate_10 NUMERIC(14,12),
    @heart_rate_15 NUMERIC(14,12),
    @heart_rate_20 NUMERIC(14,12),
    @heart_rate_25 NUMERIC(14,12),
    @heart_rate_30 NUMERIC(14,12),
    @heart_rate_35 NUMERIC(14,12),
    @heart_rate_40 NUMERIC(14,12),
    @heart_rate_45 NUMERIC(14,12),
    @heart_rate_50 NUMERIC(14,12),
    @heart_rate_55 NUMERIC(14,12),
    @heart_rate_60 NUMERIC(14,12),
    @heart_rate_65 NUMERIC(14,12),
    @heart_rate_70 NUMERIC(14,12),
    @heart_rate_75 NUMERIC(14,12),
    @heart_rate_80 NUMERIC(14,12),
    @heart_rate_85 NUMERIC(14,12),
    @heart_rate_90 NUMERIC(14,12),
    @heart_rate_95 NUMERIC(14,12),
    @heart_rate_100 NUMERIC(14,12),
    @heart_rate TINYINT,
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
    INSERT INTO dbo.ViprHeartRateData
    VALUES (
        @heart_rate_5,
        @heart_rate_10,
        @heart_rate_15,
        @heart_rate_20,
        @heart_rate_25,
        @heart_rate_30,
        @heart_rate_35,
        @heart_rate_40,
        @heart_rate_45,
        @heart_rate_50,
        @heart_rate_55,
        @heart_rate_60,
        @heart_rate_65,
        @heart_rate_70,
        @heart_rate_75,
        @heart_rate_80,
        @heart_rate_85,
        @heart_rate_90,
        @heart_rate_95,
        @heart_rate_100,
        @heart_rate,
        @subject_id,
        @visit_id,
        @time_point_id
    );
END