/* identify drugs with quantities */
SELECT  concept_id
, concept_name
, "sum"(quantity) sum_quantity
, LOWER(dose_unit_source_value) AS unit
FROM
  (drug_exposure e
INNER JOIN concept c ON (e.drug_concept_id = c.concept_id))
WHERE   domain_id = 'Drug' AND
        concept_name LIKE '%epinephrine%'
GROUP BY concept_id, concept_name, LOWER(dose_unit_source_value)
HAVING ("sum"(quantity) <> 0)
ORDER BY sum_quantity DESC

/* fluids in ml per patient with start and end datetime */
SELECT e.person_id
, e.drug_exposure_start_datetime
, e.drug_exposure_end_datetime
, concept_id
, concept_name
, quantity
, LOWER(dose_unit_source_value) AS unit
, route_source_value
FROM
  (drug_exposure e
INNER JOIN concept c ON (e.drug_concept_id = c.concept_id))
WHERE   quantity <> 0 AND
        domain_id = 'Drug' AND
        (LOWER(dose_unit_source_value) LIKE 'ml') AND
        LOWER(route_source_value) LIKE '%iv%'
GROUP BY e.person_id, concept_id, concept_name, LOWER(dose_unit_source_value), e.drug_exposure_start_datetime, e.drug_exposure_end_datetime, route_source_value, quantity
ORDER BY quantity DESC

/* fluids from ml/hour calculated as ml per patient with start and end datetime */

SELECT person_id
, drug
, quantity
, start_datetime
, end_datetime
, quantity * ((seconds + (minutes * 60) + (hours * 3600) + (days * 86400)) / 3600) as dose_administered
, unit
, administration_route
FROM (
	SELECT de.person_id
	, de.drug_exposure_start_datetime as start_datetime
	, de.drug_exposure_end_datetime as end_datetime
	, EXTRACT(SECOND from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as seconds
	, EXTRACT(MINUTE from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as minutes
	, EXTRACT(HOUR from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as hours
	, EXTRACT(DAY from (de.drug_exposure_end_datetime - de.drug_exposure_start_datetime)) as days
	, co.concept_id
	, co.concept_name as drug
	, de.quantity
	, LOWER(de.dose_unit_source_value) AS unit
	, de.route_source_value as administration_route
	FROM
	(drug_exposure de
	INNER JOIN concept co ON (de.drug_concept_id = co.concept_id))
	WHERE de.quantity <> 0 AND
	co.domain_id = 'Drug' AND
	(LOWER(de.dose_unit_source_value) LIKE 'ml/hour') AND
	LOWER(de.route_source_value) LIKE '%iv%'
	GROUP BY de.person_id, co.concept_id, co.concept_name, LOWER(de.dose_unit_source_value), de.drug_exposure_start_datetime, de.drug_exposure_end_datetime, de.route_source_value, de.quantity
ORDER BY de.quantity DESC
)
LIMIT 10
