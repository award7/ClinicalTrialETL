# Data Dictionary

## ArterialSpinLabelingData
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| arterial_spin_labeling_id | SMALLINT | NO |  Primary Key | Identity |
| global | NUMERIC(2,1) | YES | `global` > 0 | Global perfusion (mL/100g/min) |
| hemisphere_l | NUMERIC(2,1) | YES | `hemisphere_l` > 0 | Global perfusion (mL/100g/min) | 
| hemisphere_r | NUMERIC(2,1) | YES | `hemisphere_r` > 0 | Global perfusion (mL/100g/min) | 
| mca_total | NUMERIC(2,1) | YES | `mca_total` > 0 | Global perfusion (mL/100g/min) | 
| mca_l | NUMERIC(2,1) | YES | `mca_l` > 0 | Global perfusion (mL/100g/min) | 
| mca_r | NUMERIC(2,1) | YES | `mca_r` > 0 | Global perfusion (mL/100g/min) | 
| aca_total | NUMERIC(2,1) | YES | `aca_total` > 0 | Global perfusion (mL/100g/min) |
| aca_l | NUMERIC(2,1) | YES | `aca_l` > 0 | Global perfusion (mL/100g/min) | 
| aca_r | NUMERIC(2,1) | YES | `aca_r` > 0 | Global perfusion (mL/100g/min) | 
| pca_total | NUMERIC(2,1) | YES | `pca_total` > 0 | Global perfusion (mL/100g/min) |
| pca_l | NUMERIC(2,1) | YES | `pca_l` > 0 | Global perfusion (mL/100g/min) | 
| pca_r | NUMERIC(2,1) | YES | `pca_r` > 0 | Global perfusion (mL/100g/min) | 
| frontal_lobe_total | NUMERIC(2,1) | YES | `frontal_lobe_total` > 0 | Global perfusion (mL/100g/min) | 
| frontal_lobe_l | NUMERIC(2,1) | YES | `frontal_lobe_l` > 0 | Global perfusion (mL/100g/min) | 
| frontal_lobe_r | NUMERIC(2,1) | YES | `frontal_lobe_r` > 0 | Global perfusion (mL/100g/min) | 
| temporal_lobe_total | NUMERIC(2,1) | YES | `temporal_lobe_total` > 0 | Global perfusion (mL/100g/min) | 
| temporal_lobe_l | NUMERIC(2,1) | YES | `temporal_lobe_l` > 0 | Global perfusion (mL/100g/min) | 
| temporal_lobe_r | NUMERIC(2,1) | YES | `temporal_lobe_r` > 0 | Global perfusion (mL/100g/min) | 
| parietal_lobe_total | NUMERIC(2,1) | YES | `parietal_lobe_total` > 0 | Global perfusion (mL/100g/min) |
| parietal_lobe_r | NUMERIC(2,1) | YES | `parietal_lobe_r` > 0 | Global perfusion (mL/100g/min) | 
| parietal_lobe_l | NUMERIC(2,1) | YES | `parietal_lobe_l` > 0 | Global perfusion (mL/100g/min) | 
| occipital_lobe_total | NUMERIC(2,1) | YES | `occipital_lobe_total` > 0 | Global perfusion (mL/100g/min) | 
| occipital_lobe_l | NUMERIC(2,1) | YES | `occipital_lobe_l` > 0 | Global perfusion (mL/100g/min) | 
| occipital_lobe_r | NUMERIC(2,1) | YES | `occipital_lobe_r` > 0 | Global perfusion (mL/100g/min) | 
| angular_l | NUMERIC(2,1) | YES | `angular_l` > 0 | Global perfusion (mL/100g/min) | 
| angular_r | NUMERIC(2,1) | YES | `angular_r` > 0 | Global perfusion (mL/100g/min) | 
| cingulum_ant_l | NUMERIC(2,1) | YES | `cingulum_ant_l` > 0 | Global perfusion (mL/100g/min) | 
| cingulum_ant_r | NUMERIC(2,1) | YES | `cingulum_ant_r` > 0 | Global perfusion (mL/100g/min) | 
| cingulum_post_l | NUMERIC(2,1) | YES | `cingulum_post_l` > 0 | Global perfusion (mL/100g/min) | 
| cingulum_post_r | NUMERIC(2,1) | YES | `cingulum_post_r` > 0 | Global perfusion (mL/100g/min) | 
| frontal_med_orb_l | NUMERIC(2,1) | YES | `frontal_med_orb_l` > 0 | Global perfusion (mL/100g/min) |
| frontal_med_orb_r | NUMERIC(2,1) | YES | `frontal_med_orb_r` > 0 | Global perfusion (mL/100g/min) | 
| frontal_mid_l | NUMERIC(2,1) | YES | `frontal_mid_l` > 0 | Global perfusion (mL/100g/min) | 
| frontal_mid_r | NUMERIC(2,1) | YES | `frontal_mid_r` > 0 | Global perfusion (mL/100g/min) | 
| frontal_mid_orb_l | NUMERIC(2,1) | YES | `frontal_mid_orb_l` > 0 | Global perfusion (mL/100g/min) |
| frontal_mid_orb_r | NUMERIC(2,1) | YES | `frontal_mid_orb_r` > 0 | Global perfusion (mL/100g/min) | 
| frontal_sup_l | NUMERIC(2,1) | YES | `frontal_sup_l` > 0 | Global perfusion (mL/100g/min) | 
| frontal_sup_r | NUMERIC(2,1) | YES | `frontal_sup_r` > 0 | Global perfusion (mL/100g/min) | 
| frontal_sup_med_l | NUMERIC(2,1) | YES | `frontal_sup_med_l` > 0 | Global perfusion (mL/100g/min) |
| frontal_sup_med_r | NUMERIC(2,1) | YES | `frontal_sup_med_r` > 0 | Global perfusion (mL/100g/min) |
| frontal_sup_orb_l | NUMERIC(2,1) | YES | `frontal_sup_orb_l` > 0 | Global perfusion (mL/100g/min) |
| frontal_sup_orb_r | NUMERIC(2,1) | YES | `frontal_sup_orb_r` > 0 | Global perfusion (mL/100g/min) | 
| hippocampus_l | NUMERIC(2,1) | YES | `hippocampus_l` > 0 | Global perfusion (mL/100g/min) | 
| hippocampus_r | NUMERIC(2,1) | YES | `hippocampus_r` > 0 | Global perfusion (mL/100g/min) | 
| precuneus_l | NUMERIC(2,1) | YES | `precuneus_l` > 0 | Global perfusion (mL/100g/min) | 
| precuneus_r | NUMERIC(2,1) | YES | `precuneus_r` > 0 | Global perfusion (mL/100g/min) | 
| supramarginal_l | NUMERIC(2,1) | YES | `supramarginal_l` > 0 | Global perfusion (mL/100g/min) |
| supramarginal_r | NUMERIC(2,1) | YES | `supramarginal_r` > 0 | Global perfusion (mL/100g/min) |
| temporal_mid_l | NUMERIC(2,1) | YES | `temporal_mid_l` > 0 | Global perfusion (mL/100g/min) | 
| temporal_mid_r | NUMERIC(2,1) | YES | `temporal_mid_r` > 0 | Global perfusion (mL/100g/min) | 
| temporal_sup_l | NUMERIC(2,1) | YES | `temporal_sup_l` > 0 | Global perfusion (mL/100g/min) | 
| temporal_sup_r | NUMERIC(2,1) | YES | `temporal_sup_r` > 0 | Global perfusion (mL/100g/min) | 
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO  | Foreign Key | Links visit | 
| time_point_id | TINYINT | NO | Foreign Key | Links time point |

