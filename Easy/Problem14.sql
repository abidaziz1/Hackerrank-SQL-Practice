/*Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of  2 decimal places.
The sum of all values in LONG_W rounded to a scale of  2 decimal places.*/
SELECT 
    ROUND(SUM(LAT_N), 2) AS Sum_Lat_N,
    ROUND(SUM(LONG_W), 2) AS Sum_Long_W
FROM 
    STATION;
