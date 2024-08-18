WITH Salaries AS 
  (SELECT  salary, CAST(REPLACE(CAST(salary AS CHAR), '0', '') AS UNSIGNED) 
  AS modified_salary    
  FROM  EMPLOYEES)
 SELECT CEIL(AVG(salary) - AVG(modified_salary)) AS salary_difference 
  FROM  Salaries;