## Biosamples
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| biosample_id | SMALLINT | NO | Primary Key | Identity (primary key)| 
| biosample_date | DATE | NO | `biosample_date` cannot be in future | Date of biosample collection | 
| subject_id | SMALLINT | NO | Foreign key | Links subject |
| visit_id | SMALLINT | NO | Foreign key | Links visit |
| time_point_id | TINYINT | YES | Foreign key | Links time point |
| tube_color_id | TINYINT | NO | Foreign key | Links tube color |
| freezer_id | TINYINT | NO | Foreign key | Links freezer |
| freezer_shelf_id | TINYINT | NO | Foreign key | Links freezer shelf |
| box_color_id | TINYINT | NO | Foreign key | Links box color |
| box_number | TINYINT | NO |  | Freezer box number | 
| grid_location_id | TINYINT | NO | Foreign key | Links grid location |
| personnel_id | TINYINT | NO | Foreign key | Links study personnel |
| status_id | TINYINT | NO | Foreign key | Links biosample status |

## BiosamplesTracker
work in progress

| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| biosample_tracker_id | SMALLINT | NO | | Identity |

## BodyMeasurementsData
| Column Name | Data Type | Nullable | Constraints | Description | 
| --- | --- | --- | --- | --- |
| body_measurement_id |  TINYINT  | NO |  Primary Key | Identity |
| height  | NUMERIC(3,0) | YES | `height` > 100 |  Subject height (cm) |
| weight  | NUMERIC(4,1) | YES | `weight` >= 42.9 | Subject weight (kg) |
| body_mass_index |  NUMERIC(3,1) | YES | 0 < `bmi` < 100 | Subject body mass index (kg/m<sup>2</sup>) |
| hip_circumference  | TINYINT | YES | 0 < `hip_circumference` <= 300 | Subject hip circumference (cm) |
| waist_circumference  | TINYINT | YES | 0 < `waist_circumference` <= 300 | Subject waist circumference (cm) |
| tanner_stage  | TINYINT | YES | 3 <= `tanner_stage` <=5 | Subject Tanner stage |
| subject_id  | SMALLINT | NO  | Foreign key | Links subject |
| visit_id  | SMALLINT | NO | Foreign key | Links visit |

## BoxColors
| Column Name | Data Type | Nullable | Constraints | Description | 
| --- | --- | --- | --- | --- |
| box_color_id | TINYINT | NO | Primary Key | Identity |
| color | CHAR(255) | NO | `Green`, `Red`, `Yellow` | Freezer box color |

## BrainVolumes
work in progress

| Column Name | Data Type | Nullable | Constraints | Description | 
| --- | --- | --- | --- | --- |
| brain_volume_id | TINYINT | NO | Primary Key | Identity |
| total_volume | NUMERIC | YES | `total_volume` > 0 | Total intracranial vault volume (mL) |
| gray_matter | NUMERIC | YES | `gray_matter` > 0 | Gray matter volume (mL) |
| white_matter | NUMERIC | YES | `white_matter` > 0 | White matter volume (mL) |
| cerebrospinal_fluid | NUMERIC | YES | `cerebrospinal_fluid` > 0 | Cerebrospinal fluid volume (mL) |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visit |

