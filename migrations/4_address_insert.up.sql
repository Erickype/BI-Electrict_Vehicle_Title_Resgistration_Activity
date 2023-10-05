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