/*
Step-by-step approach:
Tables and Relationships:

Company: Contains company_code and founder.
Lead_Manager: Contains lead_manager_code and company_code (associates lead managers with a company).
Senior_Manager: Contains senior_manager_code, lead_manager_code, and company_code (associates senior managers with lead managers and a company).
Manager: Contains manager_code, senior_manager_code, lead_manager_code, and company_code (associates managers with senior managers, lead managers, and a company).
Employee: Contains employee_code, manager_code, senior_manager_code, lead_manager_code, and company_code (associates employees with managers, senior managers, lead managers, and a company).
Required Output:

We need to print:
company_code
founder
The total number of Lead Managers
The total number of Senior Managers
The total number of Managers
The total number of Employees
Grouping and Aggregation:

We need to count how many lead managers, senior managers, managers, and employees each company has. This can be achieved by grouping the results by company_code and counting the distinct records from each table.
SQL Query:

First, we will join the tables on company_code.
Then, for each company, we will count the number of unique lead_manager_code, senior_manager_code, manager_code, and employee_code.
Finally, we will sort the output by company_code.
*/
SELECT c.company_code, 
       c.founder, 
       COUNT(DISTINCT lm.lead_manager_code) AS total_lead_managers,
       COUNT(DISTINCT sm.senior_manager_code) AS total_senior_managers,
       COUNT(DISTINCT m.manager_code) AS total_managers,
       COUNT(DISTINCT e.employee_code) AS total_employees
FROM Company c
LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm ON c.company_code = sm.company_code
LEFT JOIN Manager m ON c.company_code = m.company_code
LEFT JOIN Employee e ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;
/*
Explanation:
Joins:

We perform LEFT JOINs between the Company table and the other tables (Lead_Manager, Senior_Manager, Manager, and Employee) using company_code as the key. The LEFT JOIN ensures that we still include companies even if there are no entries in the associated tables (e.g., no lead managers or employees).
Counting Distinct Records:

We count distinct entries in each of the hierarchy levels:
COUNT(DISTINCT lm.lead_manager_code) for counting unique lead managers.
COUNT(DISTINCT sm.senior_manager_code) for counting unique senior managers.
COUNT(DISTINCT m.manager_code) for counting unique managers.
COUNT(DISTINCT e.employee_code) for counting unique employees.
Grouping:

We group the result by company_code and founder to ensure that the counts are calculated per company.
Sorting:

We sort the final output by company_code in ascending order as required.
*/
