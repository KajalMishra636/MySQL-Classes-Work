-- ================================================
-- 🎓 COLLEGE DATABASE
-- ================================================

CREATE DATABASE CollegeDB;
USE CollegeDB;

-- =================================================
-- Table 1: Students
-- Stores information about college students
-- Attributes:
-- Student_ID : Unique ID for student (Primary Key)
-- Name       : Student name
-- Age        : Student age
-- Course     : Enrolled course
-- Year       : Year of study
-- =================================================
CREATE TABLE Students (
  Student_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Age INT,
  Course VARCHAR(50),
  Year INT
);

-- Sample data for Students
INSERT INTO Students VALUES
(1,'Riya Sharma',20,'BSc IT',2),
(2,'Amit Patel',21,'BSc IT',3),
(3,'Sneha Gupta',19,'BSc CS',1),
(4,'Rahul Verma',22,'BCom',4),
(5,'Priya Singh',20,'BA',2),
(6,'Vikram Rao',23,'BSc IT',4),
(7,'Nisha Mehta',21,'BSc CS',3),
(8,'Arjun Das',22,'BCom',4),
(9,'Kavita Joshi',20,'BA',2),
(10,'Rohit Nair',21,'BSc IT',3);

SELECT * FROM Students;

-- =================================================
-- Table 2: Teachers
-- Stores information about teachers
-- Attributes:
-- Teacher_ID  : Unique ID for teacher (Primary Key)
-- Name        : Teacher name
-- Department  : Department name
-- Qualification : Highest qualification
-- Experience  : Years of experience
-- =================================================
CREATE TABLE Teachers (
  Teacher_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Department VARCHAR(50),
  Qualification VARCHAR(50),
  Experience INT
);

-- Sample data for Teachers
INSERT INTO Teachers VALUES
(101,'Dr. Suresh Iyer','Computer Science','PhD',15),
(102,'Ms. Neha Kapoor','Mathematics','MSc',10),
(103,'Mr. Ramesh Singh','Commerce','MBA',12),
(104,'Ms. Anjali Nair','English','MA',8),
(105,'Mr. Pawan Mehta','Physics','PhD',9);

SELECT * FROM Teachers;

-- =================================================
-- Table 3: Courses
-- Stores details of courses offered
-- Attributes:
-- Course_ID   : Unique ID for course (Primary Key)
-- Course_Name : Name of the course
-- Duration    : Duration of the course
-- Credits     : Number of credits
-- Department  : Department offering the course
-- =================================================
CREATE TABLE Courses (
  Course_ID INT PRIMARY KEY,
  Course_Name VARCHAR(50),
  Duration VARCHAR(20),
  Credits INT,
  Department VARCHAR(50)
);

-- Sample data for Courses
INSERT INTO Courses VALUES
(201,'BSc IT','3 Years',120,'Computer Science'),
(202,'BSc CS','3 Years',120,'Computer Science'),
(203,'BCom','3 Years',100,'Commerce'),
(204,'BA','3 Years',100,'Arts'),
(205,'MSc IT','2 Years',60,'Computer Science');

SELECT * FROM Courses;

-- =================================================
-- Table 4: Exams
-- Stores information about exams
-- Attributes:
-- Exam_ID     : Unique ID for exam (Primary Key)
-- Course_ID   : Linked course (Foreign Key)
-- Exam_Date   : Date of the exam
-- Type        : Type of exam (Midterm, Final)
-- Total_Marks : Maximum marks
-- =================================================
CREATE TABLE Exams (
  Exam_ID INT PRIMARY KEY,
  Course_ID INT,
  Exam_Date DATE,
  Type VARCHAR(20),
  Total_Marks INT
);

-- Sample data for Exams
INSERT INTO Exams VALUES
(301,201,'2024-03-10','Midterm',100),
(302,202,'2024-03-12','Final',100),
(303,203,'2024-03-15','Midterm',80),
(304,204,'2024-03-18','Final',100),
(305,205,'2024-03-20','Midterm',60);

SELECT * FROM Exams;

-- =================================================
-- Table 5: Results
-- Stores exam results for students
-- Attributes:
-- Result_ID      : Unique ID for result (Primary Key)
-- Student_ID     : Linked student (Foreign Key)
-- Exam_ID        : Linked exam (Foreign Key)
-- Marks_Obtained : Marks obtained by student
-- Grade          : Grade assigned
-- =================================================
CREATE TABLE Results (
  Result_ID INT PRIMARY KEY,
  Student_ID INT,
  Exam_ID INT,
  Marks_Obtained INT,
  Grade VARCHAR(5)
);

-- Sample data for Results
INSERT INTO Results VALUES
(401,1,301,85,'A'),
(402,2,302,90,'A+'),
(403,3,303,70,'B'),
(404,4,304,75,'B+'),
(405,5,305,50,'C'),
(406,6,301,88,'A'),
(407,7,302,92,'A+'),
(408,8,303,68,'B'),
(409,9,304,80,'A'),
(410,10,305,55,'C');

SELECT * FROM Results;

-- =================================================
-- Additional Operations
-- =================================================
-- Update student's course
UPDATE Students SET Course='BSc CS' WHERE Student_ID=1;

-- Delete a result record
DELETE FROM Results WHERE Result_ID=405;

-- Drop a table example
-- DROP TABLE Exams;
