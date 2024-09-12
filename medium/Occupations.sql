/*
SQL Query Explanation:
We will use a row numbering technique to align the names across different occupations row by row. In SQL, this can be achieved using ROW_NUMBER() function, which assigns a unique row number to each name within its occupation group.

Here’s the step-by-step process:

Use the ROW_NUMBER() function to assign a number to each name within its occupation group.
Order the names alphabetically within each occupation.
Pivot the result so that each row contains names of Doctors, Professors, Singers, and Actors.
Fill missing values with NULL.
*/

SELECT 
    MAX(CASE WHEN occupation = 'Doctor' THEN name ELSE NULL END) AS Doctor,
    MAX(CASE WHEN occupation = 'Professor' THEN name ELSE NULL END) AS Professor,
    MAX(CASE WHEN occupation = 'Singer' THEN name ELSE NULL END) AS Singer,
    MAX(CASE WHEN occupation = 'Actor' THEN name ELSE NULL END) AS Actor
FROM (
    SELECT name, occupation, 
           ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_num
    FROM OCCUPATIONS
) AS temp
GROUP BY row_num
ORDER BY row_num;
/*
Explanation:
ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name): This assigns a row number to each name within its occupation group, ordered alphabetically by name.

PARTITION BY occupation: This groups the names by occupation.
ORDER BY name: This sorts the names within each occupation alphabetically.
Subquery (temp): The result of the above ROW_NUMBER() is stored in a temporary table (or CTE in some databases), and now each name has a row number associated with it.

Pivoting the Result:

We use CASE statements with the MAX() function to pivot the rows into columns.
Each occupation (Doctor, Professor, Singer, Actor) is represented by a separate column.
The MAX() function ensures that for each row number, the corresponding name is selected for the appropriate occupation, and NULL is returned if there’s no corresponding name for that occupation.
GROUP BY row_num: This groups the result by row number, effectively putting names with the same row number in the same output row.

ORDER BY row_num: This ensures that the result is printed in the correct order, with row numbers increasing from 1 onward.
Expected Output:
Doctor	Professor	Singer	Actor
Jenny	Ashley	Meera	Jane
Samantha	Christeen	Priya	Julia
NULL	Ketty	NULL	Maria
Explanation:
We have 2 doctors, 3 professors, 2 singers, and 3 actors.
Names in each occupation are displayed alphabetically.
Where there are fewer names (for instance, no more doctors after "Samantha"), we use NULL to fill the gap.
*/
