-- FactRegistrationCleanAlternative
alter table dw.factregistrationcleanalternative
add constraint fk_vehicleType
foreign key (vehicletype)
references dw.dimvehicletype (id);

alter table dw.factregistrationcleanalternative
add constraint fk_date
foreign key (date)
references dw.dimdate (date);

alter table dw.factregistrationcleanalternative
add constraint fk_vehicleMake
foreign key (vehiclemake)
references dw.dimvehiclemake (id);

alter table dw.factregistrationcleanalternative
add constraint fk_vehicleModel
foreign key (vehiclemodel)
references dw.dimvehiclemodel (id);

alter table dw.factregistrationcleanalternative
add constraint fk_vehiclePrimaryUse
foreign key (vehicleprimaryuse)
references dw.dimvehicleprimaryuse (id);

-- FactLegislationRequirement

alter table dw.factlegislationrequirement
add constraint fk_vehicleMake
foreign key (vehiclemake)
references dw.dimvehiclemake (id);

alter table dw.factlegislationrequirement
add constraint fk_vehicleModel
foreign key (vehiclemodel)
references dw.dimvehiclemodel (id);

alter table dw.factlegislationrequirement
add constraint fk_modelDate
foreign key (modeldate)
references dw.dimmodeldate (date);

alter table dw.factlegislationrequirement
add constraint fk_vehicleType
foreign key (vehicletype)
references dw.dimvehicletype (id);