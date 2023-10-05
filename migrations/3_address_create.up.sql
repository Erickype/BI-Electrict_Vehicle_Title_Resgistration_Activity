-- Country table creation
create table db.country(
    id serial primary key,
    name text
);

-- City
create table db.city(
    id serial primary key,
    name text
);

-- State
create table db.state(
    id serial primary key,
    name text
);

-- Address
create table db.address(
    postalCode integer primary key,
    country integer,
    city integer,
    state integer
);

-- Address constraints
alter table db.address
add constraint fk_country
foreign key (country)
references db.country (id);

alter table db.address
add constraint fk_city
foreign key (city)
references db.city (id);

alter table db.address
add constraint fk_state
foreign key (state)
references db.state (id);