-- DimVehicleType
insert into dw.dimvehicletype (id, name)
select id, name
from db.vehicle_type;