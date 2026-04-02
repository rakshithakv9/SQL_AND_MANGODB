create database employee_query;
use employee_query;

create table employee 
(emp_id int primary key ,emp_name varchar(30) , dept_name varchar(20) , emp_salary int );
insert into employee values
(101 , 'John', 'HR' , 10000),
(201,'Mary','Finance',20000),
(301,'Zara','IT',30000),
(401,'Rida','Sales',50000),
(501, 'Ram','HR',40000),
(601,'Varun','IT',70000),
(701,'Araav','HR',60000),
(801,'Joy','IT',90000),
(302,'Arun','Sales',40000),
(403,'Joe','Finance',35000),
(704,"Dia","Finance",26000);


select * from employee;

use employee_query;

-- 1.find the deparment names
select distinct(dept_name) from employee;

-- 2.find the number of employees
select count(*) as no_of_employees
from employee;

-- 3.find the total salary 
select sum(emp_salary) from employee;

-- 4.sort the salary in ascending order
select emp_salary
from employee
order  by emp_salary asc;

-- 4.sort the salary in descending order
select emp_salary
from employee
order  by emp_salary desc;

-- 5.find the number of employees in each dept
select count(*),dept_name
from employee
group by dept_name;

-- 6.find the max salary from the department
select max(emp_salary),dept_name
from employee
group by dept_name;

-- 7.fetch top 3 rows
select *
from employee
limit 5;

-- 8.fetch last 3 rows
select * from employee order 
by emp_id desc limit 3;

-- 9.find the details of employees who belongs to hr  and
-- salary is greater than 20000

select * from employee where emp_salary>20000 and  dept_name="HR";

-- 10.find the details of the employees who belongs to hr and IT

select * from employee where dept_name in("HR","IT");

-- 22-JAN
use employee_query;

show tables;

select * from employee;

-- 11.find the details of employee whose salary range is from 20000 to 40000
select * from employee
where emp_salary  between 20000 and 40000;

-- 12.find the details of the employee whose getting the maximum salary
-- solution 1
select
* from employee
order by emp_salary desc
limit 1;

-- solution 2
select * from employee where emp_salary=90000;

-- solution 3
select * from employee where emp_salary =(select max(emp_salary)from employee);

-- find the details of the employee who's salary is greater
-- than average salary
select * from employee where emp_salary>(select avg(emp_salary)from employee);

-- find the details of the employee, where employee name starts with R
select * 
from employee
where emp_name like "R%";

-- find the details of the employee who's getting second highest salary
select * from employee where emp_salary<(select max(emp_salary)
										from employee)
                                        order by emp_salary desc
                                        limit 1;
									
-- find the number of employee in each dept
select count(*),dept_name
from employee
group by dept_name;

-- find the number of employees in each dept along with details of the employee
select emp_id,emp_name,emp_salary,dept_name,count(*)
over(partition by dept_name)as emp_count
from employee;					

-- RANK employees  by salary(dept_wise)		
select emp_id,emp_name,emp_salary,dept_name,rank()
over(partition by dept_name order by emp_salary desc)as emp_rank
from employee;	

-- INNER JOINS
select e.empid,e.empname,e.deptid,d.deptid,deptname
from employee as e
inner join
department as d
on e.deptid=d.deptid;

show tables;

-- LEFT JOINS
select e.empid,e.empname,e.deptid,d.deptid,deptname
from employee as e
left join
department as d
on e.deptid=d.deptid;

-- RIGHT JOINS
select e.empid,e.empname,e.deptid,d.deptid,deptname
from employee as e
right join
department as d
on e.deptid=d.deptid;

-- UNION JOINS
(select e.empid,e.empname,e.deptid,d.deptid,deptname
from employee as e
left join
department as d
on e.deptid=d.deptid)
union
(select e.empid,e.empname,e.deptid,d.deptid,deptname
from employee as e
right join
department as d
on e.deptid=d.deptid);

create database import_csv_db;

use import_csv_db;

show tables;

select * from csv;
							
