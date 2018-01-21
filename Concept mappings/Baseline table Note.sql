select vo.visit_occurrence_id
    , vo.person_id
    , vo.visit_concept_id
    , floor(extract(day from (vo.visit_start_datetime - pe.birth_datetime))/365.25)  as age
    , REVERSE(SUBSTR(REVERSE(SUBSTR(
            (
                select max(lexical_variant)
                from note no inner join note_nlp nn on no.note_id = nn.note_id AND nn.section_source_concept_id = 2001042802
                WHERE no.visit_occurrence_id = vo.visit_occurrence_id
            )
        , 19)), 7, 6)) as admission_weight
    , vo.visit_start_date
    , vo.visit_start_datetime
    , pe.birth_datetime
    , vo.visit_end_date
    , vo.visit_end_datetime
    , vo.provider_id
    , vo.care_site_id
    , vo.visit_source_value
    , vo.visit_source_concept_id
    , vo.admitting_source_concept_id
    , vo.admitting_source_value
    , vo.discharge_to_concept_id
    , vo.discharge_to_source_value
    , vo.preceding_visit_occurrence_id
    , vo.visit_type_concept_id
    , vo.person_id
    , pe.gender_concept_id
    , pe.year_of_birth
    , pe.month_of_birth
    , pe.day_of_birth
    , pe.race_concept_id
    , pe.ethnicity_concept_id
    , pe.location_id
    , pe.person_source_value
    , pe.gender_source_value
    , pe.gender_source_concept_id
    , pe.race_source_value
    , pe.race_source_concept_id
    , pe.ethnicity_source_value
    , pe.ethnicity_source_concept_id
from visit_occurrence vo
    join person pe on pe.person_id = vo.person_id
where floor(extract(day from (vo.visit_start_datetime - pe.birth_datetime))/365.25) >= 18

