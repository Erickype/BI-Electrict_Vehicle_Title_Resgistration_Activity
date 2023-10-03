-- Vehicle type insert
CREATE TEMP TABLE temp_table AS
SELECT DISTINCT "Clean Alternative Fuel Vehicle Type"
FROM public."Electric_Vehicle_Title_and_Registration_Activity"
ORDER BY "Clean Alternative Fuel Vehicle Type";

-- Insert the data from the temporary table into your destination table
INSERT INTO db.vehicle_type (name)
SELECT "Clean Alternative Fuel Vehicle Type"
FROM temp_table;

-- Optionally, you can drop the temporary table when you're done with it
DROP TABLE temp_table;
