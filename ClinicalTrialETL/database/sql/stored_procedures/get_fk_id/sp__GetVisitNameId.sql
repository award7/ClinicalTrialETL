CREATE PROCEDURE sp__GetVisitNameId
	@name VARCHAR(255),
	@visit_name_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @visit_name_id = visit_name_id
    FROM dbo.VisitNames
    WHERE visit_name = @name;
END