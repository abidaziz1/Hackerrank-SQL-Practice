SELECT e.employee_ID, e.name
FROM employee_information e
JOIN last_quarter_bonus b
ON e.employee_ID = b.employee_ID
WHERE e.division = 'HR'
AND b.bonus >= 5000;
