CREATE PROCEDURE sp__GetTubeColorId
	@color VARCHAR(255),
	@tube_color_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @tube_color_id = tube_color_id
    FROM dbo.TubeColors
    WHERE color = @color;
END