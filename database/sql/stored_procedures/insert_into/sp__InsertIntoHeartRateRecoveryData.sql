CREATE PROCEDURE sp__InsertIntoHeartRateRecoveryData
    @time TINYINT,
    @heart_rate TINYINT,
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
    INSERT INTO dbo.HeartRateRecoveryData
    VALUES(
        @time,
        @heart_rate,
        @subject_id,
        @visit_id
    );
END