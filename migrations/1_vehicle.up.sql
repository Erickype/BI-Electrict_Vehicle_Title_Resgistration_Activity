create table db.vehicle_type(
    id serial primary key ,
    name text
);

create table db.vehicle_make(
    id serial primary key ,
    name text
);

create table db.vehicle_model(
    id serial primary key,
    vehicle_make integer,
    name text
);

create table db.vehicle(
    dol_vehicle_id integer primary key,
    vin text,
    vehicle_type integer,
    model integer,
    model_year integer,
    electric_range numeric
)