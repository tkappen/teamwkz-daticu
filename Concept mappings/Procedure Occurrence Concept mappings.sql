select po.procedure_occurrence_id
    , po.person_id
    , po.procedure_concept_id
    , co.concept_name as procedure_concept_value
    , po.procedure_date
    , po.procedure_datetime
    , po.modifier_concept_id
    , co1.concept_name as modifier_concept_value
    , po.quantity
    , po.provider_id
    , po.visit_occurrence_id
    , po.visit_detail_id
    , po.procedure_source_value
    , po.procedure_source_concept_id
    , co2.concept_name as procedure_source_concept_value
    , po.qualifier_source_value
    , po.procedure_type_concept_id
    , co3.concept_name as procedure_type_concept_value
from procedure_occurrence po
    left join concept co on co.concept_id = po.procedure_concept_id
    left join concept co1 on co1.concept_id = po.modifier_concept_id
    left join concept co2 on co2.concept_id = po.procedure_source_concept_id
    left join concept co3 on co3.concept_id = po.procedure_type_concept_id
limit 10
