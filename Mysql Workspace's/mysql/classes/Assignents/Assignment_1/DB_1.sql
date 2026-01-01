CREATE DATABASE MENTOR;

USE MENTOR;
-- ==============================================
-- Schema: E-Learning / Online Course Platform
-- ==============================================

-- 1. Create Tables

CREATE TABLE Users (
  User_ID INT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  Password VARCHAR(100),
  Role VARCHAR(20),
  Join_Date DATE
);

-- 2. Insert Sample Data (10 records each)

-- Users
INSERT INTO Users VALUES
(1, 'Alice Smith', 'alice@example.com', 'pass1', 'student', '2024-01-15'),
(2, 'Bob Jones', 'bob@example.com', 'pass2', 'student', '2024-02-20'),
(3, 'Carol Lee', 'carol@example.com', 'pass3', 'instructor', '2023-11-05'),
(4, 'David Kim', 'david@example.com', 'pass4', 'student', '2024-03-10'),
(5, 'Eva Wright', 'eva@example.com', 'pass5', 'instructor', '2024-01-30'),
(6, 'Frank Xu', 'frank@example.com', 'pass6', 'student', '2024-04-12'),
(7, 'Grace Tan', 'grace@example.com', 'pass7', 'student', '2024-05-01'),
(8, 'Henry Wu', 'henry@example.com', 'pass8', 'student', '2024-02-28'),
(9, 'Irene Zhao', 'irene@example.com', 'pass9', 'instructor', '2023-12-15'),
(10, 'Jack Lin', 'jack@example.com', 'pass10', 'student', '2024-03-22');


SELECT * FROM Users;


-- ==============================================
-- Sample Queries & Operations
-- ==============================================


CREATE TABLE Courses (
  Course_ID INT PRIMARY KEY,
  Title VARCHAR(200),
  Description TEXT,
  Category VARCHAR(100),
  Creation_Date DATE
);

-- Courses
INSERT INTO Courses VALUES
(101, 'Intro to Python', 'Beginner-level Python course', 'Programming', '2023-12-01'),
(102, 'Data Structures', 'Data Structures using C++', 'Computer Science', '2024-01-10'),
(103, 'Web Development', 'Full stack web dev', 'Programming', '2024-02-05'),
(104, 'Machine Learning', 'Intro to ML and algorithms', 'AI', '2024-03-01'),
(105, 'Database Systems', 'Relational DB design and SQL', 'Computer Science', '2023-11-20'),
(106, 'Cloud Computing', 'AWS & Azure fundamentals', 'Infrastructure', '2024-01-25'),
(107, 'Algorithms', 'Design & Analysis of Algorithms', 'Computer Science', '2024-02-15'),
(108, 'Operating Systems', 'Concepts of OS', 'Computer Science', '2024-03-10'),
(109, 'Cybersecurity', 'Security principles', 'Security', '2024-04-01'),
(110, 'Mobile App Dev', 'Android & iOS development', 'Programming', '2024-02-20');


SELECT * FROM Courses;


