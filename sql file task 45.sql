create database college_db_task;
use college_db_task;
create table college_students (student_id int primary key auto_increment , name varchar(50) not null, email varchar(100) unique, age int check (age >=18), city varchar(50) default "kochi");
insert into college_students (name, email, age, city)values("arun","arun@gmail.com",20,"kochi"),("meera","meera@gmail.com",21,"calicut"),("rahul","rahul@gmail.com",22,"malappuram"),("anu","anu@gmail.com",19,"thrissur"),("vishnu","vishnu@gmail.com",23, default);
select * from college_students;
insert into college_students (email,age,city)values("test1@gmail.com",20,"kochi");
insert into college_students (name,email,age,city)values("ajay","ajay@gmail.com",21,"kochi");
describe college_students;
select * from college_students where email = "arun@gmail.com";
insert into college_students (name,email,age,city)values("ajay","ajay@gmail.com",16,"kochi");
insert into college_students (name,email,age)values("anjali","anjali@gmail.com",20);
select * from college_students where email = "anjali@gmail.com";
select * from college_students;


use college_db_task;
create table courses (course_id int primary key auto_increment , course_name varchar(50) not null, duration int , fee decimal(10,2));
alter table courses add column course_mode varchar(20);
alter table courses drop column duration;
insert into courses (course_name,fee,course_mode)values("python",15000,"online"),("data analytics",25000,"offline"),("sql",10000,"online"),("power bi",12000,"offline"),("java",18000,"online");
select * from courses;


select * from college_students;
create table enrollments (enrollment_id int primary key auto_increment, student_id int, course_id int, enrollment_date date, foreign key (student_id) references college_students(student_id), foreign key (course_id) references courses(course_id));
select * from college_students;
select * from courses;
insert into enrollments (student_id,couse_id,enrollment_date)values(1,1,"2026-10-10"),(2,2,"2026-10-10"),(1,2,"2026-10-10");
describe courses;
describe enrolments;
use college_db_task;
show tables;
use college_db_task;
describe enrollments;
select * from college_students;
select * from courses;
insert into enrollments (student_id,course_id,enrollment_date)values(1,1,"2026-10-10"),(2,2,"2026-10-10"),(3,3,"2026-10-10");
select * from enrollments;
insert into enrollments (student_id,course_id,enrollment_date)values(999,1,"2026-10-10");


select * from college_students;
select name,email from college_students;


truncate table courses;
create table courses_test (course_id int primary key,course_name varchar(50));
insert into course_test (course_id,course_name)values(1,"python"),(2,"sql"),(3,"power bi");
use college_db_task;
create table course_test (course_id int primary key,course_name varchar(50));
insert into course_test (course_id,course_name)values(1,"python"),(2,"sql"),(3,"power bi");
select * from course_test;
truncate table course_test;
select * from course_test;
drop table course_test;
show tables;

use college_db_task;
drop table courses_task;
show tables;
use college_db_task;
show tables like "%course%";
drop table college_db_task.courses_test;
show tables like "%course%";


create table customers (customer_id int primary key auto_increment,customer_name varchar(50) not null, city varchar(50));
create table orders (order_id int primary key,customer_id int,amount decimal(10,2),foreign key (customer_id) references customers(customer_id));
create table products (product_id int primary key auto_increment,product_name varchar(50) not null);
create table order_details (order_id int,product_id int, primary key (order_id,product_id), foreign key (order_id) references orders(order_id), foreign key (product_id) references products(product_id));
insert into customers (customer_name,city)values("arun","kochi"),("meera","malappuram");
insert into orders (order_id,customer_id,amount)values(101,1,50000),(102,2,20000),(103,1,20000);
insert into products (product_name)values("laptop"),("mobile"),("tablet");
insert into order_details (order_id,product_id)values(101,1),(101,2),(103,1);
select * from customers;
select * from orders;
select * from products;
select * from order_details; 