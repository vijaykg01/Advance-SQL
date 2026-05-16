CREATE TABLE vijay (
    id INT PRIMARY KEY,
    name VARCHAR(100) not null,
    position VARCHAR(100) ,
    department VARCHAR(100),
    join_date DATE,
    salary DECIMAL(10,2),
    email VARCHAR(150) unique,
    phone varchar(10) unique,
    address TEXT,
    status VARCHAR(20) ,
    manager_name VARCHAR(100),
    experience_years INT,
    gender VARCHAR(10),
    birth_date DATE ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from vijay;



--inserting data into table

insert into vijay( id,
	name,
    position,
    department,
    join_date,
    salary,
    email,
    phone,
    address,
    status,
    manager_name,
    experience_years,
    gender,
    birth_date)


VALUES ('1',
    'Vijay K G',
    'Data Analyst',
    'IT',
    '2026-05-14',
    45000.00,
    'vijay@example.com',
    '9876543210',
    'Bangalore, Karnataka',
    'Active',
    'Rahul Sharma',
    2,
    'Male',
    '2003-08-15'
);


insert into vijay( id,
	name,
    position,
    department,
    join_date,
    salary,
    email,
    phone,
    address,
    status,
    manager_name,
    experience_years,
    gender,
    birth_date)


VALUES ('2',
    'Vijay K G',
    'Data Analyst',
    'IT',
    '2026-05-14',
    45000.00,
    'vijay1@example.com',
    '9876543211',
    'Bangalore, Karnataka',
    'Active',
    'Rahul Sharma',
    2,
    'Male',
    '2003-08-15'
);

select * from vijay;