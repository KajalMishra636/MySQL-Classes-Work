-- ================================================
-- 💻 E-LEARNING DATABASE
-- ================================================

-- Step 1: Create a new database
CREATE DATABASE ELearningDB;

-- Step 2: Use the created database
USE ELearningDB;


-- ================================================
-- TABLE 1: Users
-- Stores information about users of the platform
-- ================================================
CREATE TABLE Users (
  User_ID INT PRIMARY KEY,                 -- Unique ID for each user
  Name VARCHAR(50),                        -- Full name
  Email VARCHAR(50),                        -- Email address
  Role VARCHAR(20),                         -- Role (Student/Instructor/Admin)
  Join_Date DATE                            -- Date of joining
);

-- Insert 10 user records
INSERT INTO Users VALUES
(1,'Amit Sharma','amit@gmail.com','Student','2024-01-10'),
(2,'Neha Verma','neha@gmail.com','Student','2024-01-12'),
(3,'Rohit Singh','rohit@gmail.com','Student','2024-01-15'),
(4,'Priya Gupta','priya@gmail.com','Student','2024-01-18'),
(5,'Karan Mehta','karan@gmail.com','Student','2024-01-20'),
(6,'Sanya Rao','sanya@gmail.com','Student','2024-01-22'),
(7,'Arjun Das','arjun@gmail.com','Student','2024-01-25'),
(8,'Isha Jain','isha@gmail.com','Student','2024-01-28'),
(9,'Vikram Rao','vikram@gmail.com','Student','2024-01-30'),
(10,'Anjali Kapoor','anjali@gmail.com','Student','2024-02-01');

-- Display all users
SELECT * FROM Users;


-- ================================================
-- TABLE 2: Instructors
-- Stores information about course instructors
-- ================================================
CREATE TABLE Instructors (
  Instructor_ID INT PRIMARY KEY,           -- Unique ID for instructor
  Name VARCHAR(50),                        -- Instructor name
  Expertise VARCHAR(50),                   -- Area of expertise
  Experience INT,                          -- Years of experience
  Rating DECIMAL(3,2)                      -- Average rating
);

-- Insert 10 instructor records
INSERT INTO Instructors VALUES
(101,'Dr. Rajesh Kumar','Data Science',12,4.8),
(102,'Ms. Neha Sharma','Web Development',8,4.5),
(103,'Mr. Rohit Verma','Machine Learning',10,4.7),
(104,'Dr. Priya Singh','Cybersecurity',15,4.9),
(105,'Mr. Karan Mehta','Cloud Computing',7,4.3),
(106,'Ms. Sanya Rao','AI',9,4.6),
(107,'Dr. Arjun Das','Blockchain',11,4.7),
(108,'Ms. Isha Jain','UI/UX Design',6,4.4),
(109,'Mr. Vikram Rao','Mobile Development',8,4.5),
(110,'Ms. Anjali Kapoor','Python Programming',5,4.3);

-- Display all instructors
SELECT * FROM Instructors;


-- ================================================
-- TABLE 3: Courses
-- Stores information about available courses
-- ================================================
CREATE TABLE Courses (
  Course_ID INT PRIMARY KEY,               -- Unique course ID
  Title VARCHAR(100),                       -- Course title
  Instructor_ID INT,                        -- References Instructors table
  Duration VARCHAR(20),                     -- Duration of the course
  Level VARCHAR(20)                         -- Level (Beginner/Intermediate/Advanced)
);

-- Insert 10 course records
INSERT INTO Courses VALUES
(201,'Data Science Bootcamp',101,'12 Weeks','Advanced'),
(202,'Full Stack Web Development',102,'10 Weeks','Intermediate'),
(203,'Machine Learning A-Z',103,'8 Weeks','Advanced'),
(204,'Cybersecurity Fundamentals',104,'6 Weeks','Beginner'),
(205,'Cloud Computing Essentials',105,'5 Weeks','Intermediate'),
(206,'AI for Everyone',106,'7 Weeks','Beginner'),
(207,'Blockchain Basics',107,'4 Weeks','Intermediate'),
(208,'UI/UX Design Masterclass',108,'6 Weeks','Beginner'),
(209,'Mobile App Development',109,'8 Weeks','Intermediate'),
(210,'Python Programming for Beginners',110,'10 Weeks','Beginner');

-- Display all courses
SELECT * FROM Courses;


-- ================================================
-- TABLE 4: Enrollments
-- Stores enrollment details of users in courses
-- ================================================
CREATE TABLE Enrollments (
  Enrollment_ID INT PRIMARY KEY,            -- Unique enrollment ID
  User_ID INT,                              -- References Users table
  Course_ID INT,                             -- References Courses table
  Enroll_Date DATE,                          -- Date of enrollment
  Status VARCHAR(20)                          -- Status (Active/Completed)
);

-- Insert 10 enrollment records
INSERT INTO Enrollments VALUES
(301,1,201,'2024-01-15','Active'),
(302,2,202,'2024-01-16','Active'),
(303,3,203,'2024-01-17','Active'),
(304,4,204,'2024-01-18','Active'),
(305,5,205,'2024-01-19','Active'),
(306,6,206,'2024-01-20','Active'),
(307,7,207,'2024-01-21','Active'),
(308,8,208,'2024-01-22','Active'),
(309,9,209,'2024-01-23','Active'),
(310,10,210,'2024-01-24','Active');

-- Display all enrollments
SELECT * FROM Enrollments;


-- ================================================
-- TABLE 5: Feedback
-- Stores feedback and ratings provided by users for courses
-- ================================================
CREATE TABLE Feedback (
  Feedback_ID INT PRIMARY KEY,             -- Unique feedback ID
  User_ID INT,                             -- References Users table
  Course_ID INT,                            -- References Courses table
  Rating INT,                               -- Rating given (1-5)
  Comments VARCHAR(255)                      -- Feedback comments
);

-- Insert 10 feedback records
INSERT INTO Feedback VALUES
(401,1,201,5,'Excellent course with hands-on projects'),
(402,2,202,4,'Very informative and practical'),
(403,3,203,5,'Great content and instructor'),
(404,4,204,4,'Good course for beginners'),
(405,5,205,3,'Could include more examples'),
(406,6,206,5,'Loved the AI introduction'),
(407,7,207,4,'Very clear and easy to understand'),
(408,8,208,5,'Fantastic UI/UX course'),
(409,9,209,4,'Well-structured content'),
(410,10,210,5,'Perfect for beginners in Python');

-- Display all feedback
SELECT * FROM Feedback;


-- ================================================
-- 🔧 ADDITIONAL SQL OPERATIONS
-- ================================================

-- Operation 1: Update user role
UPDATE Users
SET Role = 'Instructor'
WHERE User_ID = 2;

-- Operation 2: Delete a feedback record
DELETE FROM Feedback
WHERE Feedback_ID = 405;

-- Operation 3: Drop the Enrollments table
DROP TABLE Enrollments;

-- ================================================
-- END OF SCRIPT
-- ================================================
