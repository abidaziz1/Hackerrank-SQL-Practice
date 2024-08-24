/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
select city.name
from city
join country on city.countrycode=country.code
where country.continent='Africa';
/*
Tables Overview:
CITY Table:

This table contains information about various cities.
Important columns for this query:
Name: The name of the city.
CountryCode: A code that represents the country the city is in. This column will be used to link to the COUNTRY table.
COUNTRY Table:

This table contains information about various countries.
Important columns for this query:
Code: The unique code for each country (matches with CITY.CountryCode).
Continent: The continent where the country is located.
What is a JOIN Operation?
A JOIN operation is used in SQL to combine rows from two or more tables based on a related column between them.
There are different types of joins (e.g., INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN), but here we're using a basic INNER JOIN.
How the JOIN Operation Works in This Query:
Matching Rows:

The JOIN clause in this query matches rows between the CITY and COUNTRY tables based on a common column. Here, the common column is CountryCode in the CITY table and Code in the COUNTRY table.
The SQL engine looks for rows where the CountryCode in the CITY table matches the Code in the COUNTRY table.
Filtering Rows:

Once the matching rows are found, the WHERE clause filters these rows further. In this case, it filters to include only those rows where the Continent in the COUNTRY table is 'Africa'.
Selecting Columns:

Finally, the SELECT clause specifies which columns you want in the result. Here, you're selecting the Name column from the CITY table.
Step-by-Step Execution:
Step 1: Create a Combined Table:

The JOIN clause first creates a temporary combined table. This table has all the columns from both CITY and COUNTRY tables for rows where CITY.CountryCode = COUNTRY.Code.
For example:
CITY.Name	CITY.CountryCode	COUNTRY.Code	COUNTRY.Continent
Cairo	EGY	EGY	Africa
Nairobi	KEN	KEN	Africa
Tokyo	JPN	JPN	Asia
Only rows where CountryCode matches Code are included.
Step 2: Filter Rows:

The WHERE clause is applied to this combined table, filtering out rows where Continent is not 'Africa'.
The filtered result might look like:
CITY.Name	CITY.CountryCode	COUNTRY.Code	COUNTRY.Continent
Cairo	EGY	EGY	Africa
Nairobi	KEN	KEN	Africa
Step 3: Select the Desired Columns:

The SELECT clause picks the Name column from this filtered table. The final result set will contain just the names of the cities:
Name
Cairo
Nairobi
Result:
The query returns the names of all cities that are located in countries on the continent of Africa.
Why Use JOIN?
JOIN operations are powerful because they allow you to combine related data spread across multiple tables, enabling you to query complex datasets in a relational database.
Visualizing the Join:
Imagine the CITY and COUNTRY tables as two separate datasets:

The CITY table has a column that refers to the country the city is in, but it doesn't directly have the continent information.
The COUNTRY table has the continent information but no details about the individual cities.
*/
