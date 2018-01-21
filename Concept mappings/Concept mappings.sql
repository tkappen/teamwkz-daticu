select co.concept_id
    , co.concept_name
    , co.domain_id
    , co.vocabulary_id
    , co.concept_class_id
    , co.standard_concept
    , co.concept_code
    , co.valid_start_date
    , co.valid_end_date
    , co.invalid_reason
from concept co
limit 10
