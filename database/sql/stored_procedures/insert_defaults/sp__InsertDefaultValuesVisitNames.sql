CREATE PROCEDURE sp__InsertDefaultValuesVisitNames
	@visit_name VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpVisitNames(
	visit_name VARCHAR(255)
	);
 
	INSERT INTO #tmpVisitNames
	VALUES (@visit_name);

	-- insert if not exist
	INSERT dbo.VisitNames(visit_name)
	SELECT visit_name
	FROM #tmpVisitNames
	WHERE NOT EXISTS(
		SELECT visit_name
		FROM dbo.VisitNames
		WHERE dbo.VisitNames.visit_name = #tmpVisitNames.visit_name
		);
	END;
