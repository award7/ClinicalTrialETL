CREATE PROCEDURE sp__InsertIntoCerebrovascularReactivityData
    @time SMALLINT,
    @respiratory_rate TINYINT,
    @tidal_volume SMALLINT,
    @minute_ventilation TINYINT,
    @heart_rate TINYINT,
    @stroke_volume TINYINT,
    @cardiac_output TINYINT,
    @petco2 TINYINT,
    @velocity SMALLINT,
    @subject VARCHAR(255),
    @visit_name VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- get subject id
    DECLARE @subject_id INT;
    EXEC sp__GetSubjectId @subject, @subject_id OUTPUT;

    -- get visit id
    DECLARE @visit_id INT;
    EXEC sp__GetVisitId @visit_name, @visit_id OUTPUT;

    -- insert into table
    INSERT INTO dbo.CerebrovascularReactivityData
    VALUES ( 
        @time, 
        @respiratory_rate, 
        @tidal_volume,
        @minute_ventilation, 
        @heart_rate,
        @stroke_volume, 
        @cardiac_output, 
        @petco2,
        @velocity, 
        @subject_id, 
        @visit_id,
    );
END