## BriefData
| Column Name | Data Type | Nullable | Constraints| Description | 
| --- | --- | --- | --- | --- |
brief_data_id INT NOT NULL IDENTITY(1,1),
brief_inhib_raw_cog_score TINYINT,
brief_inhib_t_cog_score TINYINT,
brief_self_monitor_raw_cog_score TINYINT,
brief_self_monitor_t_cog_score TINYINT,
brief_shift_raw_cog_score TINYINT,
brief_shift_t_cog_score TINYINT,
brief_emotion_raw_cog_score TINYINT,
brief_emotion_t_cog_score TINYINT,
brief_initiate_raw_cog_score TINYINT,
brief_initiate_t_cog_score TINYINT,
brief_mem_raw_cog_score TINYINT,
brief_mem_t_cog_score TINYINT,
brief_plan_raw_cog_score TINYINT,
brief_plan_t_cog_score TINYINT,
brief_task_monitor_raw_score TINYINT,
brief_task_monitor_t_cog_score TINYINT,
brief_org_raw_cog_score TINYINT,
brief_org_t_cog_score TINYINT,
brief_bri_raw_cog_score TINYINT,
brief_bri_t_cog_score TINYINT,
brief_eri_raw_cog_score TINYINT,
brief_eri_t_cog_score TINYINT,
brief_cri_raw_cog_score TINYINT,
brief_cri_t_cog_score TINYINT,
brief_gec_raw_cog_score TINYINT,
brief_gec_t_cog_score TINYINT,

## CbclData
cbcl_activities_total_cog_score TINYINT,
                        cbcl_activities_t_cog_score TINYINT,
                        cbcl_activities_percentile_cog_score TINYINT,
                        cbcl_social_total_cog_score TINYINT,
                        cbcl_social_t_cog_score TINYINT,
                        cbcl_social_percentile_cog_score TINYINT,
                        cbcl_school_total_cog_score TINYINT,
                        cbcl_school_t_cog_score TINYINT,
                        cbcl_school_percentile_cog_score TINYINT,
                        cbcl_competence_total_cog_score TINYINT,
                        cbcl_competence_t_cog_score TINYINT,
                        cbcl_competence_percentile_cog_score TINYINT,
                        cbcl_anx_dep_total_cog_score TINYINT,
                        cbcl_anx_dep_t_cog_score TINYINT,
                        cbcl_anx_dep_percentile_cog_score TINYINT,
                        cbcl_wdrwn_dep_total_cog_score TINYINT,
                        cbcl_wdrwn_dep_t_cog_score TINYINT,
                        cbcl_wdrwn_dep_percentile_cog_score TINYINT,
                        cbcl_somatic_comp_total_cog_score TINYINT,
                        cbcl_somatic_comp_t_cog_score TINYINT,
                        cbcl_somatic_comp_percentile_cog_score TINYINT,
                        cbcl_social_prob_total_cog_score TINYINT,
                        cbcl_social_prob_t_cog_score TINYINT,
                        cbcl_social_prob_percentile_cog_score TINYINT,
                        cbcl_thought_prob_total_cog_score TINYINT,
                        cbcl_thought_prob_t_cog_score TINYINT,
                        cbcl_thought_prob_percentile_cog_score TINYINT,
                        cbcl_attn_prob_total_cog_score TINYINT,
                        cbcl_attn_prob_t_cog_score TINYINT,
                        cbcl_attn_prob_percentile_cog_score TINYINT,
                        cbcl_rules_total_cog_score TINYINT,
                        cbcl_rules_t_cog_score TINYINT,
                        cbcl_rules_percentile_cog_score TINYINT,
                        cbcl_aggres_total_cog_score TINYINT,
                        cbcl_aggres_t_cog_score TINYINT,
                        cbcl_aggres_percentile_cog_score TINYINT,
                        cbcl_intern_prob_total_cog_score TINYINT,
                        cbcl_intern_prob_t_cog_score TINYINT,
                        cbcl_intern_prob_percentile_cog_score TINYINT,
                        cbcl_extern_prob_total_cog_score TINYINT,
                        cbcl_extern_prob_t_cog_score TINYINT,
                        cbcl_extern_prob_percentile_cog_score TINYINT,
                        cbcl_total_prob_total_cog_score TINYINT,
                        cbcl_total_prob_t_cog_score TINYINT,
                        cbcl_total_prob_percentile_cog_score TINYINT,
                        cbcl_affec_prob_total_cog_score TINYINT,
                        cbcl_affec_prob_t_cog_score TINYINT,
                        cbcl_affec_prob_percentile_cog_score TINYINT,
                        cbcl_anx_prob_total_cog_score TINYINT,
                        cbcl_anx_prob_t_cog_score TINYINT,
                        cbcl_anx_prob_percentile_cog_score TINYINT,
                        cbcl_somatic_prob_total_cog_score TINYINT,
                        cbcl_somatic_prob_t_cog_score TINYINT,
                        cbcl_somatic_prob_percentile_cog_score TINYINT,
                        cbcl_adhd_prob_total_cog_score TINYINT,
                        cbcl_adhd_prob_t_cog_score TINYINT,
                        cbcl_adhd_prob_percentile_cog_score TINYINT,
                        cbcl_dev_prob_total_cog_score TINYINT,
                        cbcl_dev_prob_t_cog_score TINYINT,
                        cbcl_dev_prob_percentile_cog_score TINYINT,
                        cbcl_conduct_prob_total_cog_score TINYINT,
                        cbcl_conduct_prob_t_cog_score TINYINT,
                        cbcl_conduct_prob_percentile_cog_score TINYINT,
                        cbcl_sluggish_total_cog_score TINYINT,
                        cbcl_sluggish_t_cog_score TINYINT,
                        cbcl_sluggish_percentile_cog_score TINYINT,
                        cbcl_oc_prob_total_cog_score TINYINT,
                        cbcl_oc_prob_t_cog_score TINYINT,
                        cbcl_oc_prob_percentile_cog_score TINYINT,
                        cbcl_pts_prob_total_cog_score TINYINT,
                        cbcl_pts_prob_t_cog_score TINYINT,
                        cbcl_pts_prob_percentile_cog_score TINYINT,

