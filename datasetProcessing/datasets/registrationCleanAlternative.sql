select
    VT.name as vehicleType,
    F.date as transactionDate,
    VM.name as vehicleMake,
    VMO.name as vehicleModel,
    VP.name as vehiclePrimaryUse,
    F.vehicleregistrationnumber,
    F.registrationpercentage
    VM.id as label
from dw.factregistrationcleanalternative F
left join dw.dimvehicletype VT on F.vehicletype = VT.id
left join dw.dimvehiclemake VM on F.vehiclemake = VM.id
left join dw.dimvehiclemodel VMO on f.vehiclemodel = VMO.id
left join dw.dimvehicleprimaryuse VP ON F.vehicleprimaryuse = VP.id;