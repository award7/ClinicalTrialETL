CREATE PROCEDURE sp__InsertDefaultValuesFreezers
	@name VARCHAR(255),
	@number TINYINT
AS

BEGIN
	SET NOCOUNT ON;
	
	-- setup temp table
	CREATE TABLE #tmpFreezers(
	name VARCHAR(255),
	number TINYINT
	);
 
	INSERT INTO #tmpFreezers
	VALUES (@name, @number);

	-- insert default values
	INSERT dbo.Freezers(name, number)
	SELECT name, number
	FROM #tmpFreezers
	WHERE NOT EXISTS(
		SELECT name, number
		FROM dbo.Freezers
		WHERE dbo.Freezers.name = #tmpFreezers.name
			AND dbo.Freezers.number = #tmpFreezers.number
		);
	END;
