-- ================================================
-- ✈️ AIRLINE DATABASE
-- ================================================

-- Step 1: Create a new database
CREATE DATABASE AirlineDB;

-- Step 2: Use the created database
USE AirlineDB;


-- ================================================
-- TABLE 1: Passengers
-- Stores information about flight passengers
-- ================================================
CREATE TABLE Passengers (
  Passenger_ID INT PRIMARY KEY,            -- Unique ID for each passenger
  Name VARCHAR(50),                        -- Full name of the passenger
  Gender VARCHAR(10),                      -- Gender of the passenger
  Passport_Number VARCHAR(20),             -- Passport number (unique)
  Nationality VARCHAR(30)                  -- Nationality of the passenger
);

-- Insert 10 passenger records
INSERT INTO Passengers VALUES
(1,'Ravi Kumar','Male','P123456','Indian'),
(2,'Anita Desai','Female','P123457','Indian'),
(3,'John Smith','Male','P123458','American'),
(4,'Sara Lee','Female','P123459','Canadian'),
(5,'Mohammed Ali','Male','P123460','UAE'),
(6,'Li Wei','Male','P123461','Chinese'),
(7,'Emma Watson','Female','P123462','British'),
(8,'Carlos Gomez','Male','P123463','Spanish'),
(9,'Aisha Khan','Female','P123464','Pakistani'),
(10,'David Miller','Male','P123465','Australian');

-- Display all passenger records
SELECT * FROM Passengers;


-- ================================================
-- TABLE 2: Flights
-- Stores details about available flights
-- ================================================
CREATE TABLE Flights (
  Flight_ID INT PRIMARY KEY,               -- Unique ID for each flight
  Airline_Name VARCHAR(50),                -- Airline name
  Source VARCHAR(50),                      -- Departure location
  Destination VARCHAR(50),                 -- Arrival location
  Departure_Time DATETIME                  -- Scheduled departure date/time
);

-- Insert 10 flight records
INSERT INTO Flights VALUES
(101,'Air India','Mumbai','Delhi','2024-01-10 09:00:00'),
(102,'IndiGo','Delhi','Bangalore','2024-01-12 12:30:00'),
(103,'Emirates','Dubai','London','2024-01-14 15:00:00'),
(104,'Qatar Airways','Doha','New York','2024-01-16 22:00:00'),
(105,'Singapore Airlines','Singapore','Tokyo','2024-01-18 07:45:00'),
(106,'Air Canada','Toronto','Vancouver','2024-01-20 08:15:00'),
(107,'British Airways','London','Paris','2024-01-22 10:00:00'),
(108,'Lufthansa','Frankfurt','Berlin','2024-01-23 11:30:00'),
(109,'SpiceJet','Chennai','Kolkata','2024-01-25 14:45:00'),
(110,'Vistara','Delhi','Goa','2024-01-27 16:00:00');

-- Display all flight records
SELECT * FROM Flights;


-- ================================================
-- TABLE 3: Tickets
-- Stores booking details for passengers
-- ================================================
CREATE TABLE Tickets (
  Ticket_ID INT PRIMARY KEY,               -- Unique ticket ID
  Passenger_ID INT,                        -- References Passengers table
  Flight_ID INT,                           -- References Flights table
  Seat_Number VARCHAR(10),                 -- Assigned seat
  Price DECIMAL(10,2)                      -- Ticket price
);

-- Insert 10 ticket records
INSERT INTO Tickets VALUES
(201,1,101,'A1',5500.00),
(202,2,102,'B3',6200.00),
(203,3,103,'C5',45000.00),
(204,4,104,'D2',82000.00),
(205,5,105,'E7',67000.00),
(206,6,106,'F4',22000.00),
(207,7,107,'A3',38000.00),
(208,8,108,'B6',25000.00),
(209,9,109,'C2',7000.00),
(210,10,110,'D1',9500.00);

-- Display all ticket records
SELECT * FROM Tickets;


-- ================================================
-- TABLE 4: Crew
-- Stores details about airline crew members
-- ================================================
CREATE TABLE Crew (
  Crew_ID INT PRIMARY KEY,                 -- Unique ID for crew member
  Name VARCHAR(50),                        -- Crew member name
  Role VARCHAR(30),                        -- Role (e.g., Pilot, Attendant)
  Experience INT,                          -- Years of experience
  Contact_Number VARCHAR(15)               -- Crew member’s contact number
);

-- Insert 10 crew records
INSERT INTO Crew VALUES
(301,'Captain Rajiv','Pilot',15,'9876500001'),
(302,'Neha Kapoor','Flight Attendant',8,'9876500002'),
(303,'Aman Sharma','Co-Pilot',10,'9876500003'),
(304,'Simran Kaur','Flight Attendant',6,'9876500004'),
(305,'John Lewis','Engineer',12,'9876500005'),
(306,'Priya Singh','Ground Staff',9,'9876500006'),
(307,'Ravi Patel','Technician',7,'9876500007'),
(308,'Sophia Brown','Cabin Crew',5,'9876500008'),
(309,'David Johnson','Pilot',14,'9876500009'),
(310,'Emily Davis','Flight Attendant',4,'9876500010');

-- Display all crew records
SELECT * FROM Crew;


-- ================================================
-- TABLE 5: Luggage
-- Stores luggage details of passengers
-- ================================================
CREATE TABLE Luggage (
  Luggage_ID INT PRIMARY KEY,              -- Unique ID for each luggage
  Passenger_ID INT,                        -- References Passengers table
  Weight DECIMAL(5,2),                     -- Weight of luggage (in kg)
  Type VARCHAR(30),                        -- Type (Cabin/Check-in)
  Status VARCHAR(20)                       -- Status (Checked-in/Loaded/Missing)
);

-- Insert 10 luggage records
INSERT INTO Luggage VALUES
(401,1,18.50,'Check-in','Loaded'),
(402,2,7.00,'Cabin','Checked-in'),
(403,3,22.30,'Check-in','Loaded'),
(404,4,5.50,'Cabin','Checked-in'),
(405,5,24.00,'Check-in','Loaded'),
(406,6,20.10,'Check-in','Missing'),
(407,7,6.80,'Cabin','Checked-in'),
(408,8,25.00,'Check-in','Loaded'),
(409,9,8.00,'Cabin','Loaded'),
(410,10,19.50,'Check-in','Loaded');

-- Display all luggage records
SELECT * FROM Luggage;


-- ================================================
-- 🔧 ADDITIONAL SQL OPERATIONS
-- ================================================

-- Operation 1: Update ticket price for a passenger
UPDATE Tickets
SET Price = 6000.00
WHERE Ticket_ID = 201;

-- Operation 2: Delete a missing luggage record
DELETE FROM Luggage
WHERE Status = 'Missing';

-- Operation 3: Drop the Crew table (for restructuring)
DROP TABLE Crew;


-- ================================================
-- END OF SCRIPT
-- ================================================
