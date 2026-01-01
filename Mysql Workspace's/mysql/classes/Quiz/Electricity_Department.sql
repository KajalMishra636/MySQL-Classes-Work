-- ============================================================
-- 📘 DATABASE: ELECTRICITY_DEPT
-- Purpose: To manage customer electricity billing, meters, payments, and staff details.
-- ============================================================

CREATE DATABASE Electricity_Dept;
USE Electricity_Dept;

-- ============================================================
-- 1️⃣ CUSTOMER TABLE
-- Purpose: Stores customer information and connection details.
-- ============================================================

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,     -- Unique customer ID
  Name VARCHAR(100) NOT NULL,   -- Full name of the customer
  Address VARCHAR(200),                          -- Full address
  City VARCHAR(100),                             -- City name
  Contact VARCHAR(15) UNIQUE,                    -- Contact number (unique)
  ConnectionDate DATE,                           -- Date of connection establishment
  Status VARCHAR(20) DEFAULT 'Active'            -- Status of connection (Active/Inactive)
);

-- 🔹 Insert sample data (10 records)
INSERT INTO Customer (Name, Address, City, Contact, ConnectionDate, Status) VALUES
('Amit Sharma', '12 Green Park', 'Delhi', '9876543210', '2020-03-10', 'Active'),
('Riya Mehta', '44 MG Road', 'Mumbai', '9823456789', '2021-07-14', 'Active'),
('Vikram Singh', '9 Nehru Nagar', 'Chennai', '9812345678', '2019-11-22', 'Inactive'),
('Priya Patel', '78 Lake View', 'Ahmedabad', '9977886655', '2022-01-05', 'Active'),
('Suresh Rao', '56 Hill Top', 'Bangalore', '9001122334', '2020-09-15', 'Active'),
('Neha Gupta', '22 Civil Lines', 'Delhi', '9123456789', '2023-05-10', 'Active'),
('Karan Jain', '5 Central Ave', 'Pune', '9090909090', '2021-12-01', 'Inactive'),
('Ananya Das', '14 Park Street', 'Kolkata', '9011223344', '2020-08-20', 'Active'),
('Rohit Verma', '3 Church Road', 'Delhi', '9009988776', '2019-06-12', 'Inactive'),
('Pooja Nair', '9 Palm Grove', 'Kochi', '9988776655', '2022-11-25', 'Active');

 select * from Customer  ;


-- ============================================================
-- 2️⃣ METER TABLE
-- Purpose: Each customer has a meter for recording electricity usage.
-- ============================================================

