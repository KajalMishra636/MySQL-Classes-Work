-- ================================================
-- 🎬 MOVIE STREAMING DATABASE
-- ================================================

CREATE DATABASE MovieStreamingDB;
USE MovieStreamingDB;

-- Table 1: Users
CREATE TABLE Users (
  User_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(50),
  Subscription_Type VARCHAR(20),
  Join_Date DATE
);

INSERT INTO Users VALUES
(1,'Amit Sharma','amit@gmail.com','Premium','2024-01-10'),
(2,'Neha Verma','neha@gmail.com','Free','2024-01-12'),
(3,'Rohit Singh','rohit@gmail.com','Premium','2024-01-15'),
(4,'Priya Gupta','priya@gmail.com','Free','2024-01-18'),
(5,'Karan Mehta','karan@gmail.com','Premium','2024-01-20'),
(6,'Sanya Rao','sanya@gmail.com','Free','2024-01-22'),
(7,'Arjun Das','arjun@gmail.com','Premium','2024-01-25'),
(8,'Isha Jain','isha@gmail.com','Free','2024-01-28'),
(9,'Vikram Rao','vikram@gmail.com','Premium','2024-01-30'),
(10,'Anjali Kapoor','anjali@gmail.com','Free','2024-02-01');

SELECT * FROM Users;

-- Table 2: Movies
CREATE TABLE Movies (
  Movie_ID INT PRIMARY KEY,
  Title VARCHAR(100),
  Genre VARCHAR(30),
  Release_Year INT,
  Duration INT
);

INSERT INTO Movies VALUES
(101,'Inception','Sci-Fi',2010,148),
(102,'Avengers','Action',2012,143),
(103,'Titanic','Romance',1997,195),
(104,'Interstellar','Sci-Fi',2014,169),
(105,'Joker','Drama',2019,122),
(106,'Frozen','Animation',2013,102),
(107,'The Godfather','Crime',1972,175),
(108,'Parasite','Thriller',2019,132),
(109,'The Dark Knight','Action',2008,152),
(110,'La La Land','Musical',2016,128);

SELECT * FROM Movies;

-- Table 3: Watchlist
CREATE TABLE Watchlist (
  Watchlist_ID INT PRIMARY KEY,
  User_ID INT,
  Movie_ID INT,
  Added_Date DATE,
  Status VARCHAR(20)
);

INSERT INTO Watchlist VALUES
(201,1,101,'2024-01-10','Watching'),
(202,2,102,'2024-01-12','Completed'),
(203,3,103,'2024-01-15','Watching'),
(204,4,104,'2024-01-18','Pending'),
(205,5,105,'2024-01-20','Watching'),
(206,6,106,'2024-01-22','Completed'),
(207,7,107,'2024-01-25','Watching'),
(208,8,108,'2024-01-28','Pending'),
(209,9,109,'2024-01-30','Watching'),
(210,10,110,'2024-02-01','Completed');

SELECT * FROM Watchlist;

-- Table 4: Ratings
CREATE TABLE Ratings (
  Rating_ID INT PRIMARY KEY,
  User_ID INT,
  Movie_ID INT,
  Rating INT,
  Comments VARCHAR(255)
);

INSERT INTO Ratings VALUES
(301,1,101,5,'Amazing movie!'),
(302,2,102,4,'Good action scenes'),
(303,3,103,5,'Very emotional'),
(304,4,104,4,'Mind-blowing visuals'),
(305,5,105,5,'Excellent performance'),
(306,6,106,4,'Fun for kids'),
(307,7,107,5,'Classic crime movie'),
(308,8,108,5,'Excellent storytelling'),
(309,9,109,5,'Best Batman movie'),
(310,10,110,4,'Beautiful musical');

SELECT * FROM Ratings;

-- Table 5: Subscriptions
CREATE TABLE Subscriptions (
  Subscription_ID INT PRIMARY KEY,
  User_ID INT,
  Plan VARCHAR(20),
  Start_Date DATE,
  End_Date DATE
);

INSERT INTO Subscriptions VALUES
(401,1,'Annual','2024-01-01','2025-01-01'),
(402,2,'Monthly','2024-01-10','2024-02-10'),
(403,3,'Annual','2024-01-05','2025-01-05'),
(404,4,'Monthly','2024-01-15','2024-02-15'),
(405,5,'Annual','2024-01-20','2025-01-20'),
(406,6,'Monthly','2024-01-22','2024-02-22'),
(407,7,'Annual','2024-01-25','2025-01-25'),
(408,8,'Monthly','2024-01-28','2024-02-28'),
(409,9,'Annual','2024-01-30','2025-01-30'),
(410,10,'Monthly','2024-02-01','2024-03-01');

SELECT * FROM Subscriptions;

-- Additional Operations
UPDATE Users SET Subscription_Type='Premium' WHERE User_ID=4;
DELETE FROM Watchlist WHERE Watchlist_ID=208;
DROP TABLE Subscriptions;
