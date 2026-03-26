show databases;

create database datamites_ins;

show databases;
drop database datamites_ins;

-- 1.create database
create database school_databases;

-- 2.verify the db exist or not
show databases;

-- 3.select the db
use school_database;

-- 4.show tables
show tables;

create table student(
stud_id int,student_name varchar(50),gender varchar(10));

-- verify
show tables;

insert into student values(1,"Rakshitha","female");

-- to view the table
select * from student;

select student_name,gender from student;

insert into student values(1,"racchu","female");

-- to view the table
select * from student;

insert into student values
(2,"shravya",14),
(3,"charan",32),
(4,"diya",23);

select * from student;

desc student;