CREATE TABLE Meter (
  MeterID INT PRIMARY KEY AUTO_INCREMENT,         -- Unique meter ID
  CustomerID INT,                                 -- Linked to Customer table
  MeterType VARCHAR(50),                          -- Type of meter (Digital/Analog)
  InstallationDate DATE,           
  -- Installation date
  Status VARCHAR(20) DEFAULT 'Active',            -- Meter status
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- 🔹 Insert sample data (10 records)
INSERT INTO Meter (CustomerID, MeterType, InstallationDate, Status) VALUES
(1, 'Digital', '2020-03-11', 'Active'),
(2, 'Analog', '2021-07-15', 'Active'),
(3, 'Smart', '2019-11-25', 'Inactive'),
(4, 'Digital', '2022-01-06', 'Active'),
(5, 'Analog', '2020-09-16', 'Active'),
(6, 'Smart', '2023-05-11', 'Active'),
(7, 'Digital', '2021-12-03', 'Inactive'),
(8, 'Smart', '2020-08-21', 'Active'),
(9, 'Analog', '2019-06-13', 'Inactive'),
(10, 'Digital', '2022-11-26', 'Active');

 select * from Meter ;
-- ============================================================
-- 3️⃣ BILL TABLE
-- Purpose: Stores monthly electricity consumption and bill details.
-- ============================================================

CREATE TABLE Bill (
  BillID INT PRIMARY KEY AUTO_INCREMENT,          -- Unique bill ID
  CustomerID INT,                                 -- Linked to Customer table
  MeterID INT,                                    -- Linked to Meter table
  BillMonth VARCHAR(20),                          -- Month of billing
  UnitsConsumed INT,                              -- Total units consumed
  Amount DECIMAL(10,2),                           -- Total bill amount
  DueDate DATE,                                   -- Payment due date
  Status VARCHAR(20) DEFAULT 'Pending',           -- Bill status (Paid/Overdue/Pending)
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (MeterID) REFERENCES Meter(MeterID)
);

-- 🔹 Insert sample data (10 records)
INSERT INTO Bill (CustomerID, MeterID, BillMonth, UnitsConsumed, Amount, DueDate, Status) VALUES
(1, 1, 'Jan-2025', 250, 1250.00, '2025-02-10', 'Paid'),
(2, 2, 'Jan-2025', 300, 1500.00, '2025-02-12', 'Pending'),
(3, 3, 'Jan-2025', 180, 900.00, '2025-02-15', 'Paid'),
(4, 4, 'Jan-2025', 400, 2000.00, '2025-02-11', 'Overdue'),
(5, 5, 'Jan-2025', 220, 1100.00, '2025-02-13', 'Pending'),
(6, 6, 'Jan-2025', 350, 1750.00, '2025-02-16', 'Paid'),
(7, 7, 'Jan-2025', 190, 950.00, '2025-02-17', 'Pending'),
(8, 8, 'Jan-2025', 275, 1375.00, '2025-02-18', 'Paid'),
(9, 9, 'Jan-2025', 320, 1600.00, '2025-02-19', 'Overdue'),
(10, 10, 'Jan-2025', 240, 1200.00, '2025-02-20', 'Pending');

 select * from Bill ;
-- ============================================================
-- 4️⃣ PAYMENT TABLE
-- Purpose: Stores payment information for bills.
-- ============================================================

CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY AUTO_INCREMENT,       -- Unique payment ID
  BillID INT,                                     -- Linked to Bill table
  PaymentDate DATE,                               -- Date of payment
  AmountPaid DECIMAL(10,2),                       -- Amount paid
  Mode VARCHAR(50),                               -- Mode of payment (Cash/Online/UPI)
  Status VARCHAR(20) DEFAULT 'Completed',         -- Payment status
  FOREIGN KEY (BillID) REFERENCES Bill(BillID)
);

-- 🔹 Insert sample data (10 records)
INSERT INTO Payment (BillID, PaymentDate, AmountPaid, Mode, Status) VALUES
(1, '2025-02-08', 1250.00, 'Online', 'Completed'),
(3, '2025-02-10', 900.00, 'Cash', 'Completed'),
(4, '2025-02-20', 2000.00, 'Online', 'Completed'),
(6, '2025-02-14', 1750.00, 'UPI', 'Completed'),
(8, '2025-02-17', 1375.00, 'Online', 'Completed'),
(2, '2025-02-18', 1500.00, 'Cash', 'Completed'),
(5, '2025-02-19', 1100.00, 'Online', 'Completed'),
(7, '2025-02-21', 950.00, 'UPI', 'Completed'),
(9, '2025-02-22', 1600.00, 'Cash', 'Completed'),
(10, '2025-02-23', 1200.00, 'Online', 'Completed');

 select * from Payment ;
-- ============================================================
-- 5️⃣ STAFF TABLE
-- Purpose: Contains information about staff handling billing and customer service.
-- ============================================================

CREATE TABLE Staff (
  StaffID INT PRIMARY KEY AUTO_INCREMENT,        -- Unique staff ID
  Name VARCHAR(100) NOT NULL,                    -- Staff member name
  Role VARCHAR(50),                              -- Role (Manager/Clerk/Technician)
  Salary DECIMAL(10,2),                          -- Monthly salary
  Branch VARCHAR(100)                            -- Branch or office location
);

-- 🔹 Insert sample data (10 records)
INSERT INTO Staff (Name, Role, Salary, Branch) VALUES
('Ramesh Kumar', 'Manager', 55000.00, 'Delhi'),
('Sunita Das', 'Clerk', 30000.00, 'Mumbai'),
('Anil Mehta', 'Technician', 28000.00, 'Chennai'),
('Deepa Rao', 'Supervisor', 40000.00, 'Bangalore'),
('Vivek Sharma', 'Manager', 52000.00, 'Ahmedabad'),
('Reena Gupta', 'Clerk', 31000.00, 'Delhi'),
('Ajay Nair', 'Technician', 27000.00, 'Kochi'),
('Kavita Joshi', 'Supervisor', 42000.00, 'Pune'),
('Harish Patel', 'Manager', 54000.00, 'Kolkata'),
('Neelam Yadav', 'Clerk', 29500.00, 'Delhi');


 select * from Staff ;
