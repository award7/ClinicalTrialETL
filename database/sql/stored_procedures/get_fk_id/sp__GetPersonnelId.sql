CREATE PROCEDURE sp__GetPersonnelId
	@first_name NCHAR(255),
	@last_name NCHAR(255),
	@personnel_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @personnel_id = personnel_id
    FROM dbo.Personnel
    WHERE (first_name = @first_name
            AND last_name = @last_name);
END