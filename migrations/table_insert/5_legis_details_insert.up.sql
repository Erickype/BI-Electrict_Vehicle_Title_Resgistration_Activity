-- LegislationTransactionDetails
-- 2019 Range
create temp table tmp_trans_detail as
select
    row_number() over () as id,
    (
        select id
        from db.legislation_requirement_code LRC
        where LRC.name = 'Electric Range Requirement'
    ) as LRC,
    "Meets 2019 HB 2042 Electric Range Requirement" as LRV,
    (
        select id
        from db.legislation_requirement_details_code LRDC
        where LRDC.name = 'Battery Range Requirement'
    ) as LRDC,
    LRDV.id as LRDV
from public."Electric_Vehicle_Title_and_Registration_Activity" EVTaRA
         left join db.legislation_requirement_details_values LRDV on
            EVTaRA."2019 HB 2042: Battery Range Requirement" = LRDV.name or
            (EVTaRA."2019 HB 2042: Battery Range Requirement" isnull AND LRDV.name isnull)
order by "DOL Vehicle ID";

insert into db.transaction_legislation_detail
    (
     transaction_legislation,
     legislation_requirement_code,
     legislation_requirement_value,
     legislation_requirement_details_code,
     legislation_requirement_details_value
     )
select
    TL.id,
    TD.LRC,
    TD.LRV::boolean,
    TD.LRDC,
    TD.LRDV
from tmp_trans_detail TD
         left join db.transaction_legislation TL on
        TD.id = TL.transaction
where legislation = (
    select L.id
    from db.legislation L
    where L.name = '2019 HB 2042'
)
order by TD.id;

drop table pg_temp.tmp_trans_detail;

-- 2019 Sale Date Requirement
create temp table tmp_trans_detail as
select
            row_number() over () as id,
            (
                select id
                from db.legislation_requirement_code LRC
                where LRC.name = 'Sale Date Requirement'
            ) as LRC,
            "Meets 2019 HB 2042 Sale Date Requirement" as LRV,
            (
                select id
                from db.legislation_requirement_details_code LRDC
                where LRDC.name = 'Purchase Date Requirement'
            ) as LRDC,
            LRDV.id as LRDV
from public."Electric_Vehicle_Title_and_Registration_Activity" EVTaRA
         left join db.legislation_requirement_details_values LRDV on
            EVTaRA."2019 HB 2042: Purchase Date Requirement" = LRDV.name or
            (EVTaRA."2019 HB 2042: Purchase Date Requirement" isnull AND LRDV.name isnull)
order by "DOL Vehicle ID";

insert into db.transaction_legislation_detail
(
    transaction_legislation,
    legislation_requirement_code,
    legislation_requirement_value,
    legislation_requirement_details_code,
    legislation_requirement_details_value
)
select
    TL.id,
    TD.LRC,
    TD.LRV::boolean,
    TD.LRDC,
    TD.LRDV
from tmp_trans_detail TD
         left join db.transaction_legislation TL on
        TD.id = TL.transaction
where legislation = (
    select L.id
    from db.legislation L
    where L.name = '2019 HB 2042'
)
order by TD.id;

drop table pg_temp.tmp_trans_detail;

-- 2019 Sale Date Requirement
create temp table tmp_trans_detail as
select
    row_number() over () as id,
    (
        select id
        from db.legislation_requirement_code LRC
        where LRC.name = 'S ale Price/Value Requirement'
    ) as LRC,
    "Meets 2019 HB 2042 Sale Date Requirement" as LRV,
    (
        select id
        from db.legislation_requirement_details_code LRDC
        where LRDC.name = 'Sale Price/Value Requirement'
    ) as LRDC,
    LRDV.id as LRDV
from public."Electric_Vehicle_Title_and_Registration_Activity" EVTaRA
left join db.legislation_requirement_details_values LRDV on
    EVTaRA."2019 HB 2042: Sale Price/Value Requirement" = LRDV.name or
    (EVTaRA."2019 HB 2042: Sale Price/Value Requirement" isnull AND LRDV.name isnull)
order by "DOL Vehicle ID";

insert into db.transaction_legislation_detail
(
    transaction_legislation,
    legislation_requirement_code,
    legislation_requirement_value,
    legislation_requirement_details_code,
    legislation_requirement_details_value
)
select
    TL.id,
    TD.LRC,
    TD.LRV::boolean,
    TD.LRDC,
    TD.LRDV
from tmp_trans_detail TD
left join db.transaction_legislation TL on
    TD.id = TL.transaction
where legislation = (
    select L.id
    from db.legislation L
    where L.name = '2019 HB 2042'
)
order by TD.id;