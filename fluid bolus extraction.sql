SELECT
  de.person_id
, de.visit_occurrence_id
, de.drug_exposure_start_datetime
, de.drug_exposure_end_datetime
, vo.visit_start_datetime
, co.concept_id
, co.concept_name
, de.quantity
, "lower"(de.dose_unit_source_value) unit
, de.route_source_value
FROM
  ((drug_exposure de
INNER JOIN concept co ON (de.drug_concept_id = co.concept_id))
INNER JOIN visit_occurrence vo ON (de.visit_occurrence_id = vo.visit_occurrence_id))
WHERE ((((de.quantity <> 0) AND (co.domain_id = 'Drug')) AND ("lower"(de.dose_unit_source_value) LIKE 'ml')) AND ("lower"(de.route_source_value) LIKE '%iv%'))
GROUP BY de.person_id, de.visit_occurrence_id, co.concept_id, co.concept_name, "lower"(de.dose_unit_source_value), de.drug_exposure_start_datetime, de.drug_exposure_end_datetime, vo.visit_start_datetime, de.route_source_value, de.quantity
ORDER BY de.person_id ASC, de.visit_occurrence_id ASC, de.quantity DESC
