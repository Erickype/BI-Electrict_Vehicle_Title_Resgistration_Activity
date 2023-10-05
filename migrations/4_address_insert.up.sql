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