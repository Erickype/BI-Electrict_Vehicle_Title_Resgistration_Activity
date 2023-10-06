-- Vehicle uses
insert into db.vehicle_uses (name)
select distinct "Vehicle Primary Use"
from public."Electric_Vehicle_Title_and_Registration_Activity"
order by "Vehicle Primary Use";

-- Odometer codes
insert into db.odometer_codes (name)
select distinct "Odometer Code"
from public."Electric_Vehicle_Title_and_Registration_Activity"
order by "Odometer Code";

-- Transaction types
insert into db.transaction_types (name)
select distinct "Transaction Type"
from public."Electric_Vehicle_Title_and_Registration_Activity"
order by "Transaction Type";

-- Transactions
create temp table tmp_tran as
select
    "DOL Vehicle ID",
    "Vehicle Primary Use",
    "Odometer Reading",
    "Odometer Code",
    "New or Used Vehicle",
    "Sale Price",
    "Sale Date",
    "Transaction Type",
    "DOL Transaction Date",
    "Postal Code"
from public."Electric_Vehicle_Title_and_Registration_Activity"
order by "DOL Vehicle ID";