## CerebrovascularReactivityData
| Column Name | Data Type | Nullable | Constraints| Description | 
| --- | --- | --- | --- | --- |
| cerebrovascular_reactivity_data_id | INT | NO | Identity |
| time | SMALLINT | NO | `time` > 1 | Data collection time (s) |
| respiratory_rate |  TINYINT | YES | `respiratory_rate` >= 0 | Respiratory Rate (bpm) |
| tidal_volume |  SMALLINT | YES | `tidal_volume` >= 0 | Tidal volume (mL) |
| minute_ventilation |  TINYINT | YES | `minute_ventilation` >= 0 | Minute ventilation (L/min) | 
| heart_rate |  TINYINT | YES | `heart_rate` >= 0 | Heart rate (bpm) |
| stroke_volume |  TINYINT | YES | `stroke_volume` >= 0 | Stroke volume (mL)
| cardiac_output |  TINYINT | YES | `cardiac_output` >= 0 | Cardiac output (L/min) |
| petco2 |  TINYINT | YES | `petco2` >= 0 | End tidal CO</sub>2</sub> |
| velocity |  SMALLINT | YES | `velocity` >= 0 | Cerebral blood flow velocity (cm/s) | 
| subject_id |  SMALLINT | NO | Foreign Key | Links subject |
| visit_id |  SMALLINT | NO | Foreign Key | Links visit |
| vessel_id | TINYINT | NO | Foreign Key | Links vessel |

## CompleteBloodCountData
| Column Name | Data Type | Nullable | Constraints | Description | 
| --- | --- | --- | --- | --- |
| complete_blood_count_id | TINYINT | NO | Primary Key | Identity |
| white_cell_count | NUMERIC(3,1) | YES | `white_cell_count` > 0 | White blood cell count ([units]) |
| red_cell_count | NUMERIC(2,1) | YES | `red_cell_count` > 0 | Red blood cell count ([units]) |
| hemoglobin | NUMERIC(3,1) | YES | `hemoglobin` > 0 | Hemoglobin concentration ([units]) |
| hematocrit | TINYINT | YES | 100 => `hematocrit` > 0 | Hematocrit (%) |
| mean_cell_volume | TINYINT | YES | `mean_cell_volume` > 0 | Mean red cell volume ([units]) |
| mean_corpuscular_hemoglobin_concentration | TINYINT | YES | `mean_corpuscular_hemoglobin_concentration` > 0 | Mean corpuscular hemoglobin concentration ([units]) |
| red_cell_distribution_width_cv | NUMERIC(3,1) | YES | `red_cell_distribution_width_cv` > 0 | Red cell distribution width: Coefficient of variation (%) |
| red_cell_distribution_width_sd | NUMERIC(3,1) | YES | `red_cell_distribution_width_sd` > 0 | Red cell distribution width: Standard deviation ([units]) |
| platelet_count | SMALLINT | YES | `platelet_count` > 0 | Platelet count ([units]) |
| neutrophils_absolute | SMALLINT | YES | `neutrophils_absolute` > 0 | Neutrophil count- Absolute ([units]) |
| immature_granulocytes_absolute | SMALLINT | YES | `immature_granulocytes_absolute` => 0 | Immature granulocyte count- Absolute ([units]) |
| lymphocytes_absolute | SMALLINT | YES | `lymphocytes_absolute` > 0 | Lymphocyte count- Absolute ([units]) |
| monocytes_absolute | SMALLINT | YES | `lymphocytes_absolute` > 0 | Monocyte count- Absolute ([units]) |
| eosinophils_absolute | SMALLINT | YES | `eosinophils_absolute` > 0 | Eosinophil count- Absolute ([unit])  |
| basophils_absolute | SMALLINT | YES | `basophils_absolute` > 0 | Basophil count- Absolute ([unit]) |
| neutrophils_percent | TINYINT | YES | `neutrophils_percent` > 0 | Neutrophil count- Relative (%) |
| immature_granulocytes_percent | TINYINT | YES | `immature_granulocytes_percent` => 0 | Immature granulocyte count- Relative (%) |
| lymphocytes_percent | TINYINT | YES | `lymphocytes_percent` > 0 | Lymphocyte count- Relative (%) |
| monocytes_percent | TINYINT | YES | `monocytes_percent` > 0 | Monocyte count- Relative (%) |
| eosinophils_percent | TINYINT | YES | `eosinophils_percent` > 0 | Eosinophil count- Relative (%) |
| basophils_percent | TINYINT | YES | `basophils_percent` > 0 | Basophil count- Relative (%) |
| nucleated_red_blood_cell | TINYINT | YES | `nucleated_red_blood_cell` > 0 | Nucleated red blood cell count ([units]) |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visits |

## DccsData

