-- ================================================
-- 💊 PHARMACY DATABASE
-- ================================================

CREATE DATABASE PharmacyDB;
USE PharmacyDB;

-- Table 1: Customers
CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Age INT,
  Gender VARCHAR(10),
  Contact_Number VARCHAR(15)
);

INSERT INTO Customers VALUES
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

SELECT * FROM Customers;

-- Table 2: Medicines
CREATE TABLE Medicines (
  Medicine_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Type VARCHAR(30),
  Price DECIMAL(10,2),
  Stock INT
);

INSERT INTO Medicines VALUES
(101,'Paracetamol','Tablet',50.00,500),
(102,'Cough Syrup','Syrup',120.00,200),
(103,'Vitamin D3','Capsule',150.00,300),
(104,'Ibuprofen','Tablet',80.00,400),
(105,'Amoxicillin','Capsule',200.00,150),
(106,'Cetirizine','Tablet',60.00,350),
(107,'Insulin','Injection',500.00,100),
(108,'Omeprazole','Capsule',100.00,250),
(109,'Aspirin','Tablet',40.00,300),
(110,'Multivitamins','Capsule',180.00,200);

SELECT * FROM Medicines;

-- Table 3: Prescriptions
CREATE TABLE Prescriptions (
  Prescription_ID INT PRIMARY KEY,
  Customer_ID INT,
  Medicine_ID INT,
  Dosage VARCHAR(20),
  Duration VARCHAR(20)
);

INSERT INTO Prescriptions VALUES
(201,1,101,'500mg','5 Days'),
(202,2,102,'10ml','7 Days'),
(203,3,103,'1000IU','15 Days'),
(204,4,104,'200mg','5 Days'),
(205,5,105,'250mg','10 Days'),
(206,6,106,'10mg','7 Days'),
(207,7,107,'20 units','Daily'),
(208,8,108,'40mg','10 Days'),
(209,9,109,'75mg','30 Days'),
(210,10,110,'1 capsule','Daily');

SELECT * FROM Prescriptions;

-- Table 4: Suppliers
CREATE TABLE Suppliers (
  Supplier_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Address VARCHAR(100),
  Medicine_ID INT
);

INSERT INTO Suppliers VALUES
(301,'ABC Pharma','9876540000','Mumbai',101),
(302,'HealthPlus','9876500001','Delhi',102),
(303,'MediCare','9812345000','Bangalore',103),
(304,'Wellness Ltd','9823456000','Chennai',104),
(305,'PharmaCorp','9933445566','Kolkata',105),
(306,'GoodHealth','9900112233','Hyderabad',106),
(307,'MedSupplies','9877777777','Pune',107),
(308,'LifeCare','9811223344','Ahmedabad',108),
(309,'CureMeds','9700011223','Chandigarh',109),
(310,'VitalPharma','9812341122','Jaipur',110);

SELECT * FROM Suppliers;

-- Table 5: Sales
CREATE TABLE Sales (
  Sale_ID INT PRIMARY KEY,
  Customer_ID INT,
  Medicine_ID INT,
  Quantity INT,
  Sale_Date DATE
);

INSERT INTO Sales VALUES
(401,1,101,10,'2024-01-10'),
(402,2,102,5,'2024-01-12'),
(403,3,103,8,'2024-01-15'),
(404,4,104,12,'2024-01-18'),
(405,5,105,7,'2024-01-20'),
(406,6,106,15,'2024-01-22'),
(407,7,107,5,'2024-01-25'),
(408,8,108,10,'2024-01-28'),
(409,9,109,20,'2024-01-30'),
(410,10,110,8,'2024-02-01');

SELECT * FROM Sales;

-- Additional Operations
UPDATE Medicines SET Stock=450 WHERE Medicine_ID=104;
DELETE FROM Prescriptions WHERE Prescription_ID=205;
DROP TABLE Suppliers;
