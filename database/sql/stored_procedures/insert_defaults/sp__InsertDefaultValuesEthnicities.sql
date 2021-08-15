CREATE PROCEDURE sp__InsertDefaultValuesEthnicities
	@ethnicity VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpEthnicities(
	ethnicity VARCHAR(255)
	);
 
	INSERT INTO #tmpEthnicities
	VALUES (@ethnicity);

	-- insert default values
	INSERT dbo.Ethnicities(ethnicity)
	SELECT ethnicity
	FROM #tmpEthnicities
	WHERE NOT EXISTS(
		SELECT ethnicity
		FROM dbo.Ethnicities
		WHERE dbo.Ethnicities.ethnicity = #tmpEthnicities.ethnicity
		);
	END;
