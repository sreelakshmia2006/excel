create database sql_advanced_task;
use sql_advanced_task;
select database();
create table sales (order_id int primary key auto_increment,region varchar(50),product varchar(50),amount decimal(10,2));
insert into sales (region,product,amount)values("north","laptop",60000),("north","mobile",50000),("south","laptop",40000),("south","mobile",30000),("east","tablet",20000),("east","laptop",50000);
select * from sales;
select region, sum(amount) as total_sales from sales group by region;
select product, avg(amount) as average_sales from sales group by product;
select region, sum(amount) as total_sales from sales group by region having sum(amount) > 100000;
select product, avg(amount) as average_sales from sales group by product having avg(amount) > 10000;

create table customers (customer_id int primary key,customer_name varchar(100));
insert into customers (customer_id,customer_name)values(1,"anu"),(2,"rahul"),(3,"meera");
select * from customers;

create table orders (order_id int primary key, customer_id int,order_amount decimal(10,2),foreign key (customer_id) references customers(customer_id));
insert into orders (order_id,customer_id,order_amount)values(101,1,5000),(102,2,3500),(103,1,7000),(104,3,4500);
select * from orders;
select customers.customer_name,orders.order_id,orders.order_amount from customers inner join orders on customers.customer_id = orders.customer_id;
select customers.customer_name,orders.order_id,orders.order_amount from customers inner join orders on customers.customer_id = orders.customer_id where orders.order_amount > 4000;

create table departments (dept_id int primary key,dept_name varchar(50));
insert into departments (dept_id,dept_name)values(1,"sales"),(2,"hr"),(3,"it"),(4,"marketing");

create table employees (emp_id int primary key,emp_name varchar(100),first_name varchar(50),last_name varchar(50),dept_id int null,salary decimal(10,2),join_date date, foreign key (dept_id) references departments(dept_id));
insert into employees (emp_id,emp_name,first_name,last_name,dept_id,salary,join_date)values(101,"anu nair","anu","nair",1,55000,"2022-01-15"),(102,"rahul das","rahul","das",2,45000,"2023-03-10"),(103,"meera menon","meera","menon",1,62000,"2021-06-20"),(104,"arun kumar","arun","kumar",null,40000,"2024-02-01"),(105,"diya nair","diya","nair",3,70000,"2020-08-05");
select e.emp_id,e.emp_name,d.dept_name from employees e left join departments d on e.dept_id = d.dept_id;
select e.emp_id,e.emp_name,d.dept_name from employees e right join departments d on e.dept_id = d.dept_id;
select * from employees where dept_id is null;


select emp_name from employees where dept_id in (1, 2) union select emp_name from employees where dept_id in (1, 3);
select emp_name from employees where dept_id in (1, 2) union all select emp_name from employees where dept_id in (1, 3);


select concat(first_name, " ", last_name) as full_name, round(salary) as rounded_salary, abs(salary) as absolute_salary,datediff(curdate(), join_date) as experience_days, left(last_name, 3) as first_three_letters from employees;

select emp_id, emp_name, salary from employees where salary > (select avg(salary) from employees);
select emp_id, emp_name, dept_id, salary from employees where dept_id in (select dept_id from departments where dept_name in ("sales","hr"));
select emp_id, emp_name, salary from employees where salary = (select max(salary) from employees);
create view employee_report as select e.emp_name as name, d.dept_name as department, e.salary from employees e left join departments d on e.dept_id = d.dept_id;
select * from employee_report where salary > 50000;

 