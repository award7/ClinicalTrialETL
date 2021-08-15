CREATE PROCEDURE sp__GetVesselId
	@vessel VARCHAR(255),
	@vessel_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @vessel_id = vessel_id
    FROM dbo.Vessels
    WHERE vessel = @vessel;
END