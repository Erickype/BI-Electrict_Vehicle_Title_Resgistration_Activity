create table db.Exception_Eligibility_Codes(
    id serial primary key,
    name text
);

create table db.Legislation(
    id serial primary key,
    name text
);

create table db.Legislation_Requirement_Code(
    id serial primary key,
    legislation integer,
    name text
);

create table db.Legislation_Requirement_Details_Code(
     id serial primary key,
     legislation integer,
     name text
);

create table db.Transaction_Legislation(
    id serial primary key,
    legislation integer,
    exception_eligibility integer
);

create table db.Transaction_Legislation_Detail(
    transaction_legislation integer,
    legislation_requirement_code integer,
    legislation_requirement_details_code integer
);

alter table db.Legislation_Requirement_Code
add constraint fk_legislation
foreign key (legislation)
references db.legislation (id);