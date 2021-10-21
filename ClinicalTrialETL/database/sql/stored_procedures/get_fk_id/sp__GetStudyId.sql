CREATE PROCEDURE sp__GetStudyId
	@study VARCHAR(255),
	@study_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @study_id = study_id
    FROM dbo.Studies
    WHERE study = @study;
END