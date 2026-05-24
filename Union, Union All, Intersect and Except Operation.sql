CREATE TABLE students_2025 (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
	course VARCHAR(100) NOT NULL
);

INSERT INTO students_2025 (student_name, course)
VALUES
('Rahul Sharma', 'BCA'),
('Sneha Patel', 'BBA'),
('Arjun Reddy', 'B.Com'),
('Priya Nair', 'BSc Computer Science'),
('Karan Mehta', 'MBA'),
('Divya Rao', 'MCA');

SELECT * FROM students_2025;


CREATE TABLE students_2026 (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
	course VARCHAR(100) NOT NULL
);

INSERT INTO students_2026 (student_name, course)
VALUES
('Karan Mehta', 'MBA'),
('Divya Rao', 'MCA'),
('Amit Verma', 'B.Tech'),
('Neha Joshi', 'BBA Aviation'),
('Rohit Das', 'BMS'),
('Kavya Shetty', 'BCA');


SELECT * FROM students_2026;


--UNION- combines result and remove duplicate

SELECT student_name,course
FROM students_2025
UNION
SELECT  student_name,course
FROM students_2026;

--UNION ALL- combines result and keep duplicate

SELECT student_name,course
FROM students_2025
UNION ALL
SELECT  student_name,course
FROM students_2026;

--INTERSECT- returns common results

SELECT student_name,course
FROM students_2025
INTERSECT
SELECT  student_name,course
FROM students_2026;


--EXCEPT- returns result in first, not second

SELECT student_name,course
FROM students_2025
EXCEPT
SELECT  student_name,course
FROM students_2026;





