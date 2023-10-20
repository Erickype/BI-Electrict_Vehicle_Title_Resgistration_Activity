-- Exception_Eligibility_Codes
insert into db.exception_eligibility_codes (name)
SELECT DISTINCT "2015 HB 2778 Exemption Eligibility" AS eligibility
FROM public."Electric_Vehicle_Title_and_Registration_Activity"
UNION
SELECT DISTINCT "2019 HB 2042 Clean Alternative Fuel Vehicle (CAFV) Eligibility"
FROM public."Electric_Vehicle_Title_and_Registration_Activity";

-- Legislation
insert into db.legislation (name)
values ('2015 HB 2778');
insert into db.legislation (name)
values ('2019 HB 2042');

-- Legislation requirement codes (just have '2019 HB 2042')
insert into db.legislation_requirement_code (legislation, name)
select id, 'Electric Range Requirement'
from db.legislation
where name = '2019 HB 2042';

insert into db.legislation_requirement_code (legislation, name)
select id, 'Sale Date Requirement'
from db.legislation
where name = '2019 HB 2042';

insert into db.legislation_requirement_code (legislation, name)
select id, 'Sale Price/Value Requirement'
from db.legislation
where name = '2019 HB 2042';

-- Legislation_Requirement_Details_Code
insert into db.Legislation_Requirement_Details_Code (legislation_requirement, name)
select LRC.id, 'Battery Range Requirement'
from db.legislation_requirement_code LRC
inner join db.legislation L on
    LRC.legislation = L.id
where L.name = '2019 HB 2042' and LRC.name = 'Electric Range Requirement';

insert into db.Legislation_Requirement_Details_Code (legislation_requirement, name)
select LRC.id, 'Purchase Date Requirement'
from db.legislation_requirement_code LRC
         inner join db.legislation L on
        LRC.legislation = L.id
where L.name = '2019 HB 2042' and LRC.name = 'Sale Date Requirement';

insert into db.Legislation_Requirement_Details_Code (legislation_requirement, name)
select LRC.id, 'Sale Price/Value Requirement'
from db.legislation_requirement_code LRC
         inner join db.legislation L on
        LRC.legislation = L.id
where L.name = '2019 HB 2042' and LRC.name = 'Sale Price/Value Requirement';

-- Legislation transactions
        -- 2015
insert into db.transaction_legislation (transaction, legislation, exception_eligibility)
select
    row_number() over () as transaction,
    (
        select L.id
        from db.legislation L
        where L.name = '2015 HB 2778'
    ) as legislation,
    EEC.id as exception_eligibility
from public."Electric_Vehicle_Title_and_Registration_Activity" EVTaRA
left join db.exception_eligibility_codes EEC on
    EVTaRA."2015 HB 2778 Exemption Eligibility" = EEC.name
order by "DOL Vehicle ID";

-- 2019
insert into db.transaction_legislation (transaction, legislation, exception_eligibility)
select
    row_number() over () as transaction,
    (
        select L.id
        from db.legislation L
        where L.name = '2019 HB 2042'
    ) as legislation,
    EEC.id as exception_eligibility
from public."Electric_Vehicle_Title_and_Registration_Activity" EVTaRA
left join db.exception_eligibility_codes EEC on
    EVTaRA."2019 HB 2042 Clean Alternative Fuel Vehicle (CAFV) Eligibility" = EEC.name
order by "DOL Vehicle ID";

-- LegislationRequirementValues
insert into db.legislation_requirement_details_values (name)
select distinct
    "2019 HB 2042: Battery Range Requirement"
from public."Electric_Vehicle_Title_and_Registration_Activity"
union
select distinct
    "2019 HB 2042: Purchase Date Requirement"
from public."Electric_Vehicle_Title_and_Registration_Activity"
union
select distinct
    "2019 HB 2042: Sale Price/Value Requirement"
from public."Electric_Vehicle_Title_and_Registration_Activity";
