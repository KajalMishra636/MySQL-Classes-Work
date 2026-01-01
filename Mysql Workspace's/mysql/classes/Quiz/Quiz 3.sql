-- PART A
-- 1.
create database Company;
use Company;
drop database Company;

Create table employees (
EmpID int primary key,
Name varchar(100),
Department varchar(50),
Salary decimal(8,2) check (Salary > 0)
);

Insert into employees (EmpID, Name, department, salary)
values
(101, 'Rohit', 'Finance', 65000.00),
(102, 'Anjali', 'HR', 58000.00),
(103, 'Amit', 'IT', 72000.00),
(104, 'Neha', 'Marketing', 60000.00),
(105, 'Ravi', 'Finance', 67000.00),
(106, 'Priya', 'HR', 59000.00),
(107, 'Suresh', 'Operations', 71000.00),
(108, 'Pooja', 'IT', 75000.00);

select * from Employees;
drop table employees;
-- 2.
update Employees 
set salary = 76000
where EmpID = 105;

-- 3. 
Delete From Employees
where EmpID = 'HR';
 
-- 4. 
Select * from employees 
where department = 'Finance';

-- PART B
-- 5.
select * from employees order by salary desc limit 3;

-- 6. 
select department, sum(salary) as total_salary from employees group by department;

-- 7.
select * from employees where salary > 50000 and salary < 80000;

-- 8.
select * from employees where name like 'A%'; 

-- --------------------------------------PART C-------------------------------------------

-- 9. 
Create database school;
use school;
drop database school;

Create table students (
id int primary key,
RollNo int Unique,
name varchar(100),
marks int check(marks > 0)
);

-- 10. 
Alter table Employees
Add email varchar(100) not null;

-- 11.

create table customers (
customerid int primary key,
customer_name varchar(100)
);

INSERT INTO CUSTOMERS (CustomerID, Customer_name)
VALUES 
(201, 'Rajesh Kumar'),
(202, 'Priya Sharma'),
(203, 'Amit Verma'),
(204, 'Sneha Iyer'),
(205, 'Vikram Singh');

select * from customers;

create table orders (
OrderID int primary key,
orderdate date,
CustomerID int,
amount decimal(10, 2) check(amount > 0),
foreign key (customerid) references customers (customerid)
);

INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount)
values 
(1001, '2025-09-01', 201, 1599.50),
(1002, '2025-09-05', 202, 250.00),
(1003, '2025-09-10', 203, 9999.99),
(1004, '2025-09-15', 204, 450.75),
(1005, '2025-09-18', 205, 799.00);

select * from orders;

-- PART D
-- 12.
select c.customer_name, o.orderid, o.orderdate, o.orderamount
from customers c 
inner join orders o
on c.customerid = o.customerid;

-- 13. 
create table projects (
ProjectId int primary key,
projectname varchar(100),
EmpID int,
foreign key (EmpID) references Employees (EmpID)
);

INSERT INTO projects (ProjectId, projectname, EmpID) VALUES
(1, 'Website Redesign', 101),
(2, 'Mobile App Development', 102),
(3, 'Cloud Migration', 103),
(4, 'CRM Integration', 104),
(5, 'Data Analytics Dashboard', 105);


Select e.name as EmployeeName, ProjectName
From Employees
left Join projects p
on e.EmpId = p.EmpID;

-- 14.
Create table Departments (
departmentId int primary key,
departmentName varchar(100)
);

Insert into departments(DepartmentID, DepartmentName)
VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');

-- 14.
select d.departmentName, e.name as Employeename
from employees e
right join departments d on e.departmentid = d.departmentid;

-- 15.
select e.EmpID, e.name, e.department, e.salary
from employees e
left join projects p on e.EmpID = p.EmpID
where p.projectid is null;

-- 16. 
CREATE TABLE Branch_A_Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Branch_A_Employees (EmpID, Name, Department, Salary) VALUES
(1, 'Rajesh Kumar', 'Sales', 50000.00),
(2, 'Priya Sharma', 'Marketing', 55000.00),
(3, 'Amit Verma', 'IT', 60000.00);

CREATE TABLE Branch_B_Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Branch_B_Employees (EmpID, Name, Department, Salary) VALUES
(4, 'Neha Singh', 'Sales', 52000.00),
(5, 'Anil Mehta', 'HR', 48000.00),
(6, 'Sunita Rao', 'IT', 61000.00);

select EmpID, name, department, salary
from Branch_A_Employees 
Union
Select EmpID, name, department, salary
from Branch_B_Employees;

-- PART E
-- 17.
select max(salary) from employees 
where salary < (select max(salary) from employees);

-- 18.
select names from employees 
where salary > (select avg(salary) as avg_salary from employees);

-- 19.
Select * from employees 
where department = (select * from employees where name = 'Rohit');

 -- 20.
select distinct c.customerid, c.customername 
from customers c
join orders o 
on c.cusomerid = o.customerid 
where o.amount > (select avg(amount) from orders);

 -- 21. 
select now();
 
-- 22.
select name, length(name) as NameLength from Employees;

-- 23
select count(*) as total_employees from employees;

-- 24. 
Delimiter //

create function getbonus(salary decimal(8, 2)) 
returns decimal(10, 2)
deterministic
begin 
return salary * 0.10;
end //
delimiter ;

select EmpId, name, getbonus(salary) as bonus from employees;

