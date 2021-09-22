CREATE PROCEDURE sp__InsertIntoBiosamples
  @biosample_date DATE,
  @subject VARCHAR(255),
  @visit_name VARCHAR(255),
  @time_point TINYINT,
  @tube_color VARCHAR(255),
  @freezer_number TINYINT,
  @freezer_shelf TINYINT,
  @box_color VARCHAR(255),
  @box_number TINYINT,
  @grid_location VARCHAR(255),
  @personnel VARCHAR(255),
  @status VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- get subject id
    DECLARE @subject_id INT;
    EXEC sp__GetSubjectId @subject, @subject_id OUTPUT;

    -- get visit id
    DECLARE @visit_id INT;
    EXEC sp__GetVisitId @visit_name, @visit_id OUTPUT;

    -- get time point id
    DECLARE @time_point_id INT;
    EXEC sp__GetTimePointId @time_point, @time_point_id OUTPUT;

    -- get tube color id
    DECLARE @tube_color_id INT;
    EXEC sp__GetTubeColorId @tube_color, @tube_color_id OUTPUT;

    -- get freezer id
    DECLARE @freezer_id INT;
    EXEC sp__GetFreezerId @freezer, @freezer_id OUTPUT;

    -- get freezer shelf id
    DECLARE @freezer_shelf_id INT;
    EXEC sp__GetFreezerShelfId @freezer_shelf, @freezer_shelf_id OUTPUT;

    -- get box color id
    DECLARE @box_color_id INT;
    EXEC sp__GetBoxColorId @box_color, @box_color_id OUTPUT;

    -- get grid location id
    DECLARE @grid_location_id INT;
    EXEC sp__GetGridLocationId @grid_location, @grid_location_id OUTPUT;

    -- get personnel id
    DECLARE @personnel_id INT;
    EXEC sp__GetPersonnelId @personnel, @personnel_id OUTPUT;

    -- get status id
    DECLARE @status_id INT;
    EXEC sp__GetStatusId @status, @status_id OUTPUT;

    -- insert into table
    INSERT INTO dbo.Biosamples
    VALUES (
        @biosample_date,
        @subject_id,
        @visit_id,
        @time_point_id,
        @tube_color_id,
        @freezer_id,
        @freezer_shelf_id,
        @box_color_id,
        @box_number,
        @grid_location_id,
        @personnel_id,
        @status_id
    );
END