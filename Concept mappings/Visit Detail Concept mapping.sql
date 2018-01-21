-- visit_detail contains records of administrative admission routes through the hospital (not sure how to phrase it)
select vd.visit_detail_id
    , vd.visit_occurrence_id
    , vd.person_id
    , vd.visit_detail_concept_id
    , co.concept_name as visit_detail_concept_value
    , vd.visit_start_date
    , vd.visit_start_datetime
    , vd.visit_end_date
    , vd.visit_end_datetime
    , vd.visit_type_concept_id
    , co1.concept_name as visit_type_concept_value
    , vd.provider_id
    , vd.care_site_id
    , vd.visit_source_value
    , vd.visit_source_concept_id
    , vd.admitting_source_concept_id
    , vd.admitting_source_value
    , vd.discharge_to_concept_id
    , vd.discharge_to_source_value
    , vd.preceding_visit_detail_id
    , vd.visit_detail_parent_id
    , vd.visit_occurrence_id
 from visit_detail vd
    join concept co on co.concept_id = vd.visit_detail_concept_id
    join concept co1 on co1.concept_id = vd.visit_detail_concept_id
-- where vd.person_id = 62063368 OR visit_detail_id = 66839902 -- This one is in here because I can't find this visit_detail_id whereas it is used as a preciding visit_detail_id
order by person_id, visit_start_datetime limit 10
