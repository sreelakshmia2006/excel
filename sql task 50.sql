create database sql_task_db;
use sql_task_db;
select database();
create table students (student_id int primary key auto_increment,name varchar(50) not null,email varchar(100),age int,department varchar(50));
describe students;
insert into students (name,email,age,department)values("sneha","sneha@gmail.com",20,"math"),("vishnu","vishnu@gmail.com",21,"physics"),("athira","athira@gmail.com",19,"history"),("nikhil","nikhil@gmail.com",22,"math"),("kavya","kavya@gmail.com",18,"physics");
select * from students;
update students set department = "computer science" where name = "sneha";
select * from students;
update students set age = 23, department = "mathematics" where name = "vishnu";
select * from students;
select student_id,name,age,department from students;
delete from students where student_id = 3;
delete from students where age < 20;
select * from students;

select distinct department as dept_name from students where age > 18;

select * from students where age between 18 and 22 and department in ("math","physics") and department not in ("history") and email is null;


create table customers (customer_id int primary key auto_increment,first_name varchar(50),last_name varchar(50),email varchar(100),purchase_amount decimal(10,2));
insert into customers (first_name,last_name,email,purchase_amount)values("anand","kumar","anand@gmail.com",5000),("manu","das","manu@gmail.com",3000),("sanjay","menon","sanjay@gmail.com",7000),("ananya","nair","ananya@gmail.com",4500),("arun","thomas","arun@gmail.com",2500),("kiran","joseph","kiran@gmail.com",6000),("rohan","varma","rohan@gmail.com",4000);
select first_name as fname,last_name,email,purchase_amount from customers where first_name like "%an%" order by last_name asc, purchase_amount desc limit 5;


create table sales (order_id int primary key auto_increment,customer_id int,product varchar(100),quantity int,amount decimal(10,2));
insert into sales (customer_id,product,quantity,amount)values(1,"laptop",1,50000),(2,"mouse",2,1000),(3,"keyboard",1,2000),(4,"monitor",1,12000),(5,"headphones",2,3000);
select count(*) as total_sales,sum(amount) as total_revenue,avg(amount) as average_order_amount,min(amount) as minimum_order_amount,max(amount) as maximum_order_amount from sales;

use sql_task_db;
select * from students;
delete from students;

select * from students;
truncate table students;

drop table students;
show tables;