-- ================================================
-- 📚 LIBRARY DATABASE
-- ================================================

-- Step 1: Create a new database
CREATE DATABASE LibraryDB;

-- Step 2: Use the created database
USE LibraryDB;


-- ================================================
-- TABLE 1: Books
-- Stores information about books in the library
-- ================================================
CREATE TABLE Books (
  Book_ID INT PRIMARY KEY,                 -- Unique ID for each book
  Title VARCHAR(100),                      -- Title of the book
  Author VARCHAR(50),                      -- Author name
  Genre VARCHAR(30),                       -- Genre (Fiction, Science, etc.)
  Price DECIMAL(6,2)                       -- Price of the book
);

-- Insert 10 book records
INSERT INTO Books VALUES
(1,'The Alchemist','Paulo Coelho','Fiction',299.00),
(2,'Introduction to Algorithms','Cormen','Education',1499.00),
(3,'Clean Code','Robert Martin','Education',999.00),
(4,'Harry Potter','J.K. Rowling','Fantasy',599.00),
(5,'The Great Gatsby','F. Scott Fitzgerald','Fiction',399.00),
(6,'Atomic Habits','James Clear','Self-Help',499.00),
(7,'To Kill a Mockingbird','Harper Lee','Fiction',450.00),
(8,'Thinking, Fast and Slow','Daniel Kahneman','Psychology',799.00),
(9,'The Lean Startup','Eric Ries','Business',699.00),
(10,'1984','George Orwell','Fiction',350.00);

-- Display all books
SELECT * FROM Books;


-- ================================================
-- TABLE 2: Members
-- Stores information about library members
-- ================================================
CREATE TABLE Members (
  Member_ID INT PRIMARY KEY,               -- Unique ID for each member
  Name VARCHAR(50),                        -- Full name of the member
  Email VARCHAR(50),                       -- Email address
  Contact_Number VARCHAR(15),              -- Phone number
  Join_Date DATE                           -- Membership joining date
);

-- Insert 10 member records
INSERT INTO Members VALUES
(1,'Amit Sharma','amit@gmail.com','9876543210','2023-01-10'),
(2,'Neha Verma','neha@gmail.com','9876501234','2023-02-15'),
(3,'Rohit Singh','rohit@gmail.com','9812345678','2023-03-20'),
(4,'Priya Gupta','priya@gmail.com','9908765432','2023-04-18'),
(5,'Karan Mehta','karan@gmail.com','9823456789','2023-05-21'),
(6,'Sanya Rao','sanya@gmail.com','9811122233','2023-06-25'),
(7,'Arjun Das','arjun@gmail.com','9922334455','2023-07-05'),
(8,'Isha Jain','isha@gmail.com','9898989898','2023-08-10'),
(9,'Vikram Rao','vikram@gmail.com','9707070707','2023-09-12'),
(10,'Anjali Kapoor','anjali@gmail.com','9654321987','2023-10-05');

-- Display all members
SELECT * FROM Members;


-- ================================================
-- TABLE 3: Borrow
-- Stores details of books borrowed by members
-- ================================================
CREATE TABLE Borrow (
  Borrow_ID INT PRIMARY KEY,               -- Unique borrow record ID
  Member_ID INT,                           -- References Members table
  Book_ID INT,                             -- References Books table
  Borrow_Date DATE,                         -- Date when book was borrowed
  Return_Date DATE                          -- Expected return date
);

-- Insert 10 borrow records
INSERT INTO Borrow VALUES
(101,1,1,'2024-01-10','2024-01-20'),
(102,2,2,'2024-01-12','2024-01-22'),
(103,3,3,'2024-01-15','2024-01-25'),
(104,4,4,'2024-01-18','2024-01-28'),
(105,5,5,'2024-01-20','2024-01-30'),
(106,6,6,'2024-01-22','2024-02-01'),
(107,7,7,'2024-01-25','2024-02-04'),
(108,8,8,'2024-01-28','2024-02-07'),
(109,9,9,'2024-01-30','2024-02-09'),
(110,10,10,'2024-02-01','2024-02-11');

-- Display all borrow records
SELECT * FROM Borrow;


-- ================================================
-- TABLE 4: Staff
-- Stores information about library staff
-- ================================================
CREATE TABLE Staff (
  Staff_ID INT PRIMARY KEY,                -- Unique staff ID
  Name VARCHAR(50),                        -- Staff name
  Role VARCHAR(30),                        -- Role (Librarian, Assistant)
  Shift VARCHAR(20),                        -- Shift timing
  Salary DECIMAL(8,2)                       -- Monthly salary
);

-- Insert 10 staff records
INSERT INTO Staff VALUES
(201,'Rajesh Kumar','Librarian','Morning',40000.00),
(202,'Neha Sharma','Assistant','Morning',25000.00),
(203,'Rohit Verma','Assistant','Evening',25000.00),
(204,'Priya Singh','Librarian','Evening',40000.00),
(205,'Karan Mehta','Assistant','Morning',23000.00),
(206,'Sanya Rao','Assistant','Evening',22000.00),
(207,'Arjun Das','Librarian','Morning',42000.00),
(208,'Isha Jain','Assistant','Morning',21000.00),
(209,'Vikram Rao','Assistant','Evening',24000.00),
(210,'Anjali Kapoor','Librarian','Evening',45000.00);

-- Display all staff records
SELECT * FROM Staff;


-- ================================================
-- TABLE 5: Fines
-- Stores fines imposed on members
-- ================================================
CREATE TABLE Fines (
  Fine_ID INT PRIMARY KEY,                 -- Unique fine ID
  Member_ID INT,                           -- References Members table
  Amount DECIMAL(6,2),                     -- Fine amount
  Reason VARCHAR(100),                      -- Reason for fine
  Date DATE                                -- Date of fine
);

-- Insert 10 fine records
INSERT INTO Fines VALUES
(301,1,50.00,'Late return of book','2024-01-21'),
(302,2,75.00,'Damaged book','2024-01-23'),
(303,3,40.00,'Late return of book','2024-01-25'),
(304,4,60.00,'Lost book','2024-01-28'),
(305,5,30.00,'Late return of book','2024-01-30'),
(306,6,50.00,'Damaged book','2024-02-01'),
(307,7,20.00,'Late return of book','2024-02-04'),
(308,8,70.00,'Lost book','2024-02-07'),
(309,9,45.00,'Late return of book','2024-02-09'),
(310,10,55.00,'Damaged book','2024-02-11');

-- Display all fine records
SELECT * FROM Fines;


-- ================================================
-- 🔧 ADDITIONAL SQL OPERATIONS
-- ================================================

-- Operation 1: Update fine amount for a member
UPDATE Fines
SET Amount = 60.00
WHERE Fine_ID = 301;

-- Operation 2: Delete a fine record
DELETE FROM Fines
WHERE Fine_ID = 307;

-- Operation 3: Drop the Staff table (for restructuring)
DROP TABLE Staff;


-- ================================================
-- END OF SCRIPT
-- ================================================
