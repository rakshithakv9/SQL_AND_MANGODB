-- 27th JAN 2025

drop database if exists shop_db;
create database  shop_db;

use shop_db;

create table customers
(customer_id int primary key,
cusmoter_name varchar(50)not null,
city varchar(50));

show tables;

create table orders
(order_id int primary key,
order_date date not null,
amount decimal(10,2),
customer_id int,
foreign key(customer_id)references customers(customer_id));

show tables;

 insert into customers values
 (1,"rohan shetty","bangalore"),
 (2,"thomas","chennai"),
 (3,"harsha","bangalore");
 
 select * from customers;
 
 insert into orders values
 (101,"2025-04-21",25000,1),
 (102,"2025-05-11",350,1),
 (103,"2023-12-12",222,2),
 (104,"2024-12-13",454,2);
 
 select * from orders;
 
insert into orders values
(107,"2023-8-13",546,7);

delete from customers
where customer_id=2;

-- INNER JOINS
select c.customer_id,c.cusmoter_name,o.order_date,o.amount
from customers as c
inner join orders as o
on c.customer_id=o.customer_id;

-- retrieve customers with order
select * from customers;
select * from orders;

select *
from customers
where customer_id in(select customer_id from orders);

select *
from customers
where customer_id not in (select customer_id from orders);

-- find the total amount of each customerid =1
select sum(amount) from orders where customer_id=1;

-- find the customer who placed orders worth more than 500
select count(*)>1 from orders;

-- find the customer who places more than one order
select customer_id,cusmoter_name
from customers
where customer_id in
(select customer_id
from orders
group by customer_id
having count(*)>1);

-- find the customer name who placed the highest order amount

select MAX(amount) from orders;

select customer_id from orders where amount=(select max(amount)from orders);

select * 
from customers
where customer_id=(select customer_id from orders where amount = (select max(amount) from orders));

-- delete customer id from table then from there parent table
delete from  orders
where customer_id = (
        select customer_id
        from orders
        where amount = (select max(amount)
        from orders));
        
delete from  customers
where customer_id = (
        select customer_id
        from orders
        where amount = (select max(amount)
        from orders));
 