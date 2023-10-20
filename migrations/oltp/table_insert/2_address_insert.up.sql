-- Country
insert into db.country (name)
select distinct "County"
from public."Electric_Vehicle_Title_and_Registration_Activity";

-- City
insert into db.city (name)
select distinct "City"
from public."Electric_Vehicle_Title_and_Registration_Activity"
order by "City";

-- state
insert into db.state (name)
select distinct "State of Residence"
from public."Electric_Vehicle_Title_and_Registration_Activity"
order by "State of Residence";

                --Address--
--not nulls
create temp table tmp_address as
select distinct on ("Postal Code")
    "County",
    "City",
    "State of Residence",
    "Postal Code"
from public."Electric_Vehicle_Title_and_Registration_Activity" EVTaRA
where "Postal Code" is not null
order by "Postal Code";

insert into db.address (postalcode, country, city, state)
select
    "Postal Code",
    C.id as country,
    cy.id as city,
    s.id as state
from tmp_address TAdd
left join db.country C on
    TAdd."County" = C.name or (TAdd."County" isnull AND C.name isnull)
left join db.city cy on
    TAdd."City" = cy.name or (TAdd."City" isnull AND cy.name isnull)
left join db.state s on
    TAdd."State of Residence" = s.name or
    (TAdd."State of Residence" isnull AND s.name isnull)
order by "Postal Code";

drop table tmp_address;

-- nulls
create table address_nulls as
select distinct
    "County",
    "City",
    "State of Residence",
    "Postal Code"
from public."Electric_Vehicle_Title_and_Registration_Activity"
where "Postal Code" isnull;