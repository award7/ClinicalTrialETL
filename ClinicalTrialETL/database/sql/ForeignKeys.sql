DBCC FREEPROCCACHE
-- ArterialSpinLabelingData
IF OBJECT_ID(N'fk__ArterialSpinLabelingData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
            ADD CONSTRAINT fk__ArterialSpinLabelingData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__ArterialSpinLabelingData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
            ADD CONSTRAINT fk__ArterialSpinLabelingData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


IF OBJECT_ID(N'fk__ArterialSpinLabelingData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
            ADD CONSTRAINT fk__ArterialSpinLabelingData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
    END;


-- Biosamples
IF OBJECT_ID(N'fk__Biosamples_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__Biosamples_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


IF OBJECT_ID(N'fk__Biosamples_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
    END;


IF OBJECT_ID(N'fk__Biosamples_TubeColors', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_TubeColors
            FOREIGN KEY (tube_color_id) REFERENCES TubeColors(tube_color_id)
    END;


IF OBJECT_ID(N'fk__Biosamples_Freezers', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_Freezers
            FOREIGN KEY (freezer_id) REFERENCES Freezers(freezer_id)
    END;


IF OBJECT_ID(N'fk__Biosamples_FreezerShelves', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_FreezerShelves
            FOREIGN KEY (freezer_shelf_id) REFERENCES FreezerShelves(freezer_shelf_id)
    END;


IF OBJECT_ID(N'fk__Biosamples_BoxColors', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_BoxColors
            FOREIGN KEY (box_color_id) REFERENCES BoxColors(box_color_id)
    END;


IF OBJECT_ID(N'fk__Biosamples_GridLocations', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_GridLocations
            FOREIGN KEY (grid_location_id) REFERENCES GridLocations(grid_location_id)
    END;


IF OBJECT_ID(N'fk__Biosamples_Personnel', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_Personnel
            FOREIGN KEY (personnel_id) REFERENCES Personnel(personnel_id)
    END;


IF OBJECT_ID(N'fk__Biosamples_Statuses', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_Statuses
            FOREIGN KEY (status_id) REFERENCES Statuses(status_id)
    END;


-- BodyMeasurementsData
IF OBJECT_ID(N'fk__BodyMeasurementsData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.BodyMeasurementsData
            ADD CONSTRAINT fk__BodyMeasurementsData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__BodyMeasurementsData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.BodyMeasurementsData
            ADD CONSTRAINT fk__BodyMeasurementsData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


-- CerebrovascularReactivityData
IF OBJECT_ID(N'fk__CerebrovascularReactivityData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
            ADD CONSTRAINT fk__CerebrovascularReactivityData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__CerebrovascularReactivityData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
            ADD CONSTRAINT fk__CerebrovascularReactivityData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


-- CompleteBloodCountData
IF OBJECT_ID(N'fk__CompleteBloodCountData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
            ADD CONSTRAINT fk__CompleteBloodCountData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__CompleteBloodCountData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
            ADD CONSTRAINT fk__CompleteBloodCountData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


-- DexaData
IF OBJECT_ID(N'fk__DexaData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.DexaData
            ADD CONSTRAINT fk__DexaData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__DexaData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.DexaData
            ADD CONSTRAINT fk__DexaData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


-- HeartRateRecoveryData
IF OBJECT_ID(N'fk__HeartRateRecoveryData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.HeartRateRecoveryData
            ADD CONSTRAINT fk__HeartRateRecoveryData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__HeartRateRecoveryData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.HeartRateRecoveryData
            ADD CONSTRAINT fk__HeartRateRecoveryData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


-- MaximalOxygenUptakeData
IF OBJECT_ID(N'fk__MaximalOxygenUptakeData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
            ADD CONSTRAINT fk__MaximalOxygenUptakeData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__MaximalOxygenUptakeData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
            ADD CONSTRAINT fk__MaximalOxygenUptakeData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


-- OgttBloodChemistries
IF OBJECT_ID(N'fk__OgttBloodChemistries_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.OgttBloodChemistries
            ADD CONSTRAINT fk__OgttBloodChemistries_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__OgttBloodChemistries_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.OgttBloodChemistries
            ADD CONSTRAINT fk__OgttBloodChemistries_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


IF OBJECT_ID(N'fk__OgttBloodChemistries_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.OgttBloodChemistries
            ADD CONSTRAINT fk__OgttBloodChemistries_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
    END;


-- ScreeningBloodChemistries
IF OBJECT_ID(N'fk__ScreeningBloodChemistries_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
            ADD CONSTRAINT fk__ScreeningBloodChemistries_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__ScreeningBloodChemistries_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
            ADD CONSTRAINT fk__ScreeningBloodChemistries_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


-- ScreeningVitalsData
IF OBJECT_ID(N'fk__ScreeningVitalsData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
            ADD CONSTRAINT fk__ScreeningVitalsData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__ScreeningVitalsData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
            ADD CONSTRAINT fk__ScreeningVitalsData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


-- Subjects
IF OBJECT_ID(N'fk__Subjects_Sexes', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Subjects
            ADD CONSTRAINT fk__Subjects_Sexes
            FOREIGN KEY (sex_id) REFERENCES Sexes(sex_id)
    END;

IF OBJECT_ID(N'fk__Subjects_Races', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Subjects
            ADD CONSTRAINT fk__Subjects_Races
            FOREIGN KEY (race_id) REFERENCES Races(race_id)
    END;

IF OBJECT_ID(N'fk__Subjects_Ethnicities', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Subjects
            ADD CONSTRAINT fk__Subjects_Ethnicities
            FOREIGN KEY (ethnicity_id) REFERENCES Ethnicities(ethnicity_id)
    END;

IF OBJECT_ID(N'fk__Subjects_Studies', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Subjects
            ADD CONSTRAINT fk__Subjects_Studies
            FOREIGN KEY (study_id) REFERENCES Studies(study_id)
    END;




-- SubmaximalExerciseData
IF OBJECT_ID(N'fk__SubmaximalExerciseData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
            ADD CONSTRAINT fk__SubmaximalExerciseData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__SubmaximalExerciseData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
            ADD CONSTRAINT fk__SubmaximalExerciseData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


-- ViprHeartRateData
IF OBJECT_ID(N'fk__ViprHeartRateData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
            ADD CONSTRAINT fk__ViprHeartRateData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__ViprHeartRateData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
            ADD CONSTRAINT fk__ViprHeartRateData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


IF OBJECT_ID(N'fk__ViprHeartRateData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
            ADD CONSTRAINT fk__ViprHeartRateData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
    END;


-- ViprTimeAveragedData
IF OBJECT_ID(N'fk__ViprTimeAveragedData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeAveragedData
            ADD CONSTRAINT fk__ViprTimeAveragedData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__ViprTimeAveragedData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeAveragedData
            ADD CONSTRAINT fk__ViprTimeAveragedData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


IF OBJECT_ID(N'fk__ViprTimeAveragedData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeAveragedData
            ADD CONSTRAINT fk__ViprTimeAveragedData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
    END;


IF OBJECT_ID(N'fk__ViprTimeAveragedData_Vessels', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeAveragedData
            ADD CONSTRAINT fk__ViprTimeAveragedData_Vessels
            FOREIGN KEY (vessel_id) REFERENCES Vessels(vessel_id)
    END;


-- ViprTimeResolvedData
IF OBJECT_ID(N'fk__ViprTimeResolvedData_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeResolvedData
            ADD CONSTRAINT fk__ViprTimeResolvedData_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__ViprTimeResolvedData_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeResolvedData
            ADD CONSTRAINT fk__ViprTimeResolvedData_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


IF OBJECT_ID(N'fk__ViprTimeResolvedData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeResolvedData
            ADD CONSTRAINT fk__ViprTimeResolvedData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
    END;


IF OBJECT_ID(N'fk__ViprTimeResolvedData_Vessels', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeResolvedData
            ADD CONSTRAINT fk__ViprTimeResolvedData_Vessels
            FOREIGN KEY (vessel_id) REFERENCES Vessels(vessel_id)
    END;


-- ViprWindows
IF OBJECT_ID(N'fk__ViprWindows_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprWindows
            ADD CONSTRAINT fk__ViprWindows_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;


IF OBJECT_ID(N'fk__ViprWindows_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprWindows
            ADD CONSTRAINT fk__ViprWindows_Visits
            FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
    END;


IF OBJECT_ID(N'fk__ViprWindows_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprWindows
            ADD CONSTRAINT fk__ViprWindows_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
    END;


IF OBJECT_ID(N'fk__ViprWindows_Vessels', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprWindows
            ADD CONSTRAINT fk__ViprWindows_Vessels
            FOREIGN KEY (vessel_id) REFERENCES Vessels(vessel_id)
    END;


-- Visits
IF OBJECT_ID(N'fk__Visits_VisitNames', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Visits
            ADD CONSTRAINT fk__Visits_VisitNames
            FOREIGN KEY (visit_name_id) REFERENCES VisitNames(visit_name_id)
    END;


IF OBJECT_ID(N'fk__Visits_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Visits
            ADD CONSTRAINT fk__Visits_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
    END;
