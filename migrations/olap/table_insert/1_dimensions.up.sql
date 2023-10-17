-- DimVehicleType
insert into dw.dimvehicletype (id, name)
select id, name
from db.vehicle_type;

-- DimDate
insert into dw.dimdate(date)
select distinct dol_transaction_date
from db.transactions
order by dol_transaction_date;