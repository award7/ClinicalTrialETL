CREATE PROCEDURE sp__GetBoxColorId
	@color VARCHAR(255),
	@box_color_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @box_color_id = box_color_id
    FROM dbo.BoxColors
    WHERE color = @color;
END