-- FactRegistrationCleanAlternative
WITH Counts AS (
    SELECT
        V.type,
        T.dol_transaction_date,
        VM.vehicle_make,
        V.model,
        T.vehicle_primary_use,
        COUNT(V.dol_id) AS vehicleRegistrationNumber
    FROM db.vehicle V
        LEFT JOIN db.vehicle_model VM ON V.model = VM.id
        join db.transactions T on V.dol_id = T.dol_vehicle_id
    GROUP BY
        V.type,
        VM.vehicle_make,
        V.model,
        T.vehicle_primary_use,
        T.dol_transaction_date
    order by T.dol_transaction_date
)

SELECT
    C.type,
    C.dol_transaction_date,
    C.vehicle_make,
    C.model,
    C.vehicle_primary_use,
    C.vehicleRegistrationNumber,
    (C.vehicleRegistrationNumber * 100.0) / NULLIF(sum(C.vehicleRegistrationNumber) over(), 0) AS percentage
FROM Counts C;

-- FactLegislationRequirement
WITH Subquery AS (
    SELECT
        VM.vehicle_make,
        V.model,
        to_date(V.model_year::text, 'YYYY') as modelDate,
        T.dol_transaction_date,
        V.type,
        TLD.legislation_requirement_code,
        count(CASE WHEN TLD.legislation_requirement_value = true THEN 1 ELSE 0 END) AS sum_legislation_requirement_value,
        V.base_msrp,
        V.electric_range
    FROM db.transaction_legislation_detail TLD
             JOIN db.transaction_legislation TL ON TLD.transaction_legislation = TL.id
             JOIN db.transactions T ON TL.transaction = T.id
             JOIN db.vehicle V ON T.dol_vehicle_id = V.dol_id
             JOIN db.vehicle_model VM ON V.model = VM.id
    WHERE TL.legislation = 2
    GROUP BY VM.vehicle_make, V.model, modelDate, TL.legislation, T.dol_transaction_date,
             TLD.legislation_requirement_code,
             V.base_msrp, V.electric_range, V.type
)
SELECT
    vehicle_make as vehicleMake,
    model as vehicleModel,
    modelDate as modelDate,
    dol_transaction_date as transactionDate,
    type as vehicleType,
    MAX(sum_legislation_requirement_value) asrequirementsNumberMeet,
    base_msrp as modelPrice,
    electric_range as electricRange
FROM Subquery
GROUP BY
    vehicle_make, model, modelDate, dol_transaction_date,
    type, base_msrp, electric_range
ORDER BY dol_transaction_date;
