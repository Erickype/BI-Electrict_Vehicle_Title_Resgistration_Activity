-- DimVehicleType
select id, name
from db.vehicle_type;

-- DimDate
select distinct dol_transaction_date
from db.transactions
order by dol_transaction_date;