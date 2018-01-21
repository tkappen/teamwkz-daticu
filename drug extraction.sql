/* identify drugs with quantities */

SELECT  concept_id
, concept_name
, "sum"(quantity) sum_quantity
, LOWER(dose_unit_source_value) AS unit
FROM
  (drug_exposure e
INNER JOIN concept c ON (e.drug_concept_id = c.concept_id))
WHERE   domain_id = 'Drug'
GROUP BY concept_id, concept_name, LOWER(dose_unit_source_value)
HAVING ("sum"(quantity) <> 0)
ORDER BY sum_quantity DESC

/* quantitative fluids (ml or ml/hour) */
SELECT  concept_id
, concept_name
, "sum"(quantity) sum_quantity
, LOWER(dose_unit_source_value) AS unit
FROM
  (drug_exposure e
INNER JOIN concept c ON (e.drug_concept_id = c.concept_id))
WHERE   domain_id = 'Drug' AND
        (LOWER(dose_unit_source_value) LIKE 'ml' OR LOWER(dose_unit_source_value) LIKE 'ml/hour')
GROUP BY concept_id, concept_name, LOWER(dose_unit_source_value)
HAVING ("sum"(quantity) <> 0)
ORDER BY sum_quantity DESC

/* fluids per patient with start and end datetime */
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
        (LOWER(dose_unit_source_value) LIKE 'ml' OR LOWER(dose_unit_source_value) LIKE 'ml/hour') AND
        LOWER(route_source_value) LIKE '%iv%'
GROUP BY e.person_id, concept_id, concept_name, LOWER(dose_unit_source_value), e.drug_exposure_start_datetime, e.drug_exposure_end_datetime, route_source_value, quantity
ORDER BY quantity DESC
