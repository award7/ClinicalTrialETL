CREATE PROCEDURE sp__InsertIntoScreeningVitalsData
    @measurement_number TINYINT,
    @heart_rate TINYINT,
    @systolic_blood_pressure TINYINT,
    @diastolic_blood_pressure TINYINT,
    @mean_arterial_pressure TINYINT,
    @respiratory_rate TINYINT,
    @pulse_oximetry TINYINT,
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

    INSERT INTO dbo.ScreeningVitalsData
    VALUES(
        @measurement_number,
        @heart_rate,
        @systolic_blood_pressure,
        @diastolic_blood_pressure,
        @mean_arterial_pressure,
        @respiratory_rate,
        @pulse_oximetry,
        @subject_id,
        @visit_id
    );
END