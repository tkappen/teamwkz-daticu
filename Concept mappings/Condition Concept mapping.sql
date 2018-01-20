select co.*
    , concept_name
    , concept_class_id
    , valid_start_date
    , valid_end_date
    , invalid_reason
from condition_occurrence co
    join concept ci ON co.condition_concept_id = ci.concept_id
limit 100
