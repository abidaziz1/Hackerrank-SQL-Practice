"""Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. (Both conditions must be true)"""
SELECT 
  DISTINCT CITY 
  FROM STATION 
  WHERE UPPER(SUBSTR(CITY, 1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U') 
  AND UPPER(SUBSTR(CITY, -1)) NOT IN ('A', 'E', 'I', 'O', 'U');
