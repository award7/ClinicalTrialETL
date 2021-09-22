CREATE PROCEDURE sp__InsertDefaultValuesTimePoints
	@time_point TINYINT
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpTimePoints(
	time_point VARCHAR(255)
	);
 
	INSERT INTO #tmpTimePoints(time_point)
	VALUES (@time_point);

	-- insert if not exist
	INSERT dbo.TimePoints(time_point)
	SELECT time_point
	FROM #tmpTimePoints
	WHERE NOT EXISTS(
		SELECT time_point
		FROM dbo.TimePoints
		WHERE dbo.TimePoints.time_point = #tmpTimePoints.time_point
		);
	END;