-- ============================================================
-- 6️⃣ COMPLAINT TABLE
-- Purpose: Stores customer complaints handled by staff members.
-- Links Customer → Complaint → Staff for service tracking.
-- ============================================================

CREATE TABLE Complaint (
  ComplaintID INT PRIMARY KEY AUTO_INCREMENT,   -- Unique complaint ID
  CustomerID INT,                               -- Linked to Customer table
  Date DATE,                                    -- Complaint date
  Description TEXT,                             -- Description of issue
  Status VARCHAR(30) DEFAULT 'Pending',         -- Status (Pending/In Progress/Resolved)
  StaffID INT,                                  -- Staff member handling the complaint
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- ============================================================
-- INSERT SAMPLE DATA (10 records)
-- ============================================================
INSERT INTO Complaint (CustomerID, Date, Description, Status, StaffID)
VALUES
(1, '2025-02-15', 'Meter reading not updated', 'Resolved', 2),
(2, '2025-02-18', 'High bill amount for January', 'Pending', 5),
(3, '2025-02-20', 'Power outage for 3 hours', 'In Progress', 3),
(4, '2025-02-19', 'Wrong customer name on bill', 'Resolved', 1),
(5, '2025-02-22', 'Meter malfunctioning', 'In Progress', 7),
(6, '2025-02-25', 'Late payment charges applied incorrectly', 'Pending', 6),
(7, '2025-02-23', 'App not showing latest payment details', 'Resolved', 4),
(8, '2025-02-21', 'Bill not generated for current month', 'Pending', 8),
(9, '2025-02-26', 'Frequent power fluctuations', 'In Progress', 9),
(10, '2025-02-28', 'Wrong meter type recorded', 'Resolved', 10);


 select * from Complaint ;



/* 2. (DDL) Alter Bill table to add LateFee */
ALTER TABLE Bill
ADD COLUMN LateFee DECIMAL(8,2);

set SQL_safe_updates=1;
/* 3. (DML) Insert a new customer record */
INSERT INTO Customer (Name, Address, City, Contact, ConnectionDate, Status)
VALUES ('Rahul Sharma', '10 Gomti Nagar', 'Lucknow', '9876543210', CURDATE(), 'Active');


/* 4. (DML) Update all overdue bills */
UPDATE Bill
SET Status = 'Overdue'
WHERE DueDate < CURRENT_DATE;

/* 5. (DQL) Display customers connected after 2020 */
SELECT Name AS CustomerName, City, ConnectionDate
FROM Customer
WHERE YEAR(ConnectionDate) > 2020;

/* 6. (DCL) Grant SELECT and UPDATE privilege */
GRANT SELECT, UPDATE
ON Electricity_Dept.Bill
TO 'clerk1'@'localhost';

/* 7. (TCL) Rollback demonstration */
START TRANSACTION;
INSERT INTO Payment (BillID, PaymentDate, AmountPaid, Mode, Status)
VALUES (5, CURDATE(), 5000.00, 'Cash', 'Completed');
ROLLBACK;

/* ==========================================================
   SECTION B – CLAUSES
   ========================================================== */

/* 8. WHERE: Customers from Delhi */
SELECT * FROM Customer
WHERE City = 'Delhi';

/* 9. GROUP BY: Count customers per city */
SELECT City, COUNT(*) AS TotalConnections
FROM Customer
GROUP BY City;

/* 10. MAX with GROUP BY: Highest bill per city */
SELECT City, MAX(Amount) AS MaxBill
FROM Bill
GROUP BY City;

/* 11. LIKE: Customers whose name starts with ‘A’ */
SELECT * FROM Customer
WHERE Name LIKE 'A%';

/* 12. ORDER BY & LIMIT: Top 5 highest bills */
SELECT * FROM Bill
ORDER BY Amount DESC
LIMIT 5;

/* 13. HAVING: Average units consumed (>200 units) */
SELECT City, AVG(UnitsConsumed) AS AvgUnits
FROM Bill
GROUP BY City
HAVING AVG(UnitsConsumed) > 200;

/* ==========================================================
   SECTION C – CONSTRAINTS
   ========================================================== */

CREATE TABLE Meter (
  MeterID INT PRIMARY KEY AUTO_INCREMENT,         -- Unique meter ID
  CustomerID INT,                                 -- Linked to Customer table
    MeterType VARCHAR(20) CHECK (MeterType IN ('Domestic','Commercial')),
  InstallationDate DATE,           
  -- Installation date
  Status VARCHAR(20) DEFAULT 'Active',            -- Meter status
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

/* 15. Auto Increment Primary Key for BillID */
CREATE TABLE Bill (
  BillID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT,
  UnitsConsumed INT,
  Amount DECIMAL(10,2),
  BillDate DATE,
  DueDate DATE,
  Status VARCHAR(20)
);

/* 16. FOREIGN KEY in Bill table */
ALTER TABLE Bill
ADD CONSTRAINT fk_customer
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

/* ==========================================================
   SECTION D – JOINS
   ========================================================== */

/* 17. INNER JOIN: Customer and Meter */
SELECT c.Name AS CustomerName, m.MeterType, m.InstallationDate
FROM Customer c
INNER JOIN Meter m ON c.CustomerID = m.CustomerID;

/* 18. LEFT JOIN: All customers and their bills */
SELECT c.Name, b.BillID, b.Amount
FROM Customer c
LEFT JOIN Bill b ON c.CustomerID = b.CustomerID;

/* 19. LEFT JOIN: Staff without complaints */
SELECT s.StaffName
FROM Staff s
LEFT JOIN Complaint c ON s.StaffID = c.StaffID
WHERE c.StaffID IS NULL;

/* 20. JOIN: Total amount collected by staff */
SELECT s.StaffName, SUM(p.AmountPaid) AS TotalCollected
FROM Staff s
JOIN Payment p ON s.StaffID = p.StaffID
GROUP BY s.StaffName;

/* 21. JOIN: Customers who paid after due date */
SELECT c.Name, b.BillID, p.PaymentDate
FROM Customer c
JOIN Bill b ON c.CustomerID = b.CustomerID
JOIN Payment p ON b.BillID = p.BillID
WHERE p.PaymentDate > b.DueDate;

/* 22. JOIN: Customer, Complaint, and Staff */
SELECT cu.Name AS CustomerName, co.Description AS ComplaintDescription, s.StaffName
FROM Complaint co
JOIN Customer cu ON co.CustomerID = cu.CustomerID
JOIN Staff s ON co.StaffID = s.StaffID;

/* ==========================================================
   SECTION E – SUBQUERIES
   ========================================================== */

/* 23. Highest bill amount customer */
SELECT * FROM Customer
WHERE CustomerID = (SELECT CustomerID FROM Bill ORDER BY Amount DESC LIMIT 1);

/* 24. Customers with above-average consumption */
SELECT * FROM Customer
WHERE CustomerID IN (
  SELECT CustomerID FROM Bill
  WHERE UnitsConsumed > (SELECT AVG(UnitsConsumed) FROM Bill)
);

/* 25. Second highest bill */
SELECT Amount
FROM Bill
ORDER BY Amount DESC
LIMIT 1 OFFSET 1;

/* 26. Customers who never made a payment */
SELECT * FROM Customer
WHERE CustomerID NOT IN (SELECT CustomerID FROM Payment);

/* 27. Due bills greater than max staff salary */
SELECT * FROM Bill
WHERE Amount > (SELECT MAX(Salary) FROM Staff);

/* 28. Oldest connection date */
SELECT MIN(ConnectionDate) AS OldestConnection
FROM Customer;

/* ==========================================================
   SECTION F – FUNCTIONS
   ========================================================== */

/* 29. Current date and time */
SELECT NOW() AS CurrentDateTime;

/* 30. First 5 characters of customer names */
SELECT LEFT(Name, 5) AS ShortName FROM Customer;

/* 31. UDF: GetFullName */
DELIMITER $$
CREATE FUNCTION GetFullName(custID INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
  DECLARE fullName VARCHAR(200);
  SELECT CONCAT(FirstName, ' ', LastName) INTO fullName
  FROM Customer WHERE CustomerID = custID;
  RETURN fullName;
END$$
DELIMITER ;

/* 32. Date difference between DueDate and PaymentDate */
SELECT BillID, DATEDIFF(PaymentDate, DueDate) AS DaysDifference
FROM Payment;

/* 33. UDF: CalculateBill */
DELIMITER $$
CREATE FUNCTION CalculateBill(units INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);
  IF units <= 200 THEN
    SET total = units * 5;
  ELSE
    SET total = 200 * 5 + (units - 200) * 7;
  END IF;
  RETURN total;
END$$
DELIMITER ;

/* ==========================================================
   SECTION G – STORED PROCEDURES
   ========================================================== */

/* 34. Procedure: Insert new customer */
DELIMITER $$
CREATE PROCEDURE InsertCustomer(
  IN p_name VARCHAR(100),
  IN p_address VARCHAR(200),
  IN p_city VARCHAR(100),
  IN p_contact VARCHAR(15)
)
BEGIN
  INSERT INTO Customer (Name, Address, City, Contact, ConnectionDate)
  VALUES (p_name, p_address, p_city, p_contact, CURDATE());
END$$
DELIMITER ;

/* 35. Procedure: Generate monthly bills */
DELIMITER $$
CREATE PROCEDURE GenerateMonthlyBills()
BEGIN
  INSERT INTO Bill (CustomerID, UnitsConsumed, Amount, BillDate, DueDate, Status)
  SELECT CustomerID, FLOOR(RAND()*500)+100, 0, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY), 'Pending'
  FROM Customer;
END$$
DELIMITER ;

/* 36. Procedure: Pending bills for a customer */
DELIMITER $$
CREATE PROCEDURE ShowPendingBills(IN p_custID INT)
BEGIN
  SELECT * FROM Bill WHERE CustomerID = p_custID AND Status <> 'Paid';
END$$
DELIMITER ;

/* 37. Procedure: Apply late fees */
DELIMITER $$
CREATE PROCEDURE ApplyLateFees()
BEGIN
  UPDATE Bill
  SET LateFee = 50
  WHERE DATEDIFF(CURDATE(), DueDate) > 10 AND Status = 'Overdue';
END$$
DELIMITER ;

/* ==========================================================
   SECTION I – WINDOW FUNCTIONS
   ========================================================== */

/* 42. RANK() by total bill amount */
SELECT CustomerID, SUM(Amount) AS TotalBill,
RANK() OVER (ORDER BY SUM(Amount) DESC) AS RankPosition
FROM Bill
GROUP BY CustomerID;

/* 43. Cumulative units consumed */
SELECT CustomerID, BillDate, UnitsConsumed,
SUM(UnitsConsumed) OVER (PARTITION BY CustomerID ORDER BY BillDate) AS CumulativeUnits
FROM Bill;

/* 44. AVG() OVER city-wise */
SELECT City, AVG(Amount) OVER (PARTITION BY City) AS AvgBill
FROM Customer c
JOIN Bill b ON c.CustomerID = b.CustomerID;

/* 45. LEAD() for next month’s units */
SELECT CustomerID, BillDate, UnitsConsumed,
LEAD(UnitsConsumed) OVER (PARTITION BY CustomerID ORDER BY BillDate) AS NextMonthUnits
FROM Bill;

/* 46. ROW_NUMBER(): First bill per customer */
SELECT * FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY BillDate) AS RowNum
  FROM Bill
) t WHERE RowNum = 1;

