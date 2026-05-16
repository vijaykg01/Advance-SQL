select * from employee2;


INSERT INTO employee2 (name,position,department,join_date,salary)

VALUES ('vijay','data analyst','data science','2026-11-18',35000),
       ('akash','civil engineer','B tech','2026-11-19',45000),
	   ('amar','mbbs','doctor','2026-11-20',55000),
	   ('manu','mechanical engineer','B tech','2026-11-21',25000),
	   ('ganesh','AIDS engineer','B tech','2026-11-22',55000);

ALTER TABLE employee2
RENAME COLUMN start_date to join_date ;

truncate table employee2;

truncate table employee2 restart identity;

select * from employee2;



	