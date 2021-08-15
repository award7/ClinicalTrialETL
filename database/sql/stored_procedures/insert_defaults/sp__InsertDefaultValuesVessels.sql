CREATE PROCEDURE sp__InsertDefaultValuesVessels
	@vessel VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpVessels(
	vessel VARCHAR(255)
	);
 
	INSERT INTO #tmpVessels
	VALUES (@vessel);

	-- insert if not exist
	INSERT dbo.Vessels(vessel)
	SELECT vessel
	FROM #tmpVessels
	WHERE NOT EXISTS(
		SELECT vessel
		FROM dbo.Vessels
		WHERE dbo.Vessels.vessel = #tmpVessels.vessel
		);
	END;
