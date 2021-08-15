CREATE PROCEDURE sp__InsertDefaultValuesTubeColors
	@color VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpTubeColors(
	color VARCHAR(255)
	);
 
	INSERT INTO #tmpTubeColors
	VALUES (@color);

	-- insert if not exist
	INSERT dbo.TubeColors(color)
	SELECT color
	FROM #tmpTubeColors
	WHERE NOT EXISTS(
		SELECT color
		FROM dbo.TubeColors
		WHERE dbo.TubeColors.color = #tmpTubeColors.color
		);
	END;
