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
     legislation_requirement integer,
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
    legislation_requirement_value boolean,
    legislation_requirement_details_code integer
);

-- Legislation
alter table db.Legislation_Requirement_Code
add constraint fk_legislation
foreign key (legislation)
references db.legislation (id);

alter table db.Legislation_Requirement_Details_Code
add constraint fk_legislation_requirement
foreign key (legislation_requirement)
references db.Legislation_Requirement_Code (id);

-- Legislation transaction
alter table db.Transaction_Legislation
add constraint fk_legislation
foreign key (legislation)
references db.legislation (id);

alter table db.Transaction_Legislation
add constraint fk_exception_eligibility
foreign key (exception_eligibility)
references db.Exception_Eligibility_Codes (id);

-- Legislation trans detail
alter table db.Transaction_Legislation_Detail
add constraint fk_transaction_legislation
foreign key (transaction_legislation)
references db.Transaction_Legislation (id);

alter table db.Transaction_Legislation_Detail
add constraint fk_legislation_requirement_code
foreign key (legislation_requirement_code)
references db.Legislation_Requirement_Code (id);

alter table db.Transaction_Legislation_Detail
add constraint fk_legislation_requirement__details_code
foreign key (legislation_requirement_details_code)
references db.Legislation_Requirement_Details_Code (id);