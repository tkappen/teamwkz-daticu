select me.measurement_id
    , me.person_id
    , me.measurement_concept_id
    , co.concept_name as measurement_concept_value
    , me.measurement_type_concept_id
    , co1.concept_name as measurement_type_concept_value
    , me.measurement_date
    , me.measurement_datetime
    , me.operator_concept_id
    , co2.concept_name as operator_concept_value
    , me.value_as_number
    , me.value_as_concept_id
    , co3.concept_name as value_as_concept_value
    , me.unit_concept_id
    , co4.concept_name as unit_concept_value
    , me.range_low
    , me.range_high
    , me.provider_id
    , me.visit_occurrence_id
    , me.visit_detail_id
    , me.measurement_source_value
    , me.measurement_source_concept_id
    , co5.concept_name as measurement_source_concept_value
    , me.unit_source_value
    , me.value_source_value
from measurement me
    left join concept co on co.concept_id = me.measurement_concept_id
    left join concept co1 on co1.concept_id = me.measurement_type_concept_id
    left join concept co2 on co2.concept_id = me.operator_concept_id
    left join concept co3 on co3.concept_id = me.value_as_concept_id
    left join concept co4 on co4.concept_id = me.unit_concept_id
    left join concept co5 on co5.concept_id = me.measurement_source_concept_id
limit 10
