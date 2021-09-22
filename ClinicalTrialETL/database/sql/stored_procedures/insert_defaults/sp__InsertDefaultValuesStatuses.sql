CREATE PROCEDURE sp__InsertDefaultValuesStatuses
	@status VARCHAR(255)
AS

BEGIN
	SET NOCOUNT ON;

	-- setup temp table
	CREATE TABLE #tmpStatuses(
	status VARCHAR(255)
	);
 
	INSERT INTO #tmpStatuses(status)
	VALUES (@status);

	-- insert if not exist
	INSERT dbo.Statuses(status)
	SELECT status
	FROM #tmpStatuses
	WHERE NOT EXISTS(
		SELECT status
		FROM dbo.Statuses
		WHERE dbo.Statuses.status = #tmpStatuses.status
		);
	END;
