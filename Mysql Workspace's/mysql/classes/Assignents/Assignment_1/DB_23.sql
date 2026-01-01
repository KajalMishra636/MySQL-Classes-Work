-- ================================================
-- 🏦 INSURANCE DATABASE
-- ================================================

CREATE DATABASE InsuranceDB;
USE InsuranceDB;

-- =================================================
-- Table 1: Policyholders
-- Stores information about people holding insurance policies
-- Attributes:
-- Policyholder_ID : Unique ID for policyholder (Primary Key)
-- Name            : Policyholder's name
-- Age             : Age of policyholder
-- Gender          : Gender
-- Contact_Number  : Phone number
-- =================================================
CREATE TABLE Policyholders (
  Policyholder_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Age INT,
  Gender VARCHAR(10),
  Contact_Number VARCHAR(15)
);

-- Sample data for Policyholders
INSERT INTO Policyholders VALUES
(1,'Riya Sharma',25,'Female','9876543210'),
(2,'Amit Patel',30,'Male','9876501234'),
(3,'Sneha Gupta',42,'Female','9812345678'),
(4,'Rahul Verma',35,'Male','9908765432'),
(5,'Priya Singh',28,'Female','9823456789'),
(6,'Vikram Rao',50,'Male','9811122233'),
(7,'Nisha Mehta',33,'Female','9922334455'),
(8,'Arjun Das',40,'Male','9898989898'),
(9,'Kavita Joshi',38,'Female','9707070707'),
(10,'Rohit Nair',29,'Male','9654321987');

SELECT * FROM Policyholders;

-- =================================================
-- Table 2: Policies
-- Stores insurance policy details
-- Attributes:
-- Policy_ID     : Unique ID for policy (Primary Key)
-- Policyholder_ID: Linked policyholder (Foreign Key)
-- Type          : Type of insurance (Health, Life, Vehicle, etc.)
-- Premium       : Premium amount
-- Start_Date    : Policy start date
-- =================================================
CREATE TABLE Policies (
  Policy_ID INT PRIMARY KEY,
  Policyholder_ID INT,
  Type VARCHAR(30),
  Premium DECIMAL(10,2),
  Start_Date DATE
);

-- Sample data for Policies
INSERT INTO Policies VALUES
(101,1,'Health',15000.00,'2024-01-01'),
(102,2,'Life',25000.00,'2024-02-01'),
(103,3,'Vehicle',12000.00,'2024-03-01'),
(104,4,'Health',18000.00,'2024-04-01'),
(105,5,'Life',22000.00,'2024-05-01'),
(106,6,'Vehicle',14000.00,'2024-06-01'),
(107,7,'Health',16000.00,'2024-07-01'),
(108,8,'Life',30000.00,'2024-08-01'),
(109,9,'Vehicle',13000.00,'2024-09-01'),
(110,10,'Health',17000.00,'2024-10-01');

SELECT * FROM Policies;

-- =================================================
-- Table 3: Claims
-- Stores insurance claim details
-- Attributes:
-- Claim_ID       : Unique ID for claim (Primary Key)
-- Policy_ID      : Linked policy (Foreign Key)
-- Claim_Amount   : Amount claimed
-- Claim_Date     : Date of claim
-- Status         : Claim status (Approved, Pending, Rejected)
-- =================================================
CREATE TABLE Claims (
  Claim_ID INT PRIMARY KEY,
  Policy_ID INT,
  Claim_Amount DECIMAL(10,2),
  Claim_Date DATE,
  Status VARCHAR(20)
);

-- Sample data for Claims
INSERT INTO Claims VALUES
(201,101,5000.00,'2024-01-15','Approved'),
(202,102,10000.00,'2024-02-10','Pending'),
(203,103,3000.00,'2024-03-05','Rejected'),
(204,104,7000.00,'2024-04-12','Approved'),
(205,105,8000.00,'2024-05-20','Pending'),
(206,106,6000.00,'2024-06-18','Approved'),
(207,107,4000.00,'2024-07-22','Rejected'),
(208,108,12000.00,'2024-08-15','Approved'),
(209,109,3500.00,'2024-09-10','Pending'),
(210,110,4500.00,'2024-10-05','Approved');

SELECT * FROM Claims;

-- =================================================
-- Table 4: Agents
-- Stores information about insurance agents
-- Attributes:
-- Agent_ID       : Unique ID for agent (Primary Key)
-- Name           : Agent name
-- Contact_Number : Phone number
-- Email          : Email address
-- Experience     : Experience in years
-- =================================================
CREATE TABLE Agents (
  Agent_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Experience INT
);

-- Sample data for Agents
INSERT INTO Agents VALUES
(301,'Rohit Sharma','9876540000','rohit@gmail.com',10),
(302,'Sneha Kapoor','9876500001','sneha@gmail.com',8),
(303,'Ramesh Singh','9876512345','ramesh@gmail.com',12),
(304,'Anjali Nair','9812345000','anjali@gmail.com',7),
(305,'Pawan Mehta','9823456000','pawan@gmail.com',9),
(306,'Sunita Rao','9933445566','sunita@gmail.com',11),
(307,'Karan Bhatia','9900112233','karan@gmail.com',6),
(308,'Meera Jain','9877777777','meera@gmail.com',8),
(309,'Deepak Shah','9811223344','deepak@gmail.com',15),
(310,'Reena Dey','9700011223','reena@gmail.com',5);

SELECT * FROM Agents;

-- =================================================
-- Table 5: Payments
-- Stores premium payment details
-- Attributes:
-- Payment_ID     : Unique ID for payment (Primary Key)
-- Policy_ID      : Linked policy (Foreign Key)
-- Amount         : Payment amount
-- Payment_Date   : Date of payment
-- Payment_Method : Payment mode (Cash, Credit Card, UPI)
-- =================================================
CREATE TABLE Payments (
  Payment_ID INT PRIMARY KEY,
  Policy_ID INT,
  Amount DECIMAL(10,2),
  Payment_Date DATE,
  Payment_Method VARCHAR(20)
);

-- Sample data for Payments
INSERT INTO Payments VALUES
(401,101,15000.00,'2024-01-01','Credit Card'),
(402,102,25000.00,'2024-02-01','UPI'),
(403,103,12000.00,'2024-03-01','Cash'),
(404,104,18000.00,'2024-04-01','Debit Card'),
(405,105,22000.00,'2024-05-01','UPI'),
(406,106,14000.00,'2024-06-01','Credit Card'),
(407,107,16000.00,'2024-07-01','Cash'),
(408,108,30000.00,'2024-08-01','UPI'),
(409,109,13000.00,'2024-09-01','Debit Card'),
(410,110,17000.00,'2024-10-01','Credit Card');

SELECT * FROM Payments;

-- =================================================
-- Additional Operations
-- =================================================
-- Update policy premium
UPDATE Policies SET Premium=20000.00 WHERE Policy_ID=105;

-- Delete a claim
DELETE FROM Claims WHERE Claim_ID=203;

-- Drop a table example
-- DROP TABLE Agents;