## DexaData
| Column Name | Data Type | Nullable | Constraints| Description | 
| --- | --- | --- | --- | --- |
| dexa_id | TINYINT | NO | Primary Key | Identity |
| trunk_total | NUMERIC | YES | `trunk_total` => 0 | Total trunk mass (kg) |
| trunk_tissue | NUMERIC | YES | `trunk_tissue` => 0 | Trunk tissue mass (kg) |
| trunk_lean | NUMERIC | YES | `trunk_lean` => 0 | Trunk lean mass (kg) |
| trunk_fat | NUMERIC | YES | `trunk_fat` => 0 | Trunk fat mass- Absolute (kg) |
| trunk_fat_percent | NUMERIC | YES | 100 => `trunk_fat_percent` => 0 | Trunk fat mass- Relative (%) |
| android_total | NUMERIC | YES | `android_total` => 0 | Total android mass (kg) |
| android_tissue | NUMERIC | YES | `android_tissue` => 0 | Android tissue mass (kg) |
| android_lean | NUMERIC | YES | `android_lean` => 0 | Android lean mass (kg) |
| android_fat | NUMERIC | YES | `android_fat` => 0 | Android fat mass- Absolute (kg) |
| android_fat_percent | NUMERIC | YES | 100 => `android_fat_percent` => 0 | Android fat mass- Relative (%) |
| gynoic_total | NUMERIC | YES | `gynoid_total` => 0 | Total gynoid mass (kg) |
| gynoid_tissue | NUMERIC | YES | `gynoid_tissue` => 0 | Gynoid tissue mass (kg) |
| gynoid_lean | NUMERIC | YES | `gynoid_lean` => 0 | Gynoid lean mass (kg) |
| gynoid_fat | NUMERIC | YES | `gynoid_fat` => 0 | Gynoid fat mass- Absolute (kg) |
| gynoid_fat_percent | NUMERIC | YES | `gynoid_fat_percent` => 0 | Gynoid fat mass- Relative (%) |
| whole_total | NUMERIC | YES | `whole_total` => 0 | Total whole body mass (kg) |
| whole_tissue | NUMERIC | YES | `whole_tissue` => 0 | Whole body tissue mass (kg) |
| whole_lean | NUMERIC | YES | `whole_lean` => 0 | Whole body lean mass (kg) |
| whole_fat | NUMERIC | YES | `whole_fat` => 0 | Whole body fat mass- Absolute (kg) |
| whole_fat_percent | NUMERIC | YES | 100 => `whole_fat_percent` => 0 | Whole body fat mass- Relative (%) |
| vat_volume | NUMERIC | YES | `vat_volume` => 0 | Visceral adipose tissue volume (mL) |
| vat_mass | NUMERIC | YES | `vat_mass` => 0 | Visceral adipose tissue mass (kg) |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visit |

## DkefsData
dkefs_tmt_con2_raw_cog_score TINYINT,
                        dkefs_tmt_con2_scaled_cog_score TINYINT,
                        dkefs_tmt_con4_raw_cog_score TINYINT,
                        dkefs_tmt_con4_scaled_cog_score TINYINT,
                        dkefs_tmt_switch_raw_cog_score TINYINT,
                        dkefs_tmt_switch_scaled_cog_score TINYINT,
                        dkefs_cwi_con1_raw_cog_score TINYINT,
                        dkefs_cwi_con1_scaled_cog_score TINYINT,
                        dkefs_cwi_con2_raw_cog_score TINYINT,
                        dkefs_cwi_con2_scaled_cog_score TINYINT,
                        dkefs_cwi_con3_raw_cog_score TINYINT,
                        dkefs_cwi_con3_scaled_cog_score TINYINT,
                        dkefs_cwi_con4_raw_cog_score TINYINT,
                        dkefs_cwi_con4_scaled_cog_score TINYINT,
                        dkefs_cwi_naming_reading_sum_cog_score TINYINT,
                        dkefs_cwi_naming_reading_composite_cog_score TINYINT,
                        dkefs_cwi_inhib_color_scaled_cog_score TINYINT,
                        dkefs_cwi_inhib_color_contrast_cog_score TINYINT,
                        dkefs_cwi_switch_read_scaled_cog_score TINYINT,
                        dkefs_cwi_switch_read_contrast_cog_score TINYINT,
                        dkefs_cwi_switch_inhib_scaled_cog_score TINYINT,
                        dkefs_cwi_switch_inhib_contrast_cog_score TINYINT,
                        dkefs_cwi_switch_color_scaled_cog_score TINYINT,
                        dkefs_cwi_switch_color_contrast_cog_score TINYINT,
                        dkefs_cwi_switch_word_scaled_cog_score TINYINT,
                        dkefs_cwi_switch_word_contrast_cog_score TINYINT,
                        

## FlankerData

## Freezers

## FreezerShelves

## GridLocations

## HeartRateRecoveryData
| Column Name | Data Type | Nullable | Constraints| Description | 
| --- | --- | --- | --- | --- |
heart_rate_recovery_data_id | SMALLINT | NO | Primary Key | Identity | 
time | TINYINT | NO | 120 => `time` > 1 | Data collection time (s) | 
heart_rate | TINYINT | YES | 250 => `heart_rate` > 0 | Heart rate (bpm) |
subject_id | SMALLINT | NO | Foreign Key | Links subject |
visit_id | SMALLINT | NO | Foreign Key | Links visit |

## ListSortData

## MaximalOxygenUptakeData
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| maximal_oxygen_uptake_data_id | TINYINT | NO | Primary Key | Identity |
| work_rate | SMALLINT | NO | `work_rate` => 0 | Ergometer work rate (W) |
| vo2_absolute | NUMERIC(3,2) | NO | `vo2_absolute` => 0 | VO<sub>2</sub>- Absolute (L/min) |
| vo2_relative | NUMERIC(3,1) | NO | `vo2_relative` => 0 | VO<sub>2</sub>- Relative (mL/kg/min) |
| vco2_absolute | NUMERIC(3,2) | NO | `vco2_absolute` => 0 | VCO<sub>2</sub>- Absolute (L/min) |
| vco2_relative | NUMERIC(3,1) | NO | `vco2_relative` => 0 | VCO<sub>2</sub>- Relative (mL/kg/min) |
| heart_rate | TINYINT | NO | `heart_rate` => 0 | Heart rate (bpm) |
| respiratory_exchange_ratio | NUMERIC(3,2) | NO | `respiratory_exchange_ratio` => 0 | Respiratory exchange ratio (a.u.) |
| respiratory_rate | TINYINT | NO | `respiratory_exchange_ratio` => 0 | Respiratory rate (bpm) |
| tidal_volume | SMALLINT | NO | `tidal_volume` => 0 | Tidal volume (mL) |
| minute_ventilation | TINYINT | NO | `minute_ventilation` | Minute ventilation (L/min) |
| peto2 | TINYINT | NO | `peto2` => 0 | End tidal O<sub>2</sub> (mmHg) |
| petco2 | TINYINT | NO | `petco2` => 0 | End tidal CO<sub>2</sub> (mmHg) | 
| ve_vo2 | NUMERIC(3,2) | NO | `ve_vo2` => 0 | Ventilatory equivalent- O<sub>2</sub> (a.u.) |
| ve_vco2 | NUMERIC(3,2) | NO | `ve_vco2` => 0 | Ventilatory equivalent- CO<sub>2</sub> (a.u.) |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visit |

