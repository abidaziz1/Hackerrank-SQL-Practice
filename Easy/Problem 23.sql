/*
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  4 decimal places.
*/
WITH Ordered_Latitudes AS (
    SELECT LAT_N
    FROM STATION
    ORDER BY LAT_N
),
Row_Numbered AS (
    SELECT LAT_N, ROW_NUMBER() OVER () AS RowNum, COUNT(*) OVER () AS TotalRows
    FROM Ordered_Latitudes
)
SELECT ROUND(
    CASE
        WHEN TotalRows % 2 = 1 THEN -- Odd number of rows
            (SELECT LAT_N FROM Row_Numbered WHERE RowNum = (TotalRows + 1) / 2)
        ELSE -- Even number of rows
            (SELECT AVG(LAT_N) FROM Row_Numbered WHERE RowNum IN (TotalRows / 2, (TotalRows / 2) + 1))
    END, 4) AS Median_LAT_N
FROM Row_Numbered
LIMIT 1;
