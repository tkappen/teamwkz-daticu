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


select coo.condition_concept_id
    , co.concept_name as condition_concept_value
    , count(*) as tot_nr
from condition_occurrence coo
    left join concept co on co.concept_id = coo.condition_concept_id
    left join concept co1 on co1.concept_id = coo.condition_source_concept_id
    left join concept co2 on co2.concept_id = coo.condition_status_concept_id
    left join concept co3 on co3.concept_id = coo.condition_type_concept_id
group by coo.condition_concept_id
    , co.concept_name
order by tot_nr desc





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
where condition_concept_id in
    (
        320128
        , 319835
        , 313217
        , 42872402
        , 132797
        , 201826
        , 197320
        , 432867
        , 444104
        , 319049
        , 81902
        , 255848
        , 4014295
        , 318800
        , 439697
        , 437827
        , 4015724
        , 439777
        , 140673
        , 440927
        , 255573
        , 434894
        , 435517
        , 317576
        , 46271022
        , 252663
        , 440383
        , 437264
        , 444406
        , 314666
        , 254061
        , 432870
        , 436375
        , 312922
        , 435515
        , 433656
        , 319843
        , 317002
        , 435141
        , 4161462
        , 196236
        , 440922
        , 314054
        , 316999
        , 442588
        , 192671
        , 321462
        , 377091
        , 317009
        , 444044
        , 440519
        , 441829
        , 440847
        , 434610
        , 315831
        , 261880
        , 4120275
        , 440279
        , 440674
        , 261881
        , 80502
        , 315296
        , 193782
        , 437579
        , 439221
        , 321319
        , 442019
        , 440276
        , 321042
        , 376112
        , 442077
        , 257004
        , 436583
        , 200528
        , 77670
        , 433736
        , 132736
        , 201072
        , 435796
        , 373995
        , 193688
        , 321052
        , 437833
        , 376713
        , 40479553
        , 43020432
        , 443961
        , 376065
        , 4119499
        , 258866
        , 437390
        , 372887
        , 44783163
        , 194692
        , 433163
        , 4336464
        , 40479576
        , 192450
        , 434005
        , 314665
        , 40481043
        , 198964
        , 443862
        , 432923
        , 196463
        , 374009
        , 198571
        , 437474
        , 81611
        , 4223020
        , 436659
        , 45884380
        , 4014296
        , 75860
        , 321318
        , 440320
        , 40480602
        , 433440
        , 40479192
        , 437247
        , 443731
        , 380378
        , 192357
        , 4263370
        , 196523
        , 433315
        , 201065
        , 439847
        , 436222
        , 440940
        , 440417
        , 142026
        , 314479
        , 437663
        , 432585
        , 432875
        , 192680
    )
