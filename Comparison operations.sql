CREATE TABLE vijay_kg (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    join_date DATE DEFAULT CURRENT_DATE,
    age INT CHECK (age >= 18),
    city VARCHAR(100),
    salary NUMERIC(10,2) CHECK (salary > 0)
);

SELECT * FROM vijay_kg;

--where age is EQUAL TO 25

SELECT * FROM vijay_kg
WHERE age=25;

--where age is Greater then are EQUAL TO 28

SELECT * FROM vijay_kg
WHERE age>=28;

--where age is Lesser then are EQUAL TO 28

SELECT * FROM vijay_kg
WHERE age<=28;

--age is not equal to 28

select name,department,age
from vijay_kg
WHERE age!=28;