CREATE TABLE Modules (
  Module_ID INT PRIMARY KEY,
  Course_ID INT,
  Title VARCHAR(200),
  Module_Order INT,
  Content TEXT,
  FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- Modules
INSERT INTO Modules VALUES
(1001, 101, 'Python Basics', 1, 'Variables, Types, Input/Output'),
(1002, 101, 'Control Flow', 2, 'if, for, while'),
(1003, 101, 'Functions & Modules', 3, 'Defining and importing modules'),
(1004, 102, 'Arrays & Linked Lists', 1, 'Implement and analyze arrays and lists'),
(1005, 102, 'Stacks & Queues', 2, 'LIFO, FIFO data structures'),
(1006, 103, 'HTML & CSS', 1, 'Basics of web pages'),
(1007, 103, 'JavaScript', 2, 'DOM, event handling'),
(1008, 104, 'Linear Regression', 1, 'Theory and implementation'),
(1009, 104, 'Classification', 2, 'Logistic regression, SVM'),
(1010, 105, 'ER Modeling', 1, 'Entity-relationship diagrams');


-- ==============================================
-- Sample Queries & Operations
-- ==============================================


SELECT * FROM Modules;



CREATE TABLE Enrollments (
  Enroll_ID INT PRIMARY KEY,
  User_ID INT,
  Course_ID INT,
  Enroll_Date DATE,
  Progress_Percentage DECIMAL(5,2),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- Enrollments
INSERT INTO Enrollments VALUES
(5001, 1, 101, '2024-01-16', 30.00),
(5002, 2, 101, '2024-01-17', 45.50),
(5003, 4, 102, '2024-02-11', 20.00),
(5004, 6, 103, '2024-02-20', 10.00),
(5005, 7, 104, '2024-03-05', 5.00),
(5006, 8, 105, '2024-03-15', 0.00),
(5007, 10, 106, '2024-03-25', 0.00),
(5008, 1, 105, '2024-02-01', 15.00),
(5009, 3, 105, '2024-01-20', 100.00),
(5010, 5, 104, '2024-03-10', 50.00);


-- ==============================================
-- Sample Queries & Operations
-- ==============================================


SELECT * FROM Enrollments;

-- F) Example JOIN: show students with their enrolled courses and progress
SELECT U.User_ID, U.Name, C.Course_ID, C.Title, E.Progress_Percentage
FROM Enrollments E
JOIN Users U ON E.User_ID = U.User_ID
JOIN Courses C ON E.Course_ID = C.Course_ID;

-- G) Update: change progress for one enrollment
UPDATE Enrollments
SET Progress_Percentage = 55.00
WHERE Enroll_ID = 5001;


-- H) Delete: remove a specific enrollment
DELETE FROM Enrollments
WHERE Enroll_ID = 5006;

CREATE TABLE Assessments (
  Assessment_ID INT PRIMARY KEY,
  Course_ID INT,
  Title VARCHAR(200),
  Max_Marks INT,
  Due_Date DATE,
  FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);


-- Assessments
INSERT INTO Assessments VALUES
(2001, 101, 'Quiz 1', 20, '2024-02-10'),
(2002, 101, 'Assignment 1', 50, '2024-02-20'),
(2003, 102, 'Midterm', 100, '2024-03-10'),
(2004, 103, 'Project', 100, '2024-03-25'),
(2005, 104, 'Quiz ML', 30, '2024-04-05'),
(2006, 105, 'SQL Assignment', 70, '2024-03-15'),
(2007, 106, 'Cloud Basics Test', 50, '2024-04-01'),
(2008, 107, 'Algorithms Quiz', 30, '2024-03-20'),
(2009, 108, 'OS Midterm', 100, '2024-03-30'),
(2010, 109, 'Security Assignment', 50, '2024-04-10');


-- ==============================================
-- Sample Queries & Operations
-- ==============================================


SELECT * FROM Assessments;


-- B) Create a new table for storing assessment results
CREATE TABLE AssessmentResults (
  Result_ID INT PRIMARY KEY,
  Assessment_ID INT,
  User_ID INT,
  Marks_Obtained INT,
  Submission_Date DATE,
  FOREIGN KEY (Assessment_ID) REFERENCES Assessments(Assessment_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- C) Insert into the new table
INSERT INTO AssessmentResults VALUES
(9001, 2001, 1, 18, '2024-02-09'),
(9002, 2001, 2, 17, '2024-02-09'),
(9003, 2002, 1, 45, '2024-02-19'),
(9004, 2002, 2, 48, '2024-02-19'),
(9005, 2006, 8, 60, '2024-03-14');


-- ==============================================
-- Sample Queries & Operations
-- ==============================================

-- D) Select from AssessmentResults
SELECT * FROM AssessmentResults;

-- E) Drop the AssessmentResults table (cleanup/demonstration)
DROP TABLE AssessmentResults;