/* ==========================================================
   SECTION J – MISCELLANEOUS QUERIES
   ========================================================== */

/* 47. Customers with complaints but no overdue bill */
SELECT DISTINCT c.Name
FROM Customer c
JOIN Complaint co ON c.CustomerID = co.CustomerID
WHERE c.CustomerID NOT IN (
  SELECT CustomerID FROM Bill WHERE Status = 'Overdue'
);

/* 48. Customer with maximum complaints */
SELECT c.Name, COUNT(co.ComplaintID) AS TotalComplaints
FROM Customer c
JOIN Complaint co ON c.CustomerID = co.CustomerID
GROUP BY c.Name
ORDER BY TotalComplaints DESC
LIMIT 1;

/* 49. Percentage of customers paid on time */
SELECT 
  (COUNT(DISTINCT CASE WHEN p.PaymentDate <= b.DueDate THEN b.CustomerID END) * 100 / COUNT(DISTINCT b.CustomerID)) 
  AS PercentagePaidOnTime
FROM Bill b
JOIN Payment p ON b.BillID = p.BillID;

/* 50. Total revenue month-wise (past year) */
SELECT DATE_FORMAT(PaymentDate, '%Y-%m') AS Month, SUM(AmountPaid) AS TotalRevenue
FROM Payment
WHERE YEAR(PaymentDate) = YEAR(CURDATE())
GROUP BY Month
ORDER BY Month;