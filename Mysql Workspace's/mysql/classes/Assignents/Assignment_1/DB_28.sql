-- ================================================
-- 🌐 SOCIAL MEDIA DATABASE
-- ================================================

CREATE DATABASE SocialMediaDB;
USE SocialMediaDB;

-- =================================================
-- Table 1: Users
-- Stores information about platform users
-- Attributes:
-- User_ID       : Unique ID for user (Primary Key)
-- Name          : User name
-- Email         : Email address
-- Username      : Unique username
-- Join_Date     : Date user joined
-- =================================================
CREATE TABLE Users (
  User_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(50),
  Username VARCHAR(30),
  Join_Date DATE
);

-- Sample data for Users
INSERT INTO Users VALUES
(1,'Riya Sharma','riya@gmail.com','riya123','2024-01-10'),
(2,'Amit Patel','amit@gmail.com','amit_p','2024-01-12'),
(3,'Sneha Gupta','sneha@gmail.com','sneha_g','2024-01-15'),
(4,'Rahul Verma','rahul@gmail.com','rahul_v','2024-01-18'),
(5,'Priya Singh','priya@gmail.com','priya_s','2024-01-20'),
(6,'Vikram Rao','vikram@gmail.com','vikram_r','2024-01-22'),
(7,'Nisha Mehta','nisha@gmail.com','nisha_m','2024-01-25'),
(8,'Arjun Das','arjun@gmail.com','arjun_d','2024-01-28'),
(9,'Kavita Joshi','kavita@gmail.com','kavita_j','2024-01-30'),
(10,'Rohit Nair','rohit@gmail.com','rohit_n','2024-02-01');

SELECT * FROM Users;

-- =================================================
-- Table 2: Posts
-- Stores posts made by users
-- Attributes:
-- Post_ID       : Unique ID for post (Primary Key)
-- User_ID       : Linked user (Foreign Key)
-- Content       : Text content of post
-- Post_Date     : Date of post
-- Likes         : Number of likes
-- =================================================
CREATE TABLE Posts (
  Post_ID INT PRIMARY KEY,
  User_ID INT,
  Content VARCHAR(255),
  Post_Date DATE,
  Likes INT
);

-- Sample data for Posts
INSERT INTO Posts VALUES
(101,1,'Hello world!','2024-01-11',25),
(102,2,'My first post','2024-01-12',30),
(103,3,'Enjoying the weather','2024-01-13',20),
(104,4,'Happy to join!','2024-01-14',15),
(105,5,'New blog post','2024-01-15',40),
(106,6,'Vacation photos','2024-01-16',50),
(107,7,'Foodie adventures','2024-01-17',35),
(108,8,'Workout routines','2024-01-18',45),
(109,9,'Travel plans','2024-01-19',38),
(110,10,'Tech tips','2024-01-20',42);

SELECT * FROM Posts;

-- =================================================
-- Table 3: Friends
-- Stores friendships between users
-- Attributes:
-- Friend_ID     : Unique ID for friendship (Primary Key)
-- User_ID       : User 1 (Foreign Key)
-- Friend_User_ID: User 2 (Foreign Key)
-- Status        : Friendship status (Accepted, Pending)
-- Since_Date    : Date friendship was established
-- =================================================
CREATE TABLE Friends (
  Friend_ID INT PRIMARY KEY,
  User_ID INT,
  Friend_User_ID INT,
  Status VARCHAR(20),
  Since_Date DATE
);

-- Sample data for Friends
INSERT INTO Friends VALUES
(201,1,2,'Accepted','2024-01-12'),
(202,1,3,'Accepted','2024-01-13'),
(203,2,4,'Pending','2024-01-14'),
(204,3,5,'Accepted','2024-01-15'),
(205,4,6,'Accepted','2024-01-16'),
(206,5,7,'Pending','2024-01-17'),
(207,6,8,'Accepted','2024-01-18'),
(208,7,9,'Accepted','2024-01-19'),
(209,8,10,'Pending','2024-01-20'),
(210,9,1,'Accepted','2024-01-21');

SELECT * FROM Friends;

-- =================================================
-- Table 4: Comments
-- Stores comments made on posts
-- Attributes:
-- Comment_ID    : Unique ID for comment (Primary Key)
-- Post_ID       : Linked post (Foreign Key)
-- User_ID       : User who commented (Foreign Key)
-- Comment_Text  : Text of the comment
-- Comment_Date  : Date of comment
-- =================================================
CREATE TABLE Comments (
  Comment_ID INT PRIMARY KEY,
  Post_ID INT,
  User_ID INT,
  Comment_Text VARCHAR(255),
  Comment_Date DATE
);

-- Sample data for Comments
INSERT INTO Comments VALUES
(301,101,2,'Nice post!','2024-01-12'),
(302,102,3,'Welcome!','2024-01-13'),
(303,103,4,'Agree!','2024-01-14'),
(304,104,5,'Great content','2024-01-15'),
(305,105,6,'Awesome!','2024-01-16'),
(306,106,7,'Love it','2024-01-17'),
(307,107,8,'Yummy!','2024-01-18'),
(308,108,9,'Good tips','2024-01-19'),
(309,109,10,'Excited!','2024-01-20'),
(310,110,1,'Thanks for sharing','2024-01-21');

SELECT * FROM Comments;

-- =================================================
-- Table 5: Messages
-- Stores private messages between users
-- Attributes:
-- Message_ID    : Unique ID for message (Primary Key)
-- Sender_ID     : Sender user ID (Foreign Key)
-- Receiver_ID   : Receiver user ID (Foreign Key)
-- Message_Text  : Text content
-- Sent_Date     : Date message sent
-- =================================================
CREATE TABLE Messages (
  Message_ID INT PRIMARY KEY,
  Sender_ID INT,
  Receiver_ID INT,
  Message_Text VARCHAR(255),
  Sent_Date DATE
);

-- Sample data for Messages
INSERT INTO Messages VALUES
(401,1,2,'Hi, how are you?','2024-01-12'),
(402,2,1,'I am good! You?','2024-01-12'),
(403,3,4,'Hey!','2024-01-13'),
(404,4,3,'Hello!','2024-01-13'),
(405,5,6,'Check this out','2024-01-14'),
(406,6,5,'Looks great','2024-01-14'),
(407,7,8,'Hi there','2024-01-15'),
(408,8,7,'Hello!','2024-01-15'),
(409,9,10,'Good morning','2024-01-16'),
(410,10,9,'Morning!','2024-01-16');

SELECT * FROM Messages;

-- =================================================
-- Additional Operations
-- =================================================
-- Update username
UPDATE Users SET Username='riya_sharma' WHERE User_ID=1;

-- Delete a post
DELETE FROM Posts WHERE Post_ID=104;

-- Drop a table example
-- DROP TABLE Comments;
