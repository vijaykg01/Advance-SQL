CREATE TABLE Employees3 (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

INSERT INTO Employees3
(employee_id, first_name, last_name, department_id)
VALUES
	(1, 'Rahul', 'Sharma', 101),
	(2, 'Priya', 'Mehta', 102),
	(3, 'Ankit', 'Verma', 103),
	(4, 'Simran', 'Kaur', NULL),
	(5, 'Aman', 'Singh', 101);

SELECT * FROM EMPLOYEES3;

CREATE TABLE Departments1(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Departments1
(department_id, department_name)
VALUES
	(101, 'Sales'),
	(102, 'Marketing'),
	(103, 'IT'),
	(104, 'HR');

SELECT * FROM DEPARTMENTS1;

SELECT * FROM EMPLOYEES3;


-- INNER JOIN

SELECT e.employee_id,
       e.first_name,
       e.last_name,
	   d.department_id,
       d.department_name
FROM Employees3 e
INNER JOIN Departments1 d
ON e.department_id = d.department_id; 

-- LEFT JOIN

SELECT e.employee_id,
       e.first_name,
       e.last_name,
	   d.department_id,
       d.department_name
FROM Employees3 e
LEFT JOIN Departments1 d
ON e.department_id = d.department_id; 

-- RIGHT JOIN

SELECT e.employee_id,
       e.first_name,
       e.last_name,
	   d.department_id,
       d.department_name
FROM Employees3 e
RIGHT JOIN Departments1 d
ON e.department_id = d.department_id; 


-- FULL JOIN

SELECT e.employee_id,
       e.first_name,
       e.last_name,
	   d.department_id,
       d.department_name
FROM Employees3 e
FULL JOIN Departments1 d
ON e.department_id = d.department_id; 

-- CROSS JOIN

SELECT e.first_name,
       d.department_name
FROM Employees3 e
CROSS JOIN Departments1 d;


--self join

select e1.first_name AS employee_name1,
	  e2.first_name AS employee_name2
FROM employees3 e1 JOIN employees3 e2
ON e1.department_id=e2.department_id
and e1.employee_id!=e2.employee_id;

	
--self join with condition

select e1.first_name AS employee_name1,
	  e2.first_name AS employee_name2,
	  department_name
FROM employees3 e1 JOIN employees3 e2
ON e1.department_id=e2.department_id
and e1.employee_id!=e2.employee_id
join departments1 d
on e1.department_id=d.department_id;
	
	