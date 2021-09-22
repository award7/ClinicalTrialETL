CREATE PROCEDURE sp__GetVisitId
    @subject VARCHAR(255),
    @visit_name VARCHAR(255),
    @visit_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- get subject id
    DECLARE @subject_id INT;
    EXEC sp__GetSubjectId @subject, @subject_id OUTPUT;

    -- get visit name id
    DECLARE @visit_name_id INT;
    EXEC sp__GetVisitNameId @visit_name, @visit_name_id OUTPUT;

    -- get visit id
    SELECT @visit_id = visit_id
    FROM dbo.Visits
    WHERE (visit_name_id = @visit_name_id
        AND subject_id = @subject_id)

END