-- Vehicle type insert
CREATE TEMP TABLE temp_table AS
SELECT DISTINCT "Clean Alternative Fuel Vehicle Type"
FROM public."Electric_Vehicle_Title_and_Registration_Activity"
ORDER BY "Clean Alternative Fuel Vehicle Type";

-- Insert the data from the temporary table into your destination table
INSERT INTO db.vehicle_type (name)
SELECT "Clean Alternative Fuel Vehicle Type"
FROM temp_table;

-- Optionally, you can drop the temporary table when you're done with it
DROP TABLE temp_table;

-- Vehicle make insert
create temp table tmp_vehicle_make as
select distinct "Make"
from public."Electric_Vehicle_Title_and_Registration_Activity"
order by "Make";

insert into db.vehicle_make (name)
select "Make"
from tmp_vehicle_make;

drop table tmp_vehicle_make;

-- Vehicle model insert
create temp table tmp_vehicle_model as
select distinct "Make", "Model"
from public."Electric_Vehicle_Title_and_Registration_Activity"
order by "Model";

insert into db.vehicle_model (vehicle_make, name)
select VMake.id, tmp_vehicle_model."Model"
from tmp_vehicle_model
inner join db.vehicle_make VMake on tmp_vehicle_model."Make" = VMake.name;

drop table tmp_vehicle_model;