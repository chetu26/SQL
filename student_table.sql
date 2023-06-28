create database test;
use test;
create table STUDENT(
StdID bigint primary key auto_increment,
StdName char(30) not null,
Sex char(8) check (Sex in ('Male','Female')), 
Percentage smallint,
SClass tinyint,
Sec varchar(5),
StdStream char(10) check (StdStream in ('science','commerce')),
DOB date not null 
);

select * from STUDENT;