CREATE PROCEDURE sp__InsertDefaultValuesGridLocations_self
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpGridLocations(
	location SMALLINT
	);

	-- create grid [A1:J10], insert into tmp table
	DECLARE @row AS INT = 1
	DECLARE @col AS INT = 1
	DECLARE @char_val AS INT = 64
	DECLARE @location AS VARCHAR(255)

	WHILE @col <= 10
		BEGIN
			WHILE @row <= 10
				BEGIN				
					SET @location = (SELECT CONCAT(VARCHAR(255), @row) AS ResultString)
					INSERT INTO dbo.GridLocations
					VALUES (@location)
					SET @row = @row + 1
				END
			SET @row = 1
			SET @col = @col + 1
		END;

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