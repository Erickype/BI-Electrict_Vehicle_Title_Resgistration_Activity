create table vehicle_uses(
    id serial primary key,
    name text
);

create table odometer_codes(
    id serial primary key,
    name text
);

create table transaction_types(
    id serial primary key,
    name text
);

create table db.transactions(
    dol_vehicle_id integer,
    vehicle_primary_use integer,
    odometer_reading integer,
    odometer_code integer,
    new_or_used text,
    sale_price numeric,
    transaction_type integer,
    dol_transaction_date date
);