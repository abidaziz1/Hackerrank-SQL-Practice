/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns. 
*/
SELECT COUNTRY.Continent, 
       FLOOR(AVG(CITY.Population)) AS AvgCityPopulation
FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;
/*
1. JOIN Operation:
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code:
This is an INNER JOIN operation that combines rows from the CITY and COUNTRY tables.
It uses the CountryCode from the CITY table and matches it with the Code from the COUNTRY table.
This join ensures that for each city in the CITY table, we can find the corresponding country in the COUNTRY table. Once matched, we can access columns from both tables.
2. SELECT Clause:
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population)) AS AvgCityPopulation:
COUNTRY.Continent: After the join, this refers to the continent of the country where the city is located.
FLOOR(AVG(CITY.Population)) AS AvgCityPopulation:
AVG(CITY.Population): This calculates the average population of cities within each continent.
FLOOR(): This function rounds down the average population to the nearest integer.
AS AvgCityPopulation: This assigns a name to the resulting column that shows the rounded average city population for each continent.
3. GROUP BY Clause:
GROUP BY COUNTRY.Continent:
This clause groups the result set by each continent. It means that the query will calculate the average city population for each continent separately.
Without GROUP BY, the AVG() function would calculate the average across all cities in the dataset, not by continent.
4. Result:
The result is a list of continents along with the average city population for cities within those continents, rounded down to the nearest integer.
Example:
Let's say you have data like this:

COUNTRY Table:

Code	Name	Continent
USA	United States	North America
CAN	Canada	North America
BRA	Brazil	South America
CITY Table:

Name	CountryCode	Population
New York	USA	8000000
Los Angeles	USA	4000000
Toronto	CAN	2800000
Rio de Janeiro	BRA	6000000
The query will join these tables on CountryCode and Code.
Then, it groups the data by Continent (e.g., North America, South America).
For each group (continent), it calculates the average population of the cities.
Finally, it rounds down the average to the nearest integer using FLOOR().
The output could be something like this:

Continent	AvgCityPopulation
North America	4933333
South America	6000000
*/
