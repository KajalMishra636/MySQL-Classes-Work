-- ================================================
-- 🎵 MUSIC STREAMING DATABASE
-- ================================================

CREATE DATABASE MusicDB;
USE MusicDB;

-- Table 1: Users
CREATE TABLE Users (
  User_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(50),
  Subscription_Type VARCHAR(20),
  Join_Date DATE
);

INSERT INTO Users VALUES
(1,'Amit Sharma','amit@gmail.com','Premium','2024-01-01'),
(2,'Neha Verma','neha@gmail.com','Free','2024-01-05'),
(3,'Rohit Singh','rohit@gmail.com','Premium','2024-01-10'),
(4,'Priya Gupta','priya@gmail.com','Free','2024-01-15'),
(5,'Karan Mehta','karan@gmail.com','Premium','2024-01-20'),
(6,'Sanya Rao','sanya@gmail.com','Free','2024-01-25'),
(7,'Arjun Das','arjun@gmail.com','Premium','2024-02-01'),
(8,'Isha Jain','isha@gmail.com','Free','2024-02-05'),
(9,'Vikram Rao','vikram@gmail.com','Premium','2024-02-10'),
(10,'Anjali Kapoor','anjali@gmail.com','Free','2024-02-15');

SELECT * FROM Users;

-- Table 2: Artists
CREATE TABLE Artists (
  Artist_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Genre VARCHAR(30),
  Country VARCHAR(50),
  Followers INT
);

INSERT INTO Artists VALUES
(101,'Arijit Singh','Pop','India',1000000),
(102,'Taylor Swift','Pop','USA',2000000),
(103,'Adele','Soul','UK',1500000),
(104,'Shreya Ghoshal','Bollywood','India',1200000),
(105,'Ed Sheeran','Pop','UK',1800000),
(106,'Badshah','Hip-Hop','India',1100000),
(107,'Justin Bieber','Pop','Canada',1700000),
(108,'Neha Kakkar','Bollywood','India',1400000),
(109,'Drake','Hip-Hop','USA',1600000),
(110,'Coldplay','Rock','UK',1900000);

SELECT * FROM Artists;

-- Table 3: Songs
CREATE TABLE Songs (
  Song_ID INT PRIMARY KEY,
  Title VARCHAR(50),
  Artist_ID INT,
  Duration VARCHAR(10),
  Album VARCHAR(50)
);

INSERT INTO Songs VALUES
(201,'Shape of You',105,'4:24','Divide'),
(202,'Tum Hi Ho',101,'4:30','Aashiqui 2'),
(203,'Hello',103,'4:55','25'),
(204,'Love Story',102,'3:55','Fearless'),
(205,'Apna Time Aayega',106,'3:45','Gully Boy'),
(206,'Perfect',105,'4:23','Divide'),
(207,'Blinding Lights',109,'3:20','After Hours'),
(208,'Garmi',106,'3:40','Street Dancer 3D'),
(209,'Rolling in the Deep',103,'3:48','21'),
(210,'Viva La Vida',110,'4:02','Viva La Vida');

SELECT * FROM Songs;

-- Table 4: Playlists
CREATE TABLE Playlists (
  Playlist_ID INT PRIMARY KEY,
  User_ID INT,
  Playlist_Name VARCHAR(50),
  Created_Date DATE,
  Number_of_Songs INT
);

INSERT INTO Playlists VALUES
(301,1,'Workout Mix','2024-01-02',10),
(302,2,'Chill Vibes','2024-01-06',15),
(303,3,'Romantic Hits','2024-01-12',12),
(304,4,'Party Time','2024-01-18',20),
(305,5,'Bollywood Beats','2024-01-22',18),
(306,6,'Top Charts','2024-01-26',25),
(307,7,'Morning Motivation','2024-02-02',14),
(308,8,'Evening Relax','2024-02-06',16),
(309,9,'Road Trip','2024-02-12',22),
(310,10,'Throwback','2024-02-15',19);

SELECT * FROM Playlists;

-- Table 5: Subscriptions
CREATE TABLE Subscriptions (
  Subscription_ID INT PRIMARY KEY,
  User_ID INT,
  Plan VARCHAR(20),
  Start_Date DATE,
  End_Date DATE
);

INSERT INTO Subscriptions VALUES
(401,1,'Premium','2024-01-01','2025-01-01'),
(402,2,'Free','2024-01-05','2024-07-05'),
(403,3,'Premium','2024-01-10','2025-01-10'),
(404,4,'Free','2024-01-15','2024-07-15'),
(405,5,'Premium','2024-01-20','2025-01-20'),
(406,6,'Free','2024-01-25','2024-07-25'),
(407,7,'Premium','2024-02-01','2025-02-01'),
(408,8,'Free','2024-02-05','2024-08-05'),
(409,9,'Premium','2024-02-10','2025-02-10'),
(410,10,'Free','2024-02-15','2024-08-15');

SELECT * FROM Subscriptions;

-- Additional Operations
UPDATE Songs SET Duration='4:30' WHERE Song_ID=206;
DELETE FROM Playlists WHERE Playlist_ID=308;
DROP TABLE Subscriptions;
