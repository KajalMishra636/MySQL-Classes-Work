-- ================================================
-- 📱 TELECOM DATABASE
-- ================================================

CREATE DATABASE TelecomDB;
USE TelecomDB;

-- =================================================
-- Table 1: Customers
-- Stores information about telecom subscribers
-- Attributes:
-- Customer_ID    : Unique ID for each customer (Primary Key)
-- Name           : Customer full name
-- Contact_Number : Customer phone number
-- Email          : Customer email
-- Address        : Customer residential address
-- =================================================
CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Address VARCHAR(100)
);

-- Sample data for Customers
INSERT INTO Customers VALUES
(1,'Ravi Kumar','9876543210','ravi@gmail.com','Mumbai'),
(2,'Sneha Sharma','9812345678','sneha@gmail.com','Delhi'),
(3,'Amit Patel','9900112233','amitp@gmail.com','Bangalore'),
(4,'Priya Verma','9922334455','priya@gmail.com','Hyderabad'),
(5,'Arjun Das','9898989898','arjun@gmail.com','Chennai'),
(6,'Kavita Joshi','9707070707','kavita@gmail.com','Pune'),
(7,'Rahul Singh','9654321987','rahul@gmail.com','Kolkata'),
(8,'Anjali Kapoor','9811223344','anjali@gmail.com','Noida'),
(9,'Vikram Rao','9933445566','vikram@gmail.com','Gurgaon'),
(10,'Isha Jain','9877778888','isha@gmail.com','Lucknow');

SELECT * FROM Customers;

-- =================================================
-- Table 2: Plans
-- Stores information about telecom plans/packages
-- Attributes:
-- Plan_ID        : Unique ID for each plan (Primary Key)
-- Plan_Name      : Name of the plan
-- Price          : Monthly subscription price
-- Data_Limit_GB  : Data limit in GB
-- Call_Minutes   : Free call minutes included
-- =================================================
CREATE TABLE Plans (
  Plan_ID INT PRIMARY KEY,
  Plan_Name VARCHAR(50),
  Price DECIMAL(10,2),
  Data_Limit_GB INT,
  Call_Minutes INT
);

-- Sample data for Plans
INSERT INTO Plans VALUES
(101,'Basic Plan',199.00,10,100),
(102,'Standard Plan',399.00,50,500),
(103,'Premium Plan',799.00,100,1000),
(104,'Unlimited Plan',1299.00,500,5000),
(105,'Night Owl Plan',299.00,20,200),
(106,'Weekend Plan',349.00,30,300),
(107,'Family Plan',999.00,200,2000),
(108,'Business Plan',1499.00,300,3000),
(109,'Student Plan',149.00,15,150),
(110,'Travel Plan',499.00,40,400);

SELECT * FROM Plans;

-- =================================================
-- Table 3: Subscriptions
-- Stores which customers have subscribed to which plans
-- Attributes:
-- Subscription_ID : Unique ID for subscription (Primary Key)
-- Customer_ID     : Customer subscribing (Foreign Key)
-- Plan_ID         : Plan chosen (Foreign Key)
-- Start_Date      : Subscription start date
-- End_Date        : Subscription end date
-- =================================================
CREATE TABLE Subscriptions (
  Subscription_ID INT PRIMARY KEY,
  Customer_ID INT,
  Plan_ID INT,
  Start_Date DATE,
  End_Date DATE
);

-- Sample data for Subscriptions
INSERT INTO Subscriptions VALUES
(201,1,102,'2024-01-01','2024-12-31'),
(202,2,103,'2024-02-01','2025-01-31'),
(203,3,101,'2024-03-01','2024-08-31'),
(204,4,105,'2024-04-01','2025-03-31'),
(205,5,104,'2024-05-01','2025-04-30'),
(206,6,107,'2024-06-01','2025-05-31'),
(207,7,108,'2024-07-01','2025-06-30'),
(208,8,109,'2024-08-01','2025-07-31'),
(209,9,106,'2024-09-01','2025-08-31'),
(210,10,110,'2024-10-01','2025-09-30');

SELECT * FROM Subscriptions;

-- =================================================
-- Table 4: Usage
-- Stores daily usage details of customers
-- Attributes:
-- Usage_ID    : Unique ID for usage record (Primary Key)
-- Customer_ID : Customer who used services (Foreign Key)
-- Date        : Date of usage
-- Data_Used_GB: Data consumed in GB
-- Call_Minutes: Call minutes used
-- =================================================
CREATE TABLE Usage (
  Usage_ID INT PRIMARY KEY,
  Customer_ID INT,
  Date DATE,
  Data_Used_GB DECIMAL(5,2),
  Call_Minutes INT
);

-- Sample data for Usage
INSERT INTO Usage VALUES
(301,1,'2024-01-10',2.5,30),
(302,2,'2024-01-11',5.0,120),
(303,3,'2024-01-12',1.2,50),
(304,4,'2024-01-13',3.0,80),
(305,5,'2024-01-14',10.0,300),
(306,6,'2024-01-15',4.0,100),
(307,7,'2024-01-16',8.0,200),
(308,8,'2024-01-17',2.5,60),
(309,9,'2024-01-18',3.5,90),
(310,10,'2024-01-19',5.5,150);

SELECT * FROM Usage;

-- =================================================
-- Table 5: Bills
-- Stores billing information for each customer
-- Attributes:
-- Bill_ID      : Unique bill ID (Primary Key)
-- Customer_ID  : Customer being billed (Foreign Key)
-- Amount       : Total bill amount
-- Bill_Date    : Date of bill generation
-- Payment_Status: Paid/Unpaid
-- =================================================
CREATE TABLE Bills (
  Bill_ID INT PRIMARY KEY,
  Customer_ID INT,
  Amount DECIMAL(10,2),
  Bill_Date DATE,
  Payment_Status VARCHAR(20)
);

-- Sample data for Bills
INSERT INTO Bills VALUES
(401,1,399.00,'2024-01-31','Paid'),
(402,2,799.00,'2024-01-31','Paid'),
(403,3,199.00,'2024-01-31','Unpaid'),
(404,4,299.00,'2024-01-31','Paid'),
(405,5,1299.00,'2024-01-31','Paid'),
(406,6,999.00,'2024-01-31','Unpaid'),
(407,7,1499.00,'2024-01-31','Paid'),
(408,8,149.00,'2024-01-31','Paid'),
(409,9,349.00,'2024-01-31','Unpaid'),
(410,10,499.00,'2024-01-31','Paid');

SELECT * FROM Bills;

-- =================================================
-- Additional Operations
-- =================================================
-- Update customer contact number
UPDATE Customers SET Contact_Number='9870001234' WHERE Customer_ID=3;

-- Delete a subscription
DELETE FROM Subscriptions WHERE Subscription_ID=204;

-- Drop a table example
-- DROP TABLE Usage;
