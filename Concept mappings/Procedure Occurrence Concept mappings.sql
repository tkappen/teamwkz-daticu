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


-- See how many procedures of each
select po.procedure_concept_id
    , co.concept_name as procedure_concept_value
    , co1.concept_name as modifier_concept_value
    , co2.concept_name as procedure_source_concept_value
    , co3.concept_name as procedure_type_concept_value
    , count(*) as tot_nr
from procedure_occurrence po
    left join concept co on co.concept_id = po.procedure_concept_id
    left join concept co1 on co1.concept_id = po.modifier_concept_id
    left join concept co2 on co2.concept_id = po.procedure_source_concept_id
    left join concept co3 on co3.concept_id = po.procedure_type_concept_id
group by po.procedure_concept_id , co.concept_name,co1.concept_name , co2.concept_name, co3.concept_name
order by tot_nr desc


 -- select procedures after manual exclusion (see excel table)
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
where procedure_concept_id in
    (4163872
    , 4163951
    , 4213288
    , 4097246
    , 2007901
    , 4107893
    , 2008005
    , 2008008
    , 4180642
    , 4150627
    , 4052413
    , 2008238
    , 2002243
    , 2008009
    , 4024509
    , 2006892
    , 2002172
    , 4037672
    , 2001514
    , 4335825
    , 4322380
    , 2008250
    , 4052413
    , 4013354
    , 2006918
    , 2001537
    , 2001354
    , 2002282
    , 4015189
    , 4032243
    , 2002685
    , 4056681
    , 4051172
    , 4336464
    , 2007680
    , 2001538
    , 4052413
    , 4032404
    , 2003547
    , 2000173
    , 4013636
    , 2006879
    , 2008241
    , 4051326
    , 2001511
    , 2001430
    , 2002176
    , 4213288
    , 2001285
    , 2008266
    , 2001393
    , 40756786
    , 2000037
    , 4279768
    , 37018292
    , 2006856
    , 4024963
    , 4267880
    , 4287484
    , 2002530
    , 2001512
    , 4067698
    , 2001449
    , 4095407
    , 4177224
    , 2000064
    , 4107893
    , 4030842
    , 2001352
    , 2001505
    , 2008239
    , 4068785
    , 2001506
    , 2001353
    , 4181917
    , 2001500
    , 2007090
    , 4115340
    , 4040551
    , 4313889
    , 4279768
    , 2001563)
