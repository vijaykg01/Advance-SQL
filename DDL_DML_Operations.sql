CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    join_date date NOT NULL,
    age INT CHECK (age >= 18),
    city VARCHAR(100),
	salary numeric(10,2)
);

SELECT * FROM users;


INSERT INTO users (full_name, join_date, age, city, salary)
VALUES
('Amit Verma', '2024-01-15', 27, 'Delhi', 55000.00),
('Neha Joshi', '2023-11-20', 23, 'Mysore', 42000.50),
('Karan Mehta', '2022-06-10', 31, 'Ahmedabad', 68000.75),
('Pooja Nair', '2025-02-05', 25, 'Kochi', 48000.00),
('Rohit Das', '2021-09-18', 29, 'Kolkata', 59000.25);

--updating the age of user_id=2 to 24

update users
set age=24
where user_id='2';


SELECT * FROM users order by user_id ASC;

--change the full_name to user_name

ALTER TABLE users
rename column full_name to user_name;

--chnage the database of column age to smallint

alter table users
alter column age type smallint;

--to add a not null constraint to city

alter table users
alter column city set not null;

SELECT * FROM users order by user_id ASC;

--adding check constraint to age column

alter table users
add constraint age check(age>=18);
