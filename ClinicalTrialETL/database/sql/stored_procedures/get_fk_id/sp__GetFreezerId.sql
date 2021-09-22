CREATE PROCEDURE sp__GetFreezerId
	@name VARCHAR(255),
	@number INT,
	@freezer_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @freezer_id = freezer_id
    FROM dbo.Freezers
    WHERE (name = @name
            AND number = @number);
END
