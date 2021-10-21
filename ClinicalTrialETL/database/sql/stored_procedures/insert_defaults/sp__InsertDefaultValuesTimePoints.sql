CREATE PROCEDURE sp__InsertDefaultValuesTimePointLabels
	@label VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpTimePoints(
        label VARCHAR(255)
	);
 
	INSERT INTO #tmpTimePointLabels(label)
	VALUES (@label);

	-- insert if not exist
	INSERT dbo.TimePointLabels(label)
	SELECT label
	FROM #tmpTimePointLabels
	WHERE NOT EXISTS(
		SELECT label
		FROM dbo.TimePointLabels
		WHERE dbo.TimePointLabels.label = #tmpTimePointLabels.label
		);
	END;
