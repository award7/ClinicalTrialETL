CREATE PROCEDURE sp__InsertDefaultValuesGridLocations
	@location VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpGridLocations(
        location SMALLINT
	);

	INSERT INTO #tmpGridLocations
	VALUES (@location);

	-- insert into db table
	INSERT dbo.GridLocations(location)
	SELECT location
	FROM #tmpGridLocations
	WHERE NOT EXISTS(
		SELECT location
		FROM dbo.GridLocations
		WHERE dbo.GridLocations.location = #tmpGridLocations.location
		);
	END;