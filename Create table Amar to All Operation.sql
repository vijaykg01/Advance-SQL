CREATE TABLE AMAR(
	user_id SERIAL primary key,
	user_name VARCHAR(100) not null,
	position VARCHAR(100) not null,
	email VARCHAR(100) unique,
	age INT check(age>=18),
	join_date DATE DEFAULT current_date,
	salary numeric(10,2) check(salary>0)
);

SELECT * FROM amar;

INSERT INTO AMAR
(user_name, position, email, age, join_date, salary)
VALUES
	('Amit Verma', 'Manager', 'amit@gmail.com', 27, '2024-01-15', 55000.00),
	('Neha Joshi', 'HR Executive', 'neha@yahoo.com', 23, '2023-11-20', 42000.50),
	('Karan Mehta', 'Software Engineer', 'karan@outlook.com', 31, '2022-06-10', 68000.75),
	('Pooja Nair', 'Accountant', 'pooja@hotmail.com', 25, '2025-02-05', 48000.00),
	('Rohit Das', 'Data Analyst', 'rohit@icloud.com', 29, '2021-09-18', 59000.25),
	('Anjali Kapoor', 'Team Lead', 'anjali@protonmail.com', 26, '2023-03-12', 51000.00),
	('Suresh Kumar', 'Civil Engineer', 'suresh@zoho.com', 35, '2020-07-25', 72000.00),
	('Divya Rao', 'UI Designer', 'divya@mail.com', 24, '2024-08-30', 46000.50),
	('Manoj Singh', 'Marketing Executive', 'manoj@aol.com', 32, '2022-12-14', 63000.00),
	('Kavya Shetty', 'Project Coordinator', 'kavya@rediffmail.com', 28, '2025-01-09',54000.75);


SELECT * FROM amar;

--DELETING ROW NO.10
DELETE FROM amar
WHERE user_id=10;

--UPDATING DATA
UPDATE amar
SET AGE=24
WHERE user_id=2;

SELECT * FROM amar ORDER BY user_id ASC;

--CHANING AGE CONSTRAINT
ALTER TABLE amar
ALTER COLUMN age TYPE SMALLINT;

--CAL ANNUAL SALARY
SELECT user_name,position,salary,(salary*12) AS annual_salary
FROM amar;

--CAL BONUS ADDED SALARY
SELECT user_name,position,salary,(salary+5000) AS bonus_added_salary
FROM amar;

--fINDING THE ABOVE 25 AGE EMPLOYEES
SELECT * FROM amar
WHERE age>=25;

--USING AND FUNCTION
SELECT * FROM amar
WHERE age>=25
AND salary>=60000;


--USING OR FUNCTION
SELECT * FROM amar
WHERE age>=25
OR salary>=60000;


--USING NOT FUNCTION
SELECT * FROM amar
WHERE NOT(salary>=60000);

--USING BETWEEN FUNCTION
SELECT * FROM amar
WHERE salary BETWEEN 60000 AND 70000;


SELECT * FROM amar ORDER BY user_id ASC;

--USING LIKE FUNCTION
SELECT * FROM amar
WHERE email LIKE ('%@gmail.com');

--USING IN FUNCTION
SELECT * FROM amar
WHERE position IN ('Manager','Data Analyst');

--USING IS NULL FUNCTION
SELECT * FROM amar
WHERE AGE IS NULL;

--USING ORDER BY FUNCTION
SELECT * FROM amar
ORDER BY salary DESC;

--USING LIMIT FUNCTION
SELECT * FROM amar
ORDER BY USER_ID ASC
LIMIT 5;

--USING DISTINCT FUNCTION
SELECT DISTINCT AGE 
FROM amar;


--USING COUNT DISTINCT FUNCTION
SELECT COUNT(DISTINCT AGE) AS age_distinct_count
FROM amar;

SELECT * FROM amar ORDER BY user_id ASC;

--UNION-combine results & remove duplicate
select student_name,course
from students_2025
UNION
select student_name,course
from students_2026;

--UNION ALL-combine results & Keep duplicate
select student_name,course
from students_2025
UNION ALL
select student_name,course
from students_2026;

--INTERSECT-returns common result
select student_name,course
from students_2025
INTERSECT
select student_name,course
from students_2026;

--EXCEPT-returns results in 1st, not 2nd
select student_name,course
from students_2025
EXCEPT
select student_name,course
from students_2026;

SELECT * FROM amar ORDER BY user_id ASC;











