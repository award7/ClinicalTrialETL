CREATE PROCEDURE sp__InsertDefaultValuesPersonnel
	@first_name NCHAR(255),
	@last_name NCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpPersonnel(
        first_name NCHAR(255),
        last_name NCHAR(255)
	);
 
	INSERT INTO #tmpPersonnel(first_name, last_name)
	VALUES (@first_name, @last_name);

	-- insert colors if not exist in box colors
	INSERT dbo.Personnel(first_name, last_name)
	SELECT first_name, last_name
	FROM #tmpPersonnel
	WHERE NOT EXISTS(
		SELECT first_name, last_name
		FROM dbo.Personnel
		WHERE dbo.Personnel.first_name = #tmpPersonnel.first_name
			AND dbo.Personnel.last_name = #tmpPersonnel.last_name
		);
	END;
