CREATE TABLE VKG (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    age INT CHECK (age >= 18 AND age <= 60),
    city VARCHAR(100) NOT NULL,
    salary NUMERIC(10,2) CHECK (salary >= 0),
	join_date DATE DEFAULT CURRENT_DATE,
	phone VARCHAR(10) UNIQUE CHECK (LENGTH(phone) = 10),
	gender VARCHAR(20) CHECK (gender IN ('Male', 'Female', 'Other')),
	user_status VARCHAR(20) DEFAULT 'Active' 
				CHECK (user_status IN ('Active', 'Inactive', 'On Leave')),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM VKG;

--using function BETWEEN 
SELECT full_name,salary
FROM vkg
where salary BETWEEN 40000 AND 60000;

--using function LIKE
SELECT full_name,email,salary
FROM vkg
where email LIKE '%@yahoo.com';

--using function IN
SELECT full_name,user_status 
		FROM vkg
where user_status IN ('Active','Inactive');




