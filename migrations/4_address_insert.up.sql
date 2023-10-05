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