select vo.*
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 320128 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Essential_hypertension
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 319835 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Congestive_heart_failure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 313217 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Atrial_fibrillation
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 42872402 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_arteriosclerosis_in_native_artery
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 132797 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Sepsis
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 201826 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Type_2_diabetes_mellitus
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 197320 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_renal_failure_syndrome
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 432867 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hyperlipidemia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 444104 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Newborn
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 319049 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_respiratory_failure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 81902 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Urinary_tract_infectious_disease
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 255848 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pneumonia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4014295 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Single_live_birth
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 318800 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Gastroesophageal_reflux_disease
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 439697 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypertensive_renal_disease_with_renal_failure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437827 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pure_hypercholesterolemia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4015724 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Vaccination_required
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 439777 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Anemia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 140673 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypothyroidism
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440927 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_High_risk_drug_monitoring_status
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 255573 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_obstructive_lung_disease
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 434894 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_posthemorrhagic_anemia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 435517 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acidosis
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 317576 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_arteriosclerosis
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 46271022 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_kidney_disease
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 252663 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pneumonitis_due_to_inhalation_of_food_or_vomitus
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440383 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Depressive_disorder
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437264 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Tobacco_dependence_syndrome
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 444406 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_subendocardial_infarction
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 314666 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Old_myocardial_infarction
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 254061 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pleural_effusion
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 432870 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Thrombocytopenic_disorder
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 436375 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypovolemia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 312922 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_bypass_graft_finding
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 435515 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypo_osmolality_and_or_hyponatremia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 433656 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Abnormal_patient_reaction
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 319843 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Mitral_valve_disorder
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 317002 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Low_blood_pressure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 435141 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hemorrhage_AND_OR_hematoma_complicating_procedure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4161462 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Patient_post_percutaneous_transluminal_coronary_angioplasty
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 196236 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Septic_shock
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440922 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diabetic_on_insulin
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 314054 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Aortic_valve_disorder
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 316999 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Conduction_disorder_of_the_heart
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 442588 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Obstructive_sleep_apnea_syndrome
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 192671 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Gastrointestinal_hemorrhage
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 321462 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiac_complication
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 377091 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Seizure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 317009 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Asthma
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 444044 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_tubular_necrosis
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440519 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Premature___weight_1000g_2499g_or_gestation_of_28_37weeks
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 441829 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hyperosmolality_and_or_hypernatremia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440847 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Neonatal_jaundice_associated_with_preterm_delivery
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 434610 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hyperkalemia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 315831 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_pulmonary_heart_disease
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 261880 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Atelectasis
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4120275 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Drug_induced_hypotension
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440279 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Accident
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440674 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Gout
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 261881 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Trauma_and_postoperative_pulmonary_insufficiency
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 80502 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Osteoporosis
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 315296 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Preinfarction_syndrome
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 193782 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_End_stage_renal_disease
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437579 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Paroxysmal_ventricular_tachycardia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 439221 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Adverse_effectdue_to_correct_medicinal_substance_properly_administered
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 321319 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiomyopathy
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 442019 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Complication_of_procedure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440276 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Infection_AND_OR_inflammatory_reaction_due_to_internal_prosthetic_device_implant_AND_OR_graft
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 321042 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiac_arrest
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 376112 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diabetic_polyneuropathy
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 442077 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Anxiety_disorder
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 257004 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_exacerbation_of_chronic_obstructive_airways_disease
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 436583 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Fall
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 200528 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Ascites
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 77670 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chest_pain
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 433736 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Obesity
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 132736 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Bacteremia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 201072 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Benign_prostatic_hypertrophy_without_outflow_obstruction
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 435796 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Dehydration
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 373995 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Delirium
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 193688 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Clostridium_difficile_infection
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 321052 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Peripheral_vascular_disease
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437833 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypokalemia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 376713 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cerebral_hemorrhage
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 40479553 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiac_pacemaker_in_situ
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 43020432 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Atherosclerosis_of_native_arteries_of_the_extremities
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 443961 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Anemia_of_chronic_renal_failure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 376065 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Neurologic_disorder_associated_with_type_2_diabetes_mellitus
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4119499 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Not_for_resuscitation
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 258866 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Respiratory_distress_syndrome_in_the_newborn
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437390 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypoxemia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 372887 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Disorder_of_brain
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 44783163 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pressure_ulcer_of_lower_back
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 194692 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cirrhosis___non_alcoholic
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 433163 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Deficiency_of_macronutrients
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4336464 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_artery_bypass_graft
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 40479576 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_diastolic_heart_failure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 192450 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Retention_of_urine
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 434005 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Morbid_obesity
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 314665 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Atrial_flutter
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 40481043 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_on_chronic_diastolic_heart_failure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 198964 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_hepatitis_C
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 443862 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Complication_of_internal_anastomosis
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 432923 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Subarachnoid_hemorrhage
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 196463 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Alcoholic_cirrhosis
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 374009 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Organic_mental_disorder
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 198571 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiogenic_shock
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437474 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Postoperative_infection
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 81611 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diverticular_disease_of_colon
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4223020 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiac_catheterization
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 436659 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Iron_deficiency_anemia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 45884380 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiac_catheterization
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4014296 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Twins___both_live_born
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 75860 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Constipation
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 321318 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Angina_pectoris
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440320 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Infection_due_to_Escherichia_coli
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 40480602 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_on_chronic_systolic_heart_failure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 433440 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Dysthymia
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 40479192 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_systolic_heart_failure
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437247 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Anemia_of_chronic_disease
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 443731 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Renal_disorder_due_to_type_2_diabetes_mellitus
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 380378 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Epilepsy
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 192357 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Paralytic_ileus
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4263370 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_R_I_N_D__syndrome
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 196523 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diarrhea
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 433315 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Feeding_problems_in_newborn
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 201065 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_and_subacute_liver_necrosis
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 439847 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Intracranial_hemorrhage
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 436222 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Altered_mental_status
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440940 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Methicillin_resistant_Staphylococcus_aureus_infection
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440417 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pulmonary_embolism
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 142026 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Disorder_of_cardiovascular_prostheses_and_implants
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 314479 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Primary_apnea_in_the_newborn
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437663 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Fever
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 432585 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Blood_coagulation_disorder
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 432875 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Anemia_due_to_chronic_blood_loss
, CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 192680 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Portal_hypertension

from visit_occurrence vo






