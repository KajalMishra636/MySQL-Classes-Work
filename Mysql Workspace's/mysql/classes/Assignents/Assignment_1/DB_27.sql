-- ================================================
-- 🎓 SCHOOL DATABASE
-- ================================================

CREATE DATABASE SchoolDB;
USE SchoolDB;

-- =================================================
-- Table 1: Students
-- Stores information about students
-- Attributes:
-- Student_ID    : Unique ID for student (Primary Key)
-- Name          : Student name
-- Age           : Student age
-- Grade         : Current grade/class
-- Contact_Number: Phone number
-- =================================================
CREATE TABLE Students (
  Student_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Age INT,
  Grade VARCHAR(10),
  Contact_Number VARCHAR(15)
);

-- Sample data for Students
INSERT INTO Students VALUES
(1,'Riya Sharma',10,'5th','9876543210'),
(2,'Amit Patel',12,'6th','9812345678'),
(3,'Sneha Gupta',11,'5th','9900112233'),
(4,'Rahul Verma',13,'7th','9922334455'),
(5,'Priya Singh',10,'5th','9898989898'),
(6,'Vikram Rao',12,'6th','9707070707'),
(7,'Nisha Mehta',11,'5th','9654321987'),
(8,'Arjun Das',13,'7th','9811223344'),
(9,'Kavita Joshi',12,'6th','9933445566'),
(10,'Rohit Nair',11,'5th','9877778888');

SELECT * FROM Students;

-- =================================================
-- Table 2: Teachers
-- Stores information about teachers
-- Attributes:
-- Teacher_ID    : Unique ID for teacher (Primary Key)
-- Name          : Teacher name
-- Subject       : Subject taught
-- Experience    : Years of experience
-- Contact_Number: Phone number
-- =================================================
CREATE TABLE Teachers (
  Teacher_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Subject VARCHAR(50),
  Experience INT,
  Contact_Number VARCHAR(15)
);

-- Sample data for Teachers
INSERT INTO Teachers VALUES
(101,'Mr. Suresh Iyer','Math',15,'9876500001'),
(102,'Ms. Neha Kapoor','Science',10,'9876512345'),
(103,'Mr. Ramesh Singh','English',12,'9812345000'),
(104,'Ms. Anjali Nair','History',8,'9823456000'),
(105,'Mr. Pawan Mehta','Geography',9,'9933445566');

SELECT * FROM Teachers;

-- =================================================
-- Table 3: Classes
-- Stores information about classes
-- Attributes:
-- Class_ID      : Unique ID for class (Primary Key)
-- Grade         : Grade/Class
-- Teacher_ID    : Class teacher (Foreign Key)
-- Room_Number   : Classroom number
-- Schedule      : Timing of class
-- =================================================
CREATE TABLE Classes (
  Class_ID INT PRIMARY KEY,
  Grade VARCHAR(10),
  Teacher_ID INT,
  Room_Number VARCHAR(10),
  Schedule VARCHAR(50)
);

-- Sample data for Classes
INSERT INTO Classes VALUES
(201,'5th',101,'A101','Mon-Fri 9:00-10:00'),
(202,'6th',102,'A102','Mon-Fri 10:00-11:00'),
(203,'7th',103,'A103','Mon-Fri 11:00-12:00'),
(204,'5th',104,'A104','Mon-Fri 12:00-01:00'),
(205,'6th',105,'A105','Mon-Fri 1:00-2:00');

SELECT * FROM Classes;

-- =================================================
-- Table 4: Exams
-- Stores information about exams
-- Attributes:
-- Exam_ID       : Unique ID for exam (Primary Key)
-- Class_ID      : Linked class (Foreign Key)
-- Subject       : Subject of exam
-- Exam_Date     : Date of exam
-- Total_Marks   : Maximum marks
-- =================================================
CREATE TABLE Exams (
  Exam_ID INT PRIMARY KEY,
  Class_ID INT,
  Subject VARCHAR(50),
  Exam_Date DATE,
  Total_Marks INT
);

-- Sample data for Exams
INSERT INTO Exams VALUES
(301,201,'Math','2024-10-15',100),
(302,202,'Science','2024-10-16',100),
(303,203,'English','2024-10-17',100),
(304,204,'History','2024-10-18',100),
(305,205,'Geography','2024-10-19',100);

SELECT * FROM Exams;

-- =================================================
-- Table 5: Results
-- Stores exam results of students
-- Attributes:
-- Result_ID     : Unique ID for result (Primary Key)
-- Student_ID    : Linked student (Foreign Key)
-- Exam_ID       : Linked exam (Foreign Key)
-- Marks_Obtained: Marks obtained
-- Grade         : Grade obtained
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
(402,2,302,78,'B'),
(403,3,303,90,'A'),
(404,4,304,70,'C'),
(405,5,305,88,'A'),
(406,6,301,76,'B'),
(407,7,302,82,'A'),
(408,8,303,68,'C'),
(409,9,304,80,'B'),
(410,10,305,95,'A');

SELECT * FROM Results;

-- =================================================
-- Additional Operations
-- =================================================
-- Update student grade
UPDATE Students SET Grade='6th' WHERE Student_ID=5;

-- Delete a teacher record
DELETE FROM Teachers WHERE Teacher_ID=105;

-- Drop a table example
-- DROP TABLE Results;
