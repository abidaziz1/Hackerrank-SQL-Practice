/*
Consider  p1(a,c) and p2(b,d)  to be two points on a 2D plane.

 a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 b happens to equal the max value in Northern Longitude (LAT_N in STATION).
c  happens to equal the minimum value in Western Latitude (LONG_W in STATION).
 d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the eucladian Distance between points p1 and p2 and round it to a scale of  4decimal places.
*/
SELECT ROUND(SQRT(POW((MAX(LAT_N) - MIN(LAT_N)), 2) + POW((MAX(LONG_W) - MIN(LONG_W)), 2)), 4) AS euclidean_distance
FROM STATION;
