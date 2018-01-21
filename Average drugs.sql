/**** mg/kg/hour to avarage mcg administered ****/
SELECT person_id
, visit_occurrence_id
, hours_since_start
, drug
, AVG(quantity * 1000) as average_mcg_hour
, unit
FROM (
    SELECT de.person_id
    , vo.visit_occurrence_id
    , de.drug_exposure_start_datetime - vo.visit_start_datetime as time_since_visit_start
    , (EXTRACT(DAY from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) * 24) + EXTRACT(HOUR from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as hours_since_start
    , EXTRACT(MINUTE from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as minutes_since_visit_start
    , EXTRACT(HOUR from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as hours_since_visit_start
    , EXTRACT(DAY from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as days_since_visit_start
    , de.drug_exposure_end_datetime - vo.visit_start_datetime as time_since_visit_end
    , EXTRACT(MINUTE from (de.drug_exposure_end_datetime - vo.visit_start_datetime)) as minutes_since_visit_end
    , de.drug_exposure_start_datetime as start_datetime
    , de.drug_exposure_end_datetime as end_datetime
    , de.drug_exposure_end_datetime - de.drug_exposure_start_datetime as date_diff
    , EXTRACT(SECOND from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as seconds
    , EXTRACT(MINUTE from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as minutes
    , EXTRACT(HOUR from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as hours
    , EXTRACT(DAY from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as days
    , co.concept_id
    , co.concept_name as drug
    , de.quantity
    , LOWER(de.dose_unit_source_value) AS unit
    , de.route_source_value as administration_route
    FROM (
        drug_exposure de
        INNER JOIN concept co ON (de.drug_concept_id = co.concept_id)
        INNER JOIN visit_occurrence vo ON (de.visit_occurrence_id = vo.visit_occurrence_id)
    )
    WHERE   de.quantity <> 0 AND
            co.domain_id = 'Drug' AND
            (LOWER(de.dose_unit_source_value) = 'mg/kg/hour')
    GROUP BY de.person_id, vo.visit_occurrence_id, vo.visit_start_datetime, co.concept_id, co.concept_name, LOWER(de.dose_unit_source_value), de.drug_exposure_start_datetime, de.drug_exposure_end_datetime, de.route_source_value, de.quantity
)
WHERE seconds + minutes + hours + days > 0
GROUP BY person_id, visit_occurrence_id, hours_since_start, drug, unit
ORDER BY person_id ASC, visit_occurrence_id ASC, hours_since_start ASC
LIMIT 10000

/**** mg/hour to avarage mcg administered ****/
SELECT person_id
, visit_occurrence_id
, hours_since_start
, drug
, AVG(quantity * 1000) as average_mcg_hour
, unit
FROM (
    SELECT de.person_id
    , vo.visit_occurrence_id
    , de.drug_exposure_start_datetime - vo.visit_start_datetime as time_since_visit_start
    , (EXTRACT(DAY from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) * 24) + EXTRACT(HOUR from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as hours_since_start
    , EXTRACT(MINUTE from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as minutes_since_visit_start
    , EXTRACT(HOUR from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as hours_since_visit_start
    , EXTRACT(DAY from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as days_since_visit_start
    , de.drug_exposure_end_datetime - vo.visit_start_datetime as time_since_visit_end
    , EXTRACT(MINUTE from (de.drug_exposure_end_datetime - vo.visit_start_datetime)) as minutes_since_visit_end
    , de.drug_exposure_start_datetime as start_datetime
    , de.drug_exposure_end_datetime as end_datetime
    , de.drug_exposure_end_datetime - de.drug_exposure_start_datetime as date_diff
    , EXTRACT(SECOND from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as seconds
    , EXTRACT(MINUTE from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as minutes
    , EXTRACT(HOUR from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as hours
    , EXTRACT(DAY from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as days
    , co.concept_id
    , co.concept_name as drug
    , de.quantity
    , LOWER(de.dose_unit_source_value) AS unit
    , de.route_source_value as administration_route
    FROM (
        drug_exposure de
        INNER JOIN concept co ON (de.drug_concept_id = co.concept_id)
        INNER JOIN visit_occurrence vo ON (de.visit_occurrence_id = vo.visit_occurrence_id)
    )
    WHERE   de.quantity <> 0 AND
            co.domain_id = 'Drug' AND
            (LOWER(de.dose_unit_source_value) = 'mg/hour')
    GROUP BY de.person_id, vo.visit_occurrence_id, vo.visit_start_datetime, co.concept_id, co.concept_name, LOWER(de.dose_unit_source_value), de.drug_exposure_start_datetime, de.drug_exposure_end_datetime, de.route_source_value, de.quantity
)
WHERE seconds + minutes + hours + days > 0
GROUP BY person_id, visit_occurrence_id, hours_since_start, drug, unit
ORDER BY person_id ASC, visit_occurrence_id ASC, hours_since_start ASC
LIMIT 10000

/**** mcg/kg/min to avarage mcg administered ****/
SELECT person_id
, visit_occurrence_id
, hours_since_start
, drug
, AVG(quantity * 60) as average_mcg_hour
, unit
FROM (
    SELECT de.person_id
    , vo.visit_occurrence_id
    , de.drug_exposure_start_datetime - vo.visit_start_datetime as time_since_visit_start
    , (EXTRACT(DAY from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) * 24) + EXTRACT(HOUR from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as hours_since_start
    , EXTRACT(MINUTE from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as minutes_since_visit_start
    , EXTRACT(HOUR from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as hours_since_visit_start
    , EXTRACT(DAY from (de.drug_exposure_start_datetime - vo.visit_start_datetime)) as days_since_visit_start
    , de.drug_exposure_end_datetime - vo.visit_start_datetime as time_since_visit_end
    , EXTRACT(MINUTE from (de.drug_exposure_end_datetime - vo.visit_start_datetime)) as minutes_since_visit_end
    , de.drug_exposure_start_datetime as start_datetime
    , de.drug_exposure_end_datetime as end_datetime
    , de.drug_exposure_end_datetime - de.drug_exposure_start_datetime as date_diff
    , EXTRACT(SECOND from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as seconds
    , EXTRACT(MINUTE from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as minutes
    , EXTRACT(HOUR from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as hours
    , EXTRACT(DAY from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as days
    , co.concept_id
    , co.concept_name as drug
    , de.quantity
    , LOWER(de.dose_unit_source_value) AS unit
    , de.route_source_value as administration_route
    FROM (
        drug_exposure de
        INNER JOIN concept co ON (de.drug_concept_id = co.concept_id)
        INNER JOIN visit_occurrence vo ON (de.visit_occurrence_id = vo.visit_occurrence_id)
    )
    WHERE   de.quantity <> 0 AND
            co.domain_id = 'Drug' AND
            (LOWER(de.dose_unit_source_value) = 'mcg/kg/min')
    GROUP BY de.person_id, vo.visit_occurrence_id, vo.visit_start_datetime, co.concept_id, co.concept_name, LOWER(de.dose_unit_source_value), de.drug_exposure_start_datetime, de.drug_exposure_end_datetime, de.route_source_value, de.quantity
)
WHERE seconds + minutes + hours + days > 0
GROUP BY person_id, visit_occurrence_id, hours_since_start, drug, unit
ORDER BY person_id ASC, visit_occurrence_id ASC, hours_since_start ASC
LIMIT 10000