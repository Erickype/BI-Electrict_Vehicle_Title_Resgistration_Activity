create table db.vehicle_uses(
    id serial primary key,
    name text
);

create table db.odometer_codes(
    id serial primary key,
    name text
);

create table db.transaction_types(
    id serial primary key,
    name text
);

create table db.transactions(
    id integer primary key ,
    dol_vehicle_id integer,
    vehicle_primary_use integer,
    odometer_reading integer,
    odometer_code integer,
    new_or_used text,
    sale_price numeric,
    sale_date date,
    transaction_type integer,
    dol_transaction_date date,
    postal_code integer
);

alter table db.transactions
add constraint fk_dol_vehicle_id
foreign key (dol_vehicle_id)
references db.vehicle (dol_id);

alter table db.transactions
add constraint fk_vehicle_primary_use
foreign key (vehicle_primary_use)
references db.vehicle_uses (id);

alter table db.transactions
add constraint fk_odometer_code
foreign key (odometer_code)
references db.odometer_codes (id);

alter table db.transactions
add constraint fk_transaction_type
foreign key (transaction_type)
references db.transaction_types (id);

alter table db.transactions
add constraint fk_postal_code
foreign key (postal_code)
references db.address (postalcode);