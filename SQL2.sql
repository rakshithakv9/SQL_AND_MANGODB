-- create new database and tables with constraints
create database amazon_db;

-- select the db
use amazon_db;

-- verify the db
show databases;

-- create table  employee with constraint
create table employee(
emp_id varchar(20) primary key,
emp_name varchar(50) not null,
emp_salary int default 20000,
emp_age int check(emp_age>18),
emp_email varchar(50));

desc employee;

insert into employee values
("AE001","ashwin",35000,24,"ashwin@gmail.com"),
("AE002","bharat",22000,19,"bharath@gmail.com"),
("AE003","charan",45000,44,"chagajaj@gmail.com");

select * from employee;

-- 1.check for duplicate entries-primary key constraint-error
insert  into employee values
("AE008","john",34444,19,"adjkj@gmail.com");

-- 2.check for giving a null values
insert into employee values
("AE005","john",34444,null,"adjkj@gmail.com");

-- 3.check for age<18 check constraint-error
insert  into employee values
("AE005","john",34444,10,"adjkj@gmail.com");

select * from employee;

-- 3.check for not null constraint-error
insert into employee(emp_id,emp_salary,emp_age)
values("AE005",23000,19);

insert into employee(emp_id,emp_name,emp_age)
values("AE007","souri",19);

select * from employee;

-- update the age to 23 for employee id AE002
update employee 
set emp_age=23
where emp_id="AE002";

select * from employee;

-- 2.update the salary of the employee who's age is greater than 20

set SQL_SAFE_UPDATES=0;

update  employee
set  emp_salary=45000
where emp_age>20;

select  * from employee;

-- find the employee details who's AGE>25 and SALARY>20000
select * from employee where emp_age>25 and emp_salary>20000;

-- find the MAX age of an employee
select max(emp_age)from employee;

-- find the MAX salary of an employee
select max(emp_salary)from employee;

-- find the MIN salary of an employee
select min(emp_salary)from employee;

-- find the AVG salary of an employee
select avg(emp_salary)from employee;

-- find the SUM salary of an employee
select sum(emp_salary)from employee;

-- 21 JAN 2026
show databases;

use amazon_db;

select * from employee;
-- delete  operations
-- delete the employee details who's age is less than 20
set sql_safe_updates=0;
delete from  employee where emp_age<20;

select * from employee;

-- alter command table
alter table employee
add emp_status varchar(10),
add emp_state varchar(30);

select * from employee;

-- update the status of all the employees to active and the state is KARNATAKA
update employee set emp_status="Active" , emp_state="Karnataka";

select * from employee;

select *
from employee
where emp_age=null;

select *
from employee
where emp_age is not null;

-- drop the columns
alter table employee
drop column emp_status, drop emp_state;

-- verify
select * from employee;

-- change the column name emp_name to name_of_employee
alter table employee
change column emp_name name_of_employee varchar(50);

select * from employee;

-- change the table name 
alter table employee rename employee_info;

select * from employee_info;

-- error for old table name
select * from employee;







