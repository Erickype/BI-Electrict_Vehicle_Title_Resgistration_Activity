select distinct
    "2015 HB 2778 Exemption Eligibility",
    "2019 HB 2042 Clean Alternative Fuel Vehicle (CAFV) Eligibility"
from public."Electric_Vehicle_Title_and_Registration_Activity";

select
    "DOL Vehicle ID",
    "Odometer Reading",
    "Odometer Code",
    "New or Used Vehicle",
    "Sale Price", "Sale Date",
    "Transaction Type",
    to_date("DOL Transaction Date", 'Month DD YYYY') as DOL_trans_date,
    "2015 HB 2778 Exemption Eligibility" as "2015 1",

    "2019 HB 2042 Clean Alternative Fuel Vehicle (CAFV) Eligibility" as "2019 2",

    "Meets 2019 HB 2042 Electric Range Requirement" as "M2019 SaleR",
    "Meets 2019 HB 2042 Sale Date Requirement" as "M2019 SaleD",
    "Meets 2019 HB 2042 Sale Price/Value Requirement" as "M2019 PV",

    "2019 HB 2042: Battery Range Requirement" as "2019 BR",
    "2019 HB 2042: Purchase Date Requirement" as "2019 PD",
    "2019 HB 2042: Sale Price/Value Requirement" as "2019 PV"
from public."Electric_Vehicle_Title_and_Registration_Activity"
where "DOL Vehicle ID" in (205708100)
order by DOL_trans_date;

select distinct "2015 HB 2778 Exemption Eligibility"
from public."Electric_Vehicle_Title_and_Registration_Activity";

select distinct "2019 HB 2042 Clean Alternative Fuel Vehicle (CAFV) Eligibility"
from public."Electric_Vehicle_Title_and_Registration_Activity";

select distinct "2019 HB 2042: Battery Range Requirement"
from public."Electric_Vehicle_Title_and_Registration_Activity";

select distinct "2019 HB 2042: Purchase Date Requirement"
from public."Electric_Vehicle_Title_and_Registration_Activity";

select distinct "2019 HB 2042: Sale Price/Value Requirement"
from public."Electric_Vehicle_Title_and_Registration_Activity";

select
from information_schema.columns
where table_name = 'Electric_Vehicle_Title_and_Registration_Activity' and
      column_name = '2015 HB 2778 Exemption Eligibility'