## OgttBloodChemistries
| Column Name | Data Type | Nullable | Constraints| Description | 
| --- | --- | --- | --- | --- |
ogtt_blood_chemistry_id | SMALLINT | NO | Primary Key | Identity |
glucose | SMALLINT | YES | `glucose` > 0 | Glucose (mg/dL) |
insulin | SMALLINT | YES | `insulin` > 0 | Insulin (uU/mL) | 
hemoglobin | NUMERIC(3,1) | YES | `hemoglobin` > 0 | Hemoglobin (g/dL) |
subject_id | SMALLINT | NO | Foreign Key | Links subject |
visit_id | SMALLINT | NO | Foreign Key | Links visit |
time_point_id | TINYINT | NO | Foreign Key | Links time point |

## PatternComparisonData

## PedsQlData
pedsql_child_physical_cog_score TINYINT,
                        pedsql_child_pysch_cog_score TINYINT,
                        pedsql_child_total_cog_score TINYINT,
                        pedsql_parent_physical_cog_score TINYINT,
                        pedsql_parent_pysch_cog_score TINYINT,
                        pedsql_parent_total_cog_score TINYINT,
                        

## Personnel
| Column Name | Data Type | Nullable | Constraints| Description | 
| --- | --- | --- | --- | --- |
| personnel_id | TINYINT | NO | Primary Key | Study Personnel |
| first_name | NCHAR(255) | NO | | First name |
| last_name | NCHAR(255) | NO | | Last name |

## ScreeningBloodChemistries
| Column Name | Data Type | Nullable | Constraints | Description | 
| --- | --- | --- | --- | --- |
| screening_blood_chemistry_id | TINYINT | NO | Primary Key | Identity |
| measurement_number | TINYINT | NO | 3 => `measurement_number` > 0 | Measurement |
| glucose | TINYINT | YES | `glucose` > 0 | Glucose (mg/dL) |
| total_cholesterol | SMALLINT | YES | `total_cholesterol` > 0 | Total cholesterol (mg/dL) |
| high_density_cholesterol | TINYINT | YES | `high_density_cholesterol` > 0 | High density cholesterol (mg/dL) |
| low_density_cholesterol | SMALLINT | YES | `low_density_cholesterol` > 0 | Low density cholesterol (mg/dL) |
| triglycerides | SMALLINT | YES | `triglycerides` > 0 | Triglycerides (mg/dL) |
| hemoglobin_a1c | NUMERIC(3,1) | YES | `hemoglobin_a1c` > 0 | Hemoglobin A1c (%) |
| insulin | TINYINT | YES | `insulin` > 0 | Insulin (uU/mL) |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visit |

## ScreeningVitalsData
| Column Name | Data Type | Nullable | Constraints| Description | 
| --- | --- | --- | --- | --- |
| screening_vitals_data_id | TINYINT | NO | Primary Key | Identity |
| measurement_number | TINYINT | NO | 3=> `measurement_number` > 0 | Vitals measurement |
| heart_rate | TINYINT | YES | 220 => `heart_rate` > 0 | Heart rate measurement (bpm) |
| systolic_blood_pressure | TINYINT | YES | `systolic_blood_pressure` > 0 | Systolic blood pressure measurement (mmHg) |
| diastolic_blood_pressure | TINYINT | YES | `diastolic_blood_pressure` > 0 | Diastolic blood pressure measurement (mmHg) |
| mean_arterial_pressure | TINYINT | YES | `mean_arterial_pressure` > 0 | Mean arterial pressure measurement (mmHg) |
| respiratory_rate | TINYINT | YES | `respiratory_rate` > 0 | Respiratory rate measurement (bpm) |
| pulse_oximetry | TINYINT | YES | `pulse_oximetry` > 0 | Pulse oximetry measurement (%) |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visit |

## Statuses
| Column Name | Data Type | Nullable | Constraints | Description | 
| --- | --- | --- | --- | --- |
| status_id | TINYINT | NO | Primary Key | Identity |
| status | CHAR(25) | NO | `In`, `Out`, `Analyzed`, `Destroyed` | Biosample status |

## Studies
| Column Name | Data Type | Nullable | Constraints | Description | 
| --- | --- | --- | --- | --- |
| study_id | TINYINT | NO | Primary Key |Identity |
| study | VARCHAR(9) | NO | | Eight digit IRB study number (e.g. 2019-0361) |

## SubjectEthnicities
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| subject_ethnicity_id | TINYINT | NO | Primary Key | Identity |
| ethnicity | CHAR(255) | NO | `Hispanic`, `Non-Hispanic`, `Unknown or Not Reported` | Subject ethnicity |

## SubjectRaces
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| subject_race_id | TINYINT | NO | Primary Key | Identity |
| race | CHAR(255) | NO | `American Indian or Alaska Native`, `Asian`, `Black or African American`, `Native Hawaiian or Other Pacific Islander`, `White or Caucasian`, `Unknown or Not Reported`, `Multiracial` | Subject race |
 

