CREATE TABLE employee_dates (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    salary NUMERIC(10,2)
        CHECK (salary > 0),
    join_date DATE NOT NULL,
    birth_date DATE,
    project_deadline DATE,
    last_login TIMESTAMP,
    work_shift VARCHAR(20)
        CHECK (work_shift IN ('Morning', 'Evening', 'Night')),
    employee_status VARCHAR(20)
        DEFAULT 'Active'
        CHECK (employee_status IN ('Active', 'Inactive', 'On Leave')),
    experience_years NUMERIC(4,1)
        CHECK (experience_years >= 0),
    bonus NUMERIC(10,2)
        DEFAULT 0,
    created_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP);

INSERT INTO employee_dates
(employee_name, department, position, salary, join_date, birth_date,
project_deadline, last_login, work_shift, employee_status,
experience_years, bonus)
VALUES
	
	('Amit Verma', 'IT', 'Developer', 55000.00,
	'2024-01-15', '1998-05-10', '2025-06-30',
	'2026-05-18 09:30:00', 'Morning', 'Active', 2.5, 5000),
	
	('Neha Joshi', 'HR', 'HR Executive', 42000.50,
	'2023-11-20', '2001-09-22', '2025-07-15',
	'2026-05-18 10:15:00', 'Morning', 'Active', 1.8, 3000),
	
	('Karan Mehta', 'IT', 'Software Engineer', 68000.75,
	'2022-06-10', '1995-03-18', '2025-08-20',
	'2026-05-17 08:45:00', 'Night', 'On Leave', 5.2, 7000),
	
	('Pooja Nair', 'Finance', 'Accountant', 48000.00,
	'2025-02-05', '1999-12-01', '2025-09-10',
	'2026-05-18 11:20:00', 'Evening', 'Active', 1.0, 2500),
	
	('Rohit Das', 'Analytics', 'Data Analyst', 59000.25,
	'2021-09-18', '1997-07-14', '2025-10-05',
	'2026-05-16 07:40:00', 'Morning', 'Inactive', 4.3, 6500),
	
	('Anjali Kapoor', 'Management', 'Team Lead', 51000.00,
	'2023-03-12', '2000-11-25', '2025-11-22',
	'2026-05-18 09:10:00', 'Morning', 'Active', 3.0, 4500),
	
	('Suresh Kumar', 'Civil', 'Civil Engineer', 72000.00,
	'2020-07-25', '1992-04-30', '2025-12-31',
	'2026-05-15 06:50:00', 'Night', 'Active', 8.5, 9000),
	
	('Divya Rao', 'Design', 'UI Designer', 46000.50,
	'2024-08-30', '2002-06-09', '2026-01-18',
	'2026-05-18 12:00:00', 'Evening', 'On Leave', 1.5, 2800),
	
	('Manoj Singh', 'Marketing', 'Marketing Executive', 63000.00,
	'2022-12-14', '1994-08-27', '2026-02-25',
	'2026-05-17 05:30:00', 'Morning', 'Active', 6.0, 7500),
	
	('Kavya Shetty', 'Operations', 'Project Coordinator', 54000.75,
	'2025-01-09', '2001-01-19', '2026-03-12',
	'2026-05-18 01:10:00', 'Night', 'Active', 2.0, 3500);

SELECT * FROM employee_dates;

--NOW()-CURRENT DATE & TIME

select now() AS current_date_time;

--CURRENT DATE

select current_date AS today_date;

--CURRENT DATE

select join_date,current_date,(current_date-join_date) 
from  employee_dates;

--CURRENT TIME

select current_time AS present_time;

--AGE

select employee_name, AGE (current_date,birth_date) AS employee_age
from  employee_dates;

--WORKING AGE OR CURRENT EXPERIENCE

select employee_name, AGE (current_date,join_date) AS current_working_experience
from  employee_dates;

SELECT * FROM employee_dates;

--EXTRACT YEAR, MONTH, DAYS FROM THE COLUMN

select employee_name,
	extract(year from join_date) AS extract_year,
	extract(month from join_date) AS extract_month,
	extract(day from join_date) AS extract_days
from employee_dates;
	
--TO_CHAR- FORMAT DATES AS STRING
--FORMAT DATE IN A CUSTOM FORMAT(DD-MM-YYYY)

SELECT employee_name,join_date,
	To_CHAR(join_date,'DD-Mon-YYYY')
FROM employee_dates;

--TO_DATE- CONVERT STRING TO DATE FORMAT

SELECT To_DATE('15-01-2024','DD-MM-YYYY')
FROM employee_dates;


--DATE_PART-GET SPECIFIC DATE PART
--EXTRACT THE MONTH, YEAR, DOW(day of week),DOY(day of year)
--DOW--Sunday is 0
	 --Monday is 1
	 --tuseday is 3
	 
SELECT employee_name,project_deadline,
	DATE_PART ('year',project_deadline) AS date_year,
	DATE_PART ('month',project_deadline) AS date_month,
	DATE_PART ('dow',project_deadline) AS date_of_week,
	DATE_PART ('doy',project_deadline) AS date_of_year
from employee_dates;


SELECT * FROM employee_dates;

--DATE_TRUNC--SHOWS STATING DATE,WEEK,MONTH OF THE YEAR

SELECT employee_name,project_deadline,
	DATE_TRUNC ('year',project_deadline) AS stating_date_year,
	DATE_TRUNC ('month',project_deadline) AS stating_date_month,
	DATE_TRUNC ('week',project_deadline) AS stating_date_of_week
from employee_dates;

--IMTERVAL-SUBSTRACT OR ADD TIME INTERVAL

SELECT employee_name,project_deadline,
	   project_deadline-INTERVAL'6 MONTHS' AS sub_PD,
	   project_deadline+INTERVAL'1 MONTHS' AS add_PD
FROM employee_dates;



