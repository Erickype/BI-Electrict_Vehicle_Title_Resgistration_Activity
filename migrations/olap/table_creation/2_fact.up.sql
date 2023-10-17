create table dw.FactRegistrationCleanAlternative(
    vehicleType integer,
    date date,
    vehicleMake integer,
    vehicleModel integer,
    vehiclePrimaryUser integer,
    vehicleRegistrationNumber integer,
    registrationPercentage numeric
);

create table dw.FactLegislationRequirement(
    vehicleMake integer,
    vehicleModel integer,
    modelDate date,
    vehicleType integer,
    requirementsNumberMeet integer,
    modelPrice numeric,
    electricRange numeric
);