-- ================================================
-- 🍽️ RESTAURANT MANAGEMENT DATABASE
-- ================================================

CREATE DATABASE RestaurantDB;
USE RestaurantDB;

-- Table 1: Customers
CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Join_Date DATE
);

INSERT INTO Customers VALUES
(1,'Amit Sharma','9876543210','amit@gmail.com','2024-01-10'),
(2,'Neha Verma','9876501234','neha@gmail.com','2024-01-12'),
(3,'Rohit Singh','9812345678','rohit@gmail.com','2024-01-15'),
(4,'Priya Gupta','9908765432','priya@gmail.com','2024-01-18'),
(5,'Karan Mehta','9823456789','karan@gmail.com','2024-01-20'),
(6,'Sanya Rao','9811122233','sanya@gmail.com','2024-01-22'),
(7,'Arjun Das','9922334455','arjun@gmail.com','2024-01-25'),
(8,'Isha Jain','9898989898','isha@gmail.com','2024-01-28'),
(9,'Vikram Rao','9707070707','vikram@gmail.com','2024-01-30'),
(10,'Anjali Kapoor','9654321987','anjali@gmail.com','2024-02-01');

SELECT * FROM Customers;

-- Table 2: Tables
CREATE TABLE Tables (
  Table_ID INT PRIMARY KEY,
  Table_Number INT,
  Seats INT,
  Location VARCHAR(50),
  Status VARCHAR(20)
);

INSERT INTO Tables VALUES
(101,1,4,'Indoor','Available'),
(102,2,2,'Indoor','Booked'),
(103,3,6,'Outdoor','Available'),
(104,4,4,'Outdoor','Available'),
(105,5,2,'Indoor','Booked'),
(106,6,4,'Indoor','Available'),
(107,7,6,'Outdoor','Booked'),
(108,8,2,'Indoor','Available'),
(109,9,4,'Outdoor','Available'),
(110,10,6,'Indoor','Booked');

SELECT * FROM Tables;

-- Table 3: Orders
CREATE TABLE Orders (
  Order_ID INT PRIMARY KEY,
  Customer_ID INT,
  Table_ID INT,
  Order_Date DATE,
  Total_Amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(201,1,101,'2024-01-10',2500.00),
(202,2,102,'2024-01-12',1500.00),
(203,3,103,'2024-01-15',3000.00),
(204,4,104,'2024-01-18',2800.00),
(205,5,105,'2024-01-20',2000.00),
(206,6,106,'2024-01-22',3500.00),
(207,7,107,'2024-01-25',4000.00),
(208,8,108,'2024-01-28',2200.00),
(209,9,109,'2024-01-30',1800.00),
(210,10,110,'2024-02-01',5000.00);

SELECT * FROM Orders;

-- Table 4: Menu
CREATE TABLE Menu (
  Item_ID INT PRIMARY KEY,
  Item_Name VARCHAR(50),
  Category VARCHAR(30),
  Price DECIMAL(10,2),
  Availability VARCHAR(20)
);

INSERT INTO Menu VALUES
(301,'Pizza','Main Course',500.00,'Available'),
(302,'Pasta','Main Course',400.00,'Available'),
(303,'Burger','Main Course',300.00,'Available'),
(304,'Salad','Starter',200.00,'Available'),
(305,'Soup','Starter',150.00,'Available'),
(306,'Ice Cream','Dessert',100.00,'Available'),
(307,'Brownie','Dessert',120.00,'Available'),
(308,'Juice','Beverage',80.00,'Available'),
(309,'Coffee','Beverage',90.00,'Available'),
(310,'Tea','Beverage',50.00,'Available');

SELECT * FROM Menu;

-- Table 5: Staff
CREATE TABLE Staff (
  Staff_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Role VARCHAR(30),
  Shift VARCHAR(20),
  Salary DECIMAL(10,2)
);

INSERT INTO Staff VALUES
(401,'Rohit Verma','Manager','Morning',60000.00),
(402,'Neha Sharma','Chef','Morning',40000.00),
(403,'Amit Patel','Waiter','Evening',20000.00),
(404,'Priya Singh','Receptionist','Morning',25000.00),
(405,'Karan Rao','Chef','Evening',40000.00),
(406,'Sanya Mehta','Waiter','Morning',18000.00),
(407,'Arjun Das','Manager','Evening',60000.00),
(408,'Isha Jain','Receptionist','Evening',25000.00),
(409,'Vikram Kapoor','Chef','Morning',40000.00),
(410,'Anjali Kapoor','Waiter','Evening',18000.00);

SELECT * FROM Staff;

-- Additional Operations
UPDATE Tables SET Status='Booked' WHERE Table_ID=109;
DELETE FROM Orders WHERE Order_ID=205;
DROP TABLE Staff;
