select
    VT.name as vehicleType,
    F.date as transactionDate,
    VM.name as vehicleMake,
    VMO.name as vehicleModel,
    VP.name as vehiclePrimaryUse,
    F.vehicleregistrationnumber,
    F.registrationpercentage
from dw.factregistrationcleanalternative F
left join dw.dimvehicletype VT on F.vehicletype = VT.id
left join dw.dimvehiclemake VM on F.vehiclemake = VM.id
left join dw.dimvehiclemodel VMO on f.vehiclemodel = VMO.id
left join dw.dimvehicleprimaryuse VP on F.vehicleprimaryuse = VP.id;