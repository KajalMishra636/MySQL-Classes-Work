-- ================================================
-- 🛒 E-COMMERCE DATABASE
-- ================================================

CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- =================================================
-- Table 1: Customers
-- Stores information about customers
-- Attributes:
-- Customer_ID   : Unique ID for customer (Primary Key)
-- Name          : Customer name
-- Email         : Email address
-- Contact_Number: Phone number
-- Join_Date     : Date customer registered
-- =================================================
CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(50),
  Contact_Number VARCHAR(15),
  Join_Date DATE
);

-- Sample data for Customers
INSERT INTO Customers VALUES
(1,'Riya Sharma','riya@gmail.com','9876543210','2024-01-10'),
(2,'Amit Patel','amit@gmail.com','9812345678','2024-01-12'),
(3,'Sneha Gupta','sneha@gmail.com','9900112233','2024-01-15'),
(4,'Rahul Verma','rahul@gmail.com','9922334455','2024-01-18'),
(5,'Priya Singh','priya@gmail.com','9898989898','2024-01-20'),
(6,'Vikram Rao','vikram@gmail.com','9707070707','2024-01-22'),
(7,'Nisha Mehta','nisha@gmail.com','9654321987','2024-01-25'),
(8,'Arjun Das','arjun@gmail.com','9811223344','2024-01-28'),
(9,'Kavita Joshi','kavita@gmail.com','9933445566','2024-01-30'),
(10,'Rohit Nair','rohit@gmail.com','9877778888','2024-02-01');

SELECT * FROM Customers;

-- =================================================
-- Table 2: Products
-- Stores information about products available for sale
-- Attributes:
-- Product_ID    : Unique ID for product (Primary Key)
-- Name          : Product name
-- Category      : Product category
-- Price         : Price per unit
-- Stock_Quantity: Quantity available in stock
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
(101,'Laptop','Electronics',50000.00,50),
(102,'Mouse','Electronics',500.00,200),
(103,'Keyboard','Electronics',1200.00,150),
(104,'Chair','Furniture',3500.00,100),
(105,'Table','Furniture',7000.00,50),
(106,'Notebook','Stationery',50.00,500),
(107,'Pen','Stationery',10.00,1000),
(108,'Headphones','Electronics',2500.00,75),
(109,'Monitor','Electronics',15000.00,60),
(110,'Cabinet','Furniture',12000.00,30);

SELECT * FROM Products;

-- =================================================
-- Table 3: Orders
-- Stores customer orders
-- Attributes:
-- Order_ID      : Unique ID for order (Primary Key)
-- Customer_ID   : Linked customer (Foreign Key)
-- Order_Date    : Date of order
-- Total_Amount  : Total order amount
-- Status        : Order status (Pending, Shipped, Delivered)
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
(201,1,'2024-02-01',55000.00,'Delivered'),
(202,2,'2024-02-02',5200.00,'Pending'),
(203,3,'2024-02-03',3700.00,'Shipped'),
(204,4,'2024-02-04',1500.00,'Delivered'),
(205,5,'2024-02-05',12000.00,'Pending'),
(206,6,'2024-02-06',2500.00,'Shipped'),
(207,7,'2024-02-07',600.00,'Delivered'),
(208,8,'2024-02-08',7500.00,'Pending'),
(209,9,'2024-02-09',3000.00,'Shipped'),
(210,10,'2024-02-10',4500.00,'Delivered');

SELECT * FROM Orders;

-- =================================================
-- Table 4: OrderItems
-- Stores details of products in each order
-- Attributes:
-- OrderItem_ID  : Unique ID for order item (Primary Key)
-- Order_ID      : Linked order (Foreign Key)
-- Product_ID    : Linked product (Foreign Key)
-- Quantity      : Quantity of product in order
-- Price         : Price per product at order time
-- =================================================
CREATE TABLE OrderItems (
  OrderItem_ID INT PRIMARY KEY,
  Order_ID INT,
  Product_ID INT,
  Quantity INT,
  Price DECIMAL(10,2)
);

-- Sample data for OrderItems
INSERT INTO OrderItems VALUES
(301,201,101,1,50000.00),
(302,202,102,2,500.00),
(303,203,104,1,3500.00),
(304,204,103,1,1200.00),
(305,205,110,1,12000.00),
(306,206,108,1,2500.00),
(307,207,107,60,10.00),
(308,208,105,1,7000.00),
(309,209,106,60,50.00),
(310,210,104,1,3500.00);

SELECT * FROM OrderItems;

-- =================================================
-- Table 5: Reviews
-- Stores product reviews from customers
-- Attributes:
-- Review_ID     : Unique ID for review (Primary Key)
-- Product_ID    : Linked product (Foreign Key)
-- Customer_ID   : Linked customer (Foreign Key)
-- Rating        : Rating out of 5
-- Comment       : Review comment
-- =================================================
CREATE TABLE Reviews (
  Review_ID INT PRIMARY KEY,
  Product_ID INT,
  Customer_ID INT,
  Rating INT,
  Comment VARCHAR(255)
);

-- Sample data for Reviews
INSERT INTO Reviews VALUES
(401,101,1,5,'Excellent Laptop!'),
(402,102,2,4,'Good mouse'),
(403,103,3,3,'Keyboard okay'),
(404,104,4,5,'Very comfortable chair'),
(405,105,5,4,'Nice table'),
(406,106,6,5,'Useful notebook'),
(407,107,7,4,'Good pen'),
(408,108,8,5,'Amazing headphones'),
(409,109,9,4,'Clear monitor'),
(410,110,10,5,'Strong cabinet');

SELECT * FROM Reviews;

-- =================================================
-- Additional Operations
-- =================================================
-- Update order status
UPDATE Orders SET Status='Delivered' WHERE Order_ID=202;

-- Delete a review
DELETE FROM Reviews WHERE Review_ID=403;

-- Drop a table example
-- DROP TABLE OrderItems;
