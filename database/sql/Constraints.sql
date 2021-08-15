-- ArterialSpinLabelingData
IF OBJECT_ID(N'chk__ArterialSpinLabelingData_global_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_global_gt_0
        CHECK (global > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_hemisphere_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_hemisphere_l_gt_0
        CHECK (hemisphere_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_hemisphere_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_hemisphere_r_gt_0
        CHECK (hemisphere_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_mca_total_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_mca_total_gt_0
        CHECK (mca_total > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_mca_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_mca_l_gt_0
        CHECK (mca_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_mca_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_mca_r_gt_0
        CHECK (mca_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_aca_total_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_aca_total_gt_0
        CHECK (aca_total > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_aca_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_aca_l_gt_0
        CHECK (aca_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_aca_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_aca_r_gt_0
        CHECK (aca_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_pca_total_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_pca_total_gt_0
        CHECK (pca_total > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_pca_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_pca_l_gt_0
        CHECK (pca_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_pca_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_pca_r_gt_0
        CHECK (pca_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_lobe_total_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_lobe_total_gt_0
        CHECK (frontal_lobe_total > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_lobe_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_lobe_l_gt_0
        CHECK (frontal_lobe_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_lobe_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_lobe_r_gt_0
        CHECK (frontal_lobe_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_temporal_lobe_total_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_temporal_lobe_total_gt_0
        CHECK (temporal_lobe_total > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_temporal_lobe_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_temporal_lobe_l_gt_0
        CHECK (temporal_lobe_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_temporal_lobe_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_temporal_lobe_r_gt_0
        CHECK (temporal_lobe_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_parietal_lobe_total_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_parietal_lobe_total_gt_0
        CHECK (parietal_lobe_total > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_parietal_lobe_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_parietal_lobe_r_gt_0
        CHECK (parietal_lobe_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_parietal_lobe_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_parietal_lobe_l_gt_0
        CHECK (parietal_lobe_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_occipital_lobe_total_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_occipital_lobe_total_gt_0
        CHECK (occipital_lobe_total > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_occipital_lobe_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_occipital_lobe_l_gt_0
        CHECK (occipital_lobe_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_occipital_lobe_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_occipital_lobe_r_gt_0
        CHECK (occipital_lobe_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_angular_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_angular_l_gt_0
        CHECK (angular_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_angular_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_angular_r_gt_0
        CHECK (angular_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_cingulum_ant_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_cingulum_ant_l_gt_0
        CHECK (cingulum_ant_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_cingulum_ant_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_cingulum_ant_r_gt_0
        CHECK (cingulum_ant_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_cingulum_post_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_cingulum_post_l_gt_0
        CHECK (cingulum_post_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_cingulum_post_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_cingulum_post_r_gt_0
        CHECK (cingulum_post_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_med_orb_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_med_orb_l_gt_0
        CHECK (frontal_med_orb_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_med_orb_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_med_orb_r_gt_0
        CHECK (frontal_med_orb_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_mid_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_mid_l_gt_0
        CHECK (frontal_mid_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_mid_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_mid_r_gt_0
        CHECK (frontal_mid_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_mid_orb_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_mid_orb_l_gt_0
        CHECK (frontal_mid_orb_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_mid_orb_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_mid_orb_r_gt_0
        CHECK (frontal_mid_orb_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_sup_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_sup_l_gt_0
        CHECK (frontal_sup_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_sup_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_sup_r_gt_0
        CHECK (frontal_sup_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_sup_med_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_sup_med_l_gt_0
        CHECK (frontal_sup_med_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_sup_med_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_sup_med_r_gt_0
        CHECK (frontal_sup_med_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_sup_orb_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_sup_orb_l_gt_0
        CHECK (frontal_sup_orb_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_frontal_sup_orb_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_frontal_sup_orb_r_gt_0
        CHECK (frontal_sup_orb_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_hippocampus_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_hippocampus_l_gt_0
        CHECK (hippocampus_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_hippocampus_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_hippocampus_r_gt_0
        CHECK (hippocampus_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_precuneus_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_precuneus_l_gt_0
        CHECK (precuneus_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_precuneus_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_precuneus_r_gt_0
        CHECK (precuneus_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_supramarginal_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_supramarginal_l_gt_0
        CHECK (supramarginal_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_supramarginal_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_supramarginal_r_gt_0
        CHECK (supramarginal_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_temporal_mid_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_temporal_mid_l_gt_0
        CHECK (temporal_mid_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_temporal_mid_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_temporal_mid_r_gt_0
        CHECK (temporal_mid_r > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_temporal_sup_l_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_temporal_sup_l_gt_0
        CHECK (temporal_sup_l > 0)
    END;

IF OBJECT_ID(N'chk__ArterialSpinLabelingData_temporal_sup_r_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
        ADD CONSTRAINT chk__ArterialSpinLabelingData_temporal_sup_r_gt_0
        CHECK (temporal_sup_r > 0)
    END;


-- Biosamples
IF OBJECT_ID(N'chk__Biosamples_biosample_date_le_today', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.Biosamples
        ADD CONSTRAINT chk__Biosamples_biosample_date_le_today
        CHECK (biosample_date <= GETDATE())
    END;


-- BodyMeasurements
IF OBJECT_ID(N'chk__BodyMeasurementsData_height_gt_100', N'C') IS NULL 
        BEGIN
            ALTER TABLE dbo.BodyMeasurementsData
            ADD CONSTRAINT chk__BodyMeasurementsData_height_gt_100
            CHECK (height > 100)
        END;
    

IF OBJECT_ID(N'chk__BodyMeasurementsData_weight_ge_42', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.BodyMeasurementsData
        ADD CONSTRAINT chk__BodyMeasurementsData_weight_ge_42
        CHECK (weight > 42.9)
    END;

IF OBJECT_ID(N'chk__BodyMeasurementsData_body_mass_index_rng', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.BodyMeasurementsData
        ADD CONSTRAINT chk__BodyMeasurementsData_body_mass_index_rng
        CHECK (body_mass_index >= 0 AND body_mass_index <= 100)
    END;

IF OBJECT_ID(N'chk__BodyMeasurementsData_hip_circumference_rng', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.BodyMeasurementsData
        ADD CONSTRAINT chk__BodyMeasurementsData_hip_circumference_rng
        CHECK (hip_circumference >= 0 AND hip_circumference <= 300)
    END;

IF OBJECT_ID(N'chk__BodyMeasurementsData_waist_circumference_rng', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.BodyMeasurementsData
        ADD CONSTRAINT chk__BodyMeasurementsData_waist_circumference_rng
        CHECK (waist_circumference >= 0 AND waist_circumference <= 300)
    END;

IF OBJECT_ID(N'chk__BodyMeasurementsData_tanner_stage_rng', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.BodyMeasurementsData
        ADD CONSTRAINT chk__BodyMeasurementsData_tanner_stage_rng
        CHECK (tanner_stage >= 0 AND tanner_stage <= 3)
    END;


-- CerebrovascularReactivityData
IF OBJECT_ID(N'chk__CerebrovascularReactivityData_time_le_today', N'C') IS NULL 
            BEGIN
                ALTER TABLE dbo.CerebrovascularReactivityData
                ADD CONSTRAINT chk__CerebrovascularReactivityData_time_le_today
                CHECK (time >= GETDATE())
            END;
        

IF OBJECT_ID(N'chk__CerebrovascularReactivityData_respiratory_rate_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
        ADD CONSTRAINT chk__CerebrovascularReactivityData_respiratory_rate_ge_0
        CHECK (respiratory_rate >= 0)
    END;

IF OBJECT_ID(N'chk__CerebrovascularReactivityData_tidal_volume_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
        ADD CONSTRAINT chk__CerebrovascularReactivityData_tidal_volume_ge_0
        CHECK (tidal_volume >= 0)
    END;

IF OBJECT_ID(N'chk__CerebrovascularReactivityData_minute_ventilation_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
        ADD CONSTRAINT chk__CerebrovascularReactivityData_minute_ventilation_ge_0
        CHECK (minute_ventilation >= 0)
    END;

IF OBJECT_ID(N'chk__CerebrovascularReactivityData_heart_rate_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
        ADD CONSTRAINT chk__CerebrovascularReactivityData_heart_rate_ge_0
        CHECK (heart_rate >= 0)
    END;

IF OBJECT_ID(N'chk__CerebrovascularReactivityData_stroke_volume_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
        ADD CONSTRAINT chk__CerebrovascularReactivityData_stroke_volume_ge_0
        CHECK (stroke_volume >= 0)
    END;

IF OBJECT_ID(N'chk__CerebrovascularReactivityData_cardiac_output_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
        ADD CONSTRAINT chk__CerebrovascularReactivityData_cardiac_output_ge_0
        CHECK (cardiac_output >= 0)
    END;

IF OBJECT_ID(N'chk__CerebrovascularReactivityData_petco2_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
        ADD CONSTRAINT chk__CerebrovascularReactivityData_petco2_ge_0
        CHECK (petco2 >= 0)
    END;

IF OBJECT_ID(N'chk__CerebrovascularReactivityData_velocity_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
        ADD CONSTRAINT chk__CerebrovascularReactivityData_velocity_ge_0
        CHECK (velocity >= 0)
    END;


-- CompleteBloodCountData
IF OBJECT_ID(N'chk__CompleteBloodCountData_white_cell_count_gt_0', N'C') IS NULL 
            BEGIN
                ALTER TABLE dbo.CompleteBloodCountData
                ADD CONSTRAINT chk__CompleteBloodCountData_white_cell_count_gt_0
                CHECK (white_cell_count > 0)
            END;
        

IF OBJECT_ID(N'chk__CompleteBloodCountData_red_cell_count_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_red_cell_count_gt_0
        CHECK (red_cell_count > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_hemoglobin_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_hemoglobin_gt_0
        CHECK (hemoglobin > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_hematocrit_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_hematocrit_gt_0
        CHECK (hematocrit > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_mean_cell_volume_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_mean_cell_volume_gt_0
        CHECK (mean_cell_volume > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_mean_corpuscular_hemoglobin_concentration_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_mean_corpuscular_hemoglobin_concentration_gt_0
        CHECK (mean_corpuscular_hemoglobin_concentration > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_red_cell_distribution_width_cv_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_red_cell_distribution_width_cv_gt_0
        CHECK (red_cell_distribution_width_cv > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_red_cell_distribution_width_sd_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_red_cell_distribution_width_sd_gt_0
        CHECK (red_cell_distribution_width_sd > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_platelet_count_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_platelet_count_gt_0
        CHECK (platelet_count > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_neutrophils_absolute_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_neutrophils_absolute_gt_0
        CHECK (neutrophils_absolute > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_immature_granulocytes_absolute_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_immature_granulocytes_absolute_ge_0
        CHECK (immature_granulocytes_absolute >= 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_lymphocytes_absolute_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_lymphocytes_absolute_gt_0
        CHECK (lymphocytes_absolute > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_monocytes_absolute_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_monocytes_absolute_gt_0
        CHECK (monocytes_absolute > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_eosinophils_absolute_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_eosinophils_absolute_gt_0
        CHECK (eosinophils_absolute > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_basophils_absolute_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_basophils_absolute_gt_0
        CHECK (basophils_absolute > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_neutrophils_percent_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_neutrophils_percent_gt_0
        CHECK (neutrophils_percent > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_immature_granulocytes_percent_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_immature_granulocytes_percent_ge_0
        CHECK (immature_granulocytes_percent > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_lymphocytes_percent_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_lymphocytes_percent_gt_0
        CHECK (lymphocytes_percent > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_monocytes_percent_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_monocytes_percent_gt_0
        CHECK (monocytes_percent > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_eosinophils_percent_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_eosinophils_percent_gt_0
        CHECK (eosinophils_percent > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_basophils_percent_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_basophils_percent_gt_0
        CHECK (basophils_percent > 0)
    END;

IF OBJECT_ID(N'chk__CompleteBloodCountData_nucleated_red_blood_cell_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
        ADD CONSTRAINT chk__CompleteBloodCountData_nucleated_red_blood_cell_gt_0
        CHECK (nucleated_red_blood_cell > 0)
    END;


--DexaData
IF OBJECT_ID(N'chk__DexaData_trunk_total_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_trunk_total_ge_0
        CHECK (trunk_total >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_trunk_tissue_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_trunk_tissue_ge_0
        CHECK (trunk_tissue >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_trunk_lean_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_trunk_lean_ge_0
        CHECK (trunk_lean >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_trunk_fat_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_trunk_fat_ge_0
        CHECK (trunk_fat >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_trunk_fat_percent_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_trunk_fat_percent_ge_0
        CHECK (trunk_fat_percent >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_android_total_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_android_total_ge_0
        CHECK (android_total >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_android_tissue_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_android_tissue_ge_0
        CHECK (android_tissue >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_android_lean_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_android_lean_ge_0
        CHECK (android_lean >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_android_fat_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_android_fat_ge_0
        CHECK (android_fat >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_android_fat_percent_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_android_fat_percent_ge_0
        CHECK (android_fat_percent >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_gynoic_total_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_gynoic_total_ge_0
        CHECK (gynoic_total >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_gynoid_tissue_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_gynoid_tissue_ge_0
        CHECK (gynoid_tissue >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_gynoid_lean_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_gynoid_lean_ge_0
        CHECK (gynoid_lean >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_gynoid_fat_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_gynoid_fat_ge_0
        CHECK (gynoid_fat >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_gynoid_fat_percent_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_gynoid_fat_percent_ge_0
        CHECK (gynoid_fat_percent >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_whole_total_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_whole_total_ge_0
        CHECK (whole_total >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_whole_tissue_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_whole_tissue_ge_0
        CHECK (whole_tissue >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_whole_lean_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_whole_lean_ge_0
        CHECK (whole_lean >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_whole_fat_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_whole_fat_ge_0
        CHECK (whole_fat >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_whole_fat_percent_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_whole_fat_percent_ge_0
        CHECK (whole_fat_percent >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_vat_volume_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_vat_volume_ge_0
        CHECK (vat_volume >= 0)
    END;

IF OBJECT_ID(N'chk__DexaData_vat_mass_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.DexaData
        ADD CONSTRAINT chk__DexaData_vat_mass_ge_0
        CHECK (vat_mass >= 0)
    END;


-- HeartRateRecoveryData
IF OBJECT_ID(N'chk__HeartRateRecoveryData_time_rng', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.HeartRateRecoveryData
        ADD CONSTRAINT chk__HeartRateRecoveryData_time_rng
        CHECK (time <= 120 AND time >= 1)
    END;

IF OBJECT_ID(N'chk__HeartRateRecoveryData_heart_rate_rng', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.HeartRateRecoveryData
        ADD CONSTRAINT chk__HeartRateRecoveryData_heart_rate_rng
        CHECK (heart_rate <= 250 AND heart_rate >= 0)
    END;


-- MaximalOxygenUptakeData
IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_work_rate_ge_0', N'C') IS NULL 
            BEGIN
                ALTER TABLE dbo.MaximalOxygenUptakeData
                ADD CONSTRAINT chk__MaximalOxygenUptakeData_work_rate_ge_0
                CHECK (work_rate >= 0)
            END;
        

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_vo2_absolute_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_vo2_absolute_ge_0
        CHECK (vo2_absolute >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_vo2_relative_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_vo2_relative_ge_0
        CHECK (vo2_relative >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_vco2_absolute_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_vco2_absolute_ge_0
        CHECK (vco2_absolute >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_vco2_relative_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_vco2_relative_ge_0
        CHECK (vco2_relative >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_heart_rate_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_heart_rate_ge_0
        CHECK (heart_rate >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_respiratory_exchange_ratio_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_respiratory_exchange_ratio_ge_0
        CHECK (respiratory_exchange_ratio >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_respiratory_rate_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_respiratory_rate_ge_0
        CHECK (respiratory_rate >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_tidal_volume_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_tidal_volume_ge_0
        CHECK (tidal_volume >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_minute_ventilation_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_minute_ventilation_ge_0
        CHECK (minute_ventilation >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_peto2_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_peto2_ge_0
        CHECK (peto2 >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_petco2_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_petco2_ge_0
        CHECK (petco2 >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_ve_vo2_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_ve_vo2_ge_0
        CHECK (ve_vo2 >= 0)
    END;

IF OBJECT_ID(N'chk__MaximalOxygenUptakeData_ve_vco2_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
        ADD CONSTRAINT chk__MaximalOxygenUptakeData_ve_vco2_ge_0
        CHECK (ve_vco2 >= 0)
    END;


-- OgttBloodChemistries
IF OBJECT_ID(N'chk__OgttBloodChemistries_glucose_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.OgttBloodChemistries
        ADD CONSTRAINT chk__OgttBloodChemistries_glucose_gt_0
        CHECK (glucose >= 0)
    END;

IF OBJECT_ID(N'chk__OgttBloodChemistries_insulin_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.OgttBloodChemistries
        ADD CONSTRAINT chk__OgttBloodChemistries_insulin_gt_0
        CHECK (insulin >= 0)
    END;

IF OBJECT_ID(N'chk__OgttBloodChemistries_hemoglobin_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.OgttBloodChemistries
        ADD CONSTRAINT chk__OgttBloodChemistries_hemoglobin_gt_0
        CHECK (hemoglobin >= 0)
    END;


-- ScreeningBloodChemistries
IF OBJECT_ID(N'chk__ScreeningBloodChemistries_measurement_number_rng', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
        ADD CONSTRAINT chk__ScreeningBloodChemistries_measurement_number_rng
        CHECK (measurement_number <= 3 AND measurement_number > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningBloodChemistries_glucose_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
        ADD CONSTRAINT chk__ScreeningBloodChemistries_glucose_gt_0
        CHECK (glucose > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningBloodChemistries_total_cholesterol_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
        ADD CONSTRAINT chk__ScreeningBloodChemistries_total_cholesterol_gt_0
        CHECK (total_cholesterol > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningBloodChemistries_high_density_cholesterol_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
        ADD CONSTRAINT chk__ScreeningBloodChemistries_high_density_cholesterol_gt_0
        CHECK (high_density_cholesterol > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningBloodChemistries_low_density_cholesterol_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
        ADD CONSTRAINT chk__ScreeningBloodChemistries_low_density_cholesterol_gt_0
        CHECK (low_density_cholesterol > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningBloodChemistries_triglycerides_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
        ADD CONSTRAINT chk__ScreeningBloodChemistries_triglycerides_gt_0
        CHECK (triglycerides > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningBloodChemistries_hemoglobin_a1c_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
        ADD CONSTRAINT chk__ScreeningBloodChemistries_hemoglobin_a1c_gt_0
        CHECK (hemoglobin_a1c > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningBloodChemistries_insulin_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
        ADD CONSTRAINT chk__ScreeningBloodChemistries_insulin_gt_0
        CHECK (insulin > 0)
    END;


-- ScreeningVitalsData
IF OBJECT_ID(N'chk__ScreeningVitalsData_measurement_number_rng', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
        ADD CONSTRAINT chk__ScreeningVitalsData_measurement_number_rng
        CHECK (measurement_number <= 3 AND measurement_number > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningVitalsData_heart_rate_rng', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
        ADD CONSTRAINT chk__ScreeningVitalsData_heart_rate_rng
        CHECK (heart_rate <= 220 AND heart_rate > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningVitalsData_systolic_blood_pressure_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
        ADD CONSTRAINT chk__ScreeningVitalsData_systolic_blood_pressure_gt_0
        CHECK (systolic_blood_pressure > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningVitalsData_diastolic_blood_pressure_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
        ADD CONSTRAINT chk__ScreeningVitalsData_diastolic_blood_pressure_gt_0
        CHECK (diastolic_blood_pressure > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningVitalsData_mean_arterial_pressure_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
        ADD CONSTRAINT chk__ScreeningVitalsData_mean_arterial_pressure_gt_0
        CHECK (mean_arterial_pressure > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningVitalsData_respiratory_rate_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
        ADD CONSTRAINT chk__ScreeningVitalsData_respiratory_rate_gt_0
        CHECK (respiratory_rate > 0)
    END;

IF OBJECT_ID(N'chk__ScreeningVitalsData_pulse_oximetry_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
        ADD CONSTRAINT chk__ScreeningVitalsData_pulse_oximetry_gt_0
        CHECK (pulse_oximetry > 0)
    END;


-- Subjects
IF OBJECT_ID(N'chk__Subjects_age_rng', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.Subjects
        ADD CONSTRAINT chk__Subjects_age_rng
        CHECK (age <= 18 AND age > 12)
    END;


-- SubmaximalExerciseData
IF OBJECT_ID(N'chk__SubmaximalExerciseData_work_rate_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_work_rate_ge_0
        CHECK (work_rate >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_rpm_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_rpm_ge_0
        CHECK (rpm >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_velocity_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_velocity_ge_0
        CHECK (velocity >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_mean_arterial_pressure_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_mean_arterial_pressure_ge_0
        CHECK (mean_arterial_pressure >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_stroke_volume_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_stroke_volume_ge_0
        CHECK (stroke_volume >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_cardiac_output_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_cardiac_output_ge_0
        CHECK (cardiac_output >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_vo2_absolute_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_vo2_absolute_ge_0
        CHECK (vo2_absolute >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_vo2_relative_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_vo2_relative_ge_0
        CHECK (vo2_relative >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_vco2_absolute_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_vco2_absolute_ge_0
        CHECK (vco2_absolute >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_vco2_relative_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_vco2_relative_ge_0
        CHECK (vco2_relative >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_heart_rate_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_heart_rate_ge_0
        CHECK (heart_rate >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_respiratory_exchange_ratio_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_respiratory_exchange_ratio_ge_0
        CHECK (respiratory_exchange_ratio >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_respiratory_rate_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_respiratory_rate_ge_0
        CHECK (respiratory_rate >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_tidal_volume_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_tidal_volume_ge_0
        CHECK (tidal_volume >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_minute_ventilation_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_minute_ventilation_ge_0
        CHECK (minute_ventilation >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_peto2_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_peto2_ge_0
        CHECK (peto2 >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_petco2_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_petco2_ge_0
        CHECK (petco2 >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_petco2_gas_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_petco2_gas_ge_0
        CHECK (petco2_gas >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_ve_vo2_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_ve_vo2_ge_0
        CHECK (ve_vo2 >= 0)
    END;

IF OBJECT_ID(N'chk__SubmaximalExerciseData_ve_vco2_ge_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
        ADD CONSTRAINT chk__SubmaximalExerciseData_ve_vco2_ge_0
        CHECK (ve_vco2 >= 0)
    END;


-- ViprHeartRateData
IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_5_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_5_gt_0
        CHECK (heart_rate_5 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_10_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_10_gt_0
        CHECK (heart_rate_10 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_15_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_15_gt_0
        CHECK (heart_rate_15 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_20_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_20_gt_0
        CHECK (heart_rate_20 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_25_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_25_gt_0
        CHECK (heart_rate_25 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_30_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_30_gt_0
        CHECK (heart_rate_30 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_35_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_35_gt_0
        CHECK (heart_rate_35 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_40_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_40_gt_0
        CHECK (heart_rate_40 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_45_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_45_gt_0
        CHECK (heart_rate_45 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_50_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_50_gt_0
        CHECK (heart_rate_50 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_55_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_55_gt_0
        CHECK (heart_rate_55 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_60_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_60_gt_0
        CHECK (heart_rate_60 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_65_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_65_gt_0
        CHECK (heart_rate_65 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_70_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_70_gt_0
        CHECK (heart_rate_70 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_75_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_75_gt_0
        CHECK (heart_rate_75 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_80_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_80_gt_0
        CHECK (heart_rate_80 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_85_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_85_gt_0
        CHECK (heart_rate_85 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_90_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_90_gt_0
        CHECK (heart_rate_90 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_95_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_95_gt_0
        CHECK (heart_rate_95 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_100_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_100_gt_0
        CHECK (heart_rate_100 > 0)
    END;

IF OBJECT_ID(N'chk__ViprHeartRateData_heart_rate_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
        ADD CONSTRAINT chk__ViprHeartRateData_heart_rate_gt_0
        CHECK (heart_rate > 0)
    END;


-- ViprTimeAveragedData
IF OBJECT_ID(N'chk__ViprTimeAveragedData_voxel_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprTimeAveragedData
        ADD CONSTRAINT chk__ViprTimeAveragedData_voxel_gt_0
        CHECK (voxel > 0)
    END;


-- ViprTimeResolvedData
IF OBJECT_ID(N'chk__ViprTimeResolvedData_voxel_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprTimeResolvedData
        ADD CONSTRAINT chk__ViprTimeResolvedData_voxel_gt_0
        CHECK (voxel > 0)
    END;


-- ViprWindows
IF OBJECT_ID(N'chk__ViprWindows_window_gt_0', N'C') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprWindows
        ADD CONSTRAINT chk__ViprWindows_window_gt_0
        CHECK (window >= 0)
    END;

IF OBJECT_ID(N'chk__ViprWindows_lower_voxel_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprWindows
        ADD CONSTRAINT chk__ViprWindows_lower_voxel_gt_0
        CHECK (lower_voxel > 0)
    END;

IF OBJECT_ID(N'chk__ViprWindows_upper_voxel_gt_0', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.ViprWindows
        ADD CONSTRAINT chk__ViprWindows_upper_voxel_gt_0
        CHECK (upper_voxel >= lower_voxel AND upper_voxel > 0)
    END;


-- Visits
IF OBJECT_ID(N'chk__Visits_visit_date_le_today', N'C') IS NULL 
    BEGIN
        ALTER TABLE dbo.Visits
        ADD CONSTRAINT chk__Visits_visit_date_le_today
        CHECK (visit_date <= GETDATE())
    END;
