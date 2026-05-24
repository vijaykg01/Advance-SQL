CREATE TABLE sql_practice (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    city VARCHAR(100),
    salary NUMERIC(10,2) CHECK (salary > 0),
    age INT CHECK (age >= 18),
    join_date DATE,
    email VARCHAR(150) UNIQUE,
    bonus NUMERIC(10,2),
    experience_years NUMERIC(4,1)
);

INSERT INTO sql_practice
(employee_name, department, city, salary,
age, join_date, email, bonus, experience_years)
VALUES

	('Amit Verma','IT','Delhi',55000,27,'2024-01-15','amit@gmail.com',5000,2.5),
	('Neha Joshi','HR','Mysore',42000,23,'2023-11-20','neha@yahoo.com',3000,1.8),
	('Karan Mehta','IT','Ahmedabad',68000,31,'2022-06-10','karan@outlook.com',7000,5.2),
	('Pooja Nair','Finance','Kochi',48000,25,'2025-02-05','pooja@hotmail.com',2500,1.0),
	('Rohit Das','Analytics','Kolkata',59000,29,'2021-09-18','rohit@icloud.com',6500,4.3),
	('Anjali Kapoor','Management','Mumbai',51000,26,'2023-03-12','anjali@protonmail.com',4500,3.0),
	('Suresh Kumar','Civil','Hyderabad',72000,35,'2020-07-25','suresh@zoho.com',9000,8.5),
	('Divya Rao','Design','Bangalore',46000,24,'2024-08-30','divya@mail.com',2800,1.5),
	('Manoj Singh','Marketing','Chennai',63000,32,'2022-12-14','manoj@aol.com',7500,6.0),
	('Kavya Shetty','Operations','Pune',54000,28,'2025-01-09','kavya@rediffmail.com',3500,2.0),
	('Ramesh Patel','IT','Jaipur',80000,40,'2021-05-11','ramesh@gmail.com',9500,10.0),
	('Sneha Iyer','HR','Coimbatore',47000,27,'2023-10-19','sneha@yahoo.com',3000,2.2),
	('Akash Jain','Finance','Lucknow',61000,30,'2022-02-28','akash@outlook.com',6200,5.5),
	('Meera Kulkarni','Design','Nagpur',53000,29,'2024-06-22','meera@hotmail.com',3800,3.2),
	('Varun Gupta','Management','Surat',69000,33,'2020-11-03','varun@icloud.com',8200,7.0);
	
SELECT * FROM SQL_PRACTICE;

/* 1.AGGEGATE FUNCTION */

SELECT SUM(SALARY) As total_salary
FROM sql_practice;

SELECT count(*) As total_salary
FROM sql_practice;

SELECT avg(SALARY) As avg_salary
FROM sql_practice;
	
SELECT max(SALARY) As max_salary,
	   min(SALARY) As min_salary
FROM sql_practice;

SELECT SUM(SALARY) As total_salary
FROM sql_practice
where age>=30 and salary>=50000;


SELECT * FROM SQL_PRACTICE;

/* 2.STRING FUNCTION */

SELECT UPPER(DEPARTMENT) AS DEPARTMENT
FROM SQL_PRACTICE;

SELECT LOWER(DEPARTMENT) AS DEPARTMENT
FROM SQL_PRACTICE;

SELECT LENGTH(DEPARTMENT) AS DEPARTMENT
FROM SQL_PRACTICE;

SELECT CONCAT (DEPARTMENT,'-',AGE)
FROM SQL_PRACTICE;

SELECT SUBSTRING(EMAIL,1,5)
FROM SQL_PRACTICE;

SELECT TRIM(DEPARTMENT) AS DEPARTMENT
FROM SQL_PRACTICE;

SELECT REPLACE(DEPARTMENT,'HR','HUMAN_RESOURCE')
FROM SQL_PRACTICE;

SELECT LEFT(EMPLOYEE_NAME,5),
	   RIGHT(EMPLOYEE_NAME,5)
FROM SQL_PRACTICE;


SELECT * FROM SQL_PRACTICE;

/* 3.DATE & TIME FUNCTION */

SELECT NOW();

SELECT CURRENT_TIME;

SELECT CURRENT_DATE;

SELECT EXTRACT(MONTH FROM join_date)
FROM SQL_PRACTICE;

SELECT DATE_PART('DOW', join_date)
FROM SQL_PRACTICE;

SELECT AGE (CURRENT_DATE,join_date)
FROM SQL_PRACTICE;

SELECT DATE_TRUNC ('WEEK',join_date)
FROM SQL_PRACTICE;

SELECT join_date + INTERVAL '1 MONTH'
FROM SQL_PRACTICE;

SELECT TO_DATE ('15-01-2024','DD-MM-YYYY');

SELECT TO_CHAR (join_date,'DD-Mon-YYYY')
FROM SQL_PRACTICE;


SELECT * FROM SQL_PRACTICE;

/* 4.CONDITION FUNCTION */

SELECT employee_name,salary,
CASE
	WHEN SALARY>=60000 THEN 'EXPENSIVE'
	WHEN SALARY BETWEEN 50000 AND 59999 THEN 'MODERATE'
	ELSE 'AFFORDABLE'
END AS SALARY_CATEGORY
FROM SQL_PRACTICE; 


ALTER TABLE SQL_PRACTICE
ADD COLUMN discount_salary numeric(10,2);

update SQL_PRACTICE
SET  discount_salary = salary*0.8
where employee_id NOT IN ('2','3');

SELECT * FROM SQL_PRACTICE order by employee_id asc;


SELECT employee_name,
COALESCE (discount_salary,salary)
FROM SQL_PRACTICE order by employee_id asc;

/* 5.WINDOW FUNCTION */

SELECT employee_name,department,salary,
ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC)
FROM  SQL_PRACTICE ;
--OR--
SELECT employee_name,department,salary,
DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC)
FROM  SQL_PRACTICE ;

SELECT employee_name,department,salary,
SUM(salary) OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC)
FROM  SQL_PRACTICE ;

SELECT employee_name,department,salary,
SUM(salary) OVER(ORDER BY SALARY DESC)
FROM  SQL_PRACTICE ;


SELECT * FROM SQL_PRACTICE order by employee_id asc;

/* 6.JOIN FUNCTION */

SELECT * FROM employees3;
SELECT * FROM departments1;

--inner join / left join / right join / full join

SELECT e.employee_id,e.first_name,e.last_name,d.department_id,d.department_name
from employees3 e
INNER JOIN departments1 d
on e.department_id=d.department_id;

--cross join
SELECT e.first_name,e.last_name,d.department_name
from employees3 e
cross JOIN departments1 d;


--self join
SELECT e1.first_name as employee_name1,
	   e2.first_name as employee_name2
from employees3 e1
JOIN  employees3 e2
on e1.department_id=e2.department_id
and e1.employee_id!=e2.employee_id;

--self join with condition 
SELECT e1.first_name as employee_name1,
	   e2.first_name as employee_name2,
	   d.department_name
from employees3 e1
JOIN  employees3 e2
on e1.department_id=e2.department_id
and e1.employee_id!=e2.employee_id
JOIN departments1 d
on e1.department_id=d.department_id;
