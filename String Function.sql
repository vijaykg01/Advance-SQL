--STRING FUNCTION 
CREATE TABLE string_data (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    full_text TEXT,
    email VARCHAR(150),
    city VARCHAR(100)
);

INSERT INTO string_data
(first_name, last_name, full_text, email, city)
VALUES
	('Amit', 'Verma', 'SQL is easy to learn', 'amit@gmail.com', 'Delhi'),
	('Neha', 'Joshi', 'PostgreSQL string functions practice', 'neha@yahoo.com', 'Mysore'),
	('Karan', 'Mehta', 'Learning database concepts', 'karan@outlook.com', 'Ahmedabad'),
	('Pooja', 'Nair', 'Working with SQL queries', 'pooja@hotmail.com', 'Kochi'),
	('Rohit', 'Das', 'String manipulation in PostgreSQL', 'rohit@icloud.com', 'Kolkata');

	
SELECT * FROM string_data;

--GET ALL CAEGORIES IN UPPERCASE
SELECT UPPER(first_name) AS UPPERCASE
FROM string_data;

--GET ALL CAEGORIES IN LOWERCASE
SELECT LOWER(first_name) AS UPPERCASE
FROM string_data;

--GET LENGH OF full_text
SELECT LENGTH (full_text) AS Length 
FROM string_data;

--GET LENGH OF full_text
SELECT CONCAT (first_name,' ',last_name) AS Full_name 
FROM string_data;

--EXTRACT FIRST 5 CHARACTERS OF full_text
SELECT SUBSTRING(full_text,1,5) AS short_name
FROM string_data; 

--REMOVE LENGHT & TRAILING SPACE FROM STRING
SELECT LENGTH('    monitor    ') AS Length_of_monitor,
		TRIM('    monitor    ') AS trimmed_text,
		LENGTH(TRIM('    monitor    ')) AS Length_trimmed_text;

--REPLACE THE WORD VERMA WITH SHARMA
SELECT REPLACE (last_name,'Verma','Sharma')
FROM string_data;

SELECT * FROM string_data;

--GET LEFT & RIGHT CHARCATERS
SELECT LEFT (email,4) FROM string_data;
SELECT RIGHT (email,4) FROM string_data;













