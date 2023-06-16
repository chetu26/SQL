use org;

CREATE TABLE employee(
emp_id char(25) NOT NULL PRIMARY KEY,
emp_name CHAR(25),
SALARY INT,
dept_id char(25),
manager_id CHAR(25)
);

show tables;

CREATE TABLE department(
dept_id char(25),
dept_name CHAR(25)
);

CREATE TABLE manager(
manager_id char(25),
manager_name CHAR(25),
dept_id char(25)
);

CREATE TABLE project(
project_id char(25),
project_name CHAR(40),
team_member_id char(25)
);

INSERT INTO employee
(emp_id,emp_name,salary,dept_id,manager_id) VALUES
('E1','rahul',15000,'D1','M1'),
('E2','manoj',15000,'D1','M1'),
('E3','james',55000,'D2','M2'),
('E4','michael',25000,'D2','M2'),
('E5','ali',20000,'D10','M3'),
('E6','robin',35000,'D10','M3');

INSERT INTO department
(dept_id,dept_name) VALUES
('D1','IT'),
('D2','HR'),
('D3','finance'),
('D4','admin');

INSERT INTO manager
(manager_id,manager_name,dept_id) VALUES
('M1','prem','D3'),
('M2','shripadh','D4'),
('M3','nick','D1'),
('M4','cory','D1');

INSERT INTO project
(project_id,project_name,team_member_id) VALUES
('P1','data migration','E1'),
('P1','data migration','E2'),
('P1','data migration','M3'),
('P2','ETL tool','E1'),
('P2','ETL tool','M4');

select e.emp_name,d.dept_name from employee as e, department as d where e.dept_id=d.dept_id;

select e.emp_name,d.dept_name
from employee as e inner join department as d
on e.dept_id=d.dept_id;

select e.emp_name,d.dept_name
from employee as e left join department as d
on e.dept_id=d.dept_id;

select e.emp_name,d.dept_name
from employee as e right join department as d
on e.dept_id=d.dept_id;

-- all employee and their manager

select e.emp_name,m.manager_name,d.dept_name,p.project_name
from employee as e left join manager as m 
on e.manager_id=m.manager_id left join department as d
on e.dept_id=d.dept_id left join project as p
on p.team_member_id=e.emp_id;



