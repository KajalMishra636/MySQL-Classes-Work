-- ================================================
-- 🐾 VETERINARY CLINIC DATABASE
-- ================================================

CREATE DATABASE VetClinicDB;
USE VetClinicDB;

-- =================================================
-- Table 1: Pets
-- Stores information about pets visiting the clinic
-- Attributes:
-- Pet_ID      : Unique ID for each pet (Primary Key)
-- Name        : Pet's name
-- Species     : Species of the pet (Dog, Cat, etc.)
-- Age         : Pet's age in years
-- Owner_ID    : Owner of the pet (Foreign Key to Owners table)
-- =================================================
CREATE TABLE Pets (
  Pet_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Species VARCHAR(20),
  Age INT,
  Owner_ID INT
);

-- Sample data for Pets
INSERT INTO Pets VALUES
(1,'Buddy','Dog',3,101),
(2,'Milo','Cat',2,102),
(3,'Charlie','Dog',5,103),
(4,'Bella','Rabbit',1,104),
(5,'Lucy','Dog',4,105),
(6,'Daisy','Cat',3,106),
(7,'Max','Dog',6,107),
(8,'Luna','Cat',2,108),
(9,'Rocky','Dog',7,109),
(10,'Coco','Rabbit',1,110);

SELECT * FROM Pets;

-- =================================================
-- Table 2: Owners
-- Stores information about pet owners
-- Attributes:
-- Owner_ID       : Unique ID for each owner (Primary Key)
-- Name           : Owner's name
-- Contact_Number : Phone number
-- Email          : Email address
-- Address        : Residential address
-- =================================================
CREATE TABLE Owners (
  Owner_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Address VARCHAR(100)
);

-- Sample data for Owners
INSERT INTO Owners VALUES
(101,'Ravi Kumar','9876543210','ravi@gmail.com','Mumbai'),
(102,'Sneha Sharma','9812345678','sneha@gmail.com','Delhi'),
(103,'Amit Patel','9900112233','amitp@gmail.com','Bangalore'),
(104,'Priya Verma','9922334455','priya@gmail.com','Hyderabad'),
(105,'Arjun Das','9898989898','arjun@gmail.com','Chennai'),
(106,'Kavita Joshi','9707070707','kavita@gmail.com','Pune'),
(107,'Rahul Singh','9654321987','rahul@gmail.com','Kolkata'),
(108,'Anjali Kapoor','9811223344','anjali@gmail.com','Noida'),
(109,'Vikram Rao','9933445566','vikram@gmail.com','Gurgaon'),
(110,'Isha Jain','9877778888','isha@gmail.com','Lucknow');

SELECT * FROM Owners;

-- =================================================
-- Table 3: Appointments
-- Stores appointment details for pets
-- Attributes:
-- Appointment_ID : Unique ID for appointment (Primary Key)
-- Pet_ID         : Pet visiting (Foreign Key)
-- Vet_ID         : Assigned veterinarian (Foreign Key)
-- Date           : Appointment date
-- Time           : Appointment time
-- =================================================
CREATE TABLE Appointments (
  Appointment_ID INT PRIMARY KEY,
  Pet_ID INT,
  Vet_ID INT,
  Date DATE,
  Time TIME
);

-- Sample data for Appointments
INSERT INTO Appointments VALUES
(201,1,301,'2024-01-10','10:00:00'),
(202,2,302,'2024-01-11','11:30:00'),
(203,3,303,'2024-01-12','09:45:00'),
(204,4,304,'2024-01-13','12:00:00'),
(205,5,301,'2024-01-14','15:00:00'),
(206,6,302,'2024-01-15','16:00:00'),
(207,7,303,'2024-01-16','14:30:00'),
(208,8,304,'2024-01-17','13:00:00'),
(209,9,301,'2024-01-18','09:30:00'),
(210,10,302,'2024-01-19','10:15:00');

SELECT * FROM Appointments;

-- =================================================
-- Table 4: Veterinarians
-- Stores information about clinic vets
-- Attributes:
-- Vet_ID       : Unique ID for veterinarian (Primary Key)
-- Name         : Vet's name
-- Specialization: Field of expertise (Surgery, Dermatology, etc.)
-- Experience   : Years of experience
-- Contact_Number: Phone number
-- =================================================
CREATE TABLE Veterinarians (
  Vet_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Specialization VARCHAR(50),
  Experience INT,
  Contact_Number VARCHAR(15)
);

-- Sample data for Veterinarians
INSERT INTO Veterinarians VALUES
(301,'Dr. Suresh Iyer','Surgery',15,'9876540000'),
(302,'Dr. Neha Kapoor','Dermatology',10,'9876500001'),
(303,'Dr. Ramesh Singh','Orthopedics',12,'9876512345'),
(304,'Dr. Anjali Nair','General Medicine',8,'9812345000'),
(305,'Dr. Pawan Mehta','Pediatrics',9,'9823456000'),
(306,'Dr. Sunita Rao','Neurology',14,'9933445566'),
(307,'Dr. Karan Bhatia','ENT',11,'9900112233'),
(308,'Dr. Meera Jain','Oncology',13,'9877777777'),
(309,'Dr. Deepak Shah','General Medicine',10,'9811223344'),
(310,'Dr. Reena Dey','Ophthalmology',7,'9700011223');

SELECT * FROM Veterinarians;

-- =================================================
-- Table 5: Treatments
-- Stores treatment records for pets
-- Attributes:
-- Treatment_ID : Unique ID for treatment (Primary Key)
-- Pet_ID       : Treated pet (Foreign Key)
-- Vet_ID       : Vet who treated the pet (Foreign Key)
-- Treatment    : Treatment description
-- Cost         : Treatment cost
-- =================================================
CREATE TABLE Treatments (
  Treatment_ID INT PRIMARY KEY,
  Pet_ID INT,
  Vet_ID INT,
  Treatment VARCHAR(100),
  Cost DECIMAL(10,2)
);

-- Sample data for Treatments
INSERT INTO Treatments VALUES
(401,1,301,'Vaccination','500.00'),
(402,2,302,'Flea Treatment','300.00'),
(403,3,303,'Fracture Surgery','5000.00'),
(404,4,304,'Checkup','200.00'),
(405,5,301,'Deworming','250.00'),
(406,6,302,'Skin Allergy Treatment','800.00'),
(407,7,303,'Hip Surgery','7000.00'),
(408,8,304,'General Checkup','200.00'),
(409,9,301,'Vaccination','500.00'),
(410,10,302,'Dental Cleaning','400.00');

SELECT * FROM Treatments;

-- =================================================
-- Additional Operations
-- =================================================
-- Update treatment cost
UPDATE Treatments SET Cost=600.00 WHERE Treatment_ID=401;

-- Delete an appointment
DELETE FROM Appointments WHERE Appointment_ID=205;

-- Drop a table example
-- DROP TABLE Treatments;
