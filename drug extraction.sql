/* identify drugs with quantities */

SELECT
  drug_source_concept_id
, drug_source_value
, "sum"(quantity) sum_quantity
, dose_unit_source_value
, concept_name
FROM
  (drug_exposure e
INNER JOIN concept c ON (e.drug_concept_id = c.concept_id))
WHERE (drug_source_value LIKE '%epinephrine%') /* insert drug name here */
GROUP BY drug_source_concept_id, drug_source_value, dose_unit_source_value, concept_name
HAVING ("sum"(quantity) <> 0)
ORDER BY drug_source_value DESC