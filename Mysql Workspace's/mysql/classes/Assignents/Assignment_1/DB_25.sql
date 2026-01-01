-- ================================================
-- 🤝 CUSTOMER RELATIONSHIP MANAGEMENT (CRM) DATABASE
-- ================================================

CREATE DATABASE CRMDB;
USE CRMDB;

-- =================================================
-- Table 1: Customers
-- Stores information about the company’s customers
-- Attributes:
-- Customer_ID   : Unique ID for customer (Primary Key)
-- Name          : Customer name
-- Email         : Email address
-- Contact_Number: Phone number
-- Join_Date     : Date the customer joined
-- =================================================
CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(50),
  Contact_Number VARCHAR(15),
  Join_Date DATE
);

-- Sample data for Customers
INSERT INTO Customers VALUES
(1,'Ravi Kumar','ravi@gmail.com','9876543210','2024-01-01'),
(2,'Sneha Sharma','sneha@gmail.com','9812345678','2024-01-02'),
(3,'Amit Patel','amit@gmail.com','9900112233','2024-01-03'),
(4,'Priya Verma','priya@gmail.com','9922334455','2024-01-04'),
(5,'Arjun Das','arjun@gmail.com','9898989898','2024-01-05'),
(6,'Kavita Joshi','kavita@gmail.com','9707070707','2024-01-06'),
(7,'Rahul Singh','rahul@gmail.com','9654321987','2024-01-07'),
(8,'Anjali Kapoor','anjali@gmail.com','9811223344','2024-01-08'),
(9,'Vikram Rao','vikram@gmail.com','9933445566','2024-01-09'),
(10,'Isha Jain','isha@gmail.com','9877778888','2024-01-10');

SELECT * FROM Customers;

-- =================================================
-- Table 2: Leads
-- Stores potential customer leads
-- Attributes:
-- Lead_ID       : Unique ID for lead (Primary Key)
-- Customer_ID   : Linked customer (Foreign Key)
-- Source        : Lead source (Website, Referral, Email, etc.)
-- Status        : Status of lead (New, Contacted, Converted)
-- Assigned_To   : Sales agent handling the lead
-- =================================================
CREATE TABLE Leads (
  Lead_ID INT PRIMARY KEY,
  Customer_ID INT,
  Source VARCHAR(30),
  Status VARCHAR(20),
  Assigned_To VARCHAR(50)
);

-- Sample data for Leads
INSERT INTO Leads VALUES
(101,1,'Website','New','Agent A'),
(102,2,'Referral','Contacted','Agent B'),
(103,3,'Email','Converted','Agent C'),
(104,4,'Website','New','Agent A'),
(105,5,'Email','Contacted','Agent B'),
(106,6,'Referral','Converted','Agent C'),
(107,7,'Website','New','Agent A'),
(108,8,'Email','Contacted','Agent B'),
(109,9,'Referral','Converted','Agent C'),
(110,10,'Website','New','Agent A');

SELECT * FROM Leads;

-- =================================================
-- Table 3: Interactions
-- Stores communication interactions with customers
-- Attributes:
-- Interaction_ID : Unique ID for interaction (Primary Key)
-- Customer_ID    : Linked customer (Foreign Key)
-- Date           : Interaction date
-- Channel        : Communication channel (Email, Call, Meeting)
-- Notes          : Summary of the interaction
-- =================================================
CREATE TABLE Interactions (
  Interaction_ID INT PRIMARY KEY,
  Customer_ID INT,
  Date DATE,
  Channel VARCHAR(20),
  Notes VARCHAR(255)
);

-- Sample data for Interactions
INSERT INTO Interactions VALUES
(201,1,'2024-01-05','Email','Sent introductory email'),
(202,2,'2024-01-06','Call','Discussed product requirements'),
(203,3,'2024-01-07','Meeting','Presentation of product demo'),
(204,4,'2024-01-08','Email','Follow-up for quote'),
(205,5,'2024-01-09','Call','Clarified pricing details'),
(206,6,'2024-01-10','Meeting','Signed contract'),
(207,7,'2024-01-11','Email','Sent brochure'),
(208,8,'2024-01-12','Call','Scheduled demo session'),
(209,9,'2024-01-13','Meeting','Closed sale'),
(210,10,'2024-01-14','Email','Sent follow-up thank you');

SELECT * FROM Interactions;

-- =================================================
-- Table 4: Agents
-- Stores information about sales or CRM agents
-- Attributes:
-- Agent_ID      : Unique ID for agent (Primary Key)
-- Name          : Agent name
-- Email         : Email address
-- Contact_Number: Phone number
-- Experience    : Years of experience
-- =================================================
CREATE TABLE Agents (
  Agent_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(50),
  Contact_Number VARCHAR(15),
  Experience INT
);

-- Sample data for Agents
INSERT INTO Agents VALUES
(301,'Agent A','agentA@gmail.com','9876540000',5),
(302,'Agent B','agentB@gmail.com','9876500001',7),
(303,'Agent C','agentC@gmail.com','9876512345',10),
(304,'Agent D','agentD@gmail.com','9812345000',6),
(305,'Agent E','agentE@gmail.com','9823456000',8);

SELECT * FROM Agents;

-- =================================================
-- Table 5: Sales
-- Stores sales transactions made to customers
-- Attributes:
-- Sale_ID       : Unique ID for sale (Primary Key)
-- Customer_ID   : Linked customer (Foreign Key)
-- Product       : Product sold
-- Sale_Date     : Date of sale
-- Amount        : Sale amount
-- =================================================
CREATE TABLE Sales (
  Sale_ID INT PRIMARY KEY,
  Customer_ID INT,
  Product VARCHAR(50),
  Sale_Date DATE,
  Amount DECIMAL(10,2)
);

-- Sample data for Sales
INSERT INTO Sales VALUES
(401,1,'CRM Software','2024-01-05',5000.00),
(402,2,'Analytics Tool','2024-01-06',7500.00),
(403,3,'Marketing Platform','2024-01-07',12000.00),
(404,4,'CRM Software','2024-01-08',5000.00),
(405,5,'Analytics Tool','2024-01-09',7500.00),
(406,6,'Marketing Platform','2024-01-10',12000.00),
(407,7,'CRM Software','2024-01-11',5000.00),
(408,8,'Analytics Tool','2024-01-12',7500.00),
(409,9,'Marketing Platform','2024-01-13',12000.00),
(410,10,'CRM Software','2024-01-14',5000.00);

SELECT * FROM Sales;

-- =================================================
-- Additional Operations
-- =================================================
-- Update lead status
UPDATE Leads SET Status='Converted' WHERE Lead_ID=104;

-- Delete an interaction
DELETE FROM Interactions WHERE Interaction_ID=207;

-- Drop a table example
-- DROP TABLE Agents;
