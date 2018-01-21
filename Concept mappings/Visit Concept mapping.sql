-- Visit occurrence (similar (or even equal) to hospital admission, further routing in visit_detail)
select vo.visit_occurrence_id
    , vo.person_id
    , co.concept_name as visit_concept_value
    , vo.visit_start_date
    , vo.visit_start_datetime
    , vo.visit_end_date
    , vo.visit_end_datetime
    , vo.visit_source_value
    , vo.admitting_source_value
    , vo.discharge_to_source_value
    , vo.visit_concept_id
    , vo.visit_source_concept_id
    , co1.concept_name as visit_source_concept_value -- mapping not necessary, just to be complete
    , vo.admitting_source_concept_id
    , co2.concept_name as admitting_source_concept_value -- mapping not necessary, just to be complete
    , vo.discharge_to_concept_id
    , co3.concept_name as discharge_to_concept_value -- mapping not necessary, just to be complete
    , vo.preceding_visit_occurrence_id
    , vo.visit_type_concept_id -- seems to always have the same value
    , co4.concept_name as visit_type_concept_value
from visit_occurrence vo
    join concept co on co.concept_id = vo.visit_concept_id
    join concept co1 on co1.concept_id = vo.visit_source_concept_id
    join concept co2 on co2.concept_id = vo.admitting_source_concept_id
    join concept co3 on co3.concept_id = vo.discharge_to_concept_id
    join concept co4 on co4.concept_id = vo.visit_type_concept_id
limit 10
