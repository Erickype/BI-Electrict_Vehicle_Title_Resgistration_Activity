select
    VM.id as VehicleMakeId, VM.name as VehicleMakeName,
    VMo.id as VehicleModelId, VMo.name as VehicleModelName,
    VT.id as VehicleTypeId, VT.name as VehicleTypeName,
    F.modeldate as VehicleModelDate,
    F.transactiondate,
    F.requirementsnumbermeet,
    F.modelprice,
    F.electricrange
from dw.factlegislationrequirement F
left join dw.dimvehiclemake VM on F.vehiclemake = VM.id
left join dw.dimvehiclemodel VMo on F.vehiclemodel = VMo.id
left join dw.dimvehicletype VT on F.vehicletype = VT.id;