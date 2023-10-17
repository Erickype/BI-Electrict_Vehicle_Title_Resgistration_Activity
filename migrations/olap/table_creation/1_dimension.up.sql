-- Dimensions

create table dw.DimVehicleType(
    id integer primary key,
    name text
);

create table dw.DimDate(
    date date primary key
);

create table dw.DimVehicleMake(
    id integer primary key,
    name text
);

create table dw.DimVehicleModel(
    id integer primary key,
    name text
);

create table dw.DimModelDate(
    date date
);

create table dw.DimVehiclePrimaryUse(
    id integer primary key,
    name text
);