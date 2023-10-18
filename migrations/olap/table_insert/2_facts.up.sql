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
