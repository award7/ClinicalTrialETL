CREATE PROCEDURE sp__InsertDefaultValuesBoxColors
	@color VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpBoxColors(
	color VARCHAR(255)
	);
 
	INSERT INTO #tmpBoxColors
	VALUES (@color);

	-- insert if not exist
	INSERT dbo.BoxColors(color)
	SELECT color
	FROM #tmpBoxColors
	WHERE NOT EXISTS(
		SELECT color
		FROM dbo.BoxColors
		WHERE dbo.BoxColors.color = #tmpBoxColors.color
		);
	END;
