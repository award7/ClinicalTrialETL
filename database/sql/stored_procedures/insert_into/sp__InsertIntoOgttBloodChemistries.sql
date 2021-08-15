CREATE PROCEDURE sp__InsertIntoOgttBloodChemistries
    @glucose SMALLINT,
    @insulin SMALLINT,
    @hemoglobin NUMERIC(3,1) = NULL,
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

    INSERT INTO dbo.OgttBloodChemistries
    VALUES(
        @glucose,
        @insulin,
        @hemoglobin,
        @subject_id,
        @visit_id,
        @time_point_id
    );
END