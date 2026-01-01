-- ================================================
-- 📚 LIBRARY DATABASE
-- ================================================

CREATE DATABASE LibraryDB;
USE LibraryDB;

-- =================================================
-- Table 1: Books
-- Stores information about books available in the library
-- Attributes:
-- Book_ID   : Unique ID for book (Primary Key)
-- Title     : Title of the book
-- Author    : Author of the book
-- Genre     : Genre of the book
-- Price     : Price of the book
-- =================================================
CREATE TABLE Books (
  Book_ID INT PRIMARY KEY,
  Title VARCHAR(100),
  Author VARCHAR(50),
  Genre VARCHAR(30),
  Price DECIMAL(6,2)
);

-- Sample data for Books
INSERT INTO Books VALUES
(1,'The Alchemist','Paulo Coelho','Fiction',500.00),
(2,'Harry Potter','J.K. Rowling','Fantasy',600.00),
(3,'Atomic Habits','James Clear','Self-Help',450.00),
(4,'The Great Gatsby','F. Scott Fitzgerald','Classic',550.00),
(5,'To Kill a Mockingbird','Harper Lee','Classic',500.00),
(6,'1984','George Orwell','Dystopian',400.00),
(7,'The Subtle Art of Not Giving a F*ck','Mark Manson','Self-Help',450.00),
(8,'The Hobbit','J.R.R. Tolkien','Fantasy',600.00),
(9,'Pride and Prejudice','Jane Austen','Classic',500.00),
(10,'Thinking, Fast and Slow','Daniel Kahneman','Psychology',700.00);

SELECT * FROM Books;

-- =================================================
-- Table 2: Members
-- Stores information about library members
-- Attributes:
-- Member_ID      : Unique ID for member (Primary Key)
-- Name           : Member name
-- Email          : Email address
-- Contact_Number : Phone number
-- Join_Date      : Date member joined
-- =================================================
CREATE TABLE Members (
  Member_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(50),
  Contact_Number VARCHAR(15),
  Join_Date DATE
);

-- Sample data for Members
INSERT INTO Members VALUES
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

SELECT * FROM Members;

-- =================================================
-- Table 3: Borrow
-- Stores information about borrowed books
-- Attributes:
-- Borrow_ID   : Unique ID for borrow record (Primary Key)
-- Member_ID   : Linked member (Foreign Key)
-- Book_ID     : Linked book (Foreign Key)
-- Borrow_Date : Date borrowed
-- Return_Date : Date returned
-- =================================================
CREATE TABLE Borrow (
  Borrow_ID INT PRIMARY KEY,
  Member_ID INT,
  Book_ID INT,
  Borrow_Date DATE,
  Return_Date DATE
);

-- Sample data for Borrow
INSERT INTO Borrow VALUES
(101,1,1,'2024-02-01','2024-02-10'),
(102,2,2,'2024-02-02','2024-02-12'),
(103,3,3,'2024-02-03','2024-02-13'),
(104,4,4,'2024-02-04','2024-02-14'),
(105,5,5,'2024-02-05','2024-02-15'),
(106,6,6,'2024-02-06','2024-02-16'),
(107,7,7,'2024-02-07','2024-02-17'),
(108,8,8,'2024-02-08','2024-02-18'),
(109,9,9,'2024-02-09','2024-02-19'),
(110,10,10,'2024-02-10','2024-02-20');

SELECT * FROM Borrow;

-- =================================================
-- Table 4: Staff
-- Stores information about library staff
-- Attributes:
-- Staff_ID   : Unique ID for staff (Primary Key)
-- Name       : Staff name
-- Role       : Role in library
-- Shift      : Shift assigned
-- Salary     : Salary
-- =================================================
CREATE TABLE Staff (
  Staff_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Role VARCHAR(30),
  Shift VARCHAR(20),
  Salary DECIMAL(8,2)
);

-- Sample data for Staff
INSERT INTO Staff VALUES
(201,'Mr. Suresh Iyer','Librarian','Morning',30000.00),
(202,'Ms. Neha Kapoor','Assistant','Morning',25000.00),
(203,'Mr. Ramesh Singh','Assistant','Evening',25000.00),
(204,'Ms. Anjali Nair','Accountant
