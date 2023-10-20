create table db.Fess(
    transaction integer,
    electric_vehicle text,
    transportation_electrification text,
    hybrid_vehicle text
);

alter table db.Fess
add constraint fk_transaction
foreign key (transaction)
references db.transactions (id);