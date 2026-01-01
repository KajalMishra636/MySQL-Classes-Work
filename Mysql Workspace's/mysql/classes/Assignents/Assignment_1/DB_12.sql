-- ================================================
-- 🌍 TRAVEL / TOURISM DATABASE
-- ================================================

CREATE DATABASE TravelDB;
USE TravelDB;

-- Table 1: Travelers
CREATE TABLE Travelers (
  Traveler_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Age INT,
  Gender VARCHAR(10),
  Contact_Number VARCHAR(15)
);

INSERT INTO Travelers VALUES
(1,'Amit Sharma',28,'Male','9876543210'),
(2,'Neha Verma',25,'Female','9876501234'),
(3,'Rohit Singh',30,'Male','9812345678'),
(4,'Priya Gupta',27,'Female','9908765432'),
(5,'Karan Mehta',32,'Male','9823456789'),
(6,'Sanya Rao',29,'Female','9811122233'),
(7,'Arjun Das',31,'Male','9922334455'),
(8,'Isha Jain',26,'Female','9898989898'),
(9,'Vikram Rao',33,'Male','9707070707'),
(10,'Anjali Kapoor',24,'Female','9654321987');

SELECT * FROM Travelers;

-- Table 2: Destinations
CREATE TABLE Destinations (
  Destination_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Country VARCHAR(50),
  Type VARCHAR(30),
  Popularity_Rating INT
);

INSERT INTO Destinations VALUES
(101,'Paris','France','City',10),
(102,'Goa','India','Beach',9),
(103,'Swiss Alps','Switzerland','Mountain',8),
(104,'Tokyo','Japan','City',9),
(105,'Bali','Indonesia','Island',9),
(106,'London','UK','City',10),
(107,'New York','USA','City',10),
(108,'Dubai','UAE','City',9),
(109,'Maldives','Maldives','Island',10),
(110,'Sydney','Australia','City',8);

SELECT * FROM Destinations;

-- Table 3: Bookings
CREATE TABLE Bookings (
  Booking_ID INT PRIMARY KEY,
  Traveler_ID INT,
  Destination_ID INT,
  Booking_Date DATE,
  Travel_Date DATE
);

INSERT INTO Bookings VALUES
(201,1,101,'2024-01-10','2024-02-10'),
(202,2,102,'2024-01-12','2024-02-15'),
(203,3,103,'2024-01-15','2024-03-01'),
(204,4,104,'2024-01-18','2024-03-10'),
(205,5,105,'2024-01-20','2024-04-01'),
(206,6,106,'2024-01-22','2024-04-15'),
(207,7,107,'2024-01-25','2024-05-01'),
(208,8,108,'2024-01-28','2024-05-10'),
(209,9,109,'2024-01-30','2024-06-01'),
(210,10,110,'2024-02-01','2024-06-10');

SELECT * FROM Bookings;

-- Table 4: Hotels
CREATE TABLE Hotels (
  Hotel_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Destination_ID INT,
  Stars INT,
  Price_Per_Night DECIMAL(10,2)
);

INSERT INTO Hotels VALUES
(301,'Hotel Paris','101',5,15000.00),
(302,'Goa Beach Resort','102',4,8000.00),
(303,'Swiss Inn','103',5,20000.00),
(304,'Tokyo Stay','104',4,12000.00),
(305,'Bali Paradise','105',5,18000.00),
(306,'London Suites','106',5,16000.00),
(307,'NYC Grand','107',5,20000.00),
(308,'Dubai Palace','108',5,22000.00),
(309,'Maldives Retreat','109',5,25000.00),
(310,'Sydney Harbor','110',4,15000.00);

SELECT * FROM Hotels;

-- Table 5: Payments
CREATE TABLE Payments (
  Payment_ID INT PRIMARY KEY,
  Booking_ID INT,
  Amount DECIMAL(10,2),
  Payment_Date DATE,
  Payment_Method VARCHAR(20)
);

INSERT INTO Payments VALUES
(401,201,150000.00,'2024-01-15','Credit Card'),
(402,202,80000.00,'2024-01-16','UPI'),
(403,203,200000.00,'2024-01-18','Debit Card'),
(404,204,120000.00,'2024-01-20','Credit Card'),
(405,205,180000.00,'2024-01-22','UPI'),
(406,206,160000.00,'2024-01-24','Net Banking'),
(407,207,200000.00,'2024-01-26','Credit Card'),
(408,208,220000.00,'2024-01-28','UPI'),
(409,209,250000.00,'2024-01-30','Debit Card'),
(410,210,150000.00,'2024-02-01','Net Banking');

SELECT * FROM Payments;

-- Additional Operations
UPDATE Destinations SET Popularity_Rating=10 WHERE Destination_ID=103;
DELETE FROM Bookings WHERE Booking_ID=205;
DROP TABLE Hotels;
