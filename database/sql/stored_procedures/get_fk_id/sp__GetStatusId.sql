CREATE PROCEDURE sp__GetStatusId
	@status VARCHAR(255),
	@status_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @status_id = status_id
    FROM dbo.Statuses
    WHERE status = @status;
END