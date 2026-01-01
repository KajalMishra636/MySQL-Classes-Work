-- ================================================
-- 🏨 HOTEL MANAGEMENT DATABASE
-- ================================================

CREATE DATABASE HotelDB;
USE HotelDB;

-- Table 1: Guests
CREATE TABLE Guests (
  Guest_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  CheckIn_Date DATE
);

INSERT INTO Guests VALUES
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

SELECT * FROM Guests;

-- Table 2: Rooms
CREATE TABLE Rooms (
  Room_ID INT PRIMARY KEY,
  Room_Type VARCHAR(30),
  Capacity INT,
  Price_Per_Night DECIMAL(10,2),
  Status VARCHAR(20)
);

INSERT INTO Rooms VALUES
(101,'Single',1,1500.00,'Available'),
(102,'Double',2,2500.00,'Booked'),
(103,'Suite',4,5000.00,'Available'),
(104,'Deluxe',3,3500.00,'Available'),
(105,'Single',1,1500.00,'Booked'),
(106,'Double',2,2500.00,'Available'),
(107,'Suite',4,5000.00,'Booked'),
(108,'Deluxe',3,3500.00,'Available'),
(109,'Single',1,1500.00,'Available'),
(110,'Double',2,2500.00,'Booked');

SELECT * FROM Rooms;

-- Table 3: Bookings
CREATE TABLE Bookings (
  Booking_ID INT PRIMARY KEY,
  Guest_ID INT,
  Room_ID INT,
  CheckIn_Date DATE,
  CheckOut_Date DATE
);

INSERT INTO Bookings VALUES
(201,1,101,'2024-01-10','2024-01-15'),
(202,2,102,'2024-01-12','2024-01-17'),
(203,3,103,'2024-01-15','2024-01-20'),
(204,4,104,'2024-01-18','2024-01-22'),
(205,5,105,'2024-01-20','2024-01-25'),
(206,6,106,'2024-01-22','2024-01-27'),
(207,7,107,'2024-01-25','2024-01-30'),
(208,8,108,'2024-01-28','2024-02-02'),
(209,9,109,'2024-01-30','2024-02-04'),
(210,10,110,'2024-02-01','2024-02-06');

SELECT * FROM Bookings;

-- Table 4: Staff
CREATE TABLE Staff (
  Staff_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Role VARCHAR(30),
  Shift VARCHAR(20),
  Salary DECIMAL(10,2)
);

INSERT INTO Staff VALUES
(301,'Rajesh Kumar','Manager','Morning',60000.00),
(302,'Neha Sharma','Receptionist','Morning',25000.00),
(303,'Rohit Verma','Housekeeping','Evening',20000.00),
(304,'Priya Singh','Chef','Morning',40000.00),
(305,'Karan Mehta','Waiter','Evening',18000.00),
(306,'Sanya Rao','Receptionist','Evening',25000.00),
(307,'Arjun Das','Housekeeping','Morning',20000.00),
(308,'Isha Jain','Chef','Evening',40000.00),
(309,'Vikram Rao','Manager','Evening',60000.00),
(310,'Anjali Kapoor','Waiter','Morning',18000.00);

SELECT * FROM Staff;

-- Table 5: Services
CREATE TABLE Services (
  Service_ID INT PRIMARY KEY,
  Booking_ID INT,
  Service_Name VARCHAR(50),
  Cost DECIMAL(10,2),
  Date DATE
);

INSERT INTO Services VALUES
(401,201,'Spa',1000.00,'2024-01-11'),
(402,202,'Room Service',500.00,'2024-01-13'),
(403,203,'Laundry',300.00,'2024-01-16'),
(404,204,'Breakfast',400.00,'2024-01-19'),
(405,205,'Dinner',700.00,'2024-01-21'),
(406,206,'Spa',1000.00,'2024-01-23'),
(407,207,'Laundry',300.00,'2024-01-26'),
(408,208,'Breakfast',400.00,'2024-01-29'),
(409,209,'Dinner',700.00,'2024-02-01'),
(410,210,'Room Service',500.00,'2024-02-03');

SELECT * FROM Services;

-- Additional Operations
-- Update room status
UPDATE Rooms SET Status='Booked' WHERE Room_ID=109;

-- Delete a service record
DELETE FROM Services WHERE Service_ID=403;

-- Drop Staff table for restructuring
DROP TABLE Staff;
