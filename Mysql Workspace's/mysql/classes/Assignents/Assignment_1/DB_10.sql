-- ================================================
-- 🚗 CAR RENTAL DATABASE
-- ================================================

CREATE DATABASE CarRentalDB;
USE CarRentalDB;

-- Table 1: Customers
CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  License_Number VARCHAR(20),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50)
);

INSERT INTO Customers VALUES
(1,'Amit Sharma','DL123456','9876543210','amit@gmail.com'),
(2,'Neha Verma','DL234567','9876501234','neha@gmail.com'),
(3,'Rohit Singh','DL345678','9812345678','rohit@gmail.com'),
(4,'Priya Gupta','DL456789','9908765432','priya@gmail.com'),
(5,'Karan Mehta','DL567890','9823456789','karan@gmail.com'),
(6,'Sanya Rao','DL678901','9811122233','sanya@gmail.com'),
(7,'Arjun Das','DL789012','9922334455','arjun@gmail.com'),
(8,'Isha Jain','DL890123','9898989898','isha@gmail.com'),
(9,'Vikram Rao','DL901234','9707070707','vikram@gmail.com'),
(10,'Anjali Kapoor','DL012345','9654321987','anjali@gmail.com');

SELECT * FROM Customers;

-- Table 2: Cars
CREATE TABLE Cars (
  Car_ID INT PRIMARY KEY,
  Model VARCHAR(50),
  Brand VARCHAR(30),
  Year INT,
  Price_Per_Day DECIMAL(10,2)
);

INSERT INTO Cars VALUES
(101,'XUV700','Mahindra',2023,5000.00),
(102,'Creta','Hyundai',2022,3000.00),
(103,'i20','Hyundai',2021,2000.00),
(104,'Altroz','Tata',2022,2500.00),
(105,'Swift','Maruti',2023,1800.00),
(106,'City','Honda',2022,2200.00),
(107,'Fortuner','Toyota',2023,6000.00),
(108,'Verna','Hyundai',2022,2800.00),
(109,'Baleno','Maruti',2021,1900.00),
(110,'Gloster','Mahindra',2023,7000.00);

SELECT * FROM Cars;

-- Table 3: Rentals
CREATE TABLE Rentals (
  Rental_ID INT PRIMARY KEY,
  Customer_ID INT,
  Car_ID INT,
  Start_Date DATE,
  End_Date DATE
);

INSERT INTO Rentals VALUES
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

SELECT * FROM Rentals;

-- Table 4: Payments
CREATE TABLE Payments (
  Payment_ID INT PRIMARY KEY,
  Rental_ID INT,
  Amount DECIMAL(10,2),
  Payment_Date DATE,
  Payment_Method VARCHAR(20)
);

INSERT INTO Payments VALUES
(301,201,25000.00,'2024-01-15','Credit Card'),
(302,202,15000.00,'2024-01-17
