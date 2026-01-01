-- ================================================
-- 📦 INVENTORY MANAGEMENT DATABASE
-- ================================================

CREATE DATABASE InventoryDB;
USE InventoryDB;

-- =================================================
-- Table 1: Products
-- Stores information about products in inventory
-- Attributes:
-- Product_ID     : Unique ID for product (Primary Key)
-- Name           : Product name
-- Category       : Product category
-- Quantity       : Quantity in stock
-- Price          : Price per unit
-- =================================================
CREATE TABLE Products (
  Product_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Category VARCHAR(30),
  Quantity INT,
  Price DECIMAL(10,2)
);

-- Sample data for Products
INSERT INTO Products VALUES
(1,'Laptop','Electronics',50,50000.00),
(2,'Mouse','Electronics',200,500.00),
(3,'Keyboard','Electronics',150,1200.00),
(4,'Chair','Furniture',100,3500.00),
(5,'Table','Furniture',50,7000.00),
(6,'Notebook','Stationery',500,50.00),
(7,'Pen','Stationery',1000,10.00),
(8,'Headphones','Electronics',75,2500.00),
(9,'Monitor','Electronics',60,15000.00),
(10,'Cabinet','Furniture',30,12000.00);

SELECT * FROM Products;

-- =================================================
-- Table 2: Suppliers
-- Stores information about suppliers
-- Attributes:
-- Supplier_ID    : Unique ID for supplier (Primary Key)
-- Name           : Supplier name
-- Contact_Number : Phone number
-- Email          : Email address
-- Address        : Supplier address
-- =================================================
CREATE TABLE Suppliers (
  Supplier_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Address VARCHAR(100)
);

-- Sample data for Suppliers
INSERT INTO Suppliers VALUES
(101,'TechSupply','9876543210','techsupply@gmail.com','Mumbai'),
(102,'FurniWorld','9812345678','furniworld@gmail.com','Pune'),
(103,'StationeryHub','9900112233','stationeryhub@gmail.com','Nashik'),
(104,'GadgetStore','9922334455','gadgetstore@gmail.com','Mumbai'),
(105,'OfficeMart','9898989898','officemart@gmail.com','Pune');

SELECT * FROM Suppliers;

-- =================================================
-- Table 3: PurchaseOrders
-- Stores details of products purchased from suppliers
-- Attributes:
-- PO_ID          : Unique ID for purchase order (Primary Key)
-- Supplier_ID    : Linked supplier (Foreign Key)
-- Product_ID     : Linked product (Foreign Key)
-- Quantity       : Quantity purchased
-- Order_Date     : Date of order
-- =================================================
CREATE TABLE PurchaseOrders (
  PO_ID INT PRIMARY KEY,
  Supplier_ID INT,
  Product_ID INT,
  Quantity INT,
  Order_Date DATE
);

-- Sample data for PurchaseOrders
INSERT INTO PurchaseOrders VALUES
(201,101,1,20,'2024-01-05'),
(202,102,4,10,'2024-01-06'),
(203,103,6,200,'2024-01-07'),
(204,104,8,15,'2024-01-08'),
(205,101,2,50,'2024-01-09'),
(206,102,5,5,'2024-01-10'),
(207,103,7,500,'2024-01-11'),
(208,104,9,10,'2024-01-12'),
(209,105,3,30,'2024-01-13'),
(210,105,10,3,'2024-01-14');

SELECT * FROM PurchaseOrders;

-- =================================================
-- Table 4: Sales
-- Stores details of products sold
-- Attributes:
-- Sale_ID        : Unique ID for sale (Primary Key)
-- Product_ID     : Linked product (Foreign Key)
-- Quantity       : Quantity sold
-- Sale_Date      : Date of sale
-- Customer_Name  : Customer who bought
-- =================================================
CREATE TABLE Sales (
  Sale_ID INT PRIMARY KEY,
  Product_ID INT,
  Quantity INT,
  Sale_Date DATE,
  Customer_Name VARCHAR(50)
);

-- Sample data for Sales
INSERT INTO Sales VALUES
(301,1,5,'2024-01-15','Ravi Kumar'),
(302,2,20,'2024-01-16','Sneha Sharma'),
(303,3,15,'2024-01-17','Amit Patel'),
(304,4,8,'2024-01-18','Priya Verma'),
(305,5,2,'2024-01-19','Arjun Das'),
(306,6,100,'2024-01-20','Kavita Joshi'),
(307,7,200,'2024-01-21','Rahul Singh'),
(308,8,5,'2024-01-22','Anjali Kapoor'),
(309,9,3,'2024-01-23','Vikram Rao'),
(310,10,1,'2024-01-24','Isha Jain');

SELECT * FROM Sales;

-- =================================================
-- Table 5: Inventory
-- Stores current stock levels of products
-- Attributes:
-- Inventory_ID   : Unique ID for inventory record (Primary Key)
-- Product_ID     : Linked product (Foreign Key)
-- Quantity_Added : Quantity added to stock
-- Quantity_Sold  : Quantity sold
-- Current_Stock  : Current stock available
-- =================================================
CREATE TABLE Inventory (
  Inventory_ID INT PRIMARY KEY,
  Product_ID INT,
  Quantity_Added INT,
  Quantity_Sold INT,
  Current_Stock INT
);

-- Sample data for Inventory
INSERT INTO Inventory VALUES
(401,1,50,5,45),
(402,2,200,20,180),
(403,3,150,15,135),
(404,4,100,8,92),
(405,5,50,2,48),
(406,6,500,100,400),
(407,7,1000,200,800),
(408,8,75,5,70),
(409,9,60,3,57),
(410,10,30,1,29);

SELECT * FROM Inventory;

-- =================================================
-- Additional Operations
-- =================================================
-- Update product price
UPDATE Products SET Price=52000.00 WHERE Product_ID=1;

-- Delete a purchase order
DELETE FROM PurchaseOrders WHERE PO_ID=206;

-- Drop a table example
-- DROP TABLE Inventory;