select vo.*
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4163872 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Plain_chest_X_ray
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4163951 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Electrocardiographic_procedure
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4213288 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_catheter_into_artery
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4097246 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Controlled_ventilation_procedure_and_therapy__initiation_and_management
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2007901 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_endotracheal_tube
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4107893 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Blood_culture
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008005 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Enteral_infusion_of_concentrated_nutritional_substances
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008008 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Continuous_invasive_mechanical_ventilation_for_less_than_96_consecutive_hours
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4180642 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_CT_of_site
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4150627 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Removal_of_endotracheal_tube
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4052413 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Central_venous_cannula_insertion
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008238 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Transfusion_of_packed_cells
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002243 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Extracorporeal_circulation_auxiliary_to_open_heart_surgery
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008009 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Continuous_invasive_mechanical_ventilation_for_96_consecutive_hours_or_more
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4024509 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Urine_culture
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2006892 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_arteriography_using_two_catheters
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002172 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Arterial_catheterization
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4037672 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Ultrasonography
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001514 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Single_internal_mammary_coronary_artery_bypass
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4335825 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Transthoracic_echocardiography
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4322380 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_peripherally_inserted_central_catheter
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008250 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Parenteral_infusion_of_concentrated_nutritional_substances
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4052413 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Central_venous_cannula_insertion
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4013354 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_endotracheal_tube
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2006918 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diagnostic_ultrasound_of_heart
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001537 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Left_heart_cardiac_catheterization
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001354 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Closed__endoscopic__biopsy_of_bronchus
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002282 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hemodialysis
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4015189 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Microbial_culture_of_sputum
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4032243 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Dialysis_procedure
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002685 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Other_endoscopy_of_small_intestine
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4056681 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Plain_radiography
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4051172 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Harvesting_of_vein
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4336464 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_artery_bypass_graft
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2007680 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Non_invasive_mechanical_ventilation
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001538 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Combined_right_and_left_heart_cardiac_catheterization
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4052413 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Central_venous_cannula_insertion
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4032404 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Bronchoscopy
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2003547 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Percutaneous_abdominal_drainage
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2000173 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Spinal_tap
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4013636 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Magnetic_resonance_imaging
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2006879 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Angiocardiography_of_left_heart_structures
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008241 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Transfusion_of_other_serum
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4051326 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Intermittent_hemodialysis
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001511 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_ortocoronary_bypass_of_two_coronary_arteries
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001430 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Thoracentesis
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002176 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Venous_catheterization_for_renal_dialysis
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4213288 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_catheter_into_artery
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001285 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Temporary_tracheostomy
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008266 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Injection_or_infusion_of_platelet_inhibitor
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001393 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_intercostal_catheter_for_drainage
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 40756786 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Central_venous_catheter_placement_with_guidance
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2000037 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Procedure_on_single_vessel
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4279768 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pulmonary_catheterization_with_Swan_Ganz_catheter
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 37018292 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Continuous_renal_replacement_therapy
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2006856 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Arteriography_of_cerebral_arteries
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4024963 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Stool_culture
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4267880 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_cannula_for_hemodialysis__vein_to_vein
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4287484 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Bronchoscopy_and_bronchoalveolar_lavage
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002530 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Percutaneous__endoscopic__gastrostomy__PEG_
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001512 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Aortocoronary_bypass_of_three_coronary_arteries
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4067698 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Rigid_therapeutic_bronchoscopy
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001449 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Open_and_other_replacement_of_aortic_valve_with_tissue_graft
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4095407 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Replacement_of_aortic_valve
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4177224 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Noninvasive_ventilation
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2000064 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Percutaneous_transluminal_coronary_angioplasty__PTCA_
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4107893 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Blood_culture
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4030842 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Intercostal_drain_removal
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001352 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Fiber_optic_bronchoscopy
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001505 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_non_drug_eluting_coronary_artery_stents
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008239 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Transfusion_of_platelets
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4068785 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diagnostic_fiberoptic_bronchoscopy
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001506 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_drug_eluting_coronary_artery_stent
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001353 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Other_bronchoscopy
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4181917 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Electroencephalogram
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001500 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Single_vessel_percutaneous
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2007090 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pulmonary_artery_wedge_monitoring
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4115340 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Arterial_bypass_using_vein_graft
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4040551 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Procedure_on_blood_vessel
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4313889 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Endoscopy
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4279768 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pulmonary_catheterization_with_Swan_Ganz_catheter
, CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001563 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Implant_of_pulsation_balloon

from visit_occurrence vo




select vo.visit_occurrence_id
    , vo.person_id
    , floor(extract(day from (vo.visit_start_datetime - pe.birth_datetime))/365.25)  as fixed_age
    , REVERSE(SUBSTR(REVERSE(SUBSTR(
            (
                select max(lexical_variant)
                from note no inner join note_nlp nn on no.note_id = nn.note_id AND nn.section_source_concept_id = 2001042802
                WHERE no.visit_occurrence_id = vo.visit_occurrence_id
            )
        , 19)), 7, 6)) as fixed_admission_weight
    , vo.visit_source_value as fixed_visit_source
    , pe.gender_source_value as fixed_gender
    , pe.race_source_value as fixed_race
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 320128 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Essential_hypertension
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 319835 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Congestive_heart_failure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 313217 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Atrial_fibrillation
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 42872402 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_arteriosclerosis_in_native_artery
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 132797 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Sepsis
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 201826 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Type_2_diabetes_mellitus
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 197320 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_renal_failure_syndrome
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 432867 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hyperlipidemia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 444104 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Newborn
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 319049 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_respiratory_failure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 81902 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Urinary_tract_infectious_disease
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 255848 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pneumonia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4014295 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Single_live_birth
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 318800 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Gastroesophageal_reflux_disease
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 439697 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypertensive_renal_disease_with_renal_failure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437827 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pure_hypercholesterolemia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4015724 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Vaccination_required
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 439777 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Anemia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 140673 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypothyroidism
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440927 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_High_risk_drug_monitoring_status
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 255573 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_obstructive_lung_disease
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 434894 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_posthemorrhagic_anemia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 435517 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acidosis
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 317576 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_arteriosclerosis
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 46271022 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_kidney_disease
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 252663 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pneumonitis_due_to_inhalation_of_food_or_vomitus
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440383 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Depressive_disorder
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437264 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Tobacco_dependence_syndrome
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 444406 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_subendocardial_infarction
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 314666 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Old_myocardial_infarction
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 254061 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pleural_effusion
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 432870 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Thrombocytopenic_disorder
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 436375 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypovolemia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 312922 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_bypass_graft_finding
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 435515 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypo_osmolality_and_or_hyponatremia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 433656 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Abnormal_patient_reaction
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 319843 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Mitral_valve_disorder
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 317002 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Low_blood_pressure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 435141 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hemorrhage_AND_OR_hematoma_complicating_procedure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4161462 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Patient_post_percutaneous_transluminal_coronary_angioplasty
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 196236 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Septic_shock
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440922 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diabetic_on_insulin
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 314054 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Aortic_valve_disorder
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 316999 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Conduction_disorder_of_the_heart
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 442588 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Obstructive_sleep_apnea_syndrome
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 192671 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Gastrointestinal_hemorrhage
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 321462 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiac_complication
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 377091 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Seizure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 317009 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Asthma
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 444044 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_tubular_necrosis
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440519 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Premature___weight_1000g_2499g_or_gestation_of_28_37weeks
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 441829 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hyperosmolality_and_or_hypernatremia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440847 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Neonatal_jaundice_associated_with_preterm_delivery
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 434610 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hyperkalemia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 315831 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_pulmonary_heart_disease
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 261880 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Atelectasis
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4120275 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Drug_induced_hypotension
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440279 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Accident
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440674 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Gout
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 261881 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Trauma_and_postoperative_pulmonary_insufficiency
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 80502 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Osteoporosis
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 315296 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Preinfarction_syndrome
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 193782 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_End_stage_renal_disease
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437579 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Paroxysmal_ventricular_tachycardia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 439221 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Adverse_effectdue_to_correct_medicinal_substance_properly_administered
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 321319 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiomyopathy
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 442019 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Complication_of_procedure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440276 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Infection_AND_OR_inflammatory_reaction_due_to_internal_prosthetic_device_implant_AND_OR_graft
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 321042 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiac_arrest
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 376112 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diabetic_polyneuropathy
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 442077 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Anxiety_disorder
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 257004 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_exacerbation_of_chronic_obstructive_airways_disease
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 436583 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Fall
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 200528 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Ascites
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 77670 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chest_pain
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 433736 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Obesity
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 132736 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Bacteremia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 201072 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Benign_prostatic_hypertrophy_without_outflow_obstruction
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 435796 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Dehydration
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 373995 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Delirium
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 193688 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Clostridium_difficile_infection
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 321052 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Peripheral_vascular_disease
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437833 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypokalemia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 376713 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cerebral_hemorrhage
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 40479553 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiac_pacemaker_in_situ
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 43020432 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Atherosclerosis_of_native_arteries_of_the_extremities
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 443961 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Anemia_of_chronic_renal_failure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 376065 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Neurologic_disorder_associated_with_type_2_diabetes_mellitus
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4119499 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Not_for_resuscitation
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 258866 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Respiratory_distress_syndrome_in_the_newborn
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437390 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hypoxemia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 372887 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Disorder_of_brain
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 44783163 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pressure_ulcer_of_lower_back
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 194692 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cirrhosis___non_alcoholic
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 433163 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Deficiency_of_macronutrients
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4336464 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_artery_bypass_graft
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 40479576 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_diastolic_heart_failure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 192450 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Retention_of_urine
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 434005 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Morbid_obesity
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 314665 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Atrial_flutter
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 40481043 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_on_chronic_diastolic_heart_failure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 198964 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_hepatitis_C
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 443862 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Complication_of_internal_anastomosis
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 432923 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Subarachnoid_hemorrhage
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 196463 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Alcoholic_cirrhosis
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 374009 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Organic_mental_disorder
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 198571 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiogenic_shock
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437474 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Postoperative_infection
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 81611 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diverticular_disease_of_colon
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4223020 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiac_catheterization
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 436659 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Iron_deficiency_anemia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 45884380 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Cardiac_catheterization
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4014296 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Twins___both_live_born
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 75860 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Constipation
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 321318 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Angina_pectoris
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440320 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Infection_due_to_Escherichia_coli
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 40480602 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_on_chronic_systolic_heart_failure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 433440 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Dysthymia
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 40479192 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Chronic_systolic_heart_failure
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437247 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Anemia_of_chronic_disease
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 443731 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Renal_disorder_due_to_type_2_diabetes_mellitus
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 380378 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Epilepsy
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 192357 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Paralytic_ileus
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 4263370 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_R_I_N_D__syndrome
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 196523 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diarrhea
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 433315 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Feeding_problems_in_newborn
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 201065 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Acute_and_subacute_liver_necrosis
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 439847 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Intracranial_hemorrhage
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 436222 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Altered_mental_status
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440940 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Methicillin_resistant_Staphylococcus_aureus_infection
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 440417 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pulmonary_embolism
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 142026 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Disorder_of_cardiovascular_prostheses_and_implants
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 314479 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Primary_apnea_in_the_newborn
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 437663 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Fever
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 432585 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Blood_coagulation_disorder
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 432875 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Anemia_due_to_chronic_blood_loss
    , CASE WHEN (select count(*) from condition_occurrence co where condition_concept_id = 192680 AND co.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Portal_hypertension
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4163872 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Plain_chest_X_ray
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4163951 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Electrocardiographic_procedure
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4213288 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_catheter_into_artery
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4097246 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Controlled_ventilation_procedure_and_therapy__initiation_and_management
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2007901 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_endotracheal_tube
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4107893 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Blood_culture
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008005 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Enteral_infusion_of_concentrated_nutritional_substances
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008008 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Continuous_invasive_mechanical_ventilation_for_less_than_96_consecutive_hours
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4180642 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_CT_of_site
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4150627 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Removal_of_endotracheal_tube
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4052413 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Central_venous_cannula_insertion
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008238 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Transfusion_of_packed_cells
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002243 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Extracorporeal_circulation_auxiliary_to_open_heart_surgery
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008009 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Continuous_invasive_mechanical_ventilation_for_96_consecutive_hours_or_more
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4024509 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Urine_culture
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2006892 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_arteriography_using_two_catheters
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002172 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Arterial_catheterization
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4037672 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Ultrasonography
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001514 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Single_internal_mammary_coronary_artery_bypass
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4335825 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Transthoracic_echocardiography
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4322380 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_peripherally_inserted_central_catheter
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008250 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Parenteral_infusion_of_concentrated_nutritional_substances
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4052413 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Central_venous_cannula_insertion
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4013354 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_endotracheal_tube
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2006918 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diagnostic_ultrasound_of_heart
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001537 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Left_heart_cardiac_catheterization
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001354 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Closed__endoscopic__biopsy_of_bronchus
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002282 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Hemodialysis
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4015189 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Microbial_culture_of_sputum
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4032243 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Dialysis_procedure
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002685 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Other_endoscopy_of_small_intestine
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4056681 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Plain_radiography
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4051172 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Harvesting_of_vein
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4336464 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Coronary_artery_bypass_graft
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2007680 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Non_invasive_mechanical_ventilation
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001538 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Combined_right_and_left_heart_cardiac_catheterization
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4052413 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Central_venous_cannula_insertion
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4032404 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Bronchoscopy
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2003547 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Percutaneous_abdominal_drainage
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2000173 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Spinal_tap
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4013636 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Magnetic_resonance_imaging
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2006879 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Angiocardiography_of_left_heart_structures
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008241 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Transfusion_of_other_serum
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4051326 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Intermittent_hemodialysis
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001511 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_ortocoronary_bypass_of_two_coronary_arteries
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001430 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Thoracentesis
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002176 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Venous_catheterization_for_renal_dialysis
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4213288 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_catheter_into_artery
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001285 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Temporary_tracheostomy
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008266 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Injection_or_infusion_of_platelet_inhibitor
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001393 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_intercostal_catheter_for_drainage
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 40756786 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Central_venous_catheter_placement_with_guidance
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2000037 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Procedure_on_single_vessel
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4279768 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pulmonary_catheterization_with_Swan_Ganz_catheter
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 37018292 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Continuous_renal_replacement_therapy
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2006856 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Arteriography_of_cerebral_arteries
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4024963 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Stool_culture
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4267880 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_cannula_for_hemodialysis__vein_to_vein
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4287484 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Bronchoscopy_and_bronchoalveolar_lavage
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2002530 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Percutaneous__endoscopic__gastrostomy__PEG_
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001512 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Aortocoronary_bypass_of_three_coronary_arteries
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4067698 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Rigid_therapeutic_bronchoscopy
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001449 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Open_and_other_replacement_of_aortic_valve_with_tissue_graft
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4095407 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Replacement_of_aortic_valve
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4177224 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Noninvasive_ventilation
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2000064 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Percutaneous_transluminal_coronary_angioplasty__PTCA_
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4107893 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Blood_culture
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4030842 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Intercostal_drain_removal
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001352 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Fiber_optic_bronchoscopy
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001505 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_non_drug_eluting_coronary_artery_stents
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2008239 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Transfusion_of_platelets
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4068785 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Diagnostic_fiberoptic_bronchoscopy
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001506 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Insertion_of_drug_eluting_coronary_artery_stent
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001353 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Other_bronchoscopy
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4181917 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Electroencephalogram
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001500 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Single_vessel_percutaneous
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2007090 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pulmonary_artery_wedge_monitoring
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4115340 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Arterial_bypass_using_vein_graft
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4040551 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Procedure_on_blood_vessel
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4313889 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Endoscopy
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 4279768 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Pulmonary_catheterization_with_Swan_Ganz_catheter
    , CASE WHEN (select count(*) from procedure_occurrence po where procedure_concept_id = 2001563 AND po.visit_occurrence_id = vo.visit_occurrence_id) > 0 then 1 else 0 end as fixed_Implant_of_pulsation_balloon
from visit_occurrence vo
    join person pe on pe.person_id = vo.person_id
where floor(extract(day from (vo.visit_start_datetime - pe.birth_datetime))/365.25) >= 18
