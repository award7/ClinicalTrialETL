CREATE PROCEDURE sp__InsertIntoSubmaximalExerciseData
    @work_rate SMALLINT,
    @rpm TINYINT,
    @velocity SMALLINT,
    @mean_arterial_pressure TINYINT,
    @stroke_volume TINYINT,
    @cardiac_output TINYINT,
    @vo2_absolute NUMERIC(3,2),
    @vo2_relative NUMERIC(3,1),
    @vco2_absolute NUMERIC(3,2),
    @vco2_relative NUMERIC(3,1),
    @heart_rate TINYINT,
    @respiratory_exchange_ratio NUMERIC(3,2),
    @respiratory_rate TINYINT,
    @tidal_volume SMALLINT,
    @minute_ventilation TINYINT,
    @peto2 TINYINT,
    @petco2 TINYINT,
    @petco2_gas TINYINT,
    @ve_vo2 NUMERIC(3,2),
    @ve_vco2 NUMERIC(3,2),
    @subject VARCHAR(255),
    @visit_name VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- get subject id
    DECLARE @subject_id INT;
    EXEC sp__GetSubjectId @subject, @subject_id OUTPUT;

    -- get visit id
    DECLARE @visit_id INT;
    EXEC sp__GetVisitId @visit_name, @visit_id OUTPUT;

    -- insert into table
    INSERT INTO dbo.SubmaximalExerciseData
    VALUES (
        @work_rate,
        @rpm,
        @velocity,
        @mean_arterial_pressure,
        @stroke_volume,
        @cardiac_output,
        @vo2_absolute,
        @vo2_relative,
        @vco2_absolute,
        @vco2_relative,
        @heart_rate,
        @respiratory_exchange_ratio,
        @respiratory_rate,
        @tidal_volume,
        @minute_ventilation,
        @peto2,
        @petco2,
        @petco2_gas,
        @ve_vo2,
        @ve_vco2,
        @subject_id,
        @visit_id
    );
END