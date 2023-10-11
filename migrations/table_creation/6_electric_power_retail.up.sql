create table db.Electric_Power_Retail(
    transaction integer,
    service text
);

alter table db.Electric_Power_Retail
add constraint fk_transaction
foreign key (transaction)
references db.transactions (id);