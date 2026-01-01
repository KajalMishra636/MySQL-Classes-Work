-- ================================================
-- 🏭 MANUFACTURING DATABASE
-- ================================================

CREATE DATABASE ManufacturingDB;
USE ManufacturingDB;

-- =================================================
-- Table 1: Products
-- Stores information about products manufactured
-- Attributes:
-- Product_ID    : Unique ID for each product (Primary Key)
-- Name          : Product name
-- Category      : Product category/type
-- Price         : Price per unit
-- Stock_Quantity: Available quantity in inventory
-- =================================================
CREATE TABLE Products (
  Product_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Category VARCHAR(30),
  Price DECIMAL(10,2),
  Stock_Quantity INT
);

-- Sample data for Products
INSERT INTO Products VALUES
(1,'Laptop','Electronics',50000.00,100),
(2,'Smartphone','Electronics',20000.00,300),
(3,'Office Chair','Furniture',5000.00,150),
(4,'Desk Table','Furniture',8000.00,80),
(5,'LED Monitor','Electronics',10000.00,120),
(6,'Air Conditioner','Appliances',30000.00,50),
(7,'Refrigerator','Appliances',25000.00,60),
(8,'Printer','Electronics',8000.00,90),
(9,'Sofa','Furniture',15000.00,40),
(10,'Microwave','Appliances',7000.00,70);

SELECT * FROM Products;

-- =================================================
-- Table 2: Suppliers
-- Stores information about suppliers providing raw materials
-- Attributes:
-- Supplier_ID   : Unique ID (Primary Key)
-- Name          : Supplier name
-- Contact_Number: Phone number
-- Email         : Supplier email
-- Material_Type : Type of material supplied
-- =================================================
CREATE TABLE Suppliers (
  Supplier_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Material_Type VARCHAR(50)
);

-- Sample data for Suppliers
INSERT INTO Suppliers VALUES
(101,'ABC Metals','9876543210','abcmetals@gmail.com','Steel'),
(102,'XYZ Plastics','9812345678','xyzplastics@gmail.com','Plastic'),
(103,'FurnitureCo','9900112233','furnitureco@gmail.com','Wood'),
(104,'ElectroParts','9922334455','electroparts@gmail.com','Electronics'),
(105,'HomeAppliances','9898989898','homeappliances@gmail.com','Appliances'),
(106,'PackTech','9707070707','packtech@gmail.com','Packaging'),
(107,'SofaMakers','9654321987','sofamakers@gmail.com','Fabric'),
(108,'CoolAir','9811223344','coolair@gmail.com','AC Parts'),
(109,'SmartGadgets','9933445566','smartgadgets@gmail.com','Circuit Boards'),
(110,'KitchenTools','9877778888','kitchentools@gmail.com','Metal & Plastic');

SELECT * FROM Suppliers;

-- =================================================
-- Table 3: Orders
-- Stores orders placed to suppliers
-- Attributes:
-- Order_ID    : Unique ID for each order (Primary Key)
-- Supplier_ID : Supplier receiving the order (Foreign Key)
-- Product_ID  : Product ordered (Foreign Key)
-- Quantity    : Number of units ordered
-- Order_Date  : Date of order
-- =================================================
CREATE TABLE Orders (
  Order_ID INT PRIMARY KEY,
  Supplier_ID INT,
  Product_ID INT,
  Quantity INT,
  Order_Date DATE
);

-- Sample data for Orders
INSERT INTO Orders VALUES
(201,101,1,50,'2024-01-05'),
(202,102,2,100,'2024-01-08'),
(203,103,3,30,'2024-01-10'),
(204,104,5,60,'2024-01-12'),
(205,105,6,20,'2024-01-15'),
(206,106,8,40,'2024-01-18'),
(207,107,9,10,'2024-01-20'),
(208,108,6,15,'2024-01-22'),
(209,109,2,50,'2024-01-25'),
(210,110,10,25,'2024-01-28');

SELECT * FROM Orders;

-- =================================================
-- Table 4: Employees
-- Stores information about manufacturing employees
-- Attributes:
-- Employee_ID  : Unique ID for employee (Primary Key)
-- Name         : Employee name
-- Role         : Job role (e.g., Operator, Manager)
-- Department   : Department name
-- Contact_Number: Phone number
-- =================================================
CREATE TABLE Employees (
  Employee_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Role VARCHAR(30),
  Department VARCHAR(30),
  Contact_Number VARCHAR(15)
);

-- Sample data for Employees
INSERT INTO Employees VALUES
(301,'Rohit Sharma','Manager','Production','9876543210'),
(302,'Sneha Verma','Operator','Assembly','9812345678'),
(303,'Amit Patel','Technician','Quality Control','9900112233'),
(304,'Priya Singh','Supervisor','Packing','9922334455'),
(305,'Arjun Das','Engineer','Maintenance','9898989898'),
(306,'Kavita Joshi','Operator','Assembly','9707070707'),
(307,'Rahul Singh','Manager','Logistics','9654321987'),
(308,'Anjali Kapoor','Operator','Assembly','9811223344'),
(309,'Vikram Rao','Technician','Quality Control','9933445566'),
(310,'Isha Jain','Supervisor','Packing','9877778888');

SELECT * FROM Employees;

-- =================================================
-- Table 5: Shipments
-- Stores shipment details of finished products
-- Attributes:
-- Shipment_ID : Unique ID for shipment (Primary Key)
-- Product_ID  : Product being shipped (Foreign Key)
-- Quantity    : Number of units shipped
-- Ship_Date   : Date of shipment
-- Destination : Delivery location
-- =================================================
CREATE TABLE Shipments (
  Shipment_ID INT PRIMARY KEY,
  Product_ID INT,
  Quantity INT,
  Ship_Date DATE,
  Destination VARCHAR(50)
);

-- Sample data for Shipments
INSERT INTO Shipments VALUES
(401,1,30,'2024-02-01','Mumbai'),
(402,2,50,'2024-02-02','Delhi'),
(403,3,20,'2024-02-03','Bangalore'),
(404,4,10,'2024-02-04','Hyderabad'),
(405,5,40,'2024-02-05','Chennai'),
(406,6,15,'2024-02-06','Pune'),
(407,7,10,'2024-02-07','Kolkata'),
(408,8,25,'2024-02-08','Noida'),
(409,9,5,'2024-02-09','Gurgaon'),
(410,10,20,'2024-02-10','Lucknow');

SELECT * FROM Shipments;

-- =================================================
-- Additional Operations
-- =================================================
-- Update stock quantity after shipment
UPDATE Products SET Stock_Quantity = Stock_Quantity - 30 WHERE Product_ID = 1;

-- Delete an order
DELETE FROM Orders WHERE Order_ID = 205;

-- Drop a table example
-- DROP TABLE Shipments;
