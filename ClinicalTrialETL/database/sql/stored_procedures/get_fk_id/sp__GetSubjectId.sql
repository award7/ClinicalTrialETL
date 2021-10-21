CREATE PROCEDURE sp__GetSubjectId 
	@subject VARCHAR(255),
	@subject_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @subject_id = subject_id
    FROM dbo.Subjects
    WHERE subject = @subject
END