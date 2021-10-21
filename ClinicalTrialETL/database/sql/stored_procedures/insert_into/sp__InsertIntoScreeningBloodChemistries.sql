CREATE PROCEDURE sp__InsertIntoScreeningBloodChemistries
    @measurement_number TINYINT,
    @glucose TINYINT,
    @total_cholesterol SMALLINT,
    @high_density_cholesterol TINYINT,
    @low_density_cholesterol SMALLINT,
    @triglycerides SMALLINT,
    @hemoglobin_a1c NUMERIC(3,1),
    @insulin TINYINT,
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

    INSERT INTO dbo.ScreeningBloodChemistries
    VALUES(
        @measurement_number,
        @glucose,
        @total_cholesterol,
        @high_density_cholesterol,
        @low_density_cholesterol,
        @triglycerides,
        @hemoglobin_a1c,
        @insulin,
        @subject_id,
        @visit_id
    );
END