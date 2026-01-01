-- ================================================
-- 🎉 EVENT MANAGEMENT DATABASE
-- ================================================

CREATE DATABASE EventManagementDB;
USE EventManagementDB;

-- =================================================
-- Table 1: Events
-- Stores details about events being organized
-- Attributes:
-- Event_ID      : Unique ID for each event (Primary Key)
-- Name          : Event name
-- Type          : Type of event (Wedding, Conference, etc.)
-- Date          : Event date
-- Location      : Event location
-- =================================================
CREATE TABLE Events (
  Event_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Type VARCHAR(30),
  Date DATE,
  Location VARCHAR(50)
);

-- Sample data for Events
INSERT INTO Events VALUES
(1,'Tech Conference 2024','Conference','2024-02-10','Mumbai'),
(2,'Wedding of Riya & Rohit','Wedding','2024-03-15','Delhi'),
(3,'Music Concert','Concert','2024-04-20','Bangalore'),
(4,'Corporate Seminar','Seminar','2024-05-25','Hyderabad'),
(5,'Birthday Party','Birthday','2024-06-05','Chennai'),
(6,'Fashion Show','Show','2024-07-10','Pune'),
(7,'Art Exhibition','Exhibition','2024-08-15','Kolkata'),
(8,'Charity Gala','Gala','2024-09-20','Noida'),
(9,'Startup Meetup','Meetup','2024-10-05','Gurgaon'),
(10,'Food Festival','Festival','2024-11-12','Lucknow');

SELECT * FROM Events;

-- =================================================
-- Table 2: Attendees
-- Stores information about attendees of events
-- Attributes:
-- Attendee_ID   : Unique ID for attendee (Primary Key)
-- Name          : Attendee name
-- Contact_Number: Phone number
-- Email         : Email address
-- Event_ID      : Event attended (Foreign Key)
-- =================================================
CREATE TABLE Attendees (
  Attendee_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Event_ID INT
);

-- Sample data for Attendees
INSERT INTO Attendees VALUES
(101,'Ravi Kumar','9876543210','ravi@gmail.com',1),
(102,'Sneha Sharma','9812345678','sneha@gmail.com',2),
(103,'Amit Patel','9900112233','amitp@gmail.com',3),
(104,'Priya Verma','9922334455','priya@gmail.com',4),
(105,'Arjun Das','9898989898','arjun@gmail.com',5),
(106,'Kavita Joshi','9707070707','kavita@gmail.com',6),
(107,'Rahul Singh','9654321987','rahul@gmail.com',7),
(108,'Anjali Kapoor','9811223344','anjali@gmail.com',8),
(109,'Vikram Rao','9933445566','vikram@gmail.com',9),
(110,'Isha Jain','9877778888','isha@gmail.com',10);

SELECT * FROM Attendees;

-- =================================================
-- Table 3: Staff
-- Stores information about staff managing events
-- Attributes:
-- Staff_ID      : Unique ID for staff (Primary Key)
-- Name          : Staff name
-- Role          : Role in event (Coordinator, Manager, etc.)
-- Contact_Number: Phone number
-- Event_ID      : Event assigned (Foreign Key)
-- =================================================
CREATE TABLE Staff (
  Staff_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Role VARCHAR(30),
  Contact_Number VARCHAR(15),
  Event_ID INT
);

-- Sample data for Staff
INSERT INTO Staff VALUES
(201,'Rohit Sharma','Coordinator','9876540000',1),
(202,'Sneha Kapoor','Manager','9876500001',2),
(203,'Ramesh Singh','Technician','9876512345',3),
(204,'Anjali Nair','Supervisor','9812345000',4),
(205,'Pawan Mehta','Coordinator','9823456000',5),
(206,'Sunita Rao','Manager','9933445566',6),
(207,'Karan Bhatia','Technician','9900112233',7),
(208,'Meera Jain','Supervisor','9877777777',8),
(209,'Deepak Shah','Coordinator','9811223344',9),
(210,'Reena Dey','Manager','9700011223',10);

SELECT * FROM Staff;

-- =================================================
-- Table 4: Vendors
-- Stores information about vendors providing services for events
-- Attributes:
-- Vendor_ID     : Unique ID for vendor (Primary Key)
-- Name          : Vendor name
-- Service_Type  : Type of service (Catering, Decoration, etc.)
-- Contact_Number: Phone number
-- Event_ID      : Event assigned (Foreign Key)
-- =================================================
CREATE TABLE Vendors (
  Vendor_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Service_Type VARCHAR(30),
  Contact_Number VARCHAR(15),
  Event_ID INT
);

-- Sample data for Vendors
INSERT INTO Vendors VALUES
(301,'Delicious Catering','Catering','9876541111',1),
(302,'Floral Designs','Decoration','9876542222',2),
(303,'Sound Pro','Audio','9876543333',3),
(304,'Lights & More','Lighting','9876544444',4),
(305,'Party Supplies','Decor','9876545555',5),
(306,'Stage Setup Co.','Stage','9876546666',6),
(307,'Music Mania','Music','9876547777',7),
(308,'Gourmet Catering','Catering','9876548888',8),
(309,'Event Decorators','Decoration','9876549999',9),
(310,'Fun Lights','Lighting','9876540001',10);

SELECT * FROM Vendors;

-- =================================================
-- Table 5: Payments
-- Stores payment details for events
-- Attributes:
-- Payment_ID    : Unique ID for payment (Primary Key)
-- Event_ID      : Event for which payment is made (Foreign Key)
-- Amount        : Payment amount
-- Payment_Date  : Date of payment
-- Payment_Method: Mode of payment (Cash, Credit Card, UPI)
-- =================================================
CREATE TABLE Payments (
  Payment_ID INT PRIMARY KEY,
  Event_ID INT,
  Amount DECIMAL(10,2),
  Payment_Date DATE,
  Payment_Method VARCHAR(20)
);

-- Sample data for Payments
INSERT INTO Payments VALUES
(401,1,50000.00,'2024-01-05','Credit Card'),
(402,2,75000.00,'2024-01-06','UPI'),
(403,3,60000.00,'2024-01-07','Cash'),
(404,4,45000.00,'2024-01-08','Debit Card'),
(405,5,30000.00,'2024-01-09','Credit Card'),
(406,6,80000.00,'2024-01-10','UPI'),
(407,7,40000.00,'2024-01-11','Cash'),
(408,8,70000.00,'2024-01-12','Credit Card'),
(409,9,35000.00,'2024-01-13','Debit Card'),
(410,10,90000.00,'2024-01-14','UPI');

SELECT * FROM Payments;

-- =================================================
-- Additional Operations
-- =================================================
-- Update payment amount for an event
UPDATE Payments SET Amount=55000.00 WHERE Payment_ID=401;

-- Delete a vendor
DELETE FROM Vendors WHERE Vendor_ID=310;

-- Drop a table example
-- DROP TABLE Staff;
