-- Country table creation
create table db.country(
    id serial primary key,
    name text
);

-- City
create table db.city(
    id serial primary key,
    country integer,
    name text
);

-- State
create table db.state(
    id serial primary key,
    city integer,
    name text
);

-- Address
create table db.address(
    postalCode integer primary key,
    country integer,
    city integer,
    state integer
);