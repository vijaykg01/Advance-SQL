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