-- ================================================
-- 🚌 TRANSPORTATION (BUS) DATABASE
-- ================================================

CREATE DATABASE BusTransportDB;
USE BusTransportDB;

-- =================================================
-- Table 1: Buses
-- Stores information about buses
-- Attributes:
-- Bus_ID       : Unique ID for bus (Primary Key)
-- Bus_Number   : Registration number
-- Capacity     : Number of seats
-- Type         : Bus type (AC, Non-AC, Sleeper)
-- Route        : Assigned route
-- =================================================
CREATE TABLE Buses (
  Bus_ID INT PRIMARY KEY,
  Bus_Number VARCHAR(20),
  Capacity INT,
  Type VARCHAR(20),
  Route VARCHAR(50)
);

-- Sample data for Buses
INSERT INTO Buses VALUES
(1,'MH01AB1234',50,'AC','Mumbai-Pune'),
(2,'MH01CD5678',40,'Non-AC','Mumbai-Nashik'),
(3,'MH02EF9012',45,'AC','Pune-Nashik'),
(4,'MH03GH3456',30,'Non-AC','Mumbai-Ahmedabad'),
(5,'MH04IJ7890',60,'Sleeper','Mumbai-Goa'),
(6,'MH05KL2345',50,'AC','Pune-Goa'),
(7,'MH06MN6789',40,'Non-AC','Nashik-Ahmedabad'),
(8,'MH07OP1234',55,'Sleeper','Mumbai-Indore'),
(9,'MH08QR5678',50,'AC','Pune-Indore'),
(10,'MH09ST9012',45,'Non-AC','Mumbai-Bangalore');

SELECT * FROM Buses;

-- =================================================
-- Table 2: Drivers
-- Stores information about bus drivers
-- Attributes:
-- Driver_ID    : Unique ID for driver (Primary Key)
-- Name         : Driver name
-- License_No   : Driving license number
-- Experience   : Years of experience
-- Contact_Number: Phone number
-- =================================================
CREATE TABLE Drivers (
  Driver_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  License_No VARCHAR(20),
  Experience INT,
  Contact_Number VARCHAR(15)
);

-- Sample data for Drivers
INSERT INTO Drivers VALUES
(101,'Rohit Sharma','DL123456','10','9876543210'),
(102,'Sneha Kapoor','DL234567','8','9812345678'),
(103,'Amit Patel','DL345678','12','9900112233'),
(104,'Priya Verma','DL456789','7','9922334455'),
(105,'Arjun Das','DL567890','9','9898989898'),
(106,'Kavita Joshi','DL678901','11','9707070707'),
(107,'Rahul Singh','DL789012','6','9654321987'),
(108,'Anjali Kapoor','DL890123','8','9811223344'),
(109,'Vikram Rao','DL901234','15','9933445566'),
(110,'Isha Jain','DL012345','5','9877778888');

SELECT * FROM Drivers;

-- =================================================
-- Table 3: Passengers
-- Stores passenger information
-- Attributes:
-- Passenger_ID : Unique ID for passenger (Primary Key)
-- Name         : Passenger name
-- Contact_Number: Phone number
-- Email        : Email address
-- Age          : Age of passenger
-- =================================================
CREATE TABLE Passengers (
  Passenger_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Age INT
);

-- Sample data for Passengers
INSERT INTO Passengers VALUES
(201,'Ravi Kumar','9876543210','ravi@gmail.com',25),
(202,'Sneha Sharma','9812345678','sneha@gmail.com',30),
(203,'Amit Patel','9900112233','amit@gmail.com',35),
(204,'Priya Verma','9922334455','priya@gmail.com',28),
(205,'Arjun Das','9898989898','arjun@gmail.com',40),
(206,'Kavita Joshi','9707070707','kavita@gmail.com',38),
(207,'Rahul Singh','9654321987','rahul@gmail.com',33),
(208,'Anjali Kapoor','9811223344','anjali@gmail.com',29),
(209,'Vikram Rao','9933445566','vikram@gmail.com',50),
(210,'Isha Jain','9877778888','isha@gmail.com',27);

SELECT * FROM Passengers;

-- =================================================
-- Table 4: Tickets
-- Stores ticket booking details
-- Attributes:
-- Ticket_ID    : Unique ID for ticket (Primary Key)
-- Passenger_ID : Linked passenger (Foreign Key)
-- Bus_ID       : Linked bus (Foreign Key)
-- Seat_Number  : Assigned seat number
-- Travel_Date  : Date of travel
-- =================================================
CREATE TABLE Tickets (
  Ticket_ID INT PRIMARY KEY,
  Passenger_ID INT,
  Bus_ID INT,
  Seat_Number VARCHAR(10),
  Travel_Date DATE
);

-- Sample data for Tickets
INSERT INTO Tickets VALUES
(301,201,1,'A1','2024-01-10'),
(302,202,2,'B2','2024-01-11'),
(303,203,3,'C3','2024-01-12'),
(304,204,4,'D4','2024-01-13'),
(305,205,5,'E5','2024-01-14'),
(306,206,6,'F6','2024-01-15'),
(307,207,7,'G7','2024-01-16'),
(308,208,8,'H8','2024-01-17'),
(309,209,9,'I9','2024-01-18'),
(310,210,10,'J10','2024-01-19');

SELECT * FROM Tickets;

-- =================================================
-- Table 5: Routes
-- Stores bus route details
-- Attributes:
-- Route_ID     : Unique ID for route (Primary Key)
-- Bus_ID       : Linked bus (Foreign Key)
-- Source       : Starting point
-- Destination  : Ending point
-- Distance_km  : Distance in kilometers
-- =================================================
CREATE TABLE Routes (
  Route_ID INT PRIMARY KEY,
  Bus_ID INT,
  Source VARCHAR(50),
  Destination VARCHAR(50),
  Distance_km INT
);

-- Sample data for Routes
INSERT INTO Routes VALUES
(401,1,'Mumbai','Pune',150),
(402,2,'Mumbai','Nashik',200),
(403,3,'Pune','Nashik',180),
(404,4,'Mumbai','Ahmedabad',500),
(405,5,'Mumbai','Goa',600),
(406,6,'Pune','Goa',450),
(407,7,'Nashik','Ahmedabad',300),
(408,8,'Mumbai','Indore',580),
(409,9,'Pune','Indore',500),
(410,10,'Mumbai','Bangalore',1000);

SELECT * FROM Routes;

-- =================================================
-- Additional Operations
-- =================================================
-- Update bus type
UPDATE Buses SET Type='Sleeper' WHERE Bus_ID=2;

-- Delete a ticket
DELETE FROM Tickets WHERE Ticket_ID=307;

-- Drop a table example
-- DROP TABLE Routes;
