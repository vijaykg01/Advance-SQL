CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    age INT CHECK (age >= 18),
    city VARCHAR(100)
);


INSERT INTO users (username, email, age, city)
VALUES
('Vijay', 'vijay@gmail.com', 22, 'Bangalore'),
('Rahul', 'rahul@gmail.com', 25, 'Hyderabad'),
('Sneha', 'sneha@gmail.com', 21, 'Mumbai'),
('Arjun', 'arjun@gmail.com', 28, 'Chennai'),
('Priya', 'priya@gmail.com', 24, 'Pune


SELECT * FROM USERS ;

update users
set age=23
where username='Vijay';

update users
set city='kalaburagi'
where user_id='3';

update users
set username='prajwal',email='prajwal@gmail.com'
where age='24';

update users
set age=age+1
where email like '%@gmail.com';


SELECT * FROM USERS ORDER BY USER_ID ASC;

--rename the username column to full_name

ALTER TABLE users 
RENAME COLUMN username to full_name;


-- change the age column datatype from INT to SMALLINT

ALTER TABLE users 
alter column age TYPE SMALLINT; 


SELECT * FROM USERS ORDER BY USER_ID ASC;


--add not null constraint to city column

ALTER TABLE users
ALTER COLUMN city SET not null;


--adding CHECK constraint to age column

ALTER TABLE users
ADD CONSTRAINT age CHECK (age>=18);


--table name change 

ALTER TABLE users
RENAME TO customers;

SELECT * FROM CUSTOMERS ORDER BY USER_ID ASC;

alter table customers
rename column full_name to name;
