-- ================================================
-- 📈 STOCK MARKET DATABASE
-- ================================================

CREATE DATABASE StockMarketDB;
USE StockMarketDB;

-- =================================================
-- Table 1: Companies
-- Stores information about listed companies
-- Attributes:
-- Company_ID   : Unique ID for each company (Primary Key)
-- Name         : Company name
-- Sector       : Sector of the company (IT, Pharma, Finance, etc.)
-- Market_Cap   : Market capitalization in crores
-- Headquarters : Headquarters location
-- =================================================
CREATE TABLE Companies (
  Company_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Sector VARCHAR(30),
  Market_Cap DECIMAL(15,2),
  Headquarters VARCHAR(50)
);

-- Sample data for Companies
INSERT INTO Companies VALUES
(1,'Tata Motors','Automobile',150000,'Mumbai'),
(2,'Infosys','IT',450000,'Bangalore'),
(3,'Reliance Industries','Conglomerate',1200000,'Mumbai'),
(4,'HDFC Bank','Finance',700000,'Mumbai'),
(5,'Sun Pharma','Pharmaceutical',200000,'Mumbai'),
(6,'Wipro','IT',250000,'Bangalore'),
(7,'L&T','Engineering',300000,'Mumbai'),
(8,'Maruti Suzuki','Automobile',600000,'Gurgaon'),
(9,'ICICI Bank','Finance',650000,'Mumbai'),
(10,'Dr. Reddy''s','Pharmaceutical',150000,'Hyderabad');

SELECT * FROM Companies;

-- =================================================
-- Table 2: Investors
-- Stores information about investors
-- Attributes:
-- Investor_ID  : Unique ID for investor (Primary Key)
-- Name         : Investor name
-- Contact_Number: Phone number
-- Email        : Email address
-- Type         : Type of investor (Individual, Institutional)
-- =================================================
CREATE TABLE Investors (
  Investor_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Contact_Number VARCHAR(15),
  Email VARCHAR(50),
  Type VARCHAR(20)
);

-- Sample data for Investors
INSERT INTO Investors VALUES
(101,'Ravi Kumar','9876543210','ravi@gmail.com','Individual'),
(102,'Sneha Sharma','9812345678','sneha@gmail.com','Individual'),
(103,'Amit Patel','9900112233','amitp@gmail.com','Institutional'),
(104,'Priya Verma','9922334455','priya@gmail.com','Individual'),
(105,'Arjun Das','9898989898','arjun@gmail.com','Institutional'),
(106,'Kavita Joshi','9707070707','kavita@gmail.com','Individual'),
(107,'Rahul Singh','9654321987','rahul@gmail.com','Individual'),
(108,'Anjali Kapoor','9811223344','anjali@gmail.com','Institutional'),
(109,'Vikram Rao','9933445566','vikram@gmail.com','Individual'),
(110,'Isha Jain','9877778888','isha@gmail.com','Individual');

SELECT * FROM Investors;

-- =================================================
-- Table 3: Stocks
-- Stores stock details of companies
-- Attributes:
-- Stock_ID     : Unique ID for stock (Primary Key)
-- Company_ID   : Linked company (Foreign Key)
-- Price        : Current price per share
-- Volume       : Number of shares traded
-- Date         : Date of price update
-- =================================================
CREATE TABLE Stocks (
  Stock_ID INT PRIMARY KEY,
  Company_ID INT,
  Price DECIMAL(10,2),
  Volume INT,
  Date DATE
);

-- Sample data for Stocks
INSERT INTO Stocks VALUES
(201,1,550.50,10000,'2024-01-10'),
(202,2,1500.75,20000,'2024-01-10'),
(203,3,2700.00,15000,'2024-01-10'),
(204,4,1450.25,18000,'2024-01-10'),
(205,5,900.50,12000,'2024-01-10'),
(206,6,620.75,16000,'2024-01-10'),
(207,7,1500.00,11000,'2024-01-10'),
(208,8,850.50,14000,'2024-01-10'),
(209,9,1320.25,13000,'2024-01-10'),
(210,10,2500.00,9000,'2024-01-10');

SELECT * FROM Stocks;

-- =================================================
-- Table 4: Transactions
-- Stores details of stock transactions by investors
-- Attributes:
-- Transaction_ID: Unique ID for transaction (Primary Key)
-- Investor_ID   : Investor making the transaction (Foreign Key)
-- Stock_ID      : Stock being traded (Foreign Key)
-- Type          : Buy/Sell
-- Quantity      : Number of shares
-- Transaction_Date: Date of transaction
-- =================================================
CREATE TABLE Transactions (
  Transaction_ID INT PRIMARY KEY,
  Investor_ID INT,
  Stock_ID INT,
  Type VARCHAR(10),
  Quantity INT,
  Transaction_Date DATE
);

-- Sample data for Transactions
INSERT INTO Transactions VALUES
(301,101,201,'Buy',100,'2024-01-10'),
(302,102,202,'Buy',50,'2024-01-10'),
(303,103,203,'Sell',200,'2024-01-10'),
(304,104,204,'Buy',150,'2024-01-10'),
(305,105,205,'Sell',100,'2024-01-10'),
(306,106,206,'Buy',120,'2024-01-10'),
(307,107,207,'Buy',80,'2024-01-10'),
(308,108,208,'Sell',60,'2024-01-10'),
(309,109,209,'Buy',90,'2024-01-10'),
(310,110,210,'Sell',70,'2024-01-10');

SELECT * FROM Transactions;

-- =================================================
-- Table 5: Dividends
-- Stores dividend records for companies
-- Attributes:
-- Dividend_ID   : Unique ID for dividend (Primary Key)
-- Company_ID    : Linked company (Foreign Key)
-- Amount_Per_Share: Dividend amount per share
-- Declaration_Date: Date dividend declared
-- Payment_Date  : Date dividend paid
-- =================================================
CREATE TABLE Dividends (
  Dividend_ID INT PRIMARY KEY,
  Company_ID INT,
  Amount_Per_Share DECIMAL(10,2),
  Declaration_Date DATE,
  Payment_Date DATE
);

-- Sample data for Dividends
INSERT INTO Dividends VALUES
(401,1,5.00,'2024-01-01','2024-01-31'),
(402,2,15.00,'2024-01-05','2024-02-05'),
(403,3,25.00,'2024-01-10','2024-02-10'),
(404,4,10.00,'2024-01-15','2024-02-15'),
(405,5,8.00,'2024-01-20','2024-02-20'),
(406,6,6.00,'2024-01-25','2024-02-25'),
(407,7,12.00,'2024-01-30','2024-02-28'),
(408,8,9.00,'2024-02-01','2024-03-01'),
(409,9,11.00,'2024-02-05','2024-03-05'),
(410,10,20.00,'2024-02-10','2024-03-10');

SELECT * FROM Dividends;

-- =================================================
-- Additional Operations
-- =================================================
-- Update stock price
UPDATE Stocks SET Price=560.00 WHERE Stock_ID=201;

-- Delete a transaction
DELETE FROM Transactions WHERE Transaction_ID=308;

-- Drop a table example
-- DROP TABLE Dividends;
