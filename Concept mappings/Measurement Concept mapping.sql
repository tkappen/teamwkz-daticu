select me.*
    , ci.concept_name as measurement_concept_name
    , ci.concept_class_id as measurement_concept_class
    , ci.valid_start_date as measurement_concept_valid_start
    , ci.valid_end_date as measurement_concept_valid_end
    , ci.invalid_reason as measurement_concept_invalid_reason
from measurement me
    join concept ci ON me.measurement_concept_id = ci.concept_id
limit 100
