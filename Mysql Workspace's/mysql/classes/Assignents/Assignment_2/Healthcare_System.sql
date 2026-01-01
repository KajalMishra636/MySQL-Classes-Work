-- ================================================
-- Step 1: CREATE DATABASE
-- ================================================
CREATE DATABASE Healthcare_System;
USE Healthcare_System;

-- ================================================
-- Step 2: CREATE TABLES with attributes, constraints
-- ================================================

-- 1️⃣ Patients Table
CREATE TABLE Patients (
  Patient_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Age INT CHECK (Age > 0),
  Gender VARCHAR(10),
  Contact VARCHAR(15) UNIQUE,
  Address VARCHAR(100)
);

-- Sample data
INSERT INTO Patients VALUES
(1,'Riya Sharma',25,'Female','9876543210','Dombivli'),
(2,'Amit Patel',30,'Male','9876501234','Thane'),
(3,'Sneha Gupta',42,'Female','9812345678','Mumbai'),
(4,'Rahul Verma',35,'Male','9908765432','Pune'),
(5,'Priya Singh',28,'Female','9823456789','Navi Mumbai'),
(6,'Vikram Rao',50,'Male','9811122233','Dombivli'),
(7,'Nisha Mehta',33,'Female','9922334455','Mumbai'),
(8,'Arjun Das',40,'Male','9898989898','Thane'),
(9,'Kavita Joshi',38,'Female','9707070707','Pune'),
(10,'Rohit Nair',29,'Male','9654321987','Navi Mumbai');

-- 2️⃣ Doctors Table
CREATE TABLE Doctors (
  Doctor_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Specialty VARCHAR(50),
  Phone VARCHAR(15) UNIQUE,
  Email VARCHAR(50) UNIQUE
);

INSERT INTO Doctors VALUES
(101,'Dr. Suresh Iyer','Cardiology','9876540000','suresh.iyer@gmail.com'),
(102,'Dr. Neha Kapoor','Dermatology','9876500001','neha.kapoor@gmail.com'),
(103,'Dr. Ramesh Singh','Orthopedics','9876512345','ramesh.singh@gmail.com'),
(104,'Dr. Anjali Nair','Gynecology','9812345000','anjali.nair@gmail.com'),
(105,'Dr. Pawan Mehta','Pediatrics','9823456000','pawan.mehta@gmail.com'),
(106,'Dr. Sunita Rao','Neurology','9933445566','sunita.rao@gmail.com'),
(107,'Dr. Karan Bhatia','ENT','9900112233','karan.bhatia@gmail.com'),
(108,'Dr. Meera Jain','Oncology','9877777777','meera.jain@gmail.com'),
(109,'Dr. Deepak Shah','General Medicine','9811223344','deepak.shah@gmail.com'),
(110,'Dr. Reena Dey','Ophthalmology','9700011223','reena.dey@gmail.com');

