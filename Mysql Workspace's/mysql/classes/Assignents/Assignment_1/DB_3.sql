-- ================================================
-- 🎓 COLLEGE DATABASE
-- ================================================

-- Step 1: Create a new database
CREATE DATABASE CollegeDB;

-- Step 2: Use the created database
USE CollegeDB;


-- ================================================
-- TABLE 1: Students
-- Stores information about college students
-- ================================================
CREATE TABLE Students (
  Student_ID INT PRIMARY KEY,             -- Unique ID for each student
  Name VARCHAR(50),                       -- Full name of the student
  Age INT,                                -- Age of the student
  Course VARCHAR(50),                     -- Course enrolled
  Year INT                                -- Current year of study
);

-- Insert 10 student records
INSERT INTO Students VALUES
(1,'Amit Sharma',20,'BSc Computer Science',2),
(2,'Neha Verma',19,'BSc Mathematics',1),
(3,'Rohit Singh',21,'BCom',3),
(4,'Priya Gupta',22,'BA English',4),
(5,'Karan Mehta',20,'BSc Physics',2),
(6,'Sanya Rao',21,'BSc Chemistry',3),
(7,'Arjun Das',19,'BBA',1),
(8,'Isha Jain',22,'BSc Computer Science',4),
(9,'Vikram Rao',20,'BCom',2),
(10,'Anjali Kapoor',21,'BA Economics',3);

-- Display all student records
SELECT * FROM Students;


-- ================================================
-- TABLE 2: Teachers
-- Stores information about college teachers
-- ================================================
CREATE TABLE Teachers (
  Teacher_ID INT PRIMARY KEY,             -- Unique ID for each teacher
  Name VARCHAR(50),                       -- Full name
  Department VARCHAR(50),                 -- Department name
  Qualification VARCHAR(50),              -- Highest qualification
  Experience INT                           -- Years of teaching experience
);

-- Insert 10 teacher records
INSERT INTO Teachers VALUES
(101,'Dr. Rajesh Kumar','Computer Science','PhD',12),
(102,'Ms. Neha Sharma','Mathematics','MSc',8),
(103,'Mr. Rohit Verma','Commerce','MCom',10),
(104,'Dr. Priya Singh','English','PhD',15),
(105,'Mr. Karan Mehta','Physics','MSc',7),
(106,'Ms. Sanya Rao','Chemistry','MSc',9),
(107,'Dr. Arjun Das','Management','PhD',11),
(108,'Ms. Isha Jain','Computer Science','MSc',6),
(109,'Mr. Vikram Rao','Economics','MCom',8),
(110,'Ms. Anjali Kapoor','English','MA',5);

-- Display all teacher records
SELECT * FROM Teachers;


-- ================================================
-- TABLE 3: Courses
-- Stores information about college courses
-- ================================================
CREATE TABLE Courses (
  Course_ID INT PRIMARY KEY,              -- Unique course ID
  Course_Name VARCHAR(50),                -- Name of the course
  Duration VARCHAR(20),                   -- Duration (e.g., 3 Years)
  Credits INT,                            -- Total credits
  Department VARCHAR(50)                  -- Department offering the course
);

-- Insert 10 course records
INSERT INTO Courses VALUES
(201,'BSc Computer Science','3 Years',120,'Computer Science'),
(202,'BSc Mathematics','3 Years',110,'Mathematics'),
(203,'BCom','3 Years',100,'Commerce'),
(204,'BA English','3 Years',100,'English'),
(205,'BSc Physics','3 Years',120,'Physics'),
(206,'BSc Chemistry','3 Years',120,'Chemistry'),
(207,'BBA','3 Years',110,'Management'),
(208,'BA Economics','3 Years',100,'Economics'),
(209,'BSc IT','3 Years',120,'Computer Science'),
(210,'BA History','3 Years',100,'History');

-- Display all course records
SELECT * FROM Courses;


-- ================================================
-- TABLE 4: Exams
-- Stores exam schedules and details
-- ================================================
CREATE TABLE Exams (
  Exam_ID INT PRIMARY KEY,                -- Unique exam ID
  Course_ID INT,                          -- References Courses table
  Exam_Date DATE,                          -- Date of the exam
  Type VARCHAR(20),                        -- Exam type (Midterm/Final)
  Total_Marks INT                           -- Maximum marks
);

-- Insert 10 exam records
INSERT INTO Exams VALUES
(301,201,'2024-03-15','Midterm',100),
(302,202,'2024-03-20','Final',100),
(303,203,'2024-04-10','Midterm',100),
(304,204,'2024-04-15','Final',100),
(305,205,'2024-05-05','Midterm',100),
(306,206,'2024-05-10','Final',100),
(307,207,'2024-06-01','Midterm',100),
(308,208,'2024-06-05','Final',100),
(309,209,'2024-06-15','Midterm',100),
(310,210,'2024-06-20','Final',100);

-- Display all exam records
SELECT * FROM Exams;


-- ================================================
-- TABLE 5: Results
-- Stores students' marks and grades for exams
-- ================================================
CREATE TABLE Results (
  Result_ID INT PRIMARY KEY,              -- Unique result ID
  Student_ID INT,                         -- References Students table
  Exam_ID INT,                             -- References Exams table
  Marks_Obtained INT,                      -- Marks obtained by the student
  Grade VARCHAR(5)                         -- Grade (A/B/C/etc.)
);

-- Insert 10 result records
INSERT INTO Results VALUES
(401,1,301,85,'A'),
(402,2,302,78,'B'),
(403,3,303,90,'A'),
(404,4,304,88,'A'),
(405,5,305,70,'B'),
(406,6,306,95,'A'),
(407,7,307,65,'C'),
(408,8,308,80,'B'),
(409,9,309,75,'B'),
(410,10,310,85,'A');

-- Display all result records
SELECT * FROM Results;


-- ================================================
-- 🔧 ADDITIONAL SQL OPERATIONS
-- ================================================

-- Operation 1: Update student course
UPDATE Students
SET Course = 'BSc Information Technology'
WHERE Student_ID = 1;

-- Operation 2: Delete a result record for re-evaluation
DELETE FROM Results
WHERE Result_ID = 407;

-- Operation 3: Drop the Exams table (for restructuring)
DROP TABLE Exams;

-- ================================================
-- END OF SCRIPT
-- ================================================
