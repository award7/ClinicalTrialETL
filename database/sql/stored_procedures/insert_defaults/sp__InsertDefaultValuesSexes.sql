CREATE PROCEDURE sp__InsertDefaultValuesSexes
	@sex VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpSexes(
	sex VARCHAR(255)
	);
 
	INSERT INTO #tmpSexes(sex)
	VALUES (@sex);

	-- insert colors if not exist in box colors
	INSERT dbo.Sexes(sex)
	SELECT sex
	FROM #tmpSexes
	WHERE NOT EXISTS(
		SELECT sex
		FROM dbo.Sexes
		WHERE dbo.Sexes.sex = #tmpSexes.sex
		);
	END;
