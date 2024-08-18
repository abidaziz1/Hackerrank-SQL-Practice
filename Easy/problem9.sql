'''Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
            Note: There will be at least two entries in the table for each type of occupation.
'''
select concat(name,'(',left(occupation,1),')') as name_with_profession
from occupations
order by name;
select concat('There are a total of ',count(*),' ',lower(occupation),'s. ') as Occupation_Count /*COUNT(*): Counts the number of records (rows) for each group (i.e., each distinct occupation).
LOWER(Profession): Converts the profession name to lowercase.
CONCAT(...): Combines the count and the profession name into a single string. The result is a formatted string that indicates the number of occurrences of each occupation, followed by the profession name in lowercase with an 's' appended (to pluralize the profession name).*/
from occupations 
group by occupation /*GROUP BY occupation: Groups the rows in the OCCUPATIONS table by the Occupation column. This means that the COUNT(*) function will calculate the number of occurrences for each unique value in the Occupation column.*/
order by count(*),lower(occupation);
