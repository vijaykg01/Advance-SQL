CREATE TABLE import (
    user_id INT PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	join_date DATE,
	age INT CHECK (age >= 18),
    city VARCHAR(100),
	salary NUMERIC(10,2) CHECK (salary >= 0)
);

ALTER TABLE IMPORT
RENAME TO import_user;

ALTER TABLE import_user
RENAME TO user_import;


select*from user_import;




