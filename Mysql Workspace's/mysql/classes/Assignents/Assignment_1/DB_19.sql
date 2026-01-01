-- ================================================
-- 🩸 BLOOD BANK DATABASE
-- ================================================

CREATE DATABASE BloodBankDB;
USE BloodBankDB;

-- =================================================
-- Table 1: Donors
-- Stores information about blood donors
-- Attributes:
-- Donor_ID      : Unique ID for each donor (Primary Key)
-- Name          : Donor's full name
-- Blood_Group   : Blood group of the donor (A+, O-, etc.)
-- Age           : Donor's age
-- Contact_Number: Phone number
-- =================================================
CREATE TABLE Donors (
  Donor_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Blood_Group VARCHAR(5),
  Age INT,
  Contact_Number VARCHAR(15)
);

-- Sample data for Donors
INSERT INTO Donors VALUES
(1,'Ravi Kumar','A+',30,'9876543210'),
(2,'Sneha Sharma','B+',25,'9812345678'),
(3,'Amit Patel','O-',35,'9900112233'),
(4,'Priya Verma','AB+',28,'9922334455'),
(5,'Arjun Das','A-',40,'9898989898'),
(6,'Kavita Joshi','O+',32,'9707070707'),
(7,'Rahul Singh','B-',29,'9654321987'),
(8,'Anjali Kapoor','AB-',26,'9811223344'),
(9,'Vikram Rao','A+',38,'9933445566'),
(10,'Isha Jain','O-',27,'9877778888');

SELECT * FROM Donors;

-- =================================================
-- Table 2: Blood_Inventory
-- Stores current blood units available in the blood bank
-- Attributes:
-- Inventory_ID : Unique ID for inventory record (Primary Key)
-- Blood_Group  : Blood group
-- Units        : Number of units available
-- Expiry_Date  : Expiration date of blood units
-- Storage_Location: Storage section of blood bank
-- =================================================
CREATE TABLE Blood_Inventory (
  Inventory_ID INT PRIMARY KEY,
  Blood_Group VARCHAR(5),
  Units INT,
  Expiry_Date DATE,
  Storage_Location VARCHAR(50)
);

-- Sample data for Blood_Inventory
INSERT INTO Blood_Inventory VALUES
(101,'A+',50,'2024-12-31','Section A'),
(102,'B+',30,'2024-11-30','Section B'),
(103,'O-',40,'2024-10-15','Section C'),
(104,'AB+',20,'2024-12-15','Section D'),
(105,'A-',25,'2024-09-30','Section A'),
(106,'O+',35,'2024-11-10','Section C'),
(107,'B-',15,'2024-08-31','Section B'),
(108,'AB-',10,'2024-12-01','Section D'),
(109,'A+',20,'2024-10-31','Section A'),
(110,'O-',15,'2024-09-15','Section C');

SELECT * FROM Blood_Inventory;

-- =================================================
-- Table 3: Hospitals
-- Stores information about hospitals receiving blood
-- Attributes:
-- Hospital_ID   : Unique ID for hospital (Primary Key)
-- Name          : Hospital name
-- Contact_Number: Phone number
-- Address       : Location of hospital
-- Email         : Hospital email
-- =================================================
CREATE TABLE Hospitals (
  Hospital_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Address VARCHAR(100),
  Email VARCHAR(50)
);

-- Sample data for Hospitals
INSERT INTO Hospitals VALUES
(201,'City Hospital','9876543210','Mumbai','cityhospital@gmail.com'),
(202,'Green Care','9812345678','Delhi','greencare@gmail.com'),
(203,'Sunrise Hospital','9900112233','Bangalore','sunrise@gmail.com'),
(204,'Health Plus','9922334455','Hyderabad','healthplus@gmail.com'),
(205,'LifeCare','9898989898','Chennai','lifecare@gmail.com'),
(206,'MediTrust','9707070707','Pune','meditrust@gmail.com'),
(207,'Healing Hands','9654321987','Kolkata','healing@gmail.com'),
(208,'Hope Hospital','9811223344','Noida','hope@gmail.com'),
(209,'CarePoint','9933445566','Gurgaon','carepoint@gmail.com'),
(210,'Wellness Center','9877778888','Lucknow','wellness@gmail.com');

SELECT * FROM Hospitals;

-- =================================================
-- Table 4: Blood_Requests
-- Stores requests made by hospitals for blood units
-- Attributes:
-- Request_ID   : Unique ID for request (Primary Key)
-- Hospital_ID  : Hospital making the request (Foreign Key)
-- Blood_Group  : Blood group requested
-- Units_Required: Number of units requested
-- Request_Date : Date of request
-- =================================================
CREATE TABLE Blood_Requests (
  Request_ID INT PRIMARY KEY,
  Hospital_ID INT,
  Blood_Group VARCHAR(5),
  Units_Required INT,
  Request_Date DATE
);

-- Sample data for Blood_Requests
INSERT INTO Blood_Requests VALUES
(301,201,'A+',10,'2024-01-10'),
(302,202,'B+',5,'2024-01-11'),
(303,203,'O-',8,'2024-01-12'),
(304,204,'AB+',4,'2024-01-13'),
(305,205,'A-',6,'2024-01-14'),
(306,206,'O+',7,'2024-01-15'),
(307,207,'B-',3,'2024-01-16'),
(308,208,'AB-',2,'2024-01-17'),
(309,209,'A+',5,'2024-01-18'),
(310,210,'O-',4,'2024-01-19');

SELECT * FROM Blood_Requests;

-- =================================================
-- Table 5: Donations
-- Stores donation history
-- Attributes:
-- Donation_ID : Unique ID for donation (Primary Key)
-- Donor_ID    : Donor providing blood (Foreign Key)
-- Blood_Group : Blood group donated
-- Units       : Number of units donated
-- Donation_Date: Date of donation
-- =================================================
CREATE TABLE Donations (
  Donation_ID INT PRIMARY KEY,
  Donor_ID INT,
  Blood_Group VARCHAR(5),
  Units INT,
  Donation_Date DATE
);

-- Sample data for Donations
INSERT INTO Donations VALUES
(401,1,'A+',2,'2024-01-05'),
(402,2,'B+',1,'2024-01-06'),
(403,3,'O-',2,'2024-01-07'),
(404,4,'AB+',1,'2024-01-08'),
(405,5,'A-',2,'2024-01-09'),
(406,6,'O+',1,'2024-01-10'),
(407,7,'B-',1,'2024-01-11'),
(408,8,'AB-',1,'2024-01-12'),
(409,9,'A+',2,'2024-01-13'),
(410,10,'O-',1,'2024-01-14');

SELECT * FROM Donations;

-- =================================================
-- Additional Operations
-- =================================================
-- Update blood units in inventory after donation
UPDATE Blood_Inventory SET Units = Units + 2 WHERE Blood_Group='A+';

-- Delete a blood request
DELETE FROM Blood_Requests WHERE Request_ID=307;

-- Drop a table example
-- DROP TABLE Donations;
