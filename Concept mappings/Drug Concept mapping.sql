select de.drug_exposure_id
    , de.person_id
    , de.drug_concept_id
    , co.concept_name as drug_concept_value
    , de.drug_exposure_start_date
    , de.drug_exposure_start_datetime
    , de.drug_exposure_end_date
    , de.drug_exposure_end_datetime
    , de.verbatim_end_date
    , de.stop_reason
    , de.refills
    , de.quantity
    , de.days_supply
    , de.sig
    , de.route_concept_id
    , co1.concept_name as route_concept_value
    , de.lot_number
    , de.provider_id
    , de.visit_occurrence_id
    , de.visit_detail_id
    , de.drug_source_value
    , de.drug_source_concept_id
    , co2.concept_name as drug_source_concept_value
    , de.route_source_value
    , de.dose_unit_source_value
    , de.drug_type_concept_id
    , co3.concept_name as drug_type_concept_value
    , ds.ingredient_concept_id
    , co4.concept_name as ingredient_concept_value
-- This is probably related to some data type issue that this doesn't work
    -- , ds.amount_value
    -- , ds.amount_unit_concept_id
    -- , co5.concept_name as amount_unit_concept_value
    -- , ds.numerator_value
    -- , ds.numerator_unit_concept_id
    -- , co6.concept_name as numerator_unit_concept_value
    -- , ds.denominator_value
    -- , ds.denominator_unit_concept_id
    -- , co7.concept_name as denominator_unit_concept_value
    , ds.box_size
    , ds.valid_start_date
    , ds.valid_end_date
    , ds.invalid_reason
from drug_exposure de
    left join concept co on co.concept_id = de.drug_concept_id
    left join concept co1 on co1.concept_id = de.route_concept_id
    left join concept co2 on co2.concept_id = de.drug_source_concept_id
    left join concept co3 on co3.concept_id = de.drug_type_concept_id
    left join drug_strength ds ON de.drug_concept_id = ds.drug_concept_id
        left join concept co4 on co4.concept_id = ds.ingredient_concept_id
        -- left join concept co5 on co5.concept_id = ds.amount_unit_concept_id
        -- left join concept co6 on co6.concept_id = ds.numerator_unit_concept_id
        -- left join concept co7 on co7.concept_id = ds.denominator_unit_concept_id
limit 10
