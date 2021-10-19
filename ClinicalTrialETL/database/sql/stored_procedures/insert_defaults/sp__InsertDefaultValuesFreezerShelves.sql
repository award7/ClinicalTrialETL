CREATE PROCEDURE sp__InsertDefaultValuesFreezerShelves
	@shelf_number TINYINT
AS

BEGIN
	SET NOCOUNT ON;
	
	-- setup temp table
	CREATE TABLE #tmpFreezerShelves(
        shelf_number TINYINT
	);
 
	INSERT INTO #tmpFreezerShelves
	VALUES (@shelf_number);

	-- insert default values
	INSERT dbo.FreezerShelves(shelf_number)
	SELECT shelf_number
	FROM #tmpFreezerShelves
	WHERE NOT EXISTS(
		SELECT shelf_number
		FROM dbo.FreezerShelves
		WHERE dbo.FreezerShelves.shelf_number = #tmpFreezerShelves.shelf_number
		);
	END;
