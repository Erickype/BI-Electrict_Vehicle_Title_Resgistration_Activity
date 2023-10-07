create table Exception_Eligibility_Codes(
    id serial primary key,
    name text
);

create table Legislation(
    id serial primary key,
    name text
);

create table Legislation_Requirement_Code(
    id serial primary key,
    legislation integer,
    name text
);

create table Legislation_Requirement_Details_Code(
     id serial primary key,
     legislation integer,
     name text
);

create table Transaction_Legislation(
    id serial primary key,
    legislation integer,
    exception_eligibility integer
);

create table Transaction_Legislation_Detail(
    transaction_legislation integer,
    legislation_requirement_code integer,
    legislation_requirement_details_code integer
);