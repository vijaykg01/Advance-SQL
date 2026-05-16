CREATE TABLE vijay_kg (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    join_date DATE DEFAULT CURRENT_DATE,
    age INT CHECK (age >= 18),
    city VARCHAR(100),
    salary NUMERIC(10,2) CHECK (salary > 0)
);

select * from vijay_kg;

SELECT name,department,salary,
			(salary*12) AS annual_salary,
			(salary*0.10) AS increment_salary,
			(salary+salary*0.10) AS new_salary,
			(salary*1.10) AS new_salary_2,
			(salary+1000) AS added_salary,
			(salary-1000) AS deducted_salary,
			(salary/2) AS divided_salary
FROM vijay_kg;








