CREATE PROCEDURE sp__InsertIntoSubjects
    @subject VARCHAR(255),
    @age TINYINT NULL,
    @sex VARCHAR(255) = NULL,
    @race VARCHAR(255) = NULL,
    @ethnicity VARCHAR(255) = NULL,
    @study VARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- get sex id
    DECLARE @sex_id INT = NULL;
    IF NOT @sex IS NULL
        BEGIN
            EXEC sp__GetSexId @sex, @sex_id OUTPUT;
        END;

    -- get race id
    DECLARE @race_id INT = NULL;
    IF NOT @race IS NULL
        BEGIN
            EXEC sp__GetRacesId @race, @race_id OUTPUT;
        END;

    -- get ethnicity id
    DECLARE @ethnicity_id INT = NULL;
    IF NOT @ethnicity IS NULL
        BEGIN
            EXEC sp__GetEthnicityId @ethnicity, @ethnicity_id OUTPUT;
        END;

    -- get study id
    DECLARE @study_id INT = NULL;
    IF NOT @study IS NULL
        BEGIN
            EXEC sp__GetStudyId @study, @study_id OUTPUT;
        END;

    -- insert into subjects
    INSERT INTO dbo.Subjects
    VALUES (@subject, @age, @sex_id, @race_id, @ethnicity_id, @study_id)

END