## Subjects
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| subject_id | SMALLINT | NO | Primary Key | Identity |
| subject | VARCHAR(255) | NO | Unique | Subject ID used in study |
| age | TINYINT | YES | 12 <= `age` <= 18 | Age of subject |
| sex | TINYINT | YES | Foreign Key | Links biological sex |
| race | TINYINT | YES | Foreign Key | Links race |
| ethnicity | TINYINT | YES | Foreign Key | Links ethnicity |
| study_id | TINYINT | NO | Foreign Key | Links study |

## SubjectSexes
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| subject_sex_id | TINYINT | NO | Primary Key | Identity |
| sex | CHAR(255) | NO | `Male`, `Female`, `Unknown or Not Reported` | Subject biological sex |

## SubmaximalExerciseData
| Column Name | Data Type | Nullable | Constraints | Description | 
| --- | --- | --- | --- | --- |
| submaximal_exercise_data_id | INT | NO | Primary Key | Identity |
| work_rate | SMALLINT | YES | `work_rate` => 0 | Ergometer work rate (W) | 
| rpm | TINYINT | YES | `rpm` => 0 | Ergometer rpm |
| velocity | SMALLINT | NO | | Cerebral blood flow velocity (cm/s) |
| mean_arterial_pressure | TINYINT | YES | | Mean arterial pressure (mmHg) |
| stroke_volume | TINYINT | YES | | Stroke volume (mL) |
| cardiac_output | TINYINT | YES | | Cardiac output (L/min) |
| vo2_absolute | NUMERIC(3,2) | NO | `vo2_absolute` => 0 | VO<sub>2</sub>- Absolute (L/min) |
| vo2_relative | NUMERIC(3,1) | NO | `vo2_relative` => 0 | VO<sub>2</sub>- Relative (mL/kg/min) |
| vco2_absolute | NUMERIC(3,2) | NO | `vco2_absolute` => 0 | VCO<sub>2</sub>- Absolute (L/min) |
| vco2_relative | NUMERIC(3,1) | NO | `vco2_relative` => 0 | VCO<sub>2</sub>- Relative (mL/kg/min) |
| heart_rate | TINYINT | NO | `heart_rate` => 0 | Heart rate (bpm) |
| respiratory_exchange_ratio | NUMERIC(3,2) | NO | 2 => `respiratory_exchange_ratio` => 0 | Respiratory exchange ratio (a.u.) |
| respiratory_rate | TINYINT | NO | `respiratory_rate` => 0 | Respiratory rate (bpm) |
| tidal_volume | SMALLINT | NO | `tidal_volume` => 0 | Tidal volume (mL) |
| minute_ventilation | TINYINT | NO | `minute_ventilation` => 0 | Minute ventilation (L/min) |
| peto2 | TINYINT | NO | `peto2` => 0 | End tidal O<sub>2</sub> (mmHg) |
| petco2 | TINYINT | NO | `petco2` => 0 | End tidal CO<sub>2</sub> (mmHg) | 
| petco2_gas | TINYINT | YES | `petco2_gas` => 0 | End tidal O<sub>2</sub> from gas analyzer (mmHg) |
| ve_vo2 | NUMERIC(3,2) | NO | `ve_vo2` => 0 | Ventilatory equivalent- O<sub>2</sub> (a.u.) |
| ve_vco2 | NUMERIC(3,2) | NO | `ve_vco2` => 0 | Ventilatory equivalent- CO<sub>2</sub> (a.u.) |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visit |

 ## TimePoints
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| time_point_id | TINYINT | NO | Primary Key | Identity |
| time_point | TINYINT | NO | `0`, `5`, `10`, `20`, `30`, `45`, `60` | Time point in experiment |

## TubeColors
| Column Name | Data Type | Nullable | Constraints | Description | 
| --- | --- | --- | --- | --- |
| tube_color_id | TINYINT | NO | Primary Key | Identity |
| color | CHAR(255) | NO | `Green`, `Red`, `Yellow` | Tube color |

## Vessels
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| vessel_id | TINYINT | NO | Primary Key | Identity |
| vessel | CHAR(255) | NO | `[vessels]` | Vessel name |

## ViprHeartRateData
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| vipr_heart_rate_data_id | SMALLINT | NO | Primary Key | Identity |
| heart_rate_5 | NUMERIC(1,13) | NO | `heart_rate_5` > 0 | Cardiac cycle duration at 5% (s) | 
| heart_rate_10 | NUMERIC(1,13) | NO | `heart_rate_10` > 0 | Cardiac cycle duration at 10% (s) |
| heart_rate_15 | NUMERIC(1,13) | NO | `heart_rate_15` > 0 | Cardiac cycle duration at 15% (s) |
| heart_rate_20 | NUMERIC(1,13) | NO | `heart_rate_20` > 0 | Cardiac cycle duration at 20% (s) |
| heart_rate_25 | NUMERIC(1,13) | NO | `heart_rate_25` > 0 | Cardiac cycle duration at 25% (s) |
| heart_rate_30 | NUMERIC(1,13) | NO | `heart_rate_30` > 0 | Cardiac cycle duration at 30% (s) |
| heart_rate_35 | NUMERIC(1,13) | NO | `heart_rate_35` > 0 | Cardiac cycle duration at 35% (s) |
| heart_rate_40 | NUMERIC(1,13) | NO | `heart_rate_40` > 0 | Cardiac cycle duration at 40% (s) |
| heart_rate_45 | NUMERIC(1,13) | NO | `heart_rate_45` > 0 | Cardiac cycle duration at 45% (s) |
| heart_rate_50 | NUMERIC(1,13) | NO | `heart_rate_50` > 0 | Cardiac cycle duration at 50% (s) |
| heart_rate_55 | NUMERIC(1,13) | NO | `heart_rate_55` > 0 | Cardiac cycle duration at 55% (s) |
| heart_rate_60 | NUMERIC(1,13) | NO | `heart_rate_60` > 0 | Cardiac cycle duration at 60% (s) |
| heart_rate_65 | NUMERIC(1,13) | NO | `heart_rate_65` > 0 | Cardiac cycle duration at 65% (s) |
| heart_rate_70 | NUMERIC(1,13) | NO | `heart_rate_70` > 0 | Cardiac cycle duration at 70% (s) |
| heart_rate_75 | NUMERIC(1,13) | NO | `heart_rate_75` > 0 | Cardiac cycle duration at 75% (s) |
| heart_rate_80 | NUMERIC(1,13) | NO | `heart_rate_80` > 0 | Cardiac cycle duration at 80% (s) |
| heart_rate_85 | NUMERIC(1,13) | NO | `heart_rate_85` > 0 | Cardiac cycle duration at 85% (s) |
| heart_rate_90 | NUMERIC(1,13) | NO | `heart_rate_90` > 0 | Cardiac cycle duration at 90% (s) |
| heart_rate_95 | NUMERIC(1,13) | NO | `heart_rate_95` > 0 | Cardiac cycle duration at 95% (s) |
| heart_rate_100 | NUMERIC(1,13) | NO | `heart_rate_100` > 0 | Cardiac cycle duration at 100% (s) |
| heart_rate | TINYINT | YES | `heart_rate` > 0 | Heart rate (bpm) |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visit |
| time_point_id | TINYINT | NO | Foreign Key | Links time point |

