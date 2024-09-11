/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/

SELECT s.Name
FROM Students s
JOIN Friends f
ON s.ID = f.ID
JOIN Packages sp
ON s.ID = sp.ID
JOIN Packages fp
ON f.Friend_ID = fp.ID
WHERE fp.Salary > sp.Salary
ORDER BY fp.Salary ASC;
