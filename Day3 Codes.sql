
SELECT column_name, is_nullable, data_type from INFORMATION_SCHEMA.COLUMNS where table_name = 'employees';

select *from INFORMATION_SCHEMA.COLUMNS where table_name = 'employees';

SELECT * FROM employees;

-- Get first name, last name, job description and country of the all employees, using joins.

SELECT e.frist_name, 
       e.last_name, 
       j.job_title, 
       c.country_name
FROM employees e
LEFT JOIN jobs j ON e.job_id= j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id=l.location_id
JOIN countries c ON l.countery_id=c.country_id;

select first_name, last_name, job_title, country_name
FROM employees e
JOIN jobs j on e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l on d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;

SELECT *
FROM employees e
RIGHT OUTER JOIN job_history j ON e.employee_id=j.employee_id;

SELECT *
FROM employees e
LEFT JOIN job_history j on e.employee_id = j.employee_id;

SELECT *
FROM employees e
RIGHT JOIN job_history j on e.employee_id = j.employee_id;

SELECT *
FROM employees e
FULL JOIN job_history j on e.employee_id = j.employee_id;

SELECT *
FROM employees e
INNER JOIN job_history j on e.employee_id = j.employee_id;

--let's find a maximum salary for employee with first name Payam and last name Kaufling
SELECT j.max_salary
FROM employees e
JOIN jobs j on e.job_id=j.job_id
WHERE first_name = 'Payam' AND last_name = 'Kaufling';


SELECT AVG(salary)
FROM employees e
JOIN jobs j ON e.job_id=j.job_id
WHERE job_title like 'Programmer';

SELECT first_name, last_name, department_id 
from employees 
where department_id IN (100, 60)
UNION
SELECT first_name, last_name, department_id 
FROM employees 
WHERE department_id IN (100, 60, 30);

SELECT first_name, last_name, department_id 
from employees 
where department_id IN (100, 60)
UNION ALL

SELECT first_name, last_name, department_id 
FROM employees 
WHERE department_id IN (100, 60, 30);


SELECT first_name, last_name, department_id 
from employees 
where department_id IN (100, 60, 30)
EXCEPT
SELECT first_name, last_name, department_id 
FROM employees 
WHERE department_id IN (100, 60);


SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees WHERE job_id = 'ST_MAN');
--- instead of job_id use job title



