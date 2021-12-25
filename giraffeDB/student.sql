show databases;
use giraffe;

drop table student;
create table student(
student_id int primary key,
name varchar(20),
major varchar(20)
);

# OR
create table student(
student_id int auto_increment,
name varchar(20) NOT NULL,
major varchar(20) DEFAULT 'undecided',
primary key(student_id)
);

show tables;

describe student;

# 3 digits, 2 decimal places after decimal
alter table student add gpa decimal(3,2);

alter table student drop column gpa;

select * from student;
insert into student(name,major) values('Jack','Biology');
insert into student(name,major) values('Kathrine','Physics');
insert into student values(2, 'Kate','Sociology');
insert into student values(3, NULL, 'Chemistry');
insert into student(student_id, name,major) values(4, 'Jack','Biology');
insert into student(student_id, name) values(5, 'Mike');


# Update & Delete
insert into student values(1, 'Jack','Biology');
insert into student values(2, 'Kate','Sociology');
insert into student values(3, 'Claire', 'Chemistry');
insert into student values(4, 'Jack','Biology');
insert into student values(5, 'Mike', 'computer Science');

# where clause is not mandatory
SET SQL_SAFE_UPDATES=0;
update student
set major = 'Bio'
where major = 'Biology';

update student
set major = 'Chemistry'
where student_id = 4;

update student
set major = 'Biochemistry'
where major = 'Bio' or major = 'Chemistry';

update student
set name = 'Tom', major = 'undecided'
where student_id = 1;
SET SQL_SAFE_UPDATES=1;

#deletes all rows
delete from student;

delete from student 
where student_id = 5;

delete from student
where name = 'Tom' and major = 'undecided';


# BASIC QUERIES
select student.name
from student
order by student_id desc;

select *
from student
order by major, student_id desc;

select * 
from student 
order by student_id desc
limit 2;

# comparison operators: <, >, <=, >=, =, <>, AND, OR
select *
from student 
where name <> 'Jack';

select *
from student 
where name IN ('Claire','Jack') and student_id <= 3;

select * from student;
