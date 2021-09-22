CREATE PROCEDURE sp__GetRaceId
    @race VARCHAR(255),
    @race_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @race_id = race_id
    FROM dbo.Races
    WHERE race = @race;
END