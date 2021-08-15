CREATE PROCEDURE sp__InsertIntoArterialSpinLabelingData
    @global NUMERIC(2,1),
    @hemisphere_l NUMERIC(2,1),
    @hemisphere_r NUMERIC(2,1),
    @mca_total NUMERIC(2,1),
    @mca_l NUMERIC(2,1),
    @mca_r NUMERIC(2,1),
    @aca_total NUMERIC(2,1),
    @aca_l NUMERIC(2,1),
    @aca_r NUMERIC(2,1),
    @pca_total NUMERIC(2,1),
    @pca_l NUMERIC(2,1),
    @pca_r NUMERIC(2,1),
    @frontal_lobe_total NUMERIC(2,1),
    @frontal_lobe_l NUMERIC(2,1),
    @frontal_lobe_r NUMERIC(2,1),
    @temporal_lobe_total NUMERIC(2,1),
    @temporal_lobe_l NUMERIC(2,1),
    @temporal_lobe_r NUMERIC(2,1),
    @parietal_lobe_total NUMERIC(2,1),
    @parietal_lobe_r NUMERIC(2,1),
    @parietal_lobe_l NUMERIC(2,1),
    @occipital_lobe_total NUMERIC(2,1),
    @occipital_lobe_l NUMERIC(2,1),
    @occipital_lobe_r NUMERIC(2,1),
    @angular_l NUMERIC(2,1),
    @angular_r NUMERIC(2,1),
    @cingulum_ant_l NUMERIC(2,1),
    @cingulum_ant_r NUMERIC(2,1),
    @cingulum_post_l NUMERIC(2,1),
    @cingulum_post_r NUMERIC(2,1),
    @frontal_med_orb_l NUMERIC(2,1),
    @frontal_med_orb_r NUMERIC(2,1),
    @frontal_mid_l NUMERIC(2,1),
    @frontal_mid_r NUMERIC(2,1),
    @frontal_mid_orb_l NUMERIC(2,1),
    @frontal_mid_orb_r NUMERIC(2,1),
    @frontal_sup_l NUMERIC(2,1),
    @frontal_sup_r NUMERIC(2,1),
    @frontal_sup_med_l NUMERIC(2,1),
    @frontal_sup_med_r NUMERIC(2,1),
    @frontal_sup_orb_l NUMERIC(2,1),
    @frontal_sup_orb_r NUMERIC(2,1),
    @hippocampus_l NUMERIC(2,1),
    @hippocampus_r NUMERIC(2,1),
    @precuneus_l NUMERIC(2,1),
    @precuneus_r NUMERIC(2,1),
    @supramarginal_l NUMERIC(2,1),
    @supramarginal_r NUMERIC(2,1),
    @temporal_mid_l NUMERIC(2,1),
    @temporal_mid_r NUMERIC(2,1),
    @temporal_sup_l NUMERIC(2,1),
    @temporal_sup_r NUMERIC(2,1),
    @subject VARCHAR(255),
    @visit_name VARCHAR(255),
    @time_point TINYINT
AS
BEGIN
    SET NOCOUNT ON;

    -- lookup subject id
    DECLARE @subject_id INT;
    EXEC sp__GetSubjectId @subject, @subject_id OUTPUT;

    -- lookup visit id
    DECLARE @visit_id INT;
    EXEC sp__GetVisitId @visit_name, @visit_id OUTPUT;

    -- lookup time point id
    DECLARE @time_point_id INT;
    EXEC sp__GetTimePointId @time_point, @time_point_id OUTPUT;

    -- insert values
    INSERT INTO dbo.ArterialSpinLabelingData
    VALUES(
        @global,
        @hemisphere_l,
        @hemisphere_r,
        @mca_total,
        @mca_l,
        @mca_r,
        @aca_total,
        @aca_l,
        @aca_r,
        @pca_total,
        @pca_l,
        @pca_r,
        @frontal_lobe_total,
        @frontal_lobe_l,
        @frontal_lobe_r,
        @temporal_lobe_total,
        @temporal_lobe_l,
        @temporal_lobe_r,
        @parietal_lobe_total,
        @parietal_lobe_r,
        @parietal_lobe_l,
        @occipital_lobe_total,
        @occipital_lobe_l,
        @occipital_lobe_r,
        @angular_l,
        @angular_r,
        @cingulum_ant_l,
        @cingulum_ant_r,
        @cingulum_post_l,
        @cingulum_post_r,
        @frontal_med_orb_l,
        @frontal_med_orb_r,
        @frontal_mid_l,
        @frontal_mid_r,
        @frontal_mid_orb_l,
        @frontal_mid_orb_r,
        @frontal_sup_l,
        @frontal_sup_r,
        @frontal_sup_med_l,
        @frontal_sup_med_r,
        @frontal_sup_orb_l,
        @frontal_sup_orb_r,
        @hippocampus_l,
        @hippocampus_r,
        @precuneus_l,
        @precuneus_r,
        @supramarginal_l,
        @supramarginal_r,
        @temporal_mid_l,
        @temporal_mid_r,
        @temporal_sup_l,
        @temporal_sup_r
        @subject_id,
        @visit_id,
        @time_point_id
    );
END