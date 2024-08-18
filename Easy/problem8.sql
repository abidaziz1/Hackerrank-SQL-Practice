'''Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table
'''
select case
when(a+b<=c) or (a+c<=b) or (b+c<=a) then 'Not A Triangle'
when a=b and b=c then 'Equilateral'
when a=b or a=c or b=c then 'Isosceles'
else 'Scalene' 
end as triangle_type
from triangles;
