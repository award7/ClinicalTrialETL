CREATE PROCEDURE sp__GetSexId
    @sex VARCHAR(255),
    @sex_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @sex_id = sex_id
    FROM dbo.Sexes
    WHERE sex = @sex;
END