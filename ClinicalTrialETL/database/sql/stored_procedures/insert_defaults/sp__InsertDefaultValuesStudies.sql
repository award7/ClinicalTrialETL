CREATE PROCEDURE sp__InsertDefaultValuesStudies
	@study VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpStudies(
	study VARCHAR(255)
	);
 
	INSERT INTO #tmpStudies(study)
	VALUES (@study);

	-- insert if not exist
	INSERT dbo.Studies(study)
	SELECT study
	FROM #tmpStudies
	WHERE NOT EXISTS(
		SELECT study
		FROM dbo.Studies
		WHERE dbo.Studies.study = #tmpStudies.study
		);
	END;
