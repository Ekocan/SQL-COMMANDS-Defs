Connection name: hr
Username: hr
Password: hr
Hostname: room-reservation-qa.cxvqfpt4mc2y.us-east-1.rds.amazonaws.com
Port: 5432
Choose database: hr

select * 
from employees;

select first_name
from employees;

select first_name, last_name
from employees;

select *
from countries;

select *
from employees
where employee_id = 114;

select first_name, last_name, salary, job_id
from employees;

select email || '@gmail.com'
from employees
where employee_id = 111;

--SELECT first_name || ' ' || last_name as FULLNAME
--FROM employees
--WHERE employee_id = 111;

--COMMENTS

select last_name ||', '|| first_name as full_name, email || '@gmail.com', job_id
from employees
order by job_id asc;

select last_name ||', '|| first_name as full_name, LOWER(email) || '@gmail.com' as email , job_id as id
from employees
order by full_name desc;

select LOWER(email)
from employees;

select last_name ||', '|| first_name as full_name, email || '@yahoo.com' as email , job_id as id
from employees
order by 2 asc;


select last_name ||', '|| first_name as full_name, email || '@yahoo.com' as email, job_id as id
from employees
order by 1 asc;

select *
from employees
where salary > 5000
order by salary asc;

select salary * 12 as annual_salary, last_name ||', '|| first_name as full_name 
from employees
order by annual_salary asc;


select first_name||'_'||last_name as full_name, 
round(salary/160) as hourly,
round(salary/20) as daily,
round(salary*12/52) as weekly, 
salary as monthly, 
round(salary*12) as yearly  
from employees order by salary DESC;


select distinct first_name
from employees order by first_name DESC;

select *
from employees
where job_id = 'IT_PROG' or job_id='PU_CLERK';

select *
from employees
where job_id in ('IT_PROG','PU_CLERK');


select *
from employees
where first_name like 'S%';

select *
from employees
where first_name like '__so%';

select *
from employees
where to_char(hire_date,'mon') = 'jan';

select * 
from employees
where salary between 3000 and 5000
order by salary desc;

SELECT * 
FROM employees
WHERE job_id NOT IN ('FI_ACCOUNT', 'PU_CLERK', 'ST_MAN')
ORDER BY job_id;

select last_name ||', '|| first_name as full_name, LOWER(email) || '@gmail.com' as email , job_id as id
from employees
order by full_name desc;

SELECT UPPER(SUBSTRING(first_name, 1, 3)) || LOWER(SUBSTRING(last_name, 1, 3)) 
AS employee_password, LOWER(email) || '@gmail.com' AS email,
first_name, last_name
FROM employees
LIMIT 5;

SELECT 
UPPER(SUBSTR(first_name, 1, 1)) || LOWER(SUBSTR(last_name, 1, 3)) as password, employee_id
AS employee_password, LOWER(email) || '@gmail.com' AS email,
first_name, last_name
FROM employees
ORDER BY employee_id desc
FETCH FIRST 10 ROWS ONLY;

---WHERE ROWNUM <=5: THIS IS FOR ORACLE DB WE ARE USING POSRTGRESQL
---WHERE ROWNUM <=5: THIS IS FOR ORACLE DB, RIGHT NOW WE ARE USING POSRTGRESQL, IT WILL NOT WORK HERE
SELECT COUNT(DISTINCT(job_id))
FROM employees;

SELECT DISTINCT(job_id)
FROM employees;

SELECT ROUND(AVG(salary), 1)
FROM employees;

SELECT MIN(salary)
FROM employees;

SELECT MAX(salary)
FROM employees;

SELECT SUM(salary) as payroll
FROM employees;
SELECT SUM(salary)*12 as annual_payroll
FROM employees;

SELECT ROUND(AVG(salary)*12/52/40, 2) as avarage_hourly_rate
FROM employees;

SELECT AVG(salary) FROM employees
SELECT * 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary ASC;

SELECT * 
FROM employees
WHERE salary AS ABOVE AVG(salary)
ORDER BY salary ASC;

SELECT (AVG(salary)) as above
FROM employees;

SELECT * 
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees)
ORDER BY salary ASC;
SELECT * 
FROM employees
WHERE salary < AVG(salary)
ORDER BY salary ASC;

SELECT * 
FROM employees
WHERE hire_date BETWEEN '01-JAN-99' AND '02-JAN-04' 
ORDER BY hire_date;

SELECT first_name || ', ' || last_name AS full_name
FROM employees
WHERE last_name LIKE '%a%a%a%';

SELECT AVG(salary)
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT AVG(salary)
FROM employees
WHERE commission_pct != 0;

SELECT * 
FROM employees
WHERE job_id <> 'SA_REP';

SELECT * 
FROM employees
WHERE job_id != 'SA_REP';

select round(avg(commission_pct*salary + salary),1) as Average_Salary_With_Commission 
from employees;

SELECT AVG(salary - (salary * commission_pct))
FROM employees;

select ROUND((AVG((salary*commission_pct+salary)))) 
from employees 
where commission_pct IS not NULL;

select ROUND((AVG((salary*commission_pct+salary)))) 
from employees;

---before ROUND method 2.8324823, after ROUND method 2.8, 
---but you need to provide 2 params: firt is column name, second amount of decimals/digits
SELECT job_id, COUNT(*) as amount_of_jobs
from employees
GROUP BY job_id;

SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id
HAVING count(*)>=2;

SELECT first_name, COUNT(*)
FROM employees
GROUP BY first_name;

SELECT h.*
FROM employees e
JOIN job_history h on e.employee_id=h.employee_id;

SELECT e.first_name ||' ' || e.last_name, r.region_name
FROM employees e
JOIN departments d on e.department_id=d.department_id
JOIN locations l on l.location_id=d.location_id
JOIN countries c on c.country_id=l.country_id
JOIN regions r on r.region_id=c.region_id
WHERE e.employee_id = 112;

