-- Country
insert into db.country (name)
select distinct "County"
from public."Electric_Vehicle_Title_and_Registration_Activity";

-- City
create temp table tmp_city as
select distinct on ("City")
    "County", "City"
from public."Electric_Vehicle_Title_and_Registration_Activity";

insert into db.city (country, name)
select
    C.id, TC."City"
from tmp_city TC
left join db.country C on
    TC."County" = C.name OR (TC."County" IS NULL AND C.name IS NULL)
order by C.id;

-- state
create temp table tmp_state as
select distinct on ("State of Residence")
    "City", "State of Residence"
from public."Electric_Vehicle_Title_and_Registration_Activity"
order by "State of Residence";

insert into db.state (city, name)
select
    C.id,
    TS."State of Residence"
from tmp_state TS
left join db.city C on
    TS."City" = C.name or (TS."City" isnull and C.name isnull)
order by Ts."State of Residence";