CREATE PROCEDURE sp__GetFreezerShelfId
	@shelf_number INT,
	@freezer_shelf_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @freezer_shelf_id = freezer_shelf_id
    FROM dbo.FreezerShelves
    WHERE shelf_number = @shelf_number;
END