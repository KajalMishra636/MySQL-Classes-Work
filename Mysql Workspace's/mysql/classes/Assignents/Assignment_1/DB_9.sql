-- ================================================
-- 💪 GYM/FITNESS DATABASE
-- ================================================

CREATE DATABASE GymDB;
USE GymDB;

-- Table 1: Members
CREATE TABLE Members (
  Member_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Age INT,
  Gender VARCHAR(10),
  Join_Date DATE
);

INSERT INTO Members VALUES
(1,'Amit Sharma',28,'Male','2024-01-10'),
(2,'Neha Verma',25,'Female','2024-01-12'),
(3,'Rohit Singh',30,'Male','2024-01-15'),
(4,'Priya Gupta',27,'Female','2024-01-18'),
(5,'Karan Mehta',32,'Male','2024-01-20'),
(6,'Sanya Rao',29,'Female','2024-01-22'),
(7,'Arjun Das',31,'Male','2024-01-25'),
(8,'Isha Jain',26,'Female','2024-01-28'),
(9,'Vikram Rao',33,'Male','2024-01-30'),
(10,'Anjali Kapoor',24,'Female','2024-02-01');

SELECT * FROM Members;

-- Table 2: Trainers
CREATE TABLE Trainers (
  Trainer_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Specialty VARCHAR(50),
  Experience INT,
  Contact_Number VARCHAR(15)
);

INSERT INTO Trainers VALUES
(101,'Rohit Verma','Strength Training',10,'9876543210'),
(102,'Neha Sharma','Yoga',8,'9876501234'),
(103,'Amit Patel','Cardio',12,'9812345678'),
(104,'Priya Singh','Zumba',7,'9908765432'),
(105,'Karan Rao','Pilates',9,'9823456789'),
(106,'Sanya Mehta','Crossfit',8,'9811122233'),
(107,'Arjun Das','Bodybuilding',11,'9922334455'),
(108,'Isha Jain','Aerobics',6,'9898989898'),
(109,'Vikram Kapoor','Martial Arts',10,'9707070707'),
(110,'Anjali Kapoor','Personal Training',5,'9654321987');

SELECT * FROM Trainers;

-- Table 3: Classes
CREATE TABLE Classes (
  Class_ID INT PRIMARY KEY,
  Class_Name VARCHAR(50),
  Trainer_ID INT,
  Schedule VARCHAR(50),
  Duration VARCHAR(20)
);

INSERT INTO Classes VALUES
(201,'Morning Yoga',102,'Mon-Wed-Fri 6AM','1 Hour'),
(202,'Strength Training',101,'Tue-Thu 7AM','1.5 Hour'),
(203,'Cardio Blast',103,'Mon-Wed 6PM','1 Hour'),
(204,'Zumba Dance',104,'Tue-Thu 6PM','1 Hour'),
(205,'Pilates Core',105,'Mon-Fri 7AM','1 Hour'),
(206,'Crossfit Extreme',106,'Sat-Sun 8AM','2 Hours'),
(207,'Bodybuilding Basics',107,'Mon-Wed 5PM','1.5 Hour'),
(208,'Aerobics Fun',108,'Tue-Thu 5PM','1 Hour'),
(209,'Martial Arts',109,'Sat 9AM','2 Hours'),
(210,'Personal Training',110,'Flexible','1 Hour');

SELECT * FROM Classes;

-- Table 4: Memberships
CREATE TABLE Memberships (
  Membership_ID INT PRIMARY KEY,
  Member_ID INT,
  Plan VARCHAR(20),
  Start_Date DATE,
  End_Date DATE
);

INSERT INTO Memberships VALUES
(301,1,'Annual','2024-01-01','2025-01-01'),
(302,2,'Monthly','2024-01-10','2024-02-10'),
(303,3,'Quarterly','2024-01-05','2024-04-05'),
(304,4,'Monthly','2024-01-15','2024-02-15'),
(305,5,'Annual','2024-01-20','2025-01-20'),
(306,6,'Quarterly','2024-01-22','2024-04-22'),
(307,7,'Annual','2024-01-25','2025-01-25'),
(308,8,'Monthly','2024-01-28','2024-02-28'),
(309,9,'Annual','2024-01-30','2025-01-30'),
(310,10,'Quarterly','2024-02-01','2024-05-01');

SELECT * FROM Memberships;

-- Table 5: Payments
CREATE TABLE Payments (
  Payment_ID INT PRIMARY KEY,
  Member_ID INT,
  Amount DECIMAL(10,2),
  Payment_Date DATE,
  Payment_Method VARCHAR(20)
);

INSERT INTO Payments VALUES
(401,1,50000.00,'2024-01-01','Credit Card'),
(402,2,4000.00,'2024-01-10','UPI'),
(403,3,12000.00,'2024-01-05','Debit Card'),
(404,4,4000.00,'2024-01-15','Cash'),
(405,5,50000.00,'2024-01-20','Net Banking'),
(406,6,12000.00,'2024-01-22','Credit Card'),
(407,7,50000.00,'2024-01-25','UPI'),
(408,8,4000.00,'2024-01-28','Cash'),
(409,9,50000.00,'2024-01-30','Debit Card'),
(410,10,12000.00,'2024-02-01','Credit Card');

SELECT * FROM Payments;

-- Additional Operations
UPDATE Members SET Age=29 WHERE Member_ID=8;
DELETE FROM Classes WHERE Class_ID=206;
DROP TABLE Payments;
