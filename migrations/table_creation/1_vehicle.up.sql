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
    dol_id integer primary key,
    vin text,
    type integer,
    model integer,
    model_year integer,
    electric_range numeric,
    base_msrp numeric
);

ALTER TABLE db.vehicle_model
ADD CONSTRAINT fk_vehicle_make
FOREIGN KEY (vehicle_make)
REFERENCES db.vehicle_make (id);

ALTER TABLE db.vehicle
ADD CONSTRAINT fk_vehicle_model
FOREIGN KEY (model)
REFERENCES db.vehicle_model (id);

ALTER TABLE db.vehicle
ADD CONSTRAINT fk_vehicle_type
FOREIGN KEY (type)
REFERENCES db.vehicle_type (id);
