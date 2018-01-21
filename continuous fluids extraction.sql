/************************************************************************/
-- continuous fluids in ml/hours with time since admission in round hours
--
-- start time:  hours_since_admission
-- end time: end_hours_since_admission
-- quantity: quantity (in ml/hour)
-- total quantity: ml_administered

SELECT
  person_id
, visit_occurrence_id
, hours_since_admission
, (CASE WHEN (total_administration_time_in_mins < 60) THEN (hours_since_admission + 1) WHEN (total_administration_time_in_mins > 59) THEN (hours_since_admission + "round"((total_administration_time_in_mins / 60), 0)) END) end_hours_since_admission
, drug
, quantity
, unit
, ml_administered total_ml_administered
, administration_route
FROM
  (
   SELECT
     person_id
   , visit_occurrence_id
   , (hours_since_admission + (days_since_admission * 24)) hours_since_admission
   , drug
   , quantity
   , ml_administered
   , total_administration_time_in_mins
   , unit
   , administration_route
   FROM
     (
      SELECT
        person_id
      , visit_occurrence_id
      , EXTRACT(HOUR FROM ("date_trunc"('hour', start_datetime) - "date_trunc"('hour', visit_start_datetime))) hours_since_admission
      , EXTRACT(DAY FROM ("date_trunc"('hour', start_datetime) - "date_trunc"('hour', visit_start_datetime))) days_since_admission
      , ("date_trunc"('hour', start_datetime) - "date_trunc"('hour', visit_start_datetime)) starttime
      , total_administration_time
      , drug
      , quantity
      , start_datetime
      , end_datetime
      , ((quantity * (((seconds + (minutes * 60)) + (hours * 3600)) + (days * 86400))) / 3600) ml_administered
      , ((((seconds + (minutes * 60)) + (hours * 3600)) + (days * 86400)) / 60) total_administration_time_in_mins
      , unit
      , administration_route
      FROM
        (
         SELECT
           de.person_id
         , vo.visit_occurrence_id
         , vo.visit_start_datetime
         , de.drug_exposure_start_datetime start_datetime
         , de.drug_exposure_end_datetime end_datetime
         , EXTRACT(SECOND FROM (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) seconds
         , EXTRACT(MINUTE FROM (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) minutes
         , EXTRACT(HOUR FROM (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) hours
         , EXTRACT(DAY FROM (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) days
         , (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime) total_administration_time
         , (de.drug_exposure_start_datetime - vo.visit_start_datetime) time
         , co.concept_id
         , co.concept_name drug
         , de.quantity
         , "lower"(de.dose_unit_source_value) unit
         , de.route_source_value administration_route
         FROM
           ((drug_exposure de
         INNER JOIN concept co ON (de.drug_concept_id = co.concept_id))
         INNER JOIN visit_occurrence vo ON (de.visit_occurrence_id = vo.visit_occurrence_id))
         WHERE ((((de.quantity <> 0) AND (co.domain_id = 'Drug')) AND ("lower"(de.dose_unit_source_value) LIKE 'ml/hour')) AND ("lower"(de.route_source_value) LIKE '%iv%'))
         GROUP BY de.person_id, vo.visit_occurrence_id, co.concept_id, co.concept_name, "lower"(de.dose_unit_source_value), de.drug_exposure_start_datetime, de.drug_exposure_end_datetime, de.route_source_value, de.quantity, vo.visit_start_datetime
         ORDER BY de.quantity DESC
      ) 
      ORDER BY person_id ASC, visit_occurrence_id ASC, time ASC, ml_administered ASC
   ) 
) 
