CREATE TABLE employee1 (			
		employee_id SERIAL primary key,
		name VARCHAR(100) not null,
		position VARCHAR(50),
		department VARCHAR(50),
		joining_date DATE,
		salary NUMERIC(10,2)
		);

SELECT * FROM employee1;