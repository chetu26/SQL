create database assign;
use assign;
show tables;
-- question 1
create table STUDENT(
StdID bigint primary key,
StdName char(30) not null,
Sex char(8) check (Sex in ('Male','Female')), 
Percentage int,
SClass int,
Sec char,
StdStream char(10) check (StdStream in ('science','commerce')),
DOB date not null 
);

INSERT INTO STUDENT
(StdID,StdName,Sex,Percentage,SClass,Sec,StdStream,DOB) VALUES
(001,'Monika','Female',83.3,5,'A','science','14-02-16'),
(002,'Naman','Male',73.3,5,'B','commerce','07-07-16');

select * from STUDENT;

-- question 2
ALTER TABLE STUDENT
ADD COLUMN  teacher_id INT;

-- question 3
create table TEACHER(
tID int primary key,
tName char(30) not null,
email char(30) not null,
class char(8), 
tSubject char(30)
);

select * from TEACHER;

-- question 4
ALTER TABLE STUDENT
ADD FOREIGN KEY (teacher_id) REFERENCES TEACHER(tID);

-- question 5
INSERT INTO TEACHER
(tID,tName,email,class,tSubject) VALUES
(5,'Radhika','radhika@gmail.com',5,'commerce'),
(8,'Raj','raj@gmail.com',5,'science'),
(10,'aarti','aarti@gmail.com',6,'science');

INSERT INTO STUDENT
(StdID,StdName,Sex,Percentage,SClass,Sec,StdStream,DOB,teacher_id) VALUES
(003,'Neha','Female',80,5,'C','commerce','14-02-16',5),
(004,'Ankit','Male',52.8,5,'A','science','07-07-16',8);

-- question 5
SELECT s.*, t.*
FROM STUDENT as s
INNER JOIN TEACHER as t ON s.teacher_id = t.tID;

-- question 6
select distinct StdName from STUDENT;

-- question 7
select Sex,count(*) from STUDENT group by Sex HAVING Sex='male';

-- question 8
select Sex,StdStream,count(*) from STUDENT group by Sex,StdStream HAVING Sex='male' && StdStream='science';

-- question 9
select * from STUDENT where year(DOB)='2020';

-- question 10
create table FEATURES
(feature_id INT PRIMARY KEY,
feature_type CHAR(30) NOT NULL
);

INSERT INTO FEATURES 
(feature_id,feature_type) VALUES
(1,'swimming'),
(2,'cricket'),
(3,'yoga');

create table Student_Features
(feature_id INT,
student_id BIGINT,
FOREIGN KEY (feature_id) REFERENCES FEATURES(feature_id),
FOREIGN KEY (student_id) REFERENCES STUDENT(StdID),
primary key(feature_id,student_id)
);

INSERT INTO Student_Features
(feature_id,student_id) VALUES
(1,001),
(2,001),
(3,002),
(3,003),
(3,004);

-- question 10
SELECT s.StdName
FROM STUDENT s
JOIN Student_Features sf ON s.StdID = sf.student_id
JOIN FEATURES f ON sf.feature_id = f.feature_id
WHERE f.feature_type = 'swimming';

-- question 11
SELECT t.*
FROM TEACHER AS t
JOIN STUDENT AS s ON t.tID = s.teacher_id
JOIN Student_Features AS sf ON s.StdID = sf.student_id
JOIN FEATURES AS f ON sf.feature_id = f.feature_id
WHERE f.feature_type = 'cricket';

-- question 12
CREATE VIEW Student_View AS
SELECT s.StdName AS students, s.Sex, s.Percentage, s.SClass AS class, s.Sec AS section, t.tName AS teacher, f.feature_type AS activity, s.StdStream AS stream
FROM STUDENT AS s
JOIN TEACHER AS t ON s.teacher_id = t.tID
JOIN Student_Features AS sf ON s.StdID = sf.student_id
JOIN FEATURES AS f ON sf.feature_id = f.feature_id;

SELECT * FROM Student_View;

-- question 13

-- question 14


-- question 15
SELECT *
FROM STUDENT
ORDER BY Percentage DESC
LIMIT 1 OFFSET 2;

-- question 16
SELECT * FROM STUDENT
UNION 
SELECT * FROM STUDENT ORDER BY StdID;


