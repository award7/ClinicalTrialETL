USE Schrage_Lab_DB;
GO

-- ArterialSpinLabelingData
IF OBJECT_ID(N'fk__ArterialSpinLabelingData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ArterialSpinLabelingData
            ADD CONSTRAINT fk__ArterialSpinLabelingData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
    END;


-- Biosamples
IF OBJECT_ID(N'fk__Biosamples_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
    END;


IF OBJECT_ID(N'fk__Biosamples_TubeColors', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_TubeColors
            FOREIGN KEY (tube_color_id) REFERENCES TubeColors(tube_color_id)
			ON UPDATE CASCADE;
    END;


IF OBJECT_ID(N'fk__Biosamples_Freezers', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_Freezers
            FOREIGN KEY (freezer_id) REFERENCES Freezers(freezer_id)
			ON UPDATE CASCADE;
    END;


IF OBJECT_ID(N'fk__Biosamples_FreezerShelves', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_FreezerShelves
            FOREIGN KEY (freezer_shelf_id) REFERENCES FreezerShelves(freezer_shelf_id)
			ON UPDATE CASCADE;
    END;


IF OBJECT_ID(N'fk__Biosamples_BoxColors', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_BoxColors
            FOREIGN KEY (box_color_id) REFERENCES BoxColors(box_color_id)
			ON UPDATE CASCADE;
    END;


IF OBJECT_ID(N'fk__Biosamples_GridLocations', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_GridLocations
            FOREIGN KEY (grid_location_id) REFERENCES GridLocations(grid_location_id)
			ON UPDATE CASCADE;
    END;


IF OBJECT_ID(N'fk__Biosamples_Personnel', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_Personnel
            FOREIGN KEY (personnel_id) REFERENCES Personnel(personnel_id)
			ON UPDATE CASCADE;
    END;


IF OBJECT_ID(N'fk__Biosamples_Statuses', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Biosamples
            ADD CONSTRAINT fk__Biosamples_Statuses
            FOREIGN KEY (status_id) REFERENCES Statuses(status_id)
			ON UPDATE CASCADE;
    END;


-- BodyMeasurementsData
IF OBJECT_ID(N'fk__BodyMeasurementsData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.BodyMeasurementsData
            ADD CONSTRAINT fk__BodyMeasurementsData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- CerebrovascularReactivityData
IF OBJECT_ID(N'fk__CerebrovascularReactivityData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.CerebrovascularReactivityData
            ADD CONSTRAINT fk__CerebrovascularReactivityData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- CompleteBloodCountData
IF OBJECT_ID(N'fk__CompleteBloodCountData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.CompleteBloodCountData
            ADD CONSTRAINT fk__CompleteBloodCountData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- DexaData
IF OBJECT_ID(N'fk__DexaData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.DexaData
            ADD CONSTRAINT fk__DexaData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- HeartRateRecoveryData
IF OBJECT_ID(N'fk__HeartRateRecoveryData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.HeartRateRecoveryData
            ADD CONSTRAINT fk__HeartRateRecoveryData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- MaximalOxygenUptakeData
IF OBJECT_ID(N'fk__MaximalOxygenUptakeData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.MaximalOxygenUptakeData
            ADD CONSTRAINT fk__MaximalOxygenUptakeData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- OgttBloodChemistries
IF OBJECT_ID(N'fk__OgttBloodChemistries_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.OgttBloodChemistries
            ADD CONSTRAINT fk__OgttBloodChemistries_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- ScreeningBloodChemistries
IF OBJECT_ID(N'fk__ScreeningBloodChemistries_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ScreeningBloodChemistries
            ADD CONSTRAINT fk__ScreeningBloodChemistries_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- ScreeningVitalsData
IF OBJECT_ID(N'fk__ScreeningVitalsData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ScreeningVitalsData
            ADD CONSTRAINT fk__ScreeningVitalsData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- Subjects
IF OBJECT_ID(N'fk__Subjects_Sexes', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Subjects
            ADD CONSTRAINT fk__Subjects_Sexes
            FOREIGN KEY (sex_id) REFERENCES Sexes(sex_id)
			ON UPDATE CASCADE;
    END;

IF OBJECT_ID(N'fk__Subjects_Races', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Subjects
            ADD CONSTRAINT fk__Subjects_Races
            FOREIGN KEY (race_id) REFERENCES Races(race_id)
			ON UPDATE CASCADE;
    END;

IF OBJECT_ID(N'fk__Subjects_Ethnicities', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Subjects
            ADD CONSTRAINT fk__Subjects_Ethnicities
            FOREIGN KEY (ethnicity_id) REFERENCES Ethnicities(ethnicity_id)
			ON UPDATE CASCADE;
    END;

IF OBJECT_ID(N'fk__Subjects_Studies', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Subjects
            ADD CONSTRAINT fk__Subjects_Studies
            FOREIGN KEY (study_id) REFERENCES Studies(study_id)
			ON UPDATE CASCADE;
    END;


-- SubmaximalExerciseData
IF OBJECT_ID(N'fk__SubmaximalExerciseData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.SubmaximalExerciseData
            ADD CONSTRAINT fk__SubmaximalExerciseData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- TimePoints
IF OBJECT_id(N'fk__TimePoints_Visits', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.TimePoints
            ADD CONSTRAINT fk__TimePoints_Visits
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
            ON UPDATE CASCADE;
    END;


-- ViprHeartRateData
IF OBJECT_ID(N'fk__ViprHeartRateData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprHeartRateData
            ADD CONSTRAINT fk__ViprHeartRateData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


-- ViprTimeAveragedData
IF OBJECT_ID(N'fk__ViprTimeAveragedData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeAveragedData
            ADD CONSTRAINT fk__ViprTimeAveragedData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


IF OBJECT_ID(N'fk__ViprTimeAveragedData_Vessels', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeAveragedData
            ADD CONSTRAINT fk__ViprTimeAveragedData_Vessels
            FOREIGN KEY (vessel_id) REFERENCES Vessels(vessel_id)
			ON UPDATE CASCADE;
    END;


-- ViprTimeResolvedData
IF OBJECT_ID(N'fk__ViprTimeResolvedData_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeResolvedData
            ADD CONSTRAINT fk__ViprTimeResolvedData_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


IF OBJECT_ID(N'fk__ViprTimeResolvedData_Vessels', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprTimeResolvedData
            ADD CONSTRAINT fk__ViprTimeResolvedData_Vessels
            FOREIGN KEY (vessel_id) REFERENCES Vessels(vessel_id)
			ON UPDATE CASCADE;
    END;


-- ViprWindows
IF OBJECT_ID(N'fk__ViprWindows_TimePoints', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprWindows
            ADD CONSTRAINT fk__ViprWindows_TimePoints
            FOREIGN KEY (time_point_id) REFERENCES TimePoints(time_point_id)
			ON UPDATE CASCADE;
	END;


IF OBJECT_ID(N'fk__ViprWindows_Vessels', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.ViprWindows
            ADD CONSTRAINT fk__ViprWindows_Vessels
            FOREIGN KEY (vessel_id) REFERENCES Vessels(vessel_id)
			ON UPDATE CASCADE;
    END;


-- Visits
IF OBJECT_ID(N'fk__Visits_VisitNames', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Visits
            ADD CONSTRAINT fk__Visits_VisitNames
            FOREIGN KEY (visit_name_id) REFERENCES VisitNames(visit_name_id)
			ON UPDATE CASCADE;
    END;


IF OBJECT_ID(N'fk__Visits_Subjects', N'F') IS NULL
    BEGIN
        ALTER TABLE dbo.Visits
            ADD CONSTRAINT fk__Visits_Subjects
            FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
			ON UPDATE CASCADE;
    END;
