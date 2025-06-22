-- single line comments

/*
Multiline 
line
comments
*/

-- ------------------------------Database Queries  ---------------------

-- create a   database Holycoss
create database Holycross;
-- to work on it ,need to use it first
use holycross;

-- SQL is not  a case  sensitive  language ,ex -Age or age all will be treated as same word

-- to delete database
drop database holycross;

-- -------------------------------------Data Analysis------------------------------
/*
databases name -HolYcross


Tables-->
T-1 Student (id, name, age, Address)

T-2 Teacher (id,name,age, Address,salary)

T-3 Staff (id, name,age,Address,contact,salary)

*/

-- -----------------------------------------------------------Table Queries ----------------------------------

-- T-1 Student (id,name,age,std,Address)
-- create a table 
create table Students(
id int primary key,  -- primary key = not null + unique --
name varchar(50),
age int,
std varchar(10),
Address varchar(100)
);




-- display table data 
select * from Students;

-- insert table data 
insert into Students (id,name,age,std,Address)
Values
(1,'Tejas' ,5,'1st','kasara'),
(2,'Sahil',5,'1st','dombivli'),
(3,'kajal',5,'1st','dombivli'),
(4,'Dev',5,'1st','thane'),
(5,'yogesh',5,'1st','dombivli');

-- to remove complete table values
truncate table Students;

-- to remove complete table 
drop table Students;



-- create Teacher Table 
-- T-2  Teacher (id, name, age, salary, address )
create table Teachers(
id int,  
 name varchar(50),
 age int,
salary varchar(10),
Address varchar(100)
);

select *  from  Teacher;

-- insert table data 
insert into Teachers (id, name,age,salary,address)
Values
(1, 'swati','24','12000','thane'),
(2,'priti', '28','40000','mumbai'),
(3,'Ravi','27','23000','goa'),
(4,'Anil','30','20000','pune');

-- deleting the table 
drop table Teacher;
-- create table 
-- T-2 Teacher (id,name,subject,contact,salary)

-- T-3 Staff(id, Name, position,salary,contact)