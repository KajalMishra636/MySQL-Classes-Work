-- ================================================
-- 🏨 HOTEL BOOKING DATABASE
-- ================================================

CREATE DATABASE HotelBookingDB;
USE HotelBookingDB;

-- Table 1: Guests
CREATE TABLE Guests (
  Guest_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Checkin_Date DATE
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
  Room_Number INT,
  Type VARCHAR(30),
  Price_Per_Night DECIMAL(10,2),
  Status VARCHAR(20)
);

INSERT INTO Rooms VALUES
(101,101,'Single',5000.00,'Available'),
(102,102,'Double',8000.00,'Booked'),
(103,103,'Suite',15000.00,'Available'),
(104,104,'Single',5000.00,'Booked'),
(105,105,'Double',8000.00,'Available'),
(106,106,'Suite',15000.00,'Available'),
(107,107,'Single',5000.00,'Booked'),
(108,108,'Double',8000.00,'Available'),
(109,109,'Suite',15000.00,'Booked'),
(110,110,'Single',5000.00,'Available');

SELECT * FROM Rooms;

-- Table 3: Bookings
CREATE TABLE Bookings (
  Booking_ID INT PRIMARY KEY,
  Guest_ID INT,
  Room_ID INT,
  Checkin_Date DATE,
  Checkout_Date DATE
);

INSERT INTO Bookings VALUES
(201,1,101,'2024-01-10','2024-01-15'),
(202,2,102,'2024-01-12','2024-01-18'),
(203,3,103,'2024-01-15','2024-01-20'),
(204,4,104,'2024-01-18','2024-01-22'),
(205,5,105,'2024-01-20','2024-01-25'),
(206,6,106,'2024-01-22','2024-01-28'),
(207,7,107,'2024-01-25','2024-01-30'),
(208,8,108,'2024-01-28','2024-02-02'),
(209,9,109,'2024-01-30','2024-02-05'),
(210,10,110,'2024-02-01','2024-02-06');

SELECT * FROM Bookings;

-- Table 4: Payments
CREATE TABLE Payments (
  Payment_ID INT PRIMARY KEY,
  Booking_ID INT,
  Amount DECIMAL(10,2),
  Payment_Date DATE,
  Payment_Method VARCHAR(20)
);

INSERT INTO Payments VALUES
(301,201,25000.00,'2024-01-10','Credit Card'),
(302,202,48000.00,'2024-01-12','UPI'),
(303,203,75000.00,'2024-01-15','Debit Card'),
(304,204,50000.00,'2024-01-18','Credit Card'),
(305,205,40000.00,'2024-01-20','Net Banking'),
(306,206,90000.00,'2024-01-22','Credit Card'),
(307,207,35000.00,'2024-01-25','UPI'),
(308,208,16000.00,'2024-01-28','Debit Card'),
(309,209,75000.00,'2024-01-30','Credit Card'),
(310,210,30000.00,'2024-02-01','UPI');

SELECT * FROM Payments;

-- Table 5: Services
CREATE TABLE Services (
  Service_ID INT PRIMARY KEY,
  Booking_ID INT,
  Service_Name VARCHAR(50),
  Price DECIMAL(10,2),
  Status VARCHAR(20)
);

INSERT INTO Services VALUES
(401,201,'Room Service',2000.00,'Completed'),
(402,202,'Spa',5000.00,'Pending'),
(403,203,'Laundry',1000.00,'Completed'),
(404,204,'Breakfast',800.00,'Completed'),
(405,205,'Gym',500.00,'Pending'),
(406,206,'Dinner',1500.00,'Completed'),
(407,207,'Pool Access',1000.00,'Completed'),
(408,208,'Room Service',2000.00,'Pending'),
(409,209,'Spa',5000.00,'Completed'),
(410,210,'Breakfast',800.00,'Pending');

SELECT * FROM Services;

-- Additional Operations
UPDATE Rooms SET Status='Booked' WHERE Room_ID=108;
DELETE FROM Bookings WHERE Booking_ID=205;
DROP TABLE Services;
