-- ================================================
-- 🛒 ONLINE SHOPPING DATABASE
-- ================================================

CREATE DATABASE OnlineShoppingDB;
USE OnlineShoppingDB;

-- Table 1: Customers
CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(50),
  Contact_Number VARCHAR(15),
  Address VARCHAR(100)
);

INSERT INTO Customers VALUES
(1,'Amit Sharma','amit@gmail.com','9876543210','Mumbai'),
(2,'Neha Verma','neha@gmail.com','9876501234','Delhi'),
(3,'Rohit Singh','rohit@gmail.com','9812345678','Bangalore'),
(4,'Priya Gupta','priya@gmail.com','9908765432','Chennai'),
(5,'Karan Mehta','karan@gmail.com','9823456789','Kolkata'),
(6,'Sanya Rao','sanya@gmail.com','9811122233','Hyderabad'),
(7,'Arjun Das','arjun@gmail.com','9922334455','Pune'),
(8,'Isha Jain','isha@gmail.com','9898989898','Ahmedabad'),
(9,'Vikram Rao','vikram@gmail.com','9707070707','Chandigarh'),
(10,'Anjali Kapoor','anjali@gmail.com','9654321987','Jaipur');

SELECT * FROM Customers;

-- Table 2: Products
CREATE TABLE Products (
  Product_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Category VARCHAR(30),
  Price DECIMAL(10,2),
  Stock INT
);

INSERT INTO Products VALUES
(101,'iPhone 15','Electronics',120000.00,50),
(102,'Samsung TV','Electronics',45000.00,30),
(103,'Nike Shoes','Fashion',5000.00,100),
(104,'Levi Jeans','Fashion',2500.00,150),
(105,'Dell Laptop','Electronics',75000.00,20),
(106,'T-shirt','Fashion',800.00,200),
(107,'Headphones','Electronics',2500.00,75),
(108,'Backpack','Fashion',1200.00,80),
(109,'Smartwatch','Electronics',10000.00,60),
(110,'Sofa','Home & Living',30000.00,10);

SELECT * FROM Products;

-- Table 3: Orders
CREATE TABLE Orders (
  Order_ID INT PRIMARY KEY,
  Customer_ID INT,
  Order_Date DATE,
  Total_Amount DECIMAL(10,2),
  Status VARCHAR(20)
);

INSERT INTO Orders VALUES
(201,1,'2024-01-10',120000.00,'Delivered'),
(202,2,'2024-01-12',5000.00,'Shipped'),
(203,3,'2024-01-15',2500.00,'Pending'),
(204,4,'2024-01-18',75000.00,'Delivered'),
(205,5,'2024-01-20',45000.00,'Cancelled'),
(206,6,'2024-01-22',1200.00,'Delivered'),
(207,7,'2024-01-25',10000.00,'Shipped'),
(208,8,'2024-01-28',2500.00,'Pending'),
(209,9,'2024-01-30',800.00,'Delivered'),
(210,10,'2024-02-01',30000.00,'Delivered');

SELECT * FROM Orders;

-- Table 4: Cart
CREATE TABLE Cart (
  Cart_ID INT PRIMARY KEY,
  Customer_ID INT,
  Product_ID INT,
  Quantity INT,
  Added_Date DATE
);

INSERT INTO Cart VALUES
(301,1,101,1,'2024-01-09'),
(302,2,103,2,'2024-01-11'),
(303,3,104,1,'2024-01-14'),
(304,4,105,1,'2024-01-17'),
(305,5,102,1,'2024-01-19'),
(306,6,108,1,'2024-01-21'),
(307,7,109,1,'2024-01-24'),
(308,8,106,3,'2024-01-27'),
(309,9,106,1,'2024-01-29'),
(310,10,110,1,'2024-01-31');

SELECT * FROM Cart;

-- Table 5: Payments
CREATE TABLE Payments (
  Payment_ID INT PRIMARY KEY,
  Order_ID INT,
  Payment_Method VARCHAR(30),
  Amount DECIMAL(10,2),
  Payment_Date DATE
);

INSERT INTO Payments VALUES
(401,201,'Credit Card',120000.00,'2024-01-10'),
(402,202,'UPI',5000.00,'2024-01-12'),
(403,203,'Cash',2500.00,'2024-01-15'),
(404,204,'Credit Card',75000.00,'2024-01-18'),
(405,205,'Debit Card',45000.00,'2024-01-20'),
(406,206,'UPI',1200.00,'2024-01-22'),
(407,207,'Net Banking',10000.00,'2024-01-25'),
(408,208,'Cash',2500.00,'2024-01-28'),
(409,209,'Credit Card',800.00,'2024-01-30'),
(410,210,'UPI',30000.00,'2024-02-01');

SELECT * FROM Payments;

-- Additional Operations
UPDATE Orders SET Status='Delivered' WHERE Order_ID=203;
DELETE FROM Cart WHERE Cart_ID=309;
DROP TABLE Payments;