-- 3️⃣ Appointments Table
CREATE TABLE Appointments (
  Appointment_ID INT PRIMARY KEY,
  Patient_ID INT,
  Doctor_ID INT,
  Date DATE,
  Time TIME,
  Status VARCHAR(20),
  FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
  FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

INSERT INTO Appointments VALUES
(201,1,101,'2024-10-01','10:00:00','Scheduled'),
(202,2,102,'2024-10-02','11:00:00','Completed'),
(203,3,103,'2024-10-03','09:30:00','Cancelled'),
(204,4,104,'2024-10-04','14:00:00','Scheduled'),
(205,5,105,'2024-10-05','15:00:00','Completed'),
(206,6,106,'2024-10-06','16:30:00','Scheduled'),
(207,7,107,'2024-10-07','13:00:00','Completed'),
(208,8,108,'2024-10-08','12:30:00','Scheduled'),
(209,9,109,'2024-10-09','10:45:00','Completed'),
(210,10,110,'2024-10-10','09:15:00','Scheduled');


SELECT * FROM Appointments WHERE Patient_ID=2;


-- 4️⃣ Medical_History Table
CREATE TABLE Medical_History (
  History_ID INT PRIMARY KEY,
  Patient_ID INT,
  Diagnosis VARCHAR(100),
  Treatment VARCHAR(100),
  Notes VARCHAR(255),
  FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

INSERT INTO Medical_History VALUES
(301,1,'Hypertension','Medication','Regular checkups needed'),
(302,2,'Acne','Topical Treatment','Follow up in 2 weeks'),
(303,3,'Fracture','Surgery','Physiotherapy required'),
(304,4,'Pregnancy','Prenatal Care','Diet and exercise advice'),
(305,5,'Cold & Fever','Medication','Rest recommended'),
(306,6,'Migraine','Medication','Avoid triggers'),
(307,7,'Sinusitis','Medication','Use nasal spray'),
(308,8,'Cancer','Chemotherapy','Monitor side effects'),
(309,9,'Diabetes','Medication','Regular blood sugar check'),
(310,10,'Cataract','Surgery','Post-op care advised');

-- 5️⃣ Medications Table
CREATE TABLE Medications (
  Medication_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Type VARCHAR(50),
  Price DECIMAL(10,2),
  Description VARCHAR(255)
);

INSERT INTO Medications VALUES
(401,'Paracetamol','Tablet',50.00,'Pain reliever'),
(402,'Cetirizine','Tablet',30.00,'Anti-allergy'),
(403,'Amoxicillin','Capsule',100.00,'Antibiotic'),
(404,'Azithromycin','Tablet',150.00,'Antibiotic'),
(405,'Ibuprofen','Tablet',60.00,'Pain reliever'),
(406,'Vitamin D3','Capsule',200.00,'Supplement'),
(407,'Cough Syrup','Syrup',120.00,'For cough'),
(408,'Insulin','Injection',500.00,'For diabetes'),
(409,'Omeprazole','Tablet',80.00,'For acidity'),
(410,'Aspirin','Tablet',40.00,'Blood thinner');

-- 6️⃣ Prescriptions Table
CREATE TABLE Prescriptions (
  Prescription_ID INT PRIMARY KEY,
  Patient_ID INT,
  Medication_ID INT,
  Date_Provided DATE,
  Dosage VARCHAR(50),
  FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
  FOREIGN KEY (Medication_ID) REFERENCES Medications(Medication_ID)
);

INSERT INTO Prescriptions VALUES
(501,1,401,'2024-10-01','500mg twice a day'),
(502,2,402,'2024-10-02','10mg once a day'),
(503,3,403,'2024-10-03','250mg thrice a day'),
(504,4,404,'2024-10-04','500mg once a day'),
(505,5,405,'2024-10-05','200mg twice a day'),
(506,6,406,'2024-10-06','1000 IU daily'),
(507,7,407,'2024-10-07','10ml thrice a day'),
(508,8,408,'2024-10-08','20 units daily'),
(509,9,409,'2024-10-09','40mg once a day'),
(510,10,410,'2024-10-10','75mg daily');

-- 7️⃣ Bills Table
CREATE TABLE Bills (
  Bill_ID INT PRIMARY KEY,
  Patient_ID INT,
  Total_Amount DECIMAL(10,2),
  Payment_Status VARCHAR(20),
  Date DATE,
  FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

INSERT INTO Bills VALUES
(601,1,1500.00,'Paid','2024-10-01'),
(602,2,2000.00,'Pending','2024-10-02'),
(603,3,2500.00,'Paid','2024-10-03'),
(604,4,1800.00,'Paid','2024-10-04'),
(605,5,3000.00,'Pending','2024-10-05'),
(606,6,3500.00,'Paid','2024-10-06'),
(607,7,2200.00,'Paid','2024-10-07'),
(608,8,2700.00,'Paid','2024-10-08'),
(609,9,1600.00,'Pending','2024-10-09'),
(610,10,3100.00,'Paid','2024-10-10');

-- 8️⃣ Staff Table
CREATE TABLE Staff (
  Staff_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Role VARCHAR(50),
  Contact VARCHAR(15),
  Shift VARCHAR(20)
);

INSERT INTO Staff VALUES
(701,'Ramesh Kumar','Nurse','9876541111','Morning'),
(702,'Anita Sharma','Receptionist','9876542222','Evening'),
(703,'Suresh Rao','Technician','9876543333','Night'),
(704,'Priya Nair','Pharmacist','9876544444','Morning'),
(705,'Vikram Singh','Lab Assistant','9876545555','Evening'),
(706,'Neha Jain','Accountant','9876546666','Morning'),
(707,'Arjun Mehta','Cleaner','9876547777','Night'),
(708,'Kavita Desai','Manager','9876548888','Morning'),
(709,'Rohit Gupta','Security','9876549999','Evening'),
(710,'Meera Joshi','IT Support','9876540001','Night');

-- 9️⃣ Departments Table
CREATE TABLE Departments (
  Department_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Location VARCHAR(50),
  Phone VARCHAR(15)
);

INSERT INTO Departments VALUES
(801,'Cardiology','Floor 1','9876501111'),
(802,'Dermatology','Floor 2','9876502222'),
(803,'Orthopedics','Floor 3','9876503333'),
(804,'Gynecology','Floor 4','9876504444'),
(805,'Pediatrics','Floor 5','9876505555'),
(806,'Neurology','Floor 6','9876506666'),
(807,'ENT','Floor 7','9876507777'),
(808,'Oncology','Floor 8','9876508888'),
(809,'General Medicine','Floor 9','9876509999'),
(810,'Ophthalmology','Floor 10','9876510000');

-- 🔟 Facilities Table
CREATE TABLE Facilities (
  Facility_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Type VARCHAR(50),
  Cost DECIMAL(10,2),
  Availability_Status VARCHAR(20)
);

INSERT INTO Facilities VALUES
(901,'MRI Machine','Diagnostic',5000.00,'Available'),
(902,'CT Scan','Diagnostic',4000.00,'Available'),
(903,'X-Ray','Diagnostic',1000.00,'In Use'),
(904,'ICU Bed','Treatment',2000.00,'Available'),
(905,'Operation Theater','Treatment',10000.00,'Occupied'),
(906,'Pharmacy','Support',500.00,'Open'),
(907,'Cafeteria','Support',100.00,'Open'),
(908,'Ambulance','Transport',1500.00,'Available'),
(909,'Physiotherapy Room','Treatment',800.00,'Available'),
(910,'Blood Bank','Support',0.00,'Available');

-- ================================================
-- Step 3: EXAMPLES OF OPERATIONS
-- ================================================

-- Show all patients
SELECT * FROM Patients;

-- Update example: Update a patient's address
UPDATE Patients SET Address='Mumbai' WHERE Patient_ID=1;

-- Rename Table Example
RENAME TABLE Staff TO Hospital_Staff;

-- Rename column example
ALTER TABLE Doctors CHANGE Phone Contact_Number VARCHAR(15);

-- Delete example
DELETE FROM Appointments WHERE Status='Cancelled';

-- Truncate example
TRUNCATE TABLE Facilities;

-- Use SQL_SAFE_UPDATES to prevent accidental changes
SET SQL_SAFE_UPDATES = 1;

-- Select with WHERE and ORDER BY
SELECT * FROM Bills WHERE Payment_Status='Pending' ORDER BY Total_Amount DESC;

-- Join Example: List all prescriptions for a patient
SELECT p.Name AS Patient_Name, m.Name AS Medication, pr.Dosage
FROM Prescriptions pr
JOIN Patients p ON pr.Patient_ID=p.Patient_ID
JOIN Medications m ON pr.Medication_ID=m.Medication_ID
WHERE p.Patient_ID=1;

-- Group By Example: Count appointments per doctor
SELECT Doctor_ID, COUNT(*) AS Number_of_Appointments
FROM Appointments
GROUP BY Doctor_ID
HAVING COUNT(*)>1;

-- Built-in Function Example: Average bill
SELECT AVG(Total_Amount) AS Average_Bill FROM Bills;


SELECT * FROM Appointments WHERE Patient_ID=2;

SELECT p.Name, mh.Diagnosis, mh.Treatment
FROM Medical_History mh
JOIN Patients p ON mh.Patient_ID=p.Patient_ID
WHERE p.Patient_ID=1;

/*
Scheduling Appointments:

Use the Appointments table to book patients with available doctors.

Example Query:
*/
SELECT Name FROM Doctors WHERE Specialty='Cardiology';

/*
Retrieving Patient Medical History:

Join Medical_History with Patients.*/
SELECT p.Name, b.Total_Amount, b.Payment_Status
FROM Bills b
JOIN Patients p ON b.Patient_ID=p.Patient_ID
WHERE p.Patient_ID=1;

-- Listing Doctors in a Department:

SELECT Name FROM 
Doctors WHERE Specialty='Cardiology';

-- Generating Patient Billing Report:

SELECT p.Name, b.Total_Amount, b.Payment_Status
FROM Bills b
JOIN Patients p ON b.Patient_ID=p.Patient_ID
WHERE p.Patient_ID=1;

-- Show total bills > 2000 for patients:

SELECT p.Name AS Patient, b.Total_Amount
FROM Bills b
JOIN Patients p ON b.Patient_ID=p.Patient_ID
WHERE b.Total_Amount>2000;

