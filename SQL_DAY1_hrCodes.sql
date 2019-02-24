
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

