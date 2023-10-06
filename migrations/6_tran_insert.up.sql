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

insert into db.transactions
    (dol_vehicle_id,
     vehicle_primary_use,
     odometer_reading,
     odometer_code,
     new_or_used,
     sale_price,
     sale_date,
     transaction_type,
     dol_transaction_date,
     postal_code)
select
    TT."DOL Vehicle ID",
    VH.id as VehicleUse,
    TT."Odometer Reading",
    OC.id as OdometerCode,
    TT."New or Used Vehicle",
    TT."Sale Price",
    to_date(TT."Sale Date",'Month DD YYYY') as SaleDate,
    TTy.id as TransType,
    to_date(TT."DOL Transaction Date", 'Month DD YYYY') as DolTransationDate,
    TT."Postal Code"
from tmp_tran TT
left join db.vehicle_uses VH on
    TT."Vehicle Primary Use" = VH.name
left join db.odometer_codes OC on
    TT."Odometer Code" = OC.name
left join db.transaction_types TTy on
    TT."Transaction Type" = TTy.name
order by TT."DOL Vehicle ID";