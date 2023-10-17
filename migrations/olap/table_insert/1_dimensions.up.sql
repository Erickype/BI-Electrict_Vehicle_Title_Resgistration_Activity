-- DimVehicleType
select id, name
from db.vehicle_type;

-- DimDate
select distinct dol_transaction_date
from db.transactions
order by dol_transaction_date;

-- DimVehicleMake
select id, name
from db.vehicle_make;

-- DimVehicleModel
select id, name
from db.vehicle_model;

-- DimModelDate
select distinct on (model_year)
    to_date(model_year::text, 'YYYY') as date
from db.vehicle
order by model_year;
