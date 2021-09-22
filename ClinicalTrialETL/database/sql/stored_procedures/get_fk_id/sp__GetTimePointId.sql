CREATE PROCEDURE sp__GetTimePointId
	@time_point TINYINT,
	@time_point_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @time_point_id = time_point_id
    FROM dbo.TimePoints
    WHERE time_point = @time_point;
END