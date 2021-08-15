CREATE PROCEDURE sp__GetGridLocationId
	@location VARCHAR(255),
	@grid_location_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @grid_location_id = grid_location_id
    FROM dbo.GridLocations
    WHERE location = @location;
END