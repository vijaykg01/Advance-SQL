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

--find where email is NULL
SELECT * from vkg
where email IS null;

--list sorted by salary is ASC ORDER
SELECT * from vkg 
ORDER BY salary ASC;

--list sorted by salary is DESC ORDER
SELECT * from vkg 
ORDER BY salary DESC;

--top 5 highest salary paid
SELECT * FROM vkg 
LIMIT 5;

--top 5 highest salary paid ORDER BY DESC
SELECT * FROM vkg 
ORDER BY salary DESC
LIMIT 5;

--list of UNIQUE user_status
SELECT DISTINCT user_status
FROM vkg;

--list of COUNT UNIQUE 
SELECT count (DISTINCT user_status) AS user_status_unique_count
FROM vkg;

SELECT * FROM VKG;