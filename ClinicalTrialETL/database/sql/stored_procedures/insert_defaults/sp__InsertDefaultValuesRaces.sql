CREATE PROCEDURE sp__InsertDefaultValuesRaces
	@race VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpRaces(
        race VARCHAR(255)
	);
 
	INSERT INTO #tmpRaces(race)
	VALUES (@race);

	-- insert colors if not exist in box colors
	INSERT dbo.Races(race)
	SELECT race
	FROM #tmpRaces
	WHERE NOT EXISTS(
		SELECT race
		FROM dbo.Races
		WHERE dbo.Races.race = #tmpRaces.race
		);
	END;
