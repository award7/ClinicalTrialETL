CREATE PROCEDURE sp__InsertIntoDexaData
    @trunk_total NUMERIC,
    @trunk_tissue NUMERIC,
    @trunk_lean NUMERIC,
    @trunk_fat NUMERIC,
    @trunk_fat_percent NUMERIC,
    @android_total NUMERIC,
    @android_tissue NUMERIC,
    @android_lean NUMERIC,
    @android_fat NUMERIC,
    @android_fat_percent NUMERIC,
    @gynoic_total NUMERIC,
    @gynoid_tissue NUMERIC,
    @gynoid_lean NUMERIC,
    @gynoid_fat NUMERIC,
    @gynoid_fat_percent NUMERIC,
    @whole_total NUMERIC,
    @whole_tissue NUMERIC,
    @whole_lean NUMERIC,
    @whole_fat NUMERIC,
    @whole_fat_percent NUMERIC,
    @vat_volume NUMERIC,
    @vat_mass NUMERIC,
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
    INSERT INTO dbo.DexaData
    VALUES (
        @trunk_total,
        @trunk_tissue,
        @trunk_lean,
        @trunk_fat,
        @trunk_fat_percent,
        @android_total,
        @android_tissue,
        @android_lean,
        @android_fat,
        @android_fat_percent,
        @gynoic_total,
        @gynoid_tissue,
        @gynoid_lean,
        @gynoid_fat,
        @gynoid_fat_percent,
        @whole_total,
        @whole_tissue,
        @whole_lean,
        @whole_fat,
        @whole_fat_percent,
        @vat_volume,
        @vat_mass,
        @subject_id,
        @visit_id
    );
END