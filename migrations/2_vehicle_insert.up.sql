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

-- Vehicle insert
create temp table tmp_vehicle as
select distinct on (PV."DOL Vehicle ID")
    PV,"DOL Vehicle ID",
    PV."VIN (1-10)",
    VT.id as VType,
    VM.id as Vmodel,
    PV."Model Year",
    PV."Electric Range",
    PV."Base MSRP"
from public."Electric_Vehicle_Title_and_Registration_Activity" PV
inner join db.vehicle_type VT on PV."Clean Alternative Fuel Vehicle Type" = VT.name
inner join db.vehicle_model VM on PV."Model" = VM.name
order by "DOL Vehicle ID";

insert into db.vehicle
(dol_id, vin, type, model, model_year, electric_range, base_msrp)
select "DOL Vehicle ID", "VIN (1-10)", VType, Vmodel, "Model Year", "Electric Range", "Base MSRP"
from tmp_vehicle TV;

drop table tmp_vehicle;
