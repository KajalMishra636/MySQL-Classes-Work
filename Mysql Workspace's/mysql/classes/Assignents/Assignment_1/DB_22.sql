-- ================================================
-- 🛒 SUPERMARKET DATABASE
-- ================================================

CREATE DATABASE SupermarketDB;
USE SupermarketDB;

-- =================================================
-- Table 1: Products
-- Stores information about products sold in the supermarket
-- Attributes:
-- Product_ID    : Unique ID for each product (Primary Key)
-- Name          : Product name
-- Category      : Product category (Dairy, Grocery, Beverages, etc.)
-- Price         : Price per unit
-- Stock_Quantity: Number of units available
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
(1,'Milk','Dairy',50.00,200),
(2,'Bread','Bakery',30.00,150),
(3,'Rice','Grocery',70.00,300),
(4,'Apple Juice','Beverages',120.00,100),
(5,'Eggs','Dairy',10.00,500),
(6,'Butter','Dairy',60.00,180),
(7,'Orange','Fruits',20.00,250),
(8,'Chicken','Meat',250.00,120),
(9,'Sugar','Grocery',40.00,200),
(10,'Tea','Beverages',150.00,80);

SELECT * FROM Products;

-- =================================================
-- Table 2: Customers
-- Stores information about customers
-- Attributes:
-- Customer_ID   : Unique ID for customer (Primary Key)
-- Name          : Customer name
-- Contact_Number: Phone number
-- Email         : Email address
-- Join_Date     : Date customer joined loyalty program
-- =================================================
CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Join_Date DATE
);

-- Sample data for Customers
INSERT INTO Customers VALUES
(101,'Ravi Kumar','9876543210','ravi@gmail.com','2024-01-01'),
(102,'Sneha Sharma','9812345678','sneha@gmail.com','2024-01-02'),
(103,'Amit Patel','9900112233','amit@gmail.com','2024-01-03'),
(104,'Priya Verma','9922334455','priya@gmail.com','2024-01-04'),
(105,'Arjun Das','9898989898','arjun@gmail.com','2024-01-05'),
(106,'Kavita Joshi','9707070707','kavita@gmail.com','2024-01-06'),
(107,'Rahul Singh','9654321987','rahul@gmail.com','2024-01-07'),
(108,'Anjali Kapoor','9811223344','anjali@gmail.com','2024-01-08'),
(109,'Vikram Rao','9933445566','vikram@gmail.com','2024-01-09'),
(110,'Isha Jain','9877778888','isha@gmail.com','2024-01-10');

SELECT * FROM Customers;

-- =================================================
-- Table 3: Orders
-- Stores order details
-- Attributes:
-- Order_ID      : Unique ID for order (Primary Key)
-- Customer_ID   : Customer placing the order (Foreign Key)
-- Order_Date    : Date of order
-- Total_Amount  : Total order amount
-- Status        : Order status (Pending, Completed, Cancelled)
-- =================================================
CREATE TABLE Orders (
  Order_ID INT PRIMARY KEY,
  Customer_ID INT,
  Order_Date DATE,
  Total_Amount DECIMAL(10,2),
  Status VARCHAR(20)
);

-- Sample data for Orders
INSERT INTO Orders VALUES
(201,101,'2024-01-10',500.00,'Completed'),
(202,102,'2024-01-11',750.00,'Pending'),
(203,103,'2024-01-12',300.00,'Completed'),
(204,104,'2024-01-13',1200.00,'Completed'),
(205,105,'2024-01-14',450.00,'Pending'),
(206,106,'2024-01-15',600.00,'Completed'),
(207,107,'2024-01-16',350.00,'Cancelled'),
(208,108,'2024-01-17',800.00,'Completed'),
(209,109,'2024-01-18',950.00,'Pending'),
(210,110,'2024-01-19',400.00,'Completed');

SELECT * FROM Orders;

-- =================================================
-- Table 4: Order_Items
-- Stores individual items in each order
-- Attributes:
-- Order_Item_ID : Unique ID for order item (Primary Key)
-- Order_ID      : Order ID (Foreign Key)
-- Product_ID    : Product ID (Foreign Key)
-- Quantity      : Number of units ordered
-- Price         : Price per unit at order time
-- =================================================
CREATE TABLE Order_Items (
  Order_Item_ID INT PRIMARY KEY,
  Order_ID INT,
  Product_ID INT,
  Quantity INT,
  Price DECIMAL(10,2)
);

-- Sample data for Order_Items
INSERT INTO Order_Items VALUES
(301,201,1,5,50.00),
(302,201,2,2,30.00),
(303,202,3,10,70.00),
(304,202,4,3,120.00),
(305,203,5,12,10.00),
(306,204,6,4,60.00),
(307,204,7,10,20.00),
(308,205,8,2,250.00),
(309,206,9,5,40.00),
(310,207,10,2,150.00);

SELECT * FROM Order_Items;

-- =================================================
-- Table 5: Suppliers
-- Stores information about product suppliers
-- Attributes:
-- Supplier_ID   : Unique ID for supplier (Primary Key)
-- Name          : Supplier name
-- Product_Supplied: Product supplied
-- Contact_Number: Phone number
-- Email         : Supplier email
-- =================================================
CREATE TABLE Suppliers (
  Supplier_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Product_Supplied VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50)
);

-- Sample data for Suppliers
INSERT INTO Suppliers VALUES
(401,'DairyFarm Co.','Milk','9876541111','dairyfarm@gmail.com'),
(402,'Baker''s Delight','Bread','9876542222','bakers@gmail.com'),
(403,'Rice Mills','Rice','9876543333','rice@gmail.com'),
(404,'Juice World','Apple Juice','9876544444','juice@gmail.com'),
(405,'Egg House','Eggs','9876545555','eggs@gmail.com'),
(406,'Butter Co.','Butter','9876546666','butter@gmail.com'),
(407,'Fresh Fruits Ltd.','Orange','9876547777','fruits@gmail.com'),
(408,'Meat House','Chicken','9876548888','meat@gmail.com'),
(409,'Sugar Mills','Sugar','9876549999','sugar@gmail.com'),
(410,'Tea Traders','Tea','9876540001','tea@gmail.com');

SELECT * FROM Suppliers;

-- =================================================
-- Additional Operations
-- =================================================
-- Update product stock
UPDATE Products SET Stock_Quantity=220 WHERE Product_ID=1;

-- Delete an order
DELETE FROM Orders WHERE Order_ID=207;

-- Drop a table example
-- DROP TABLE Suppliers;