## ViprTimeAveragedData
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| vipr_time_averaged_data_id | INT | NO | | Primary Key | Identity |
| voxel | SMALLINT | NO | `voxel` > 0 | Voxel number |
| cross_sectional_area | NUMERIC(18,16) | NO | | Vessel cross sectional area (cm<sup>2</sup>)
| diameter | NUMERIC(18,16) | NO | | Vessel diameter (cm) |
| mean_velocity | NUMERIC(18,16) | NO | | Mean velocity (cm/s) |
| max_velocity | NUMERIC(18,16) | NO | | Max velocity (cm/s) |
| flow_per_heart_cycle | NUMERIC(18,16) | NO | | Flow per heart cycle (mL) |
| wall_shear_stress | NUMERIC(18,16) | NO | | Wall shear stress (Pa) |
| pulsatility_index | NUMERIC(18,16) | NO | | Pulsatility Index (a.u.) |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visit |
| time_point_id | TINYINT | NO | Foreign Key | Links time point |
| vessel_id | TINYINT | NO | Foreign Key | Links to vessel |

## ViprTimeResolvedData
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| vipr_time_resolved_data_id | INT | NO | Primary Key | Identity |
| voxel | SMALLINT | NO | `voxel` > 0 | Voxel number |
| flow_5 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_10 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_15 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_20 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_25 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_30 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_35 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_40 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_45 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_50 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_55 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_60 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_65 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_70 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_75 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_80 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_85 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_90 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_95 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| flow_100 | NUMERIC(2,14) | NO | | Flow at cardiac cycle 5% (mL/s) |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visit |
| time_point_id | TINYINT | NO | Foreign Key | Links time point |
| vessel_id | TINYINT | NO | Foreign Key | Links to vessel |

## ViprWindows
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| vipr_window_id | SMALLINT | NO | Primary Key | Identity |
| window | SMALLINT | NO | `window` => 0 | Voxel window size |
| lower_voxel | SMALLINT | NO | `lower_voxel` > 0 | Lower voxel of window |
| upper_voxel | SMALLINT | NO | `upper_voxel` > 0 AND `upper_voxel` => `lower_voxel` | Upper voxel of window |
| subject_id | SMALLINT | NO | Foreign Key | Links subject |
| visit_id | SMALLINT | NO | Foreign Key | Links visit |
| time_point_id | TINYINT | NO | Foreign Key | Links time point |
| vessel_id | TINYINT | NO | Foreign Key | Links to vessel |

## VisitNames
| Column Name | Data Type | Nullable | Description |
| --- | --- | --- | --- |
| visit_name_id | TINYINT | NO | Identity |
| visit_name | VARCHAR(255) | NO | Visit name |

## Visits
| Column Name | Data Type | Nullable | Constraints | Description |
| --- | --- | --- | --- | --- |
| visit_id | SMALLINT | NO | Primary Key | Identity |
| visit_date | DATE | NO | `visit_date` cannot be in future  | Date of visit |
| visit_name_id | TINYINT | NO | Foreign key | Links name of visit |
| subject_id | SMALLINT | NO | Foreign key | Links subject |

## WasiiData
wasii_block_raw_cog_score TINYINT,
                        wasii_block_t1_cog_score TINYINT,
                        wasii_vocab_raw_cog_score TINYINT,
                        wasii_vocab_t1_cog_score TINYINT,
                        wasii_matrix_raw_cog_score TINYINT,
                        wasii_matrix_t1_cog_score TINYINT,
                        wasii_similar_raw_cog_score TINYINT,
                        wasii_similar_t1_cog_score TINYINT,
                        wasii_verbal_sumraw_cog_score TINYINT,
                        wasii_verbal_sumt_cog_score TINYINT,
                        wasii_verbal_composite_cog_score TINYINT,
                        wasii_verbal_percentile_cog_score TINYINT,
                        wasii_rsng_sumraw_cog_score TINYINT,
                        wasii_rsng_sumt_cog_score TINYINT,
                        wasii_rsng_composite_cog_score TINYINT,
                        wasii_rsng_percentile_cog_score TINYINT,
                        wasii_full4_sumt_cog_score TINYINT,
                        wasii_full4_composite_cog_score TINYINT,
                        wasii_full4_percentile_cog_score TINYINT,

## WramlData
wraml_raw_cog_score TINYINT,
                        wraml_scaled_cog_score TINYINT,
                        wraml_err_cog_score TINYINT,