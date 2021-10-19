-- ArterialSpinLabelingData
IF OBJECT_ID(N'pk__ArterialSpinLabelingData', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
            ADD CONSTRAINT pk__ArterialSpinLabelingData
            PRIMARY KEY (arterial_spin_labeling_id)
    END;


-- Biosamples
IF OBJECT_ID(N'pk__Biosamples', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT pk__Biosamples
            PRIMARY KEY (biosample_id)
    END;


-- BodyMeasurementsData
IF OBJECT_ID(N'pk__BodyMeasurementsData', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.BodyMeasurementsData
            ADD CONSTRAINT pk__BodyMeasurementsData
            PRIMARY KEY (body_measurement_id)
    END;



-- BoxColors
IF OBJECT_ID(N'pk__BoxColors', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.BoxColors
            ADD CONSTRAINT pk__BoxColors
            PRIMARY KEY (box_color_id)
    END;



-- CerebrovascularReactivityData
IF OBJECT_ID(N'pk__CerebrovascularReactivityData', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
            ADD CONSTRAINT pk__CerebrovascularReactivityData
            PRIMARY KEY (cerebrovascular_reactivity_data_id)
    END;


-- CompleteBloodCountData
IF OBJECT_ID(N'pk__CompleteBloodCountData', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
            ADD CONSTRAINT pk__CompleteBloodCountData
            PRIMARY KEY (complete_blood_count_id)
    END;


-- DexaData
IF OBJECT_ID(N'pk__DexaData', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.DexaData
            ADD CONSTRAINT pk__DexaData
            PRIMARY KEY (dexa_data_id)
    END;


-- Freezers
IF OBJECT_ID(N'pk__Freezers', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.Freezers
            ADD CONSTRAINT pk__Freezers
            PRIMARY KEY (freezer_id)
    END;


-- FreezerShelves
IF OBJECT_ID(N'pk__FreezerShelves', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.FreezerShelves
            ADD CONSTRAINT pk__FreezerShelves
            PRIMARY KEY (freezer_shelf_id)
    END;


-- FreezerShelves
IF OBJECT_ID(N'pk__GridLocations', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.GridLocations
            ADD CONSTRAINT pk__GridLocations
            PRIMARY KEY (grid_location_id)
    END;


-- HeartRateRecoveryData
IF OBJECT_ID(N'pk__HeartRateRecoveryData', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.HeartRateRecoveryData
            ADD CONSTRAINT pk__HeartRateRecoveryData
            PRIMARY KEY (heart_rate_recovery_data_id)
    END;


-- OgttBloodChemistries
IF OBJECT_ID(N'pk__OgttBloodChemistries', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.OgttBloodChemistries
            ADD CONSTRAINT pk__OgttBloodChemistries
            PRIMARY KEY (ogtt_blood_chemistry_id)
    END;


-- Personnel
IF OBJECT_ID(N'pk__Personnel', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.Personnel
            ADD CONSTRAINT pk__Personnel
            PRIMARY KEY (personnel_id)
    END;


-- ScreeningBloodChemistries
IF OBJECT_ID(N'pk__ScreeningBloodChemistries', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
            ADD CONSTRAINT pk__ScreeningBloodChemistries
            PRIMARY KEY (screening_blood_chemistry_id)
    END;


-- ScreeningVitalsData
IF OBJECT_ID(N'pk__ScreeningVitalsData', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
            ADD CONSTRAINT pk__ScreeningVitalsData
            PRIMARY KEY (screening_vitals_data_id)
    END;


-- Statuses
IF OBJECT_ID(N'pk__Statuses', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.Statuses
            ADD CONSTRAINT pk__Statuses
            PRIMARY KEY (status_id)
    END;

-- Studies
IF OBJECT_ID(N'pk__Studies', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.Studies
            ADD CONSTRAINT pk__Studies
            PRIMARY KEY (study_id)
    END;

-- Ethnicities
IF OBJECT_ID(N'pk__Ethnicities', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.Ethnicities
            ADD CONSTRAINT pk__Ethnicities
            PRIMARY KEY (ethnicity_id)
    END;


-- Races
IF OBJECT_ID(N'pk__Races', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.Races
            ADD CONSTRAINT pk__Races
            PRIMARY KEY (race_id)
    END;


-- Subjects
IF OBJECT_ID(N'pk__Subjects', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.Subjects
            ADD CONSTRAINT pk__Subjects
            PRIMARY KEY (subject_id)
    END;


-- Sexes
IF OBJECT_ID(N'pk__Sexes', N'PK') IS NULL
    BEGIN
        ALTER TABLE dbo.Sexes
            ADD CONSTRAINT pk__Sexes
            PRIMARY KEY (sex_id)
    END;


-- SubmaximalExerciseData
IF OBJECT_ID(N'pk__SubmaximalExerciseData', N'PK') IS NULL
    BEGIN
        ALTER  TABLE dbo.SubmaximalExerciseData
            ADD CONSTRAINT pk__SubmaximalExerciseData
            PRIMARY KEY (submaximal_exercise_data_id)
    END;


-- TimePoints
IF OBJECT_ID(N'pk__TimePoints', N'PK') IS NULL
    BEGIN
        ALTER  TABLE dbo.TimePoints
            ADD CONSTRAINT pk__TimePoints
            PRIMARY KEY (time_point_id)
    END;


-- TubeColors
IF OBJECT_ID(N'pk__TubeColors', N'PK') IS NULL
    BEGIN
        ALTER  TABLE dbo.TubeColors
            ADD CONSTRAINT pk__TubeColors
            PRIMARY KEY (tube_color_id)
    END;


-- Vessels
IF OBJECT_ID(N'pk__Vessels', N'PK') IS NULL
    BEGIN
        ALTER  TABLE dbo.Vessels
            ADD CONSTRAINT pk__Vessels
            PRIMARY KEY (vessel_id)
    END;


-- ViprHeartRateData
IF OBJECT_ID(N'pk__ViprHeartRateData', N'PK') IS NULL
    BEGIN
        ALTER  TABLE dbo.ViprHeartRateData
            ADD CONSTRAINT pk__ViprHeartRateData
            PRIMARY KEY (vipr_heart_rate_data_id)
    END;


-- ViprTimeAveragedData
IF OBJECT_ID(N'pk__ViprTimeAveragedData', N'PK') IS NULL
    BEGIN
        ALTER  TABLE dbo.ViprTimeAveragedData
            ADD CONSTRAINT pk__ViprTimeAveragedData
            PRIMARY KEY (vipr_time_averaged_data_id)
    END;


-- ViprTimeResolvedData
IF OBJECT_ID(N'pk__ViprTimeResolvedData', N'PK') IS NULL
    BEGIN
        ALTER  TABLE dbo.ViprTimeResolvedData
            ADD CONSTRAINT pk__ViprTimeResolvedData
            PRIMARY KEY (vipr_time_resolved_data_id)
    END;


-- ViprWindows
IF OBJECT_ID(N'pk__ViprWindows', N'PK') IS NULL
    BEGIN
        ALTER  TABLE dbo.ViprWindows
            ADD CONSTRAINT pk__ViprWindows
            PRIMARY KEY (vipr_window_id)
    END;


-- VisitNames
IF OBJECT_ID(N'pk__VisitNames', N'PK') IS NULL
    BEGIN
        ALTER  TABLE dbo.VisitNames
            ADD CONSTRAINT pk__VisitNames
            PRIMARY KEY (visit_name_id)
    END;


-- Visits
IF OBJECT_ID(N'pk__Visits', N'PK') IS NULL
    BEGIN
        ALTER  TABLE dbo.Visits
            ADD CONSTRAINT pk__Visits
            PRIMARY KEY (visit_id)
    END;