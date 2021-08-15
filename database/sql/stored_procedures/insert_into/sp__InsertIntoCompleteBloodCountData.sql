CREATE PROCEDURE sp__InsertIntoCompleteBloodCountData
    @white_cell_count NUMERIC(3,1),
    @red_cell_count NUMERIC(2,1),
    @hemoglobin NUMERIC(3,1),
    @hematocrit TINYINT,
    @mean_cell_volume TINYINT,
    @mean_corpuscular_hemoglobin_concentration TINYINT,
    @red_cell_distribution_width_cv NUMERIC(3,1),
    @red_cell_distribution_width_sd NUMERIC(3,1),
    @platelet_count SMALLINT,
    @neutrophils_absolute SMALLINT,
    @immature_granulocytes_absolute SMALLINT,
    @lymphocytes_absolute SMALLINT,
    @monocytes_absolute SMALLINT,
    @eosinophils_absolute SMALLINT,
    @basophils_absolute SMALLINT,
    @neutrophils_percent TINYINT,
    @immature_granulocytes_percent TINYINT,
    @lymphocytes_percent TINYINT,
    @monocytes_percent TINYINT,
    @eosinophils_percent TINYINT,
    @basophils_percent TINYINT,
    @nucleated_red_blood_cell TINYINT,
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
    INSERT INTO dbo.CompleteBloodCountData
    VALUES (
        @white_cell_count,
        @red_cell_count,
        @hemoglobin,
        @hematocrit,
        @mean_cell_volume,
        @mean_corpuscular_hemoglobin_concentration,
        @red_cell_distribution_width_cv,
        @red_cell_distribution_width_sd,
        @platelet_count,
        @neutrophils_absolute,
        @immature_granulocytes_absolute,
        @lymphocytes_absolute,
        @monocytes_absolute,
        @eosinophils_absolute,
        @basophils_absolute,
        @neutrophils_percent,
        @immature_granulocytes_percent,
        @lymphocytes_percent,
        @monocytes_percent,
        @eosinophils_percent,
        @basophils_percent,
        @nucleated_red_blood_cell,
        @subject_id,
        @visit_id
    );
END