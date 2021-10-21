-- Anthropometrics
IF OBJECT_ID(N'dbo.Anthropometrics', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Anthropometrics(
			body_measurement_id TINYINT NOT NULL IDENTITY(1,1),
			height NUMERIC(3,0),
			weight NUMERIC(4,1),
			body_mass_index NUMERIC(3,1),
            body_mass_index_zscore NUMERIC(3,2),
			hip_circumference TINYINT,
			waist_circumference TINYINT,
            waist_hip_ratio NUMERIC(3,2),
			tanner_stage TINYINT,
            time_point_id TINYINT NOT NULL
		)
	END;


-- ArterialSpinLabelingData
IF OBJECT_ID(N'dbo.ArterialSpinLabelingData', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.ArterialSpinLabelingData(
			arterial_spin_labeling_id SMALLINT NOT NULL IDENTITY(1,1),
			global NUMERIC(3,1),
			hemisphere_l NUMERIC(3,1),
			hemisphere_r NUMERIC(3,1),
			mca_total NUMERIC(3,1),
			mca_l NUMERIC(3,1),
			mca_r NUMERIC(3,1),
			aca_total NUMERIC(3,1),
			aca_l NUMERIC(3,1),
			aca_r NUMERIC(3,1),
			pca_total NUMERIC(3,1),
			pca_l NUMERIC(3,1),
			pca_r NUMERIC(3,1),
			frontal_lobe_total NUMERIC(3,1),
			frontal_lobe_l NUMERIC(3,1),
			frontal_lobe_r NUMERIC(3,1),
			temporal_lobe_total	 NUMERIC(3,1),
			temporal_lobe_l NUMERIC(3,1),
			temporal_lobe_r NUMERIC(3,1),
			parietal_lobe_total NUMERIC(3,1),
			parietal_lobe_l NUMERIC(3,1),
			parietal_lobe_r NUMERIC(3,1),
			occipital_lobe_total NUMERIC(3,1),
			occipital_lobe_l NUMERIC(3,1),
			occipital_lobe_r NUMERIC(3,1),
			angular_l NUMERIC(3,1),
			angular_r NUMERIC(3,1),
			cingulum_ant_l NUMERIC(3,1),
			cingulum_ant_r NUMERIC(3,1),
			cingulum_post_l NUMERIC(3,1),
			cingulum_post_r NUMERIC(3,1),
			frontal_med_orb_l NUMERIC(3,1),
			frontal_med_orb_r NUMERIC(3,1),
			frontal_mid_l NUMERIC(3,1),
			frontal_mid_r NUMERIC(3,1),
			frontal_mid_orb_l NUMERIC(3,1),
			frontal_mid_orb_r NUMERIC(3,1),
			frontal_sup_l NUMERIC(3,1),
			frontal_sup_r NUMERIC(3,1),
			frontal_sup_med_l NUMERIC(3,1),
			frontal_sup_med_r NUMERIC(3,1),
			frontal_sup_orb_l NUMERIC(3,1),
			frontal_sup_orb_r NUMERIC(3,1),
			hippocampus_l NUMERIC(3,1),
			hippocampus_r NUMERIC(3,1),
			precuneus_l NUMERIC(3,1),
			precuneus_r NUMERIC(3,1),
			supramarginal_l NUMERIC(3,1),
			supramarginal_r NUMERIC(3,1),
			temporal_mid_l NUMERIC(3,1),
			temporal_mid_r NUMERIC(3,1),
			temporal_sup_l NUMERIC(3,1),
			temporal_sup_r NUMERIC(3,1),
			time_point_id TINYINT NOT NULL
		)
	END;


-- Biosamples
IF OBJECT_ID(N'dbo.Biosamples', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Biosamples(
			biosample_id SMALLINT NOT NULL,
			biosample_date DATE NOT NULL,
			time_point_id TINYINT,
			tube_color_id TINYINT NOT NULL,
			freezer_id TINYINT NOT NULL,
			freezer_shelf_id  TINYINT NOT NULL,
			box_color_id TINYINT NOT NULL,
			box_number TINYINT NOT NULL,
			grid_location_id TINYINT NOT NULL,
			personnel_id TINYINT NOT NULL,
			status_id TINYINT NOT NULL
		)
	END;


-- BoxColors
IF OBJECT_ID(N'dbo.BoxColors', N'U') IS NULL
    BEGIN
		CREATE TABLE dbo.BoxColors(
            box_color_id TINYINT NOT NULL IDENTITY(1,1),
            color VARCHAR(255),
        );
    END;


-- CerebrovascularReactivityData
IF OBJECT_ID(N'dbo.CerebrovascularReactivityData', N'U') IS NULL
    BEGIN
        CREATE TABLE CerebrovascularReactivityData(
            cerebrovascular_reactivity_data_id TINYINT NOT NULL IDENTITY(1,1),
            time SMALLINT NOT NULL,
            respiratory_rate TINYINT,
            tidal_volume SMALLINT,
            minute_ventilation TINYINT,
            heart_rate TINYINT,
            stroke_volume TINYINT,
            cardiac_output TINYINT,
            petco2 TINYINT,
            velocity SMALLINT,
            time_point_id TINYINT NOT NULL
		)
	END;


-- CompleteBloodCountData
IF OBJECT_ID(N'dbo.CompleteBloodCountData', N'U') IS NULL
    BEGIN
		CREATE TABLE dbo.CompleteBloodCountData(
			complete_blood_count_id TINYINT NOT NULL IDENTITY(1,1),
			white_cell_count NUMERIC(3,1),
			red_cell_count NUMERIC(2,1),
			hemoglobin NUMERIC(3,1),
			hematocrit TINYINT,
			mean_cell_volume TINYINT,
			mean_corpuscular_hemoglobin_concentration TINYINT,
			red_cell_distribution_width_cv NUMERIC(3,1),
			red_cell_distribution_width_sd NUMERIC(3,1),
			platelet_count SMALLINT,
			neutrophils_absolute SMALLINT,
			immature_granulocytes_absolute SMALLINT,
			lymphocytes_absolute SMALLINT,
			monocytes_absolute SMALLINT,
			eosinophils_absolute SMALLINT,
			basophils_absolute SMALLINT,
			neutrophils_percent TINYINT,
			immature_granulocytes_percent TINYINT,
			lymphocytes_percent TINYINT,
			monocytes_percent TINYINT,
			eosinophils_percent TINYINT,
			basophils_percent TINYINT,
			nucleated_red_blood_cell TINYINT,
			time_point_id TINYINT NOT NULL
		)
	END;


-- DexaData
IF OBJECT_ID(N'dbo.DexaData', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.DexaData(
			dexa_data_id TINYINT NOT NULL IDENTITY(1,1),
			trunk_total NUMERIC(5,2),
			trunk_tissue NUMERIC(5,2),
			trunk_lean NUMERIC(5,2),
			trunk_fat NUMERIC(5,2),
			trunk_fat_percent NUMERIC(5,1),
			android_total NUMERIC(5,2),
			android_tissue NUMERIC(5,2),
			android_lean NUMERIC(5,2),
			android_fat NUMERIC(5,2),
			android_fat_percent NUMERIC(3,1),
			gynoic_total NUMERIC(5,2),
			gynoid_tissue NUMERIC(5,2),
			gynoid_lean NUMERIC(5,2),
			gynoid_fat NUMERIC(5,2),
			gynoid_fat_percent NUMERIC(3,1),
			whole_total NUMERIC(5,2),
			whole_tissue NUMERIC(5,2),
			whole_lean NUMERIC(5,2),
			whole_fat NUMERIC(5,2),
			whole_fat_percent NUMERIC(3,1),
			vat_volume NUMERIC(5,2),
			vat_mass NUMERIC(2,2),
			time_point_id TINYINT NOT NULL
		)
	END;


-- Freezers
IF OBJECT_ID(N'dbo.Freezers', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Freezers(
			freezer_id TINYINT NOT NULL IDENTITY(1,1),
			name VARCHAR(255),
			number TINYINT
		)
	END;


-- FreezerShelves
IF OBJECT_ID(N'dbo.FreezerShelves', N'U') IS NULL
    BEGIN
        CREATE TABLE dbo.FreezerShelves(
            freezer_shelf_id TINYINT NOT NULL IDENTITY(1,1),
            shelf_number TINYINT,
        );
    END;


-- GridLocations
IF OBJECT_ID(N'dbo.GridLocations', N'U') IS NULL
    BEGIN
        CREATE TABLE dbo.GridLocations(
            grid_location_id TINYINT NOT NULL IDENTITY(1,1),
            location VARCHAR(255) NOT NULL
		)
	END;


-- HeartRateRecoveryData
IF OBJECT_ID(N'dbo.HeartRateRecoveryData', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.HeartRateRecoveryData(
			heart_rate_recovery_data_id SMALLINT NOT NULL IDENTITY(1,1),
			time TINYINT NOT NULL,
			heart_rate TINYINT,
			time_point_id TINYINT NOT NULL
		)
	END;


-- MaximalOxygenUptakeData
IF OBJECT_ID(N'dbo.MaximalOxygenUptakeData', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.MaximalOxygenUptakeData(
			 maximal_oxygen_uptake_data_id TINYINT NOT NULL IDENTITY(1,1),
			 work_rate SMALLINT NOT NULL,
			 vo2_absolute NUMERIC(3,2) NOT NULL,
			 vo2_relative NUMERIC(3,1) NOT NULL,
			 vco2_absolute NUMERIC(3,2) NOT NULL,
			 vco2_relative NUMERIC(3,1) NOT NULL,
			 heart_rate TINYINT NOT NULL,
			 respiratory_exchange_ratio NUMERIC(3,2) NOT NULL,
			 respiratory_rate TINYINT NOT NULL,
			 tidal_volume SMALLINT NOT NULL,
			 minute_ventilation TINYINT NOT NULL,
			 peto2 TINYINT NOT NULL,
			 petco2 TINYINT NOT NULL,
			 ve_vo2 NUMERIC(3,2) NOT NULL,
			 ve_vco2 NUMERIC(3,2) NOT NULL,
			 time_point_id TINYINT NOT NULL
		)
	END;


-- OgttBloodChemistries
IF OBJECT_ID(N'dbo.OgttBloodChemistries', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.OgttBloodChemistries(
            ogtt_blood_chemistry_id SMALLINT NOT NULL IDENTITY(1,1),
            glucose SMALLINT,
            insulin SMALLINT,
            hemoglobin NUMERIC(3,1),
            subject_id SMALLINT NOT NULL,
			time_point_id TINYINT NOT NULL
        )
    END;

-- Personnel
IF OBJECT_ID(N'dbo.Personnel', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Personnel(
			 personnel_id TINYINT NOT NULL IDENTITY(1,1),
			 first_name NVARCHAR(255) NOT NULL,
			 last_name NVARCHAR(255) NOT NULL,
			 )
	END;

-- ScreeningBloodChemistries
IF OBJECT_ID(N'dbo.ScreeningBloodChemistries', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.ScreeningBloodChemistries(
			screening_blood_chemistry_id TINYINT NOT NULL IDENTITY(1,1),
			measurement_number TINYINT NOT NULL,
			glucose TINYINT,
			total_cholesterol SMALLINT,
			high_density_cholesterol TINYINT,
			low_density_cholesterol SMALLINT,
			triglycerides SMALLINT,
			hemoglobin_a1c NUMERIC(3,1),
			insulin TINYINT,
			time_point_id TINYINT NOT NULL
			 )
	END;


-- ScreeningVitalsData
IF OBJECT_ID(N'dbo.ScreeningVitalsData', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.ScreeningVitalsData(
			screening_vitals_data_id TINYINT NOT NULL IDENTITY(1,1),
			-- measurement_number TINYINT NOT NULL,
			heart_rate TINYINT,
			systolic_blood_pressure TINYINT,
			diastolic_blood_pressure TINYINT,
			mean_arterial_pressure TINYINT,
			respiratory_rate TINYINT,
			pulse_oximetry TINYINT,
			time_point_id TINYINT NOT NULL
			)
	END;


-- Statuses
IF OBJECT_ID(N'dbo.Statuses', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Statuses(
			 status_id TINYINT NOT NULL IDENTITY(1,1),
			 status VARCHAR(255) NOT NULL
		)
	END;


-- Studies
IF OBJECT_ID(N'dbo.Studies', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Studies(
			 study_id TINYINT NOT NULL IDENTITY(1,1),
			 study VARCHAR(255) NOT NULL
		)
	END;


-- Ethnicities
IF OBJECT_ID(N'dbo.Ethnicities', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Ethnicities(
			 ethnicity_id TINYINT NOT NULL IDENTITY(1,1),
			 ethnicity VARCHAR(255) NOT NULL,
		)
	END;


-- Races
IF OBJECT_ID(N'dbo.Races', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Races(
			 race_id TINYINT NOT NULL IDENTITY(1,1),
			 race VARCHAR(255) NOT NULL,
		)
	END;

-- Sexes
IF OBJECT_ID(N'dbo.Sexes', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Sexes(
			sex_id TINYINT NOT NULL IDENTITY(1,1),
			sex VARCHAR(255) NOT NULL
		)
	END;

-- Subjects
IF OBJECT_ID(N'dbo.Subjects', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Subjects(
			 subject_id SMALLINT NOT NULL IDENTITY(1,1),
			 subject VARCHAR(255) NOT NULL,
			 age TINYINT NOT NULL,
			 sex_id TINYINT NOT NULL,
			 race_id TINYINT NOT NULL,
			 ethnicity_id TINYINT NOT NULL,
			 study_id TINYINT NOT NULL
		)
	END;

-- SubmaximalExerciseData
IF OBJECT_ID(N'dbo.SubmaximalExerciseData', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.SubmaximalExerciseData(
			 submaximal_exercise_data_id INT NOT NULL IDENTITY(1,1),
			 work_rate SMALLINT,
			 rpm TINYINT,
			 velocity SMALLINT NOT NULL,
			 vo2_absolute NUMERIC(3,2) NOT NULL,
			 vo2_relative NUMERIC(3,1) NOT NULL,
			 vco2_absolute NUMERIC(3,2) NOT NULL,
			 vco2_relative NUMERIC(3,1) NOT NULL,
			 heart_rate TINYINT NOT NULL,
			 mean_arterial_pressure TINYINT,
			 cardiac_output TINYINT,
			 stroke_volume TINYINT,
			 respiratory_exchange_ratio NUMERIC(3,2) NOT NULL,
			 respiratory_rate TINYINT NOT NULL,
			 tidal_volume SMALLINT NOT NULL,
			 minute_ventilation TINYINT NOT NULL,
			 peto2 TINYINT NOT NULL,
			 petco2 TINYINT NOT NULL,
			 petco2_gas TINYINT NOT NULL,
			 ve_vo2 NUMERIC(3,2) NOT NULL,
			 ve_vco2 NUMERIC(3,2) NOT NULL,
			 time_point_id TINYINT NOT NULL
		)
	END;


-- TimePoints
IF OBJECT_ID(N'dbo.TimePoints', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.TimePoints(
			 time_point_id TINYINT NOT NULL IDENTITY(1,1),
			 time_point TINYINT NOT NULL,
             visit_id SMALLINT NOT NULL
		)
	END;


-- TubeColors
IF OBJECT_ID(N'dbo.TubeColors', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.TubeColors(
			 tube_color_id TINYINT NOT NULL IDENTITY(1,1),
			 color VARCHAR(255) NOT NULL
		)
	END;


-- Vessels
IF OBJECT_ID(N'dbo.Vessels', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Vessels(
			 vessel_id TINYINT NOT NULL IDENTITY(1,1),
			 vessel VARCHAR(255) NOT NULL
		)
	END;


-- ViprHeartRateData
IF OBJECT_ID(N'dbo.ViprHeartRateData', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.ViprHeartRateData(
			vipr_heart_rate_data_id SMALLINT NOT NULL IDENTITY(1,1),
			heart_rate_5 NUMERIC(15,13) NOT NULL,
			heart_rate_10 NUMERIC(15,13) NOT NULL,
			heart_rate_15 NUMERIC(15,13) NOT NULL,
			heart_rate_20 NUMERIC(15,13) NOT NULL,
			heart_rate_25 NUMERIC(15,13) NOT NULL,
			heart_rate_30 NUMERIC(15,13) NOT NULL,
			heart_rate_35 NUMERIC(15,13) NOT NULL,
			heart_rate_40 NUMERIC(15,13) NOT NULL,
			heart_rate_45 NUMERIC(15,13) NOT NULL,
			heart_rate_50 NUMERIC(15,13) NOT NULL,
			heart_rate_55 NUMERIC(15,13) NOT NULL,
			heart_rate_60 NUMERIC(15,13) NOT NULL,
			heart_rate_65 NUMERIC(15,13) NOT NULL,
			heart_rate_70 NUMERIC(15,13) NOT NULL,
			heart_rate_75 NUMERIC(15,13) NOT NULL,
			heart_rate_80 NUMERIC(15,13) NOT NULL,
			heart_rate_85 NUMERIC(15,13) NOT NULL,
			heart_rate_90 NUMERIC(15,13) NOT NULL,
			heart_rate_95 NUMERIC(15,13) NOT NULL,
			heart_rate_100 NUMERIC(15,13) NOT NULL,
			heart_rate TINYINT,
			time_point_id TINYINT NOT NULL
		)
	END;


-- ViprTimeAveragedData
IF OBJECT_ID(N'dbo.ViprTimeAveragedData', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.ViprTimeAveragedData(
			 vipr_time_averaged_data_id INT NOT NULL IDENTITY(1,1),
			 voxel SMALLINT NOT NULL,
			 cross_sectional_area NUMERIC(18,16) NOT NULL,
			 diameter NUMERIC(18,16) NOT NULL,
			 mean_velocity NUMERIC(18,16) NOT NULL,
			 max_velocity NUMERIC(18,16) NOT NULL,
			 flow_per_heart_cycle NUMERIC(18,16) NOT NULL,
			 wall_shear_stress   NUMERIC(18,16) NOT NULL,
			 pulsatility_index NUMERIC(18,16) NOT NULL,
			 time_point_id TINYINT NOT NULL,
			 vessel_id TINYINT NOT NULL
		)
	END;


-- ViprTimeResolvedData
IF OBJECT_ID(N'dbo.ViprTimeResolvedData', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.ViprTimeResolvedData(
			vipr_time_resolved_data_id INT NOT NULL IDENTITY(1,1),
			voxel SMALLINT NOT NULL,
			flow_5 NUMERIC(16,14) NOT NULL,
			flow_10 NUMERIC(16,14) NOT NULL,
			flow_15 NUMERIC(16,14) NOT NULL,
			flow_20 NUMERIC(16,14) NOT NULL,
			flow_25 NUMERIC(16,14) NOT NULL,
			flow_30 NUMERIC(16,14) NOT NULL,
			flow_35 NUMERIC(16,14) NOT NULL,
			flow_40 NUMERIC(16,14) NOT NULL,
			flow_45 NUMERIC(16,14) NOT NULL,
			flow_50 NUMERIC(16,14) NOT NULL,
			flow_55 NUMERIC(16,14) NOT NULL,
			flow_60 NUMERIC(16,14) NOT NULL,
			flow_65 NUMERIC(16,14) NOT NULL,
			flow_70 NUMERIC(16,14) NOT NULL,
			flow_75 NUMERIC(16,14) NOT NULL,
			flow_80 NUMERIC(16,14) NOT NULL,
			flow_85 NUMERIC(16,14) NOT NULL,
			flow_90 NUMERIC(16,14) NOT NULL,
			flow_95 NUMERIC(16,14) NOT NULL,
			flow_100 NUMERIC(16,14) NOT NULL,
            flow_min NUMERIC(16,14) NOT NULL,
			time_point_id TINYINT NOT NULL,
			vessel_id TINYINT NOT NULL
		)
	END;


-- ViprWindows
IF OBJECT_ID(N'dbo.ViprWindows', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.ViprWindows(
			vipr_window_id SMALLINT NOT NULL IDENTITY(1,1),
			window SMALLINT NOT NULL,
			lower_voxel SMALLINT NOT NULL,
			upper_voxel SMALLINT NOT NULL,
			time_point_id TINYINT NOT NULL,
			vessel_id TINYINT NOT NULL
		)
	END;


-- VisitNames
IF OBJECT_ID(N'dbo.VisitNames', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.VisitNames(
			 visit_name_id TINYINT NOT NULL IDENTITY(1,1),
			 visit_name VARCHAR(255) NOT NULL
		)
	END;


-- Visits
IF OBJECT_ID(N'dbo.Visits', N'U') IS NULL
	BEGIN
		CREATE TABLE dbo.Visits(
			 visit_id SMALLINT NOT NULL IDENTITY(1,1),
			 visit_date DATE NOT NULL,
			 visit_name_id TINYINT NOT NULL,
			 time_point_id TINYINT NOT NULL
		)
	END;
