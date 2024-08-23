/*
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7880. Round your answer to 4 decimal places.
*/
select
    round(min(Lat_n),4) as smallest
from station
where lat_n > 38.7780;
