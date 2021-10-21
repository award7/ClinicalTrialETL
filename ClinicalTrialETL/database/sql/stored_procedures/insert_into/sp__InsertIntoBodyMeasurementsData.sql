CREATE PROCEDURE sp__InsertIntoAntrhopometrics
    @height NUMERIC(3,0),
    @weight NUMERIC(4,1),
    @body_mass_index NUMERIC(3,1),
    @hip_circumference TINYINT,
    @waist_circumference TINYINT,
    @tanner_stage TINYINT,
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
    INSERT INTO dbo.Antrhopometrics
    VALUES (
        @height,
        @weight,
        @body_mass_index,
        @hip_circumference,
        @waist_circumference,
        @tanner_stage,
        @subject_id,
        @visit_id
    );
END