CREATE PROCEDURE sp__GetEthnicityId
    @ethnicity VARCHAR(255),
    @ethnicity_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @ethnicity_id = ethnicity_id
    FROM dbo.Ethnicities
    WHERE ethnicity = @ethnicity;
END