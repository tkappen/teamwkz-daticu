select coo.condition_occurrence_id
    , coo.person_id
    , co.concept_name as condition_concept_value
    , coo.condition_start_date
    , coo.condition_start_datetime
    , coo.condition_end_date
    , coo.condition_end_datetime
    , coo.stop_reason
    , coo.condition_source_value
    , coo.condition_status_source_value
    , co1.concept_name as condition_source_concept_value
    , co2.concept_name as condition_status_concept_value
    , co3.concept_name as condition_type_concept_value
    , coo.condition_concept_id
    , coo.condition_source_concept_id
    , coo.condition_status_concept_id
    , coo.condition_type_concept_id
    , coo.provider_id
    , coo.visit_occurrence_id
    , coo.visit_detail_id
from condition_occurrence coo
    left join concept co on co.concept_id = coo.condition_concept_id
    left join concept co1 on co1.concept_id = coo.condition_source_concept_id
    left join concept co2 on co2.concept_id = coo.condition_status_concept_id
    left join concept co3 on co3.concept_id = coo.condition_type_concept_id
limit 10
