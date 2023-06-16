use org;
show tables;
select w1.* from worker as w1 where 4=
(select count(distinct(w2.salary)) from worker as w2 where w1.salary>=w2.salary);

select w1.*
from worker as w1,worker as w2 
where w1.worker_id!=w2.worker_id and w1.salary=w2.salary;

select max(salary) from worker where salary !=
(select max(salary) from worker);

select worker_id from worker where worker_id not in(
select distinct(worker_ref_id) from bonus);

select worker_id from worker where worker_id<=
(select max(worker_id) from worker)/2;


select department,count(*) as c from worker group by department having c<4 ;

select * from worker where worker_id =(
select max(worker_id) from worker);

(select * from worker order by worker_id desc limit 5) order by worker_id;

select w.first_name,w.department,w.salary from worker as w,
(select department,max(salary) as sal from worker group by department) as c
where c.department=w.department and c.sal=w.salary;

select distinct(salary) from worker as w1 where 3<
(select count(distinct(salary)) from worker as w2 where w1.salary>w2.salary);

select distinct(salary) from worker as w1 where 3<(
select count(distinct(salary)) from worker as w2 where w1.salary<w2.salary);

select distinct(salary) from worker as w1 where n<
(select count(distinct(salary)) from worker as w2 where w1.salary>w2.salary);

select department,sum(salary) from worker group by department;

select first_name from worker where salary in (
select max(salary) from worker);