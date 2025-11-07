



-- This script is self-contained and tested for the provided schema.

-- ============================================= CREATE DATABASE HELLO VEGAN !!  =======================================================================================
CREATE DATABASE HELLO_VEGAN;

--  ================== USE HELLO_VEGAN !!! ====================
USE HELLO_VEGAN;
--  ========================================================== CREATE TABLE 1. USERS   =======================================================================
-- 1. USERS TABLE 
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    phone VARCHAR(15),
    role VARCHAR(30),
    gender VARCHAR(10),
    date_of_birth DATE,
    status VARCHAR(20),
    created_at DATETIME
);

-- ==============================================INSERT INTO USER VALUES =======================================================================================


INSERT INTO users (full_name, email, password, phone, role, gender, date_of_birth, status, created_at)
VALUES
('Kajal Mishra', 'kajal@hellovegan.com', 'kajal123', '9876543210', 'Customer', 'Female', '1999-06-12', 'Active', '2025-01-05 10:20:00'),
('Shalini Verma', 'shalini@hellovegan.com', 'shalini456', '8765432109', 'Admin', 'Female', '1995-02-10', 'Active', '2025-02-12 09:15:00'),
('Amit Patel', 'amit@hv.com', 'amit789', '9658741230', 'Customer', 'Male', '1998-11-05', 'Active', '2025-03-01 14:25:00'),
('Riya Shah', 'riya@hv.com', 'riya321', '9988776655', 'Customer', 'Female', '2000-08-22', 'Inactive', '2025-03-10 18:45:00'),
('Neha Joshi', 'neha@hv.com', 'neha999', '9123456789', 'Doctor', 'Female', '1990-04-30', 'Active', '2025-03-25 11:00:00'),
('Ankit Rao', 'ankit@hv.com', 'ankit654', '9345678901', 'Customer', 'Male', '1996-07-19', 'Active', '2025-04-02 12:40:00'),
('Priya Deshmukh', 'priya@hv.com', 'priya852', '9765432109', 'Counselor', 'Female', '1997-09-17', 'Active', '2025-04-12 13:15:00'),
('Rohan Gupta', 'rohan@hv.com', 'rohan963', '9098765432', 'Customer', 'Male', '1999-03-14', 'Active', '2025-04-22 17:30:00'),
('Divya Menon', 'divya@hv.com', 'divya741', '9823456712', 'Customer', 'Female', '1995-10-11', 'Active', '2025-05-01 09:50:00'),
('Varun Singh', 'varun@hv.com', 'varun258', '9876123450', 'Doctor', 'Male', '1991-12-27', 'Active', '2025-05-09 10:05:00'),
('Sana Ali', 'sana@hv.com', 'sana147', '9532678410', 'Customer', 'Female', '1998-01-16', 'Active', '2025-05-19 15:00:00'),
('Kiran Jain', 'kiran@hv.com', 'kiran369', '9087123456', 'Admin', 'Male', '1993-11-30', 'Active', '2025-05-28 10:45:00'),
('Mitali Roy', 'mitali@hv.com', 'mitali159', '9654231780', 'Customer', 'Female', '1999-09-09', 'Inactive', '2025-06-01 16:20:00'),
('Nikhil Kumar', 'nikhil@hv.com', 'nikhil753', '9456123789', 'Customer', 'Male', '1997-05-05', 'Active', '2025-06-10 12:00:00'),
('Tina Kapoor', 'tina@hv.com', 'tina951', '9988998877', 'Customer', 'Female', '1998-02-20', 'Active', '2025-06-21 08:30:00'),
('Ravi Mehta', 'ravi@hv.com', 'ravi357', '9012345678', 'Counselor', 'Male', '1992-10-18', 'Active', '2025-07-02 11:50:00'),
('Arjun Chopra', 'arjun@hv.com', 'arjun789', '9023456781', 'Customer', 'Male', '1996-03-03', 'Active', '2025-07-11 13:40:00'),
('Sneha Iyer', 'sneha@hv.com', 'sneha654', '9123456123', 'Customer', 'Female', '1999-08-15', 'Active', '2025-07-25 17:25:00'),
('Pooja Naik', 'pooja@hv.com', 'pooja951', '9234567890', 'Doctor', 'Female', '1993-01-09', 'Active', '2025-08-05 14:55:00'),
('Karan Desai', 'karan@hv.com', 'karan111', '9345678909', 'Customer', 'Male', '1997-06-27', 'Active', '2025-08-15 10:10:00');

-- ========================================================== QUERIES ===========================================================================================

 SELECT * FROM  users ;   -- select all data from the users 

DROP TABLE users;          -- drop the table 

-- 1. DDL: Alter table to add a new column
ALTER TABLE users ADD COLUMN last_login DATETIME NULL;

-- 2. DDL: Alter table to add a foreign key with ON DELETE CASCADE 
ALTER TABLE users ADD CONSTRAINT fk_users_referrer FOREIGN KEY (rederral_code) 
REFERENCES users(user_id) ON DELETE CASCADE;

-- 3. DDL: Alter table to modify a column 
ALTER TABLE  users MODIFY COLUMN phone VARCHAR(20);

-- 4. DDL : Truncate table to reset data 
 truncate table  users;   -- delete the records from the table 
 
 -- 5. DDL :Drop a column 
 ALTER TABLE users DROP COLUMN loyalty_points;
 
 -- 6. DML :  Insert a new record 
 INSERT INTO users (full_name, email, password, phone, role) VALUES ('NEW User','newuser@hellovegan.com', 'password', '1234567890','Customer');
 
 -- 7 DML : Update record using arithmetic operator(+)
 UPDATE users 
 SET created_at = created_at + 100 WHERE created_at = '2025-04-22 17:30:00';
 
 -- 8 DML: Delete record using logical; operator (AND)
 DELETE FROM users WHERE status = 'Inactive' AND role ='Customer';
 
 -- 9. DML : Insert miltiple records 
 INSERT INTO users (full_name, email, password, role) VALUES ('U');
 -- 
 
 -- 1️⃣ JOINS

-- Different join types are used to combine related data across multiple tables.

-- INNER JOIN
-- 🔹 Find all students with their enrolled courses
SELECT s.name AS StudentName, c.course AS CourseName
FROM students s
INNER JOIN courses c ON s.course = c.course_id;

-- LEFT JOIN
-- 🔹 Show all students and their assigned mentors (if any)
SELECT s.name, t.teacher_name
FROM students s
LEFT JOIN teachers t ON s.teacher_id = t.teacher_id
WHERE t.teacher_id IS NULL;

-- RIGHT JOIN
-- 🔹 Show all teachers and the students they mentor (include teachers with no students)
SELECT t.teacher_name, s.name AS StudentName
FROM students s
RIGHT JOIN teachers t ON s.teacher_id = t.teacher_id;

-- FULL JOIN (if supported)
-- 🔹 Combine all students and teachers data
SELECT s.name AS StudentName, t.teacher_name
FROM students s
FULL JOIN teachers t ON s.teacher_id = t.teacher_id;

-- SELF JOIN
-- 🔹 Find students having the same course
SELECT s1.name AS Student1, s2.name AS Student2, s1.course
FROM students s1
INNER JOIN students s2 ON s1.course = s2.course AND s1.id <> s2.id;

-- CROSS JOIN
-- 🔹 Generate all possible combinations of courses and departments
SELECT c.course_name, d.dept_name
FROM courses c
CROSS JOIN departments d;

-- 2️⃣ SUBQUERIES
-- Scalar Subquery
-- 🔹 Find students who scored above the average marks
SELECT name, marks
FROM students
WHERE marks > (SELECT AVG(marks) FROM students);

-- Correlated Subquery
-- 🔹 Find students whose marks are greater than the average marks of their course
SELECT s.name, s.marks, s.course
FROM students s
WHERE marks > (
  SELECT AVG(marks) FROM students WHERE course = s.course
);

-- Subquery with IN
-- 🔹 List students enrolled in Science or Commerce streams
SELECT name, course
FROM students
WHERE course IN (
  SELECT course_name FROM courses WHERE stream IN ('Science', 'Commerce')
);

-- Subquery with EXISTS
-- 🔹 Find teachers who have at least one student assigned
SELECT t.teacher_name
FROM teachers t
WHERE EXISTS (
  SELECT 1 FROM students s WHERE s.teacher_id = t.teacher_id
);

-- Subquery in FROM
-- 🔹 Find top 3 highest scoring students using subquery in FROM
SELECT name, marks
FROM (
  SELECT name, marks FROM students ORDER BY marks DESC LIMIT 3
) AS top_students;

-- 3️⃣ FUNCTIONS
-- Built-in String Functions
-- 🔹 Convert student names to uppercase
SELECT UPPER(name) AS UpperName FROM students;

-- 🔹 Concatenate student name with course
SELECT CONCAT(name, ' - ', course) AS StudentCourse FROM students;

-- 🔹 Extract substring from course name
SELECT SUBSTRING(course, 1, 4) AS ShortCourse FROM students;

-- Built-in Numeric Functions
-- 🔹 Round student marks
SELECT name, ROUND(marks, 2) AS RoundedMarks FROM students;

-- 🔹 Find ceiling and floor values
SELECT CEIL(marks) AS CeilMarks, FLOOR(marks) AS FloorMarks FROM students;

-- Built-in Date/Time Functions
-- 🔹 Display current date and time
SELECT NOW() AS CurrentDateTime;

-- 🔹 Calculate days since admission
SELECT name, DATEDIFF(CURDATE(), admission_date) AS DaysSinceAdmission FROM students;

-- Aggregate Functions
-- 🔹 Find total students per course
SELECT course, COUNT(*) AS TotalStudents FROM students GROUP BY course;

-- 🔹 Find average marks of students
SELECT AVG(marks) AS AverageMarks FROM students;

-- 4️⃣ USER-DEFINED FUNCTIONS (UDFs)
-- 1. Calculate Annual Salary
DELIMITER //
CREATE FUNCTION GetAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  RETURN monthly_salary * 12;
END //
DELIMITER ;

-- 🔹 Usage
SELECT teacher_name, GetAnnualSalary(salary) AS AnnualSalary FROM teachers;

-- 2. Calculate Grade Based on Marks
DELIMITER //
CREATE FUNCTION GetGrade(marks INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  DECLARE grade VARCHAR(10);
  IF marks >= 90 THEN SET grade = 'A+';
  ELSEIF marks >= 75 THEN SET grade = 'A';
  ELSEIF marks >= 60 THEN SET grade = 'B';
  ELSEIF marks >= 40 THEN SET grade = 'C';
  ELSE SET grade = 'F';
  END IF;
  RETURN grade;
END //
DELIMITER ;

-- 🔹 Usage
SELECT name, marks, GetGrade(marks) AS Grade FROM students;

-- 3. Calculate Total Fees After Discount
DELIMITER //
CREATE FUNCTION GetTotalFees(fees DECIMAL(10,2), discount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN fees - (fees * discount / 100);
END //
DELIMITER ;

-- 🔹 Usage
SELECT name, GetTotalFees(fees, 10) AS FinalFees FROM students;

-- 4. Calculate Student Age
DELIMITER //
CREATE FUNCTION GetAge(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN YEAR(CURDATE()) - YEAR(dob);
END //
DELIMITER ;

-- 🔹 Usage
SELECT name, GetAge(dob) AS Age FROM students;

-- 5. Calculate Result Status
DELIMITER //
CREATE FUNCTION GetResult(marks INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  RETURN (CASE WHEN marks >= 40 THEN 'Pass' ELSE 'Fail' END);
END //
DELIMITER ;

-- 🔹 Usage
SELECT name, marks, GetResult(marks) AS ResultStatus FROM students;

-- Table 1: users
-- 1. Views (4 Queries)

-- Simple view for active users
CREATE VIEW ActiveUsers AS
SELECT user_id, full_name, email, role
FROM users
WHERE status = 'Active';

-- Complex view with join and aggregation: User roles with count
CREATE VIEW UserRolesSummary AS
SELECT u.role, COUNT(u.user_id) AS total_users, AVG(YEAR(CURDATE()) - YEAR(u.date_of_birth)) AS avg_age
FROM users u
GROUP BY u.role;

-- View for users with profiles (join)
CREATE VIEW UsersWithProfiles AS
SELECT u.full_name, u.email, p.city, p.bio
FROM users u
INNER JOIN user_profiles p ON u.user_id = p.user_id;

-- View for inactive users filtered by role
CREATE VIEW InactiveCustomers AS
SELECT user_id, full_name, email
FROM users
WHERE status = 'Inactive' AND role = 'Customer';

-- 2. Cursors (3 Queries)

-- Cursor to process and display user names one by one
DELIMITER //
CREATE PROCEDURE ProcessUsers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_name VARCHAR(100);
    DECLARE user_cursor CURSOR FOR SELECT full_name FROM users;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN user_cursor;
    read_loop: LOOP
        FETCH user_cursor INTO user_name;
        IF done THEN LEAVE read_loop; END IF;
        SELECT CONCAT('Processing user: ', user_name) AS message;
    END LOOP;
    CLOSE user_cursor;
END //
DELIMITER ;
-- Usage: CALL ProcessUsers();

-- Cursor to update user status row-by-row
DELIMITER //
CREATE PROCEDURE UpdateUserStatus()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE uid INT;
    DECLARE user_cursor CURSOR FOR SELECT user_id FROM users WHERE status = 'Inactive';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN user_cursor;
    update_loop: LOOP
        FETCH user_cursor INTO uid;
        IF done THEN LEAVE update_loop; END IF;
        UPDATE users SET status = 'Active' WHERE user_id = uid;
    END LOOP;
    CLOSE user_cursor;
END //
DELIMITER ;
-- Usage: CALL UpdateUserStatus();

-- Cursor to calculate and display user age
DELIMITER //
CREATE PROCEDURE CalculateUserAges()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE uname VARCHAR(100), dob DATE;
    DECLARE age_cursor CURSOR FOR SELECT full_name, date_of_birth FROM users;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN age_cursor;
    age_loop: LOOP
        FETCH age_cursor INTO uname, dob;
        IF done THEN LEAVE age_loop; END IF;
        SELECT uname, YEAR(CURDATE()) - YEAR(dob) AS age;
    END LOOP;
    CLOSE age_cursor;
END //
DELIMITER ;
-- Usage: CALL CalculateUserAges();
-- 3. Stored Procedures (4 Queries)

-- Procedure to add a new user
DELIMITER //
CREATE PROCEDURE AddUser(IN fname VARCHAR(100), IN eml VARCHAR(100), IN pwd VARCHAR(255), IN rol VARCHAR(30))
BEGIN
    INSERT INTO users (full_name, email, password, role, status, created_at)
    VALUES (fname, eml, pwd, rol, 'Active', NOW());
END //
DELIMITER ;
-- Usage: CALL AddUser('New User', 'new@example.com', 'pass123', 'Customer');

-- Procedure to update user role
DELIMITER //
CREATE PROCEDURE UpdateUserRole(IN uid INT, IN new_role VARCHAR(30))
BEGIN
    UPDATE users SET role = new_role WHERE user_id = uid;
END //
DELIMITER ;
-- Usage: CALL UpdateUserRole(1, 'Admin');

-- Procedure to delete inactive users
DELIMITER //
CREATE PROCEDURE DeleteInactiveUsers()
BEGIN
    DELETE FROM users WHERE status = 'Inactive';
END //
DELIMITER ;
-- Usage: CALL DeleteInactiveUsers();

-- Procedure to get user count by role
DELIMITER //
CREATE PROCEDURE GetUserCountByRole(IN rol VARCHAR(30), OUT cnt INT)
BEGIN
    SELECT COUNT(*) INTO cnt FROM users WHERE role = rol;
END //
DELIMITER ;
-- Usage: CALL GetUserCountByRole('Customer', @count); SELECT @count;
-- 4. Window Functions (3 Queries)

-- Rank users by creation date
SELECT user_id, full_name, created_at,
       ROW_NUMBER() OVER (ORDER BY created_at) AS row_num
FROM users;

-- Rank users by age within role
SELECT user_id, full_name, role, YEAR(CURDATE()) - YEAR(date_of_birth) AS age,
       RANK() OVER (PARTITION BY role ORDER BY age DESC) AS age_rank
FROM users;

-- Lead function to show next user in creation order
SELECT user_id, full_name, created_at,
       LEAD(full_name) OVER (ORDER BY created_at) AS next_user
FROM users;
-- 5. DCL/TCL (3 Queries)

-- DCL: Grant select permission on users table
GRANT SELECT ON users TO user1;

-- DCL: Revoke insert permission
REVOKE INSERT ON users FROM user1;

-- TCL: Transaction for updating user status
START TRANSACTION;
UPDATE users SET status = 'Inactive' WHERE user_id = 1;
SAVEPOINT sp1;
UPDATE users SET status = 'Active' WHERE user_id = 2;
ROLLBACK TO sp1;  -- Rollback to savepoint
COMMIT;

-- 6. Triggers (3 Queries)

-- AFTER INSERT: Log new user creation
DELIMITER //
CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (NEW.user_id, 'INSERT', 'users', NEW.user_id, 'New user added', NOW());
END //
DELIMITER ;

-- BEFORE UPDATE: Prevent role change for admins
DELIMITER //
CREATE TRIGGER before_user_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.role = 'Admin' AND NEW.role != 'Admin' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot change admin role';
    END IF;
END //
DELIMITER ;

-- AFTER DELETE: Log user deletion
DELIMITER //
CREATE TRIGGER after_user_delete
AFTER DELETE ON users
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (OLD.user_id, 'DELETE', 'users', OLD.user_id, 'User deleted', NOW());
END //
DELIMITER ;

--  ===================================================== CREATE  TABLE 2. USER_PROFILES  =========================================================================
--  CREATE TABLE user_profiles   

CREATE TABLE user_profiles (
    profile_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(10),
    profile_pic VARCHAR(255),
    bio TEXT,
    updated_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ======================================================= INSERT INTO user_profiles =================================================================================

INSERT INTO user_profiles (user_id, address, city, state, country, postal_code, profile_pic, bio, updated_at)
VALUES
(1, '12 Green Street', 'Mumbai', 'Maharashtra', 'India', '400001', 'img/profile1.jpg', 'Eco-lover and vegan lifestyle enthusiast.', '2025-03-05 10:15:00'),
(2, '45 Eco Lane', 'Pune', 'Maharashtra', 'India', '411001', 'img/profile2.jpg', 'Admin and mentor promoting plant-based living.', '2025-03-10 12:00:00'),
(3, '22 Vegan Road', 'Delhi', 'Delhi', 'India', '110001', 'img/profile3.jpg', 'Fitness freak who believes in cruelty-free diets.', '2025-03-15 09:30:00'),
(4, '5 Herbal Avenue', 'Kolkata', 'West Bengal', 'India', '700001', 'img/profile4.jpg', 'Baker experimenting with vegan desserts.', '2025-03-20 14:45:00'),
(5, '9 Wellness Street', 'Bangalore', 'Karnataka', 'India', '560001', 'img/profile5.jpg', 'Doctor advocating vegan nutrition and health.', '2025-03-25 16:10:00'),
(6, '21 Nature Road', 'Chennai', 'Tamil Nadu', 'India', '600001', 'img/profile6.jpg', 'Traveler who documents vegan-friendly places.', '2025-04-01 11:00:00'),
(7, '15 Organic Lane', 'Hyderabad', 'Telangana', 'India', '500001', 'img/profile7.jpg', 'Counselor helping people switch to vegan diets.', '2025-04-05 13:20:00'),
(8, '16 Eco Park', 'Pune', 'Maharashtra', 'India', '411045', 'img/profile8.jpg', 'Nature lover who supports sustainable products.', '2025-04-10 10:50:00'),
(9, '18 Leafy Street', 'Kochi', 'Kerala', 'India', '682001', 'img/profile9.jpg', 'Food blogger sharing vegan recipes daily.', '2025-04-12 17:15:00'),
(10, '7 Plant Lane', 'Indore', 'Madhya Pradesh', 'India', '452001', 'img/profile10.jpg', 'Doctor promoting holistic and vegan lifestyles.', '2025-04-20 15:35:00'),
(11, '9 Green Villa', 'Lucknow', 'Uttar Pradesh', 'India', '226001', 'img/profile11.jpg', 'Vegan skincare enthusiast and product reviewer.', '2025-04-25 09:10:00'),
(12, '31 Bloom Street', 'Surat', 'Gujarat', 'India', '395001', 'img/profile12.jpg', 'Admin managing Hello Vegan community forum.', '2025-05-01 11:25:00'),
(13, '56 Vegan Plaza', 'Patna', 'Bihar', 'India', '800001', 'img/profile13.jpg', 'Student learning about sustainable living.', '2025-05-05 16:45:00'),
(14, '32 Earth Lane', 'Bhopal', 'Madhya Pradesh', 'India', '462001', 'img/profile14.jpg', 'Fitness coach focusing on plant-based diets.', '2025-05-09 10:00:00'),
(15, '1 Plantbase Road', 'Nagpur', 'Maharashtra', 'India', '440001', 'img/profile15.jpg', 'Nutritionist passionate about vegan awareness.', '2025-05-15 14:10:00'),
(16, '8 Fresh Street', 'Ahmedabad', 'Gujarat', 'India', '380001', 'img/profile16.jpg', 'Counselor helping families adapt vegan lifestyles.', '2025-05-20 13:55:00'),
(17, '20 Eco Street', 'Delhi', 'Delhi', 'India', '110002', 'img/profile17.jpg', 'Entrepreneur building vegan-friendly products.', '2025-05-25 11:45:00'),
(18, '2 Organic Road', 'Mumbai', 'Maharashtra', 'India', '400002', 'img/profile18.jpg', 'Photographer capturing vegan food stories.', '2025-06-01 09:20:00'),
(19, '3 Wellness Lane', 'Chennai', 'Tamil Nadu', 'India', '600002', 'img/profile19.jpg', 'Doctor specializing in vegan nutrition therapy.', '2025-06-10 10:35:00'),
(20, '11 Vegan Road', 'Goa', 'Goa', 'India', '403001', 'img/profile20.jpg', 'Beach lover advocating eco-conscious lifestyle.', '2025-06-20 12:00:00');


-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM user_profiles;

truncate table  user_profiles;

drop TABLE user_profiles;

-- 🧩 1️⃣ APPLY JOINS

-- (Assuming users table exists with fields like user_id, username, email)

-- 🔹 INNER JOIN: Combine users with their profiles
SELECT u.username, u.email, p.city, p.state
FROM users u
INNER JOIN user_profiles p ON u.user_id = p.user_id;

-- 🔹 LEFT JOIN: Show all users even if they don’t have profiles
SELECT u.username, p.city
FROM users u
LEFT JOIN user_profiles p ON u.user_id = p.user_id
WHERE p.user_id IS NULL;

-- 🔹 RIGHT JOIN: Show all profiles, even without users (if possible)
SELECT p.city, u.username
FROM users u
RIGHT JOIN user_profiles p ON u.user_id = p.user_id;

-- 🔹 SELF JOIN: Compare profiles from same city
SELECT a.city, a.user_id AS UserA, b.user_id AS UserB
FROM user_profiles a
INNER JOIN user_profiles b ON a.city = b.city AND a.user_id <> b.user_id;

-- 🔹 CROSS JOIN: All possible combinations of users and profiles
SELECT u.username, p.city FROM users u CROSS JOIN user_profiles p;

-- 🧮 2️⃣ SUBQUERIES
-- 🔹 Scalar Subquery: Find profiles updated after the latest profile in Pune
SELECT * FROM user_profiles
WHERE updated_at > (SELECT MAX(updated_at) FROM user_profiles WHERE city = 'Pune');

-- 🔹 Correlated Subquery: Find profiles whose postal_code appears more than once
SELECT city, postal_code
FROM user_profiles p1
WHERE EXISTS (
  SELECT 1 FROM user_profiles p2
  WHERE p1.postal_code = p2.postal_code AND p1.profile_id <> p2.profile_id
);

-- 🔹 IN Subquery: Profiles located in cities where doctors live
SELECT * FROM user_profiles
WHERE city IN (
  SELECT city FROM user_profiles WHERE bio LIKE '%Doctor%'
);

-- 🔹 EXISTS Subquery: Users having a related profile
SELECT user_id FROM users u
WHERE EXISTS (SELECT 1 FROM user_profiles p WHERE u.user_id = p.user_id);

-- ⚙️ 3️⃣ FUNCTIONS
-- 🔹 Built-in String Functions
SELECT UPPER(city) AS CityCaps FROM user_profiles;
SELECT CONCAT(city, ', ', state) AS FullLocation FROM user_profiles;
SELECT SUBSTRING(address, 1, 10) AS ShortAddress FROM user_profiles;

-- 🔹 Built-in Numeric Functions
SELECT LENGTH(address) AS AddressLength FROM user_profiles;
SELECT CEIL(profile_id/2) AS HalfGroup FROM user_profiles;

-- 🔹 Date Functions
SELECT YEAR(updated_at) AS UpdateYear, MONTH(updated_at) AS UpdateMonth FROM user_profiles;
SELECT DATEDIFF(CURDATE(), updated_at) AS DaysSinceUpdate FROM user_profiles;

-- 🔹 Aggregate Functions
SELECT city, COUNT(*) AS TotalProfiles FROM user_profiles GROUP BY city;
SELECT state, MAX(updated_at) AS LastUpdated FROM user_profiles GROUP BY state;

-- 🧠 4️⃣ USER-DEFINED FUNCTIONS (UDFs)
-- 🔹 Function 1: Get short profile description
DELIMITER //
CREATE FUNCTION GetShortBio(bio TEXT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN SUBSTRING(bio, 1, 50);
END //
DELIMITER ;

SELECT user_id, GetShortBio(bio) AS ShortBio FROM user_profiles;

-- 🔹 Function 2: Calculate profile age in days
DELIMITER //
CREATE FUNCTION GetProfileAge(updated DATETIME)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN DATEDIFF(CURDATE(), updated);
END //
DELIMITER ;

SELECT user_id, GetProfileAge(updated_at) AS ProfileAgeDays FROM user_profiles;

-- 🔹 Function 3: Format location
DELIMITER //
CREATE FUNCTION GetFullLocation(city VARCHAR(50), state VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  RETURN CONCAT(city, ', ', state);
END //
DELIMITER ;

SELECT user_id, GetFullLocation(city, state) AS Location FROM user_profiles;

-- 🔹 Function 4: Country abbreviation
DELIMITER //
CREATE FUNCTION GetCountryCode(country VARCHAR(50))
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
  RETURN UPPER(LEFT(country, 3));
END //
DELIMITER ;

SELECT user_id, GetCountryCode(country) AS CountryCode FROM user_profiles;

-- 🔹 Function 5: Bio length category
DELIMITER //
CREATE FUNCTION GetBioCategory(bio TEXT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  DECLARE category VARCHAR(20);
  IF LENGTH(bio) < 30 THEN SET category = 'Short';
  ELSEIF LENGTH(bio) < 80 THEN SET category = 'Medium';
  ELSE SET category = 'Long';
  END IF;
  RETURN category;
END //
DELIMITER ;

SELECT user_id, GetBioCategory(bio) AS BioLength FROM user_profiles;

-- 1. Views (4 Queries)

-- Simple view for profiles in Maharashtra state
CREATE VIEW MaharashtraProfiles AS
SELECT profile_id, user_id, city, bio
FROM user_profiles
WHERE state = 'Maharashtra';

-- Complex view with join and aggregation: Profiles with user details and city count
CREATE VIEW ProfilesWithUsers AS
SELECT p.profile_id, u.full_name, u.email, p.city, COUNT(*) OVER (PARTITION BY p.city) AS city_profile_count
FROM user_profiles p
INNER JOIN users u ON p.user_id = u.user_id;

-- View for profiles with bio length > 50 characters
CREATE VIEW LongBioProfiles AS
SELECT profile_id, user_id, bio, LENGTH(bio) AS bio_length
FROM user_profiles
WHERE LENGTH(bio) > 50;

-- View for recently updated profiles (last 30 days)
CREATE VIEW RecentlyUpdatedProfiles AS
SELECT profile_id, user_id, updated_at
FROM user_profiles
WHERE updated_at >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- 2. Cursors (3 Queries)

-- Cursor to process and display profile cities one by one
DELIMITER //
CREATE PROCEDURE ProcessProfileCities()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE city_name VARCHAR(50);
    DECLARE city_cursor CURSOR FOR SELECT city FROM user_profiles;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN city_cursor;
    read_loop: LOOP
        FETCH city_cursor INTO city_name;
        IF done THEN LEAVE read_loop; END IF;
        SELECT CONCAT('Processing city: ', city_name) AS message;
    END LOOP;
    CLOSE city_cursor;
END //
DELIMITER ;
-- Usage: CALL ProcessProfileCities();

-- Cursor to update bio for profiles in Delhi
DELIMITER //
CREATE PROCEDURE UpdateDelhiBios()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pid INT;
    DECLARE delhi_cursor CURSOR FOR SELECT profile_id FROM user_profiles WHERE city = 'Delhi';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN delhi_cursor;
    update_loop: LOOP
        FETCH delhi_cursor INTO pid;
        IF done THEN LEAVE update_loop; END IF;
        UPDATE user_profiles SET bio = CONCAT(bio, ' (Updated via cursor)') WHERE profile_id = pid;
    END LOOP;
    CLOSE delhi_cursor;
END //
DELIMITER ;
-- Usage: CALL UpdateDelhiBios();

-- Cursor to calculate and display profile age (days since update)
DELIMITER //
CREATE PROCEDURE CalculateProfileAges()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pid INT, upd DATETIME;
    DECLARE age_cursor CURSOR FOR SELECT profile_id, updated_at FROM user_profiles;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN age_cursor;
    age_loop: LOOP
        FETCH age_cursor INTO pid, upd;
        IF done THEN LEAVE age_loop; END IF;
        SELECT pid, DATEDIFF(NOW(), upd) AS days_since_update;
    END LOOP;
    CLOSE age_cursor;
END //
DELIMITER ;
-- Usage: CALL CalculateProfileAges();
-- 3. Stored Procedures (4 Queries)

-- Procedure to add a new profile
DELIMITER //
CREATE PROCEDURE AddProfile(IN uid INT, IN addr VARCHAR(255), IN cty VARCHAR(50), IN bio_text TEXT)
BEGIN
    INSERT INTO user_profiles (user_id, address, city, state, country, postal_code, bio, updated_at)
    VALUES (uid, addr, cty, 'Maharashtra', 'India', '400001', bio_text, NOW());
END //
DELIMITER ;
-- Usage: CALL AddProfile(21, 'New Address', 'Mumbai', 'New bio text');

-- Procedure to update profile address
DELIMITER //
CREATE PROCEDURE UpdateProfileAddress(IN pid INT, IN new_addr VARCHAR(255))
BEGIN
    UPDATE user_profiles SET address = new_addr, updated_at = NOW() WHERE profile_id = pid;
END //
DELIMITER ;
-- Usage: CALL UpdateProfileAddress(1, 'Updated Address');

-- Procedure to delete profiles with empty bio
DELIMITER //
CREATE PROCEDURE DeleteEmptyBioProfiles()
BEGIN
    DELETE FROM user_profiles WHERE bio IS NULL OR bio = '';
END //
DELIMITER ;
-- Usage: CALL DeleteEmptyBioProfiles();

-- Procedure to get profile count by city
DELIMITER //
CREATE PROCEDURE GetProfileCountByCity(IN cty VARCHAR(50), OUT cnt INT)
BEGIN
    SELECT COUNT(*) INTO cnt FROM user_profiles WHERE city = cty;
END //
DELIMITER ;
-- Usage: CALL GetProfileCountByCity('Mumbai', @count); SELECT @count;
-- 4. Window Functions (3 Queries)

-- Row number profiles by updated_at
SELECT profile_id, user_id, updated_at,
       ROW_NUMBER() OVER (ORDER BY updated_at DESC) AS row_num
FROM user_profiles;

-- Rank profiles by bio length within city
SELECT profile_id, city, LENGTH(bio) AS bio_len,
       RANK() OVER (PARTITION BY city ORDER BY LENGTH(bio) DESC) AS bio_rank
FROM user_profiles;

-- Lead function to show next profile in update order
SELECT profile_id, user_id, updated_at,
       LEAD(city) OVER (ORDER BY updated_at) AS next_city
FROM user_profiles;
-- 5. DCL/TCL (3 Queries)

-- DCL: Grant select permission on user_profiles table
GRANT SELECT ON user_profiles TO user1;

-- DCL: Revoke update permission
REVOKE UPDATE ON user_profiles FROM user1;

-- TCL: Transaction for updating profile bio
START TRANSACTION;
UPDATE user_profiles SET bio = 'Updated bio' WHERE profile_id = 1;
SAVEPOINT sp1;
UPDATE user_profiles SET updated_at = NOW() WHERE profile_id = 2;
ROLLBACK TO sp1;  -- Rollback to savepoint
COMMIT;
-- 6. Triggers (3 Queries)

-- AFTER INSERT: Log new profile creation in audit_logs
DELIMITER //
CREATE TRIGGER after_profile_insert
AFTER INSERT ON user_profiles
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (NEW.user_id, 'INSERT', 'user_profiles', NEW.profile_id, 'New profile added', NOW());
END //
DELIMITER ;

-- BEFORE UPDATE: Prevent bio update if length < 10
DELIMITER //
CREATE TRIGGER before_profile_update
BEFORE UPDATE ON user_profiles
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.bio) < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Bio must be at least 10 characters';
    END IF;
END //
DELIMITER ;

-- AFTER DELETE: Log profile deletion
DELIMITER //
CREATE TRIGGER after_profile_delete
AFTER DELETE ON user_profiles
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (OLD.user_id, 'DELETE', 'user_profiles', OLD.profile_id, 'Profile deleted', NOW());
END //
DELIMITER ;
-- =========================================================================================================
-- 💚 HELLO VEGAN PROJECT
-- 📄 PROJECT SUBMISSION PHASE-3
-- 🧩 TABLE 3: user_roles
-- =========================================================================================================

/*
=============================================================
PROJECT SUBMISSION PHASE-3 DOCUMENTATION
=============================================================

⏳ Late Submission Penalty:
100 points will be deducted for late submissions.

🔰 Objective:
Phase-3 emphasizes complex data retrieval and function implementation. You will work with joins, nested queries, built-in functions, and user-defined functions to demonstrate advanced SQL problem-solving skills.

📝 TASK DETAILS

1️⃣ APPLY JOINS  
   - INNER JOIN  
   - LEFT JOIN  
   - RIGHT JOIN  
   - FULL JOIN (if supported)  
   - SELF JOIN  
   - CROSS JOIN  

2️⃣ APPLY SUBQUERIES  
   - Scalar, Correlated, IN, EXISTS, ANY, ALL  

3️⃣ USE FUNCTIONS  
   - Built-in: String, Numeric, Date/Time, Aggregate  
   - User-Defined (UDF): Minimum 5 custom calculations  

4️⃣ CLEAN & DOCUMENTED QUERIES  
   - Comment before each query  
   - Provide screenshots of outputs
=============================================================
*/


-- =============================================
-- CREATE TABLE 3: user_roles
-- =============================================

CREATE TABLE user_roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50),
    description TEXT,
    created_by INT,
    created_at DATETIME,
    updated_by INT,
    updated_at DATETIME,
    status VARCHAR(20),
    permissions TEXT,
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);


-- =============================================
-- INSERT VALUES INTO user_roles
-- =============================================

INSERT INTO user_roles (role_name, description, created_by, created_at, updated_by, updated_at, status, permissions)
VALUES
('Admin', 'Has full control over the Hello Vegan system including user management, products, and settings.', 2, '2025-01-01 10:00:00', 2, '2025-01-10 09:00:00', 'Active', 'manage_users,manage_products,view_reports,edit_content'),
('Customer', 'Regular user who can browse and purchase vegan products.', 1, '2025-01-02 11:00:00', 2, '2025-01-12 10:30:00', 'Active', 'view_products,add_to_cart,place_order,write_review'),
('Doctor', 'Registered doctor providing vegan health advice.', 5, '2025-01-03 09:30:00', 12, '2025-01-13 09:15:00', 'Active', 'view_appointments,update_profile,chat_users'),
('Counselor', 'Lifestyle counselor offering vegan diet consultations.', 7, '2025-01-04 14:20:00', 16, '2025-01-14 11:20:00', 'Active', 'schedule_sessions,view_clients,chat_users'),
('Moderator', 'Assists admin in monitoring user-generated content and reviews.', 12, '2025-01-05 10:45:00', 2, '2025-01-15 09:30:00', 'Active', 'approve_reviews,delete_posts,ban_users'),
('Event Organizer', 'Responsible for creating and managing vegan events.', 2, '2025-01-06 08:40:00', 2, '2025-01-16 12:45:00', 'Active', 'create_event,edit_event,view_registrations'),
('Campaign Manager', 'Manages donation and awareness campaigns.', 2, '2025-01-07 13:00:00', 12, '2025-01-17 10:00:00', 'Active', 'create_campaign,track_donations,view_reports'),
('Delivery Partner', 'Handles product deliveries to customers.', 1, '2025-01-08 10:15:00', 2, '2025-01-18 09:20:00', 'Active', 'update_delivery_status,view_orders'),
('Product Manager', 'Adds and updates vegan products and categories.', 2, '2025-01-09 12:30:00', 12, '2025-01-19 10:50:00', 'Active', 'add_product,edit_product,manage_stock'),
('Volunteer', 'Supports community campaigns and local vegan events.', 1, '2025-01-10 09:10:00', 2, '2025-01-20 09:10:00', 'Active', 'join_event,share_posts'),
('Support Staff', 'Handles user queries and provides customer support.', 12, '2025-01-11 08:45:00', 2, '2025-01-21 11:00:00', 'Active', 'reply_tickets,view_feedback'),
('Editor', 'Manages website content, blogs, and news.', 2, '2025-01-12 14:00:00', 12, '2025-01-22 10:30:00', 'Active', 'create_post,edit_post,delete_post'),
('Finance Officer', 'Oversees all payments, refunds, and reports.', 2, '2025-01-13 09:00:00', 2, '2025-01-23 09:45:00', 'Active', 'manage_payments,view_finance_reports'),
('Marketing Executive', 'Handles promotions, ads, and email marketing.', 12, '2025-01-14 12:20:00', 2, '2025-01-24 15:00:00', 'Active', 'create_promo,send_emails,view_stats'),
('Nutritionist', 'Provides meal and diet plans for users.', 5, '2025-01-15 10:10:00', 12, '2025-01-25 12:30:00', 'Active', 'create_plan,update_meals,chat_users'),
('Research Analyst', 'Analyzes vegan market trends and user preferences.', 12, '2025-01-16 09:25:00', 2, '2025-01-26 11:00:00', 'Active', 'view_reports,generate_insights'),
('Event Volunteer', 'Helps organize and manage offline vegan events.', 1, '2025-01-17 08:50:00', 2, '2025-01-27 10:40:00', 'Active', 'assist_event,check_in_participants'),
('Community Manager', 'Manages Hello Vegan’s online community posts and members.', 12, '2025-01-18 11:45:00', 2, '2025-01-28 14:00:00', 'Active', 'approve_comments,moderate_posts,ban_users'),
('Content Creator', 'Creates articles, posts, and graphics for social media.', 12, '2025-01-19 15:20:00', 2, '2025-01-29 16:15:00', 'Active', 'create_content,upload_images'),
('Tester', 'Tests website features and reports bugs.', 2, '2025-01-20 09:30:00', 12, '2025-01-30 11:10:00', 'Active', 'test_features,report_bugs');


-- =============================================
-- 20 QUERIES (Joins, Subqueries, Functions, UDFs)
-- =============================================

-- 1️⃣ INNER JOIN: Show role with creator name
SELECT ur.role_name, u.username 
FROM user_roles ur
INNER JOIN users u ON ur.created_by = u.user_id;

-- 2️⃣ LEFT JOIN: Show all roles and user who updated them (if exists)
SELECT ur.role_name, u.username AS updated_by_user
FROM user_roles ur
LEFT JOIN users u ON ur.updated_by = u.user_id;

-- 3️⃣ RIGHT JOIN: Show all users and their assigned roles
SELECT u.username, ur.role_name
FROM users u
RIGHT JOIN user_roles ur ON u.user_id = ur.created_by;

-- 4️⃣ SELF JOIN: Compare roles created by same user
SELECT a.role_name AS Role1, b.role_name AS Role2
FROM user_roles a
JOIN user_roles b ON a.created_by = b.created_by
WHERE a.role_id <> b.role_id;

-- 5️⃣ CROSS JOIN: Combine roles with statuses
SELECT ur.role_name, s.status_name
FROM user_roles ur
CROSS JOIN status_master s;

-- 6️⃣ Subquery (Scalar): Show latest role creation date
SELECT MAX(created_at) AS latest_role_creation FROM user_roles;

-- 7️⃣ Subquery (IN): Roles created by users with even user_id
SELECT role_name FROM user_roles
WHERE created_by IN (SELECT user_id FROM users WHERE MOD(user_id,2)=0);

-- 8️⃣ Subquery (EXISTS): Roles that have been updated at least once
SELECT role_name FROM user_roles ur
WHERE EXISTS (SELECT 1 FROM user_roles x WHERE x.updated_by IS NOT NULL AND x.role_id = ur.role_id);

-- 9️⃣ Aggregate: Count total active roles
SELECT COUNT(*) AS total_active_roles FROM user_roles WHERE status='Active';

-- 🔟 String Function: Display all role names in uppercase
SELECT UPPER(role_name) AS Role_Upper FROM user_roles;

-- 11️⃣ Date Function: Find how many days each role existed before update
SELECT role_name, DATEDIFF(updated_at, created_at) AS days_difference FROM user_roles;

-- 12️⃣ Numeric Function: Round average days between creation and update
SELECT ROUND(AVG(DATEDIFF(updated_at, created_at)),2) AS avg_days_difference FROM user_roles;

-- 13️⃣ Concatenation: Combine role name and status
SELECT CONCAT(role_name, ' - ', status) AS Role_Status FROM user_roles;

-- 14️⃣ Filtering using SUBSTRING:
SELECT role_name FROM user_roles WHERE SUBSTRING(role_name,1,1)='C';

-- 15️⃣ Group by Function: Count roles created by each user
SELECT created_by, COUNT(role_id) AS total_roles FROM user_roles GROUP BY created_by;

-- 16️⃣ HAVING Clause: Show users who created more than 2 roles
SELECT created_by, COUNT(role_id) AS total_roles
FROM user_roles
GROUP BY created_by
HAVING COUNT(role_id) > 2;

-- 17️⃣ User Defined Function (UDF): Calculate total permissions count
DELIMITER //
CREATE FUNCTION CountPermissions(permission_text TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (LENGTH(permission_text) - LENGTH(REPLACE(permission_text, ',', '')) + 1);
END //
DELIMITER ;

-- 18️⃣ Use UDF to show permission count for each role
SELECT role_name, CountPermissions(permissions) AS permission_count FROM user_roles;

-- 19️⃣ UDF Example 2: Check Active Status
DELIMITER //
CREATE FUNCTION IsActiveStatus(stat VARCHAR(20))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF stat='Active' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

SELECT role_name, IsActiveStatus(status) AS Active FROM user_roles;

-- 20️⃣ Subquery + Function Combo: Roles created after average creation date
SELECT role_name, created_at
FROM user_roles
WHERE created_at > (SELECT AVG(created_at) FROM user_roles);

-- =============================================
-- TESTING COMMANDS
-- =============================================
SELECT * FROM user_roles;
-- TRUNCATE TABLE user_roles;
-- DROP TABLE user_roles;

-- Table: user_roles
-- 1. Views (4 Queries)

-- Simple view for active roles
CREATE VIEW ActiveRoles AS
SELECT role_id, role_name, description, status
FROM user_roles
WHERE status = 'Active';

-- Complex view with join and aggregation: Roles with creator details and permission count
CREATE VIEW RolesWithCreators AS
SELECT r.role_id, u.full_name AS creator_name, r.role_name, LENGTH(r.permissions) - LENGTH(REPLACE(r.permissions, ',', '')) + 1 AS permission_count
FROM user_roles r
INNER JOIN users u ON r.created_by = u.user_id;

-- View for roles created by admins (user_id 2)
CREATE VIEW AdminCreatedRoles AS
SELECT role_id, role_name, created_at
FROM user_roles
WHERE created_by = 2;

-- View for roles with permissions containing 'manage'
CREATE VIEW ManagementRoles AS
SELECT role_id, role_name, permissions
FROM user_roles
WHERE permissions LIKE '%manage%';
-- 2. Cursors (3 Queries)

-- Cursor to process and display role names one by one
DELIMITER //
CREATE PROCEDURE ProcessRoleNames()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE role_nm VARCHAR(50);
    DECLARE role_cursor CURSOR FOR SELECT role_name FROM user_roles;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN role_cursor;
    read_loop: LOOP
        FETCH role_cursor INTO role_nm;
        IF done THEN LEAVE read_loop; END IF;
        SELECT CONCAT('Processing role: ', role_nm) AS message;
    END LOOP;
    CLOSE role_cursor;
END //
DELIMITER ;
-- Usage: CALL ProcessRoleNames();

-- Cursor to update status for roles created by user 1
DELIMITER //
CREATE PROCEDURE UpdateRoleStatus()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE rid INT;
    DECLARE status_cursor CURSOR FOR SELECT role_id FROM user_roles WHERE created_by = 1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN status_cursor;
    update_loop: LOOP
        FETCH status_cursor INTO rid;
        IF done THEN LEAVE update_loop; END IF;
        UPDATE user_roles SET status = 'Inactive' WHERE role_id = rid;
    END LOOP;
    CLOSE status_cursor;
END //
DELIMITER ;
-- Usage: CALL UpdateRoleStatus();

-- Cursor to calculate and display role age (days since creation)
DELIMITER //
CREATE PROCEDURE CalculateRoleAges()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE rid INT, crt DATETIME;
    DECLARE age_cursor CURSOR FOR SELECT role_id, created_at FROM user_roles;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN age_cursor;
    age_loop: LOOP
        FETCH age_cursor INTO rid, crt;
        IF done THEN LEAVE age_loop; END IF;
        SELECT rid, DATEDIFF(NOW(), crt) AS days_since_creation;
    END LOOP;
    CLOSE age_cursor;
END //
DELIMITER ;
-- Usage: CALL CalculateRoleAges();
-- 3. Stored Procedures (4 Queries)

-- Procedure to add a new role
DELIMITER //
CREATE PROCEDURE AddRole(IN rname VARCHAR(50), IN desc_text TEXT, IN creator INT, IN perms TEXT)
BEGIN
    INSERT INTO user_roles (role_name, description, created_by, created_at, updated_by, updated_at, status, permissions)
    VALUES (rname, desc_text, creator, NOW(), creator, NOW(), 'Active', perms);
END //
DELIMITER ;
-- Usage: CALL AddRole('New Role', 'Description', 2, 'new_permissions');

-- Procedure to update role permissions
DELIMITER //
CREATE PROCEDURE UpdateRolePermissions(IN rid INT, IN new_perms TEXT)
BEGIN
    UPDATE user_roles SET permissions = new_perms, updated_at = NOW() WHERE role_id = rid;
END //
DELIMITER ;
-- Usage: CALL UpdateRolePermissions(1, 'updated_permissions');

-- Procedure to delete inactive roles
DELIMITER //
CREATE PROCEDURE DeleteInactiveRoles()
BEGIN
    DELETE FROM user_roles WHERE status = 'Inactive';
END //
DELIMITER ;
-- Usage: CALL DeleteInactiveRoles();

-- Procedure to get role count by creator
DELIMITER //
CREATE PROCEDURE GetRoleCountByCreator(IN creator_id INT, OUT cnt INT)
BEGIN
    SELECT COUNT(*) INTO cnt FROM user_roles WHERE created_by = creator_id;
END //
DELIMITER ;
-- Usage: CALL GetRoleCountByCreator(2, @count); SELECT @count;
-- 4. Window Functions (3 Queries)

-- Row number roles by created_at
SELECT role_id, role_name, created_at,
       ROW_NUMBER() OVER (ORDER BY created_at) AS row_num
FROM user_roles;

-- Rank roles by permission count within status
SELECT role_id, role_name, status, LENGTH(permissions) - LENGTH(REPLACE(permissions, ',', '')) + 1 AS perm_count,
       RANK() OVER (PARTITION BY status ORDER BY (LENGTH(permissions) - LENGTH(REPLACE(permissions, ',', '')) + 1) DESC) AS perm_rank
FROM user_roles;

-- Lead function to show next role in creation order
SELECT role_id, role_name, created_at,
       LEAD(role_name) OVER (ORDER BY created_at) AS next_role
FROM user_roles;
-- 5. DCL/TCL (3 Queries)

-- DCL: Grant select permission on user_roles table
GRANT SELECT ON user_roles TO user1;

-- DCL: Revoke insert permission
REVOKE INSERT ON user_roles FROM user1;

-- TCL: Transaction for updating role status
START TRANSACTION;
UPDATE user_roles SET status = 'Inactive' WHERE role_id = 1;
SAVEPOINT sp1;
UPDATE user_roles SET updated_at = NOW() WHERE role_id = 2;
ROLLBACK TO sp1;  -- Rollback to savepoint
COMMIT;
-- 6. Triggers (3 Queries)

-- AFTER INSERT: Log new role creation in audit_logs
DELIMITER //
CREATE TRIGGER after_role_insert
AFTER INSERT ON user_roles
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (NEW.created_by, 'INSERT', 'user_roles', NEW.role_id, 'New role added', NOW());
END //
DELIMITER ;

-- BEFORE UPDATE: Prevent status change to 'Inactive' for Admin roles
DELIMITER //
CREATE TRIGGER before_role_update
BEFORE UPDATE ON user_roles
FOR EACH ROW
BEGIN
    IF OLD.role_name = 'Admin' AND NEW.status = 'Inactive' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot deactivate Admin role';
    END IF;
END //
DELIMITER ;

-- AFTER DELETE: Log role deletion
DELIMITER //
CREATE TRIGGER after_role_delete
AFTER DELETE ON user_roles
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (OLD.created_by, 'DELETE', 'user_roles', OLD.role_id, 'Role deleted', NOW());
END //
DELIMITER ;

-- =========================================================================================================
-- ✅ END OF TABLE 3 - user_roles
-- =========================================================================================================


-- ============================================= CREATE TABLE 4. PRODUCTS ===================================================================================
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    name VARCHAR(150),
    description TEXT,
    price DECIMAL(10,2),
    stock INT,
    brand VARCHAR(100),
    image_url VARCHAR(255),
    status VARCHAR(20),
    created_at DATETIME
);

-- ==================================================================== INSERT INTO PRODUCTS ========================================================================

INSERT INTO products (category_id, name, description, price, stock, brand, image_url, status, created_at)
VALUES
(1, 'Organic Almond Milk', 'Unsweetened almond milk made from 100% organic almonds.', 199.00, 120, 'VeganPure', 'images/almond_milk.jpg', 'Available', '2025-10-06 10:00:00'),
(1, 'Vegan Protein Powder', 'Plant-based protein powder with pea and rice protein blend.', 999.00, 80, 'GreenFuel', 'images/protein_powder.jpg', 'Available', '2025-10-06 10:05:00'),
(2, 'Coconut Lip Balm', 'Moisturizing lip balm made with coconut oil and shea butter.', 149.00, 200, 'EcoBeauty', 'images/lip_balm.jpg', 'Available', '2025-10-06 10:10:00'),
(2, 'Aloe Vera Face Cream', 'Hydrating face cream suitable for all skin types.', 349.00, 150, 'HerbalGlow', 'images/face_cream.jpg', 'Available', '2025-10-06 10:15:00'),
(3, 'Vegan Leather Wallet', 'Handcrafted vegan leather wallet with multiple card slots.', 699.00, 90, 'LeafStyle', 'images/vegan_wallet.jpg', 'Available', '2025-10-06 10:20:00'),
(3, 'Eco-friendly Tote Bag', 'Reusable tote bag made from recycled cotton.', 299.00, 180, 'NatureCraft', 'images/tote_bag.jpg', 'Available', '2025-10-06 10:25:00'),
(4, 'Vegan Dark Chocolate', 'Rich dark chocolate with 70% cocoa and no dairy.', 249.00, 250, 'ChocoSoul', 'images/dark_chocolate.jpg', 'Available', '2025-10-06 10:30:00'),
(4, 'Oat Cookies', 'Crunchy cookies made with oats and coconut sugar.', 199.00, 220, 'HealthyBite', 'images/oat_cookies.jpg', 'Available', '2025-10-06 10:35:00'),
(1, 'Cashew Butter', 'Creamy cashew butter with no added sugar or oil.', 499.00, 75, 'NuttyNature', 'images/cashew_butter.jpg', 'Available', '2025-10-06 10:40:00'),
(5, 'Herbal Shampoo', 'Natural shampoo infused with aloe vera and neem.', 399.00, 130, 'EcoHerb', 'images/herbal_shampoo.jpg', 'Available', '2025-10-06 10:45:00'),
(5, 'Charcoal Face Wash', 'Deep-cleansing face wash with activated charcoal.', 299.00, 110, 'HerbalGlow', 'images/charcoal_facewash.jpg', 'Available', '2025-10-06 10:50:00'),
(6, 'Vegan Sneakers', 'Stylish sneakers made with recycled materials.', 1499.00, 60, 'GreenStep', 'images/vegan_sneakers.jpg', 'Available', '2025-10-06 10:55:00'),
(6, 'Bamboo Sunglasses', 'Eco-friendly sunglasses with bamboo frame.', 899.00, 85, 'EcoVision', 'images/bamboo_sunglasses.jpg', 'Available', '2025-10-06 11:00:00'),
(7, 'Vegan Omega Capsules', 'Omega-3 capsules sourced from algae.', 799.00, 140, 'PlantLife', 'images/omega_capsules.jpg', 'Available', '2025-10-06 11:05:00'),
(7, 'Multivitamin Tablets', 'Daily vegan multivitamins with essential nutrients.', 699.00, 160, 'NutraVegan', 'images/multivitamins.jpg', 'Available', '2025-10-06 11:10:00'),
(8, 'Vegan Mayonnaise', 'Egg-free creamy mayonnaise made with sunflower oil.', 199.00, 190, 'PureTaste', 'images/vegan_mayo.jpg', 'Available', '2025-10-06 11:15:00'),
(8, 'Tofu Cubes', 'Soft and fresh tofu cubes made from organic soybeans.', 149.00, 210, 'SoyFresh', 'images/tofu.jpg', 'Available', '2025-10-06 11:20:00'),
(9, 'Compostable Cutlery Set', 'Set of forks, spoons, and knives made from cornstarch.', 249.00, 130, 'GreenTable', 'images/cutlery_set.jpg', 'Available', '2025-10-06 11:25:00'),
(9, 'Bamboo Toothbrush', 'Eco-friendly toothbrush with bamboo handle and soft bristles.', 99.00, 300, 'EcoSmile', 'images/bamboo_toothbrush.jpg', 'Available', '2025-10-06 11:30:00'),
(10, 'Vegan Cheese', 'Dairy-free cheese made from cashews and nutritional yeast.', 399.00, 100, 'PlantDairy', 'images/vegan_cheese.jpg', 'Available', '2025-10-06 11:35:00');

-- ============================================= PHASE 3 PROJECT QUERIES =======================================================================================
-- 🔰 OBJECTIVE: Demonstrate advanced SQL concepts using Joins, Subqueries, Functions (Built-in & User-defined)

-- ============================================= 1️⃣ APPLY JOINS ===============================================================

-- 1. INNER JOIN: Display product name and category name
SELECT p.name, c.category_name
FROM products p
INNER JOIN categories c ON p.category_id = c.category_id;

-- 2. LEFT JOIN: Show all categories even if no products are assigned
SELECT c.category_name, p.name
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id;

-- 3. RIGHT JOIN: Show all products with their category details (if any)
SELECT p.name, c.category_name
FROM categories c
RIGHT JOIN products p ON p.category_id = c.category_id;

-- 4. SELF JOIN: Compare products of the same category
SELECT a.name AS Product1, b.name AS Product2
FROM products a, products b
WHERE a.category_id = b.category_id AND a.product_id <> b.product_id;

-- 5. CROSS JOIN: Generate all combinations of brands and statuses
SELECT DISTINCT p.brand, s.status
FROM products p
CROSS JOIN (SELECT DISTINCT status FROM products) s;

-- ============================================= 2️⃣ APPLY SUBQUERIES ==========================================================

-- 6. Scalar subquery: Show products priced above the average price
SELECT name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 7. IN subquery: List products belonging to specific categories
SELECT name
FROM products
WHERE category_id IN (SELECT category_id FROM categories WHERE category_name LIKE '%Food%');

-- 8. EXISTS subquery: Show categories having products in stock
SELECT category_name
FROM categories c
WHERE EXISTS (SELECT 1 FROM products p WHERE p.category_id = c.category_id AND p.stock > 0);

-- 9. Correlated subquery: Show products that are the most expensive in their category
SELECT name, category_id, price
FROM products p1
WHERE price = (
  SELECT MAX(price)
  FROM products p2
  WHERE p2.category_id = p1.category_id
);

-- 10. Subquery in FROM clause: Find average stock per category
SELECT category_id, AVG(stock) AS avg_stock
FROM products
GROUP BY category_id;

-- ============================================= 3️⃣ APPLY FUNCTIONS ==========================================================

-- 11. Built-in string function: Convert brand names to uppercase
SELECT UPPER(brand) AS BrandNameCaps FROM products;

-- 12. Built-in numeric function: Round price to nearest 10
SELECT name, ROUND(price, -1) AS RoundedPrice FROM products;

-- 13. Built-in date function: Show month of creation
SELECT name, MONTH(created_at) AS CreatedMonth FROM products;

-- 14. Aggregate function: Count total number of available products
SELECT COUNT(*) AS TotalAvailable FROM products WHERE status = 'Available';

-- 15. Built-in concat function: Display formatted product label
SELECT CONCAT(name, ' - ₹', price) AS ProductLabel FROM products;

-- ============================================= 4️⃣ USER-DEFINED FUNCTIONS ===================================================

-- 16. UDF: Calculate yearly revenue of a product based on price & stock
DELIMITER //
CREATE FUNCTION CalcYearlyRevenue(price DECIMAL(10,2), stock INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
RETURN price * stock;
//
DELIMITER ;

-- 17. UDF: Apply 10% discount to a product
DELIMITER //
CREATE FUNCTION ApplyDiscount(price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
RETURN price * 0.9;
//
DELIMITER ;

-- 18. UDF: Classify product price range
DELIMITER //
CREATE FUNCTION PriceCategory(price DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
RETURN (
  CASE
    WHEN price < 300 THEN 'Low'
    WHEN price BETWEEN 300 AND 800 THEN 'Medium'
    ELSE 'High'
  END
);
//
DELIMITER ;

-- 19. Use UDFs in a query
SELECT name, price, ApplyDiscount(price) AS DiscountedPrice, PriceCategory(price) AS PriceLevel
FROM products;

-- 20. Use UDF to calculate revenue
SELECT name, CalcYearlyRevenue(price, stock) AS YearlyRevenue FROM products;

-- ============================================= BASIC OPERATIONS =============================================================
SELECT * FROM products;
TRUNCATE TABLE products;
DROP TABLE products;




-- Table: products
-- 1. Views (4 Queries)

-- Simple view for available products
CREATE VIEW AvailableProducts AS
SELECT product_id, name, price, stock, brand
FROM products
WHERE status = 'Available';

-- Complex view with aggregation: Products by brand with average price and total stock
CREATE VIEW ProductsByBrand AS
SELECT brand, COUNT(product_id) AS product_count, AVG(price) AS avg_price, SUM(stock) AS total_stock
FROM products
GROUP BY brand;

-- View for products with price > 500
CREATE VIEW ExpensiveProducts AS
SELECT product_id, name, price, brand
FROM products
WHERE price > 500;

-- View for products created in the last 30 days
CREATE VIEW RecentProducts AS
SELECT product_id, name, created_at
FROM products
WHERE created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY);
-- 2. Cursors (3 Queries)

-- Cursor to process and display product names one by one
DELIMITER //
CREATE PROCEDURE ProcessProductNames()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE prod_name VARCHAR(150);
    DECLARE prod_cursor CURSOR FOR SELECT name FROM products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN prod_cursor;
    read_loop: LOOP
        FETCH prod_cursor INTO prod_name;
        IF done THEN LEAVE read_loop; END IF;
        SELECT CONCAT('Processing product: ', prod_name) AS message;
    END LOOP;
    CLOSE prod_cursor;
END //
DELIMITER ;
-- Usage: CALL ProcessProductNames();

-- Cursor to update stock for products with low stock (<100)
DELIMITER //
CREATE PROCEDURE UpdateLowStock()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pid INT;
    DECLARE stock_cursor CURSOR FOR SELECT product_id FROM products WHERE stock < 100;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN stock_cursor;
    update_loop: LOOP
        FETCH stock_cursor INTO pid;
        IF done THEN LEAVE update_loop; END IF;
        UPDATE products SET stock = stock + 50 WHERE product_id = pid;
    END LOOP;
    CLOSE stock_cursor;
END //
DELIMITER ;
-- Usage: CALL UpdateLowStock();

-- Cursor to calculate and display product age (days since creation)
DELIMITER //
CREATE PROCEDURE CalculateProductAges()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pid INT, crt DATETIME;
    DECLARE age_cursor CURSOR FOR SELECT product_id, created_at FROM products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN age_cursor;
    age_loop: LOOP
        FETCH age_cursor INTO pid, crt;
        IF done THEN LEAVE age_loop; END IF;
        SELECT pid, DATEDIFF(NOW(), crt) AS days_since_creation;
    END LOOP;
    CLOSE age_cursor;
END //
DELIMITER ;
-- Usage: CALL CalculateProductAges();
-- 3. Stored Procedures (4 Queries)

-- Procedure to add a new product
DELIMITER //
CREATE PROCEDURE AddProduct(IN cat_id INT, IN pname VARCHAR(150), IN desc_text TEXT, IN prc DECIMAL(10,2), IN stk INT, IN brnd VARCHAR(100))
BEGIN
    INSERT INTO products (category_id, name, description, price, stock, brand, status, created_at)
    VALUES (cat_id, pname, desc_text, prc, stk, brnd, 'Available', NOW());
END //
DELIMITER ;
-- Usage: CALL AddProduct(1, 'New Product', 'Description', 299.00, 100, 'NewBrand');

-- Procedure to update product price
DELIMITER //
CREATE PROCEDURE UpdateProductPrice(IN pid INT, IN new_price DECIMAL(10,2))
BEGIN
    UPDATE products SET price = new_price WHERE product_id = pid;
END //
DELIMITER ;
-- Usage: CALL UpdateProductPrice(1, 249.00);

-- Procedure to delete out-of-stock products
DELIMITER //
CREATE PROCEDURE DeleteOutOfStock()
BEGIN
    DELETE FROM products WHERE stock = 0;
END //
DELIMITER ;
-- Usage: CALL DeleteOutOfStock();

-- Procedure to get product count by brand
DELIMITER //
CREATE PROCEDURE GetProductCountByBrand(IN brnd VARCHAR(100), OUT cnt INT)
BEGIN
    SELECT COUNT(*) INTO cnt FROM products WHERE brand = brnd;
END //
DELIMITER ;
-- Usage: CALL GetProductCountByBrand('VeganPure', @count); SELECT @count;
-- 4. Window Functions (3 Queries)

-- Row number products by created_at
SELECT product_id, name, created_at,
       ROW_NUMBER() OVER (ORDER BY created_at) AS row_num
FROM products;

-- Rank products by price within brand
SELECT product_id, name, brand, price,
       RANK() OVER (PARTITION BY brand ORDER BY price DESC) AS price_rank
FROM products;

-- Lead function to show next product in creation order
SELECT product_id, name, created_at,
       LEAD(name) OVER (ORDER BY created_at) AS next_product
FROM products;
-- 5. DCL/TCL (3 Queries)

-- DCL: Grant select permission on products table
GRANT SELECT ON products TO user1;

-- DCL: Revoke update permission
REVOKE UPDATE ON products FROM user1;

-- TCL: Transaction for updating product stock
START TRANSACTION;
UPDATE products SET stock = stock - 10 WHERE product_id = 1;
SAVEPOINT sp1;
UPDATE products SET stock = stock - 5 WHERE product_id = 2;
ROLLBACK TO sp1;  -- Rollback to savepoint
COMMIT;
-- 6. Triggers (3 Queries)

-- AFTER INSERT: Log new product creation in audit_logs
DELIMITER //
CREATE TRIGGER after_product_insert
AFTER INSERT ON products
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (1, 'INSERT', 'products', NEW.product_id, 'New product added', NOW());  -- Assuming user_id 1 for admin
END //
DELIMITER ;

-- BEFORE UPDATE: Prevent price update if new price < 0
DELIMITER //
CREATE TRIGGER before_product_update
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Price cannot be negative';
    END IF;
END //
DELIMITER ;

-- AFTER DELETE: Log product deletion
DELIMITER //
CREATE TRIGGER after_product_delete
AFTER DELETE ON products
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (1, 'DELETE', 'products', OLD.product_id, 'Product deleted', NOW());
END //
DELIMITER ;
-- ============================================= DOCUMENTATION NOTES ==========================================================
/*
📘 PROJECT SUBMISSION PHASE 3 (ADVANCED SQL)
✔ Includes 20 total queries:
   - 5 Joins
   - 5 Subqueries
   - 5 Built-in Functions
   - 5 User-defined Functions
✔ Clean formatting with comments and section dividers
✔ Include screenshots of executed results in report
⏳ Late Submission Penalty: -100 points
*/



-- ===================================================== CREATE TABLE 5.  CATEGORIES =================================================================================


-- 5. CATEGORIES

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    parent_id INT,
    image_url VARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(20),
    created_by INT,
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

-- =========================================================== INSERT INTO CATEGORIES ================================================================================

INSERT INTO categories (name, description, parent_id, image_url, created_at, updated_at, status, created_by)
VALUES
('Beverages', 'Plant-based drinks including milk alternatives, juices, and smoothies.', NULL, 'images/categories/beverages.jpg', '2025-10-06 10:00:00', '2025-10-06 10:10:00', 'Active', 2),
('Food', 'All types of vegan food including snacks, ready-to-eat meals, and ingredients.', NULL, 'images/categories/food.jpg', '2025-10-06 10:05:00', '2025-10-06 10:15:00', 'Active', 2),
('Skincare', 'Natural and vegan skincare products for all skin types.', NULL, 'images/categories/skincare.jpg', '2025-10-06 10:10:00', '2025-10-06 10:20:00', 'Active', 2),
('Clothing & Accessories', 'Eco-friendly fashion products including clothes, shoes, and bags.', NULL, 'images/categories/fashion.jpg', '2025-10-06 10:15:00', '2025-10-06 10:25:00', 'Active', 2),
('Supplements', 'Vegan vitamins, protein powders, and other dietary supplements.', NULL, 'images/categories/supplements.jpg', '2025-10-06 10:20:00', '2025-10-06 10:30:00', 'Active', 2),
('Eco-Kitchen', 'Sustainable kitchenware, cutlery, and storage items.', NULL, 'images/categories/kitchen.jpg', '2025-10-06 10:25:00', '2025-10-06 10:35:00', 'Active', 2),
('Beverages - Milk Alternatives', 'Plant-based milk alternatives like almond, oat, soy, and cashew milk.', 1, 'images/categories/milk_alternatives.jpg', '2025-10-06 10:30:00', '2025-10-06 10:40:00', 'Active', 2),
('Beverages - Smoothies', 'Ready-to-drink vegan smoothies and shakes.', 1, 'images/categories/smoothies.jpg', '2025-10-06 10:35:00', '2025-10-06 10:45:00', 'Active', 2),
('Food - Snacks', 'Vegan snacks including cookies, chips, and granola bars.', 2, 'images/categories/snacks.jpg', '2025-10-06 10:40:00', '2025-10-06 10:50:00', 'Active', 2),
('Food - Tofu & Meat Alternatives', 'Plant-based proteins like tofu, tempeh, and vegan burgers.', 2, 'images/categories/meat_alternatives.jpg', '2025-10-06 10:45:00', '2025-10-06 10:55:00', 'Active', 2),
('Skincare - Face', 'Vegan face creams, serums, and cleansers.', 3, 'images/categories/face.jpg', '2025-10-06 10:50:00', '2025-10-06 11:00:00', 'Active', 2),
('Skincare - Hair', 'Shampoos, conditioners, and hair oils.', 3, 'images/categories/hair.jpg', '2025-10-06 10:55:00', '2025-10-06 11:05:00', 'Active', 2),
('Clothing - Shoes', 'Vegan sneakers, sandals, and other footwear.', 4, 'images/categories/shoes.jpg', '2025-10-06 11:00:00', '2025-10-06 11:10:00', 'Active', 2),
('Clothing - Bags', 'Eco-friendly handbags, totes, and backpacks.', 4, 'images/categories/bags.jpg', '2025-10-06 11:05:00', '2025-10-06 11:15:00', 'Active', 2),
('Supplements - Protein', 'Plant-based protein powders and blends.', 5, 'images/categories/protein.jpg', '2025-10-06 11:10:00', '2025-10-06 11:20:00', 'Active', 2),
('Supplements - Vitamins', 'Daily multivitamins and mineral supplements.', 5, 'images/categories/vitamins.jpg', '2025-10-06 11:15:00', '2025-10-06 11:25:00', 'Active', 2),
('Eco-Kitchen - Cutlery', 'Reusable cutlery sets made from bamboo or cornstarch.', 6, 'images/categories/cutlery.jpg', '2025-10-06 11:20:00', '2025-10-06 11:30:00', 'Active', 2),
('Eco-Kitchen - Storage', 'Glass jars, containers, and eco-friendly storage solutions.', 6, 'images/categories/storage.jpg', '2025-10-06 11:25:00', '2025-10-06 11:35:00', 'Active', 2),
('Food - Beverages', 'Ready-to-drink beverages including juices and plant-based drinks.', 2, 'images/categories/food_beverages.jpg', '2025-10-06 11:30:00', '2025-10-06 11:40:00', 'Active', 2),
('Food - Baking Ingredients', 'Vegan flours, baking mixes, and sugar alternatives.', 2, 'images/categories/baking.jpg', '2025-10-06 11:35:00', '2025-10-06 11:45:00', 'Active', 2);

-- ========================================= QUERIES ===============================================================================================================
SELECT * FROM categories;

TRUNCATE categories;

DROP TABLE categories;


-- 🔹 1️⃣ JOINS (6 Queries)
-- 1. INNER JOIN: Show each product along with its category name
SELECT p.name AS ProductName, c.name AS CategoryName
FROM products p
INNER JOIN categories c ON p.category_id = c.category_id;

-- 2. LEFT JOIN: Show all categories even if no product is linked
SELECT c.name AS CategoryName, p.name AS ProductName
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id;

-- 3. RIGHT JOIN: Show all products, even if their category is missing
SELECT p.name AS ProductName, c.name AS CategoryName
FROM categories c
RIGHT JOIN products p ON c.category_id = p.category_id;

-- 4. SELF JOIN: Show parent and subcategories
SELECT c1.name AS MainCategory, c2.name AS SubCategory
FROM categories c1
INNER JOIN categories c2 ON c1.category_id = c2.parent_id;

-- 5. CROSS JOIN: Combine all categories with all brands (demo)
SELECT c.name AS CategoryName, p.brand
FROM categories c
CROSS JOIN products p;

-- 6. INNER JOIN with users: Show categories created by users
SELECT c.name AS CategoryName, u.username AS CreatedBy
FROM categories c
INNER JOIN users u ON c.created_by = u.user_id;

-- 🔹 2️⃣ SUBQUERIES (6 Queries)
-- 7. Find categories that have more than 1 subcategory
SELECT name FROM categories
WHERE category_id IN (
    SELECT parent_id FROM categories
    GROUP BY parent_id
    HAVING COUNT(*) > 1
);

-- 8. Show main categories that have subcategories starting with 'Food'
SELECT name FROM categories
WHERE category_id IN (
    SELECT parent_id FROM categories WHERE name LIKE 'Food%'
);

-- 9. Scalar subquery: Show latest updated category
SELECT name, (SELECT MAX(updated_at) FROM categories) AS LatestUpdate
FROM categories
WHERE updated_at = (SELECT MAX(updated_at) FROM categories);

-- 10. Correlated subquery: Show categories with subcategories created later
SELECT c1.name
FROM categories c1
WHERE EXISTS (
    SELECT 1 FROM categories c2
    WHERE c2.parent_id = c1.category_id
    AND c2.created_at > c1.created_at
);

-- 11. Subquery in FROM: Count subcategories per main category
SELECT main.name AS MainCategory, COUNT(sub.category_id) AS SubCategoryCount
FROM categories main
LEFT JOIN categories sub ON main.category_id = sub.parent_id
GROUP BY main.category_id;

-- 12. Subquery using IN: Find all products belonging to 'Food' category tree
SELECT name FROM products
WHERE category_id IN (
    SELECT category_id FROM categories
    WHERE parent_id = (SELECT category_id FROM categories WHERE name = 'Food')
);

-- 🔹 3️⃣ BUILT-IN FUNCTIONS (5 Queries)
-- 13. String functions: Display category names in uppercase
SELECT UPPER(name) AS CategoryNameCaps FROM categories;

-- 14. Numeric & aggregate: Count total subcategories
SELECT COUNT(category_id) AS TotalSubCategories
FROM categories WHERE parent_id IS NOT NULL;

-- 15. Date function: Show how many days since category was created
SELECT name, DATEDIFF(NOW(), created_at) AS DaysSinceCreation
FROM categories;

-- 16. CONCAT: Combine name and description
SELECT CONCAT(name, ' - ', description) AS FullInfo FROM categories;

-- 17. MIN/MAX: Find earliest and latest category creation date
SELECT MIN(created_at) AS OldestCategory, MAX(created_at) AS NewestCategory
FROM categories;

🔹 4️⃣ USER-DEFINED FUNCTIONS (UDFs) (5 Queries)
-- 18. UDF: Calculate total categories (main + sub)
DELIMITER //
CREATE FUNCTION TotalCategories()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM categories;
    RETURN total;
END //
DELIMITER ;

SELECT TotalCategories() AS TotalCategoryCount;

-- 19. UDF: Get number of subcategories for a category
DELIMITER //
CREATE FUNCTION CountSubCategories(cat_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE subcount INT;
    SELECT COUNT(*) INTO subcount FROM categories WHERE parent_id = cat_id;
    RETURN subcount;
END //
DELIMITER ;

SELECT name, CountSubCategories(category_id) AS SubCount FROM categories;

-- 20. UDF: Calculate age (in days) of a category
DELIMITER //
CREATE FUNCTION CategoryAge(cat_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE created DATE;
    DECLARE days_old INT;
    SELECT created_at INTO created FROM categories WHERE category_id = cat_id;
    SET days_old = DATEDIFF(NOW(), created);
    RETURN days_old;
END //
DELIMITER ;

SELECT name, CategoryAge(category_id) AS DaysOld FROM categories;

-- Table: categories
-- 1. Views (4 Queries)

-- Simple view for active categories
CREATE VIEW ActiveCategories AS
SELECT category_id, name, description, status
FROM categories
WHERE status = 'Active';

-- Complex view with join and aggregation: Categories with creator details and sub-category count
CREATE VIEW CategoriesWithCreators AS
SELECT c.category_id, u.full_name AS creator_name, c.name, COUNT(sub.category_id) AS sub_category_count
FROM categories c
LEFT JOIN categories sub ON c.category_id = sub.parent_id
INNER JOIN users u ON c.created_by = u.user_id
GROUP BY c.category_id, u.full_name, c.name;

-- View for main categories (parent_id IS NULL)
CREATE VIEW MainCategories AS
SELECT category_id, name, description
FROM categories
WHERE parent_id IS NULL;

-- View for categories updated in the last 30 days
CREATE VIEW RecentlyUpdatedCategories AS
SELECT category_id, name, updated_at
FROM categories
WHERE updated_at >= DATE_SUB(NOW(), INTERVAL 30 DAY);
-- 2. Cursors (3 Queries)

-- Cursor to process and display category names one by one
DELIMITER //
CREATE PROCEDURE ProcessCategoryNames()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cat_name VARCHAR(100);
    DECLARE cat_cursor CURSOR FOR SELECT name FROM categories;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cat_cursor;
    read_loop: LOOP
        FETCH cat_cursor INTO cat_name;
        IF done THEN LEAVE read_loop; END IF;
        SELECT CONCAT('Processing category: ', cat_name) AS message;
    END LOOP;
    CLOSE cat_cursor;
END //
DELIMITER ;
-- Usage: CALL ProcessCategoryNames();

-- Cursor to update status for categories created by user 2
DELIMITER //
CREATE PROCEDURE UpdateCategoryStatus()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cid INT;
    DECLARE status_cursor CURSOR FOR SELECT category_id FROM categories WHERE created_by = 2;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN status_cursor;
    update_loop: LOOP
        FETCH status_cursor INTO cid;
        IF done THEN LEAVE update_loop; END IF;
        UPDATE categories SET status = 'Inactive' WHERE category_id = cid;
    END LOOP;
    CLOSE status_cursor;
END //
DELIMITER ;
-- Usage: CALL UpdateCategoryStatus();

-- Cursor to calculate and display category age (days since creation)
DELIMITER //
CREATE PROCEDURE CalculateCategoryAges()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cid INT, crt DATETIME;
    DECLARE age_cursor CURSOR FOR SELECT category_id, created_at FROM categories;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN age_cursor;
    age_loop: LOOP
        FETCH age_cursor INTO cid, crt;
        IF done THEN LEAVE age_loop; END IF;
        SELECT cid, DATEDIFF(NOW(), crt) AS days_since_creation;
    END LOOP;
    CLOSE age_cursor;
END //
DELIMITER ;
-- Usage: CALL CalculateCategoryAges();
-- 3. Stored Procedures (4 Queries)

-- Procedure to add a new category
DELIMITER //
CREATE PROCEDURE AddCategory(IN cname VARCHAR(100), IN desc_text TEXT, IN parent INT, IN creator INT)
BEGIN
    INSERT INTO categories (name, description, parent_id, created_at, updated_at, status, created_by)
    VALUES (cname, desc_text, parent, NOW(), NOW(), 'Active', creator);
END //
DELIMITER ;
-- Usage: CALL AddCategory('New Category', 'Description', NULL, 2);

-- Procedure to update category description
DELIMITER //
CREATE PROCEDURE UpdateCategoryDescription(IN cid INT, IN new_desc TEXT)
BEGIN
    UPDATE categories SET description = new_desc, updated_at = NOW() WHERE category_id = cid;
END //
DELIMITER ;
-- Usage: CALL UpdateCategoryDescription(1, 'Updated description');

-- Procedure to delete inactive categories
DELIMITER //
CREATE PROCEDURE DeleteInactiveCategories()
BEGIN
    DELETE FROM categories WHERE status = 'Inactive';
END //
DELIMITER ;
-- Usage: CALL DeleteInactiveCategories();

-- Procedure to get category count by creator
DELIMITER //
CREATE PROCEDURE GetCategoryCountByCreator(IN creator_id INT, OUT cnt INT)
BEGIN
    SELECT COUNT(*) INTO cnt FROM categories WHERE created_by = creator_id;
END //
DELIMITER ;
-- Usage: CALL GetCategoryCountByCreator(2, @count); SELECT @count;
-- 4. Window Functions (3 Queries)

-- Row number categories by created_at
SELECT category_id, name, created_at,
       ROW_NUMBER() OVER (ORDER BY created_at) AS row_num
FROM categories;

-- Rank categories by description length within status
SELECT category_id, name, status, LENGTH(description) AS desc_len,
       RANK() OVER (PARTITION BY status ORDER BY LENGTH(description) DESC) AS desc_rank
FROM categories;

-- Lead function to show next category in creation order
SELECT category_id, name, created_at,
       LEAD(name) OVER (ORDER BY created_at) AS next_category
FROM categories;
-- 5. DCL/TCL (3 Queries)

-- DCL: Grant select permission on categories table
GRANT SELECT ON categories TO user1;

-- DCL: Revoke insert permission
REVOKE INSERT ON categories FROM user1;

-- TCL: Transaction for updating category status
START TRANSACTION;
UPDATE categories SET status = 'Inactive' WHERE category_id = 1;
SAVEPOINT sp1;
UPDATE categories SET updated_at = NOW() WHERE category_id = 2;
ROLLBACK TO sp1;  -- Rollback to savepoint
COMMIT;
-- 6. Triggers (3 Queries)

-- AFTER INSERT: Log new category creation in audit_logs
DELIMITER //
CREATE TRIGGER after_category_insert
AFTER INSERT ON categories
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (NEW.created_by, 'INSERT', 'categories', NEW.category_id, 'New category added', NOW());
END //
DELIMITER ;

-- BEFORE UPDATE: Prevent status change to 'Inactive' for main categories
DELIMITER //
CREATE TRIGGER before_category_update
BEFORE UPDATE ON categories
FOR EACH ROW
BEGIN
    IF OLD.parent_id IS NULL AND NEW.status = 'Inactive' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot deactivate main category';
    END IF;
END //
DELIMITER ;

-- AFTER DELETE: Log category deletion
DELIMITER //
CREATE TRIGGER after_category_delete
AFTER DELETE ON categories
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (OLD.created_by, 'DELETE', 'categories', OLD.category_id, 'Category deleted', NOW());
END //
DELIMITER ;
-- ===================================================== CREATE TABLE  6. ORDERS=================================================================================

-- 6. ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    total_amount DECIMAL(10,2),
    order_date DATETIME,
    payment_status VARCHAR(30),
    order_status VARCHAR(30),
    shipping_address VARCHAR(255),
    city VARCHAR(50),
    pincode VARCHAR(10),
    delivery_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
-- =========================================================== INSERT INTO orders ================================================================================


INSERT INTO orders (user_id, total_amount, order_date, payment_status, order_status, shipping_address, city, pincode, delivery_date)
VALUES
(1, 1599.00, '2025-10-01 10:00:00', 'Paid', 'Delivered', '12 Green Street', 'Mumbai', '400001', '2025-10-05 10:00:00'),
(2, 899.00, '2025-10-02 11:15:00', 'Pending', 'Processing', '45 Eco Lane', 'Pune', '411001', '2025-10-06 12:00:00'),
(3, 349.00, '2025-10-03 09:30:00', 'Paid', 'Delivered', '22 Vegan Road', 'Delhi', '110001', '2025-10-07 09:00:00'),
(4, 499.00, '2025-10-03 14:20:00', 'Paid', 'Shipped', '5 Herbal Avenue', 'Kolkata', '700001', '2025-10-08 15:00:00'),
(5, 299.00, '2025-10-04 10:45:00', 'Failed', 'Cancelled', '9 Wellness Street', 'Bangalore', '560001', '2025-10-09 11:00:00'),
(6, 699.00, '2025-10-05 13:15:00', 'Paid', 'Delivered', '21 Nature Road', 'Chennai', '600001', '2025-10-10 13:00:00'),
(7, 199.00, '2025-10-05 16:10:00', 'Paid', 'Delivered', '15 Organic Lane', 'Hyderabad', '500001', '2025-10-11 14:00:00'),
(8, 999.00, '2025-10-06 11:00:00', 'Pending', 'Processing', '16 Eco Park', 'Pune', '411045', '2025-10-12 16:00:00'),
(9, 399.00, '2025-10-06 17:15:00', 'Paid', 'Shipped', '18 Leafy Street', 'Kochi', '682001', '2025-10-13 12:00:00'),
(10, 1499.00, '2025-10-07 09:50:00', 'Paid', 'Delivered', '7 Plant Lane', 'Indore', '452001', '2025-10-14 10:00:00'),
(11, 249.00, '2025-10-07 14:55:00', 'Pending', 'Processing', '9 Green Villa', 'Lucknow', '226001', '2025-10-15 11:00:00'),
(12, 199.00, '2025-10-08 09:10:00', 'Paid', 'Delivered', '31 Bloom Street', 'Surat', '395001', '2025-10-16 10:00:00'),
(13, 799.00, '2025-10-08 16:45:00', 'Paid', 'Delivered', '56 Vegan Plaza', 'Patna', '800001', '2025-10-17 14:00:00'),
(14, 349.00, '2025-10-09 10:00:00', 'Pending', 'Processing', '32 Earth Lane', 'Bhopal', '462001', '2025-10-18 12:00:00'),
(15, 149.00, '2025-10-09 14:10:00', 'Paid', 'Delivered', '1 Plantbase Road', 'Nagpur', '440001', '2025-10-19 10:00:00'),
(16, 399.00, '2025-10-10 13:55:00', 'Failed', 'Cancelled', '8 Fresh Street', 'Ahmedabad', '380001', '2025-10-20 12:00:00'),
(17, 699.00, '2025-10-10 11:45:00', 'Paid', 'Shipped', '20 Eco Street', 'Delhi', '110002', '2025-10-21 15:00:00'),
(18, 249.00, '2025-10-11 09:20:00', 'Paid', 'Delivered', '2 Organic Road', 'Mumbai', '400002', '2025-10-22 10:00:00'),
(19, 399.00, '2025-10-11 10:35:00', 'Pending', 'Processing', '3 Wellness Lane', 'Chennai', '600002', '2025-10-23 11:00:00'),
(20, 299.00, '2025-10-12 12:00:00', 'Paid', 'Delivered', '11 Vegan Road', 'Goa', '403001', '2025-10-24 13:00:00');

-- ========================================= QUERIES ===============================================================================================================

-- A — JOINS (5 queries)
-- A1: INNER JOIN - List orders with the user name (assumes users(user_id, first_name, last_name))
SELECT o.order_id, o.order_date, CONCAT(u.first_name, ' ', u.last_name) AS customer_name, o.total_amount
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id
ORDER BY o.order_date DESC;

-- A2: LEFT JOIN - All users and their last order (users without orders should appear with NULLs)
SELECT u.user_id, CONCAT(u.first_name, ' ', u.last_name) AS user_name, o.order_id, o.order_date, o.total_amount
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
  AND o.order_date = (
    -- subquery to pick each user's latest order_date
    SELECT MAX(order_date) FROM orders WHERE user_id = u.user_id
  );

-- A3: JOIN with order_items & products - show order totals broken down (assumes order_items(order_id, product_id, qty, price))
SELECT o.order_id, CONCAT(u.first_name,' ',u.last_name) AS customer_name,
       p.product_name, oi.qty, oi.price, (oi.qty * oi.price) AS line_total
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_id = 10; -- example order

-- A4: SELF JOIN on orders - find orders placed by same user on the same day (paired)
SELECT a.order_id AS order_a, b.order_id AS order_b, a.user_id, DATE(a.order_date) AS ord_date
FROM orders a
JOIN orders b ON a.user_id = b.user_id
  AND DATE(a.order_date) = DATE(b.order_date)
  AND a.order_id < b.order_id;

-- A5: CROSS JOIN example - calculate shipping cost combos (example: shipping options table)
-- (assumes shipping_options(option_id, method, base_days, cost))
SELECT o.order_id, so.method, so.base_days, o.total_amount, (o.total_amount + so.cost) AS total_with_shipping
FROM orders o
CROSS JOIN shipping_options so
WHERE o.order_status = 'Processing'
LIMIT 20;

-- B — SUBQUERIES (5 queries)
-- B1: Scalar subquery - show orders greater than average order amount
SELECT order_id, user_id, total_amount
FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

-- B2: Correlated subquery - orders that are larger than the customer's average order
SELECT o.order_id, o.user_id, o.total_amount
FROM orders o
WHERE o.total_amount > (
    SELECT AVG(o2.total_amount)
    FROM orders o2
    WHERE o2.user_id = o.user_id
);

-- B3: IN subquery with grouping - users who placed more than 2 orders
SELECT user_id, COUNT(*) AS total_orders
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 2;

-- B4: EXISTS correlated subquery - orders that have at least one order_items row
SELECT o.order_id, o.user_id, o.total_amount
FROM orders o
WHERE EXISTS (
    SELECT 1 FROM order_items oi WHERE oi.order_id = o.order_id
);

-- B5: Subquery in FROM - daily sales summary
SELECT daily_date, COUNT(*) AS orders_count, SUM(total_amount) AS total_sales
FROM (
    SELECT DATE(order_date) AS daily_date, total_amount
    FROM orders
) daily
GROUP BY daily_date
ORDER BY daily_date DESC;

-- C — BUILT-IN FUNCTION EXAMPLES (5 queries)
-- C1: String functions - normalize and show first 30 chars of address
SELECT order_id, UPPER(city) AS city_upper, CONCAT(SUBSTRING(shipping_address,1,30), '...') AS short_address
FROM orders
WHERE LENGTH(shipping_address) > 30;

-- C2: Date functions - orders placed in last 7 days (relative to NOW())
SELECT order_id, user_id, order_date, DATEDIFF(NOW(), order_date) AS days_ago
FROM orders
WHERE DATEDIFF(NOW(), order_date) <= 7
ORDER BY order_date DESC;

-- C3: Aggregate functions - monthly revenue and avg order
SELECT YEAR(order_date) AS yr, MONTH(order_date) AS mth,
       COUNT(*) AS orders_count, SUM(total_amount) AS total_revenue, ROUND(AVG(total_amount),2) AS avg_order
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY yr DESC, mth DESC;

-- C4: Conditional (CASE) - categorize orders by size
SELECT order_id, total_amount,
  CASE
    WHEN total_amount >= 1000 THEN 'High'
    WHEN total_amount >= 500 THEN 'Medium'
    ELSE 'Low'
  END AS order_band
FROM orders;

-- C5: Numeric rounding and formatting - show totals rounded and with 2 decimals
SELECT order_id, total_amount, FORMAT(total_amount,2) AS total_formatted, ROUND(total_amount,0) AS total_rounded
FROM orders
ORDER BY total_amount DESC
LIMIT 10;

D — USER-DEFINED FUNCTIONS (UDFs) + queries using them (5 queries + 5 function defs)


-- D1: UDF - Calculate expected delivery days (simple business logic)
DELIMITER $$
CREATE FUNCTION udf_expected_delivery_days(order_placed DATETIME, shipping_method VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE days INT;
    IF shipping_method = 'Express' THEN
        SET days = 2;
    ELSEIF shipping_method = 'Standard' THEN
        SET days = 5;
    ELSE
        SET days = 7;
    END IF;
    RETURN days;
END$$
DELIMITER ;

-- D1a: Use udf_expected_delivery_days (assumes orders has a shipping_method column, if not, adapt)
SELECT o.order_id, o.order_date, udf_expected_delivery_days(o.order_date, coalesce(o.shipping_method,'Standard')) AS est_days,
       DATE_ADD(o.order_date, INTERVAL udf_expected_delivery_days(o.order_date, coalesce(o.shipping_method,'Standard')) DAY) AS est_delivery_date
FROM orders o
WHERE o.order_status IN ('Processing','Shipped');

-- D2: UDF - Calculate order tax (e.g., 5% or 12% based on amount)
DELIMITER $$
CREATE FUNCTION udf_calc_tax(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    IF amount >= 1000 THEN
       RETURN ROUND(amount * 0.12, 2);
    ELSE
       RETURN ROUND(amount * 0.05, 2);
    END IF;
END$$
DELIMITER ;

-- D2a: Use udf_calc_tax to show tax & total_with_tax
SELECT order_id, total_amount, udf_calc_tax(total_amount) AS tax_amount,
       ROUND(total_amount + udf_calc_tax(total_amount),2) AS total_with_tax
FROM orders
ORDER BY total_amount DESC LIMIT 20;

-- D3: UDF - Friendly order status (map internal codes to user-friendly)
DELIMITER $$
CREATE FUNCTION udf_friendly_status(in_status VARCHAR(30))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE out_status VARCHAR(50);
    CASE in_status
        WHEN 'Pending' THEN SET out_status='Awaiting Payment / Confirmation';
        WHEN 'Processing' THEN SET out_status='Preparing your order';
        WHEN 'Shipped' THEN SET out_status='On the way';
        WHEN 'Delivered' THEN SET out_status='Delivered';
        WHEN 'Cancelled' THEN SET out_status='Order Cancelled';
        ELSE SET out_status='Status Unknown';
    END CASE;
    RETURN out_status;
END$$
DELIMITER ;

-- D3a: Use udf_friendly_status
SELECT order_id, order_status, udf_friendly_status(order_status) AS user_message FROM orders
WHERE order_status IN ('Pending','Processing','Shipped','Delivered','Cancelled');

-- D4: UDF - Days between order and delivery (handles NULL delivery_date)
DELIMITER $$
CREATE FUNCTION udf_days_to_delivery(o_date DATETIME, d_date DATETIME)
RETURNS INT
DETERMINISTIC
BEGIN
    IF d_date IS NULL THEN
        RETURN NULL;
    ELSE
        RETURN DATEDIFF(d_date, o_date);
    END IF;
END$$
DELIMITER ;

-- D4a: Use udf_days_to_delivery to analyze delivery performance
SELECT order_id, order_date, delivery_date, udf_days_to_delivery(order_date, delivery_date) AS days_to_deliver
FROM orders
WHERE delivery_date IS NOT NULL
ORDER BY days_to_deliver ASC;

-- D5: UDF - Loyalty points based on order amount (simple tier logic)
DELIMITER $$
CREATE FUNCTION udf_loyalty_points(amount DECIMAL(10,2))
RETURNS INT
DETERMINISTIC
BEGIN
    IF amount >= 2000 THEN
        RETURN 200;
    ELSEIF amount >= 1000 THEN
        RETURN 100;
    ELSEIF amount >= 500 THEN
        RETURN 25;
    ELSE
        RETURN 5;
    END IF;
END$$
DELIMITER ;

-- D5a: Award points for recent month
SELECT order_id, user_id, total_amount, udf_loyalty_points(total_amount) AS points_awarded
FROM orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);


-- Table: orders
-- 1. Views (4 Queries)

-- Simple view for delivered orders
CREATE VIEW DeliveredOrders AS
SELECT order_id, user_id, total_amount, order_date, delivery_date
FROM orders
WHERE order_status = 'Delivered';

-- Complex view with join and aggregation: Orders by user with total spent and order count
CREATE VIEW OrdersByUser AS
SELECT o.user_id, u.full_name, COUNT(o.order_id) AS order_count, SUM(o.total_amount) AS total_spent
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id
GROUP BY o.user_id, u.full_name;

-- View for pending orders
CREATE VIEW PendingOrders AS
SELECT order_id, user_id, total_amount, order_date
FROM orders
WHERE payment_status = 'Pending' OR order_status = 'Processing';

-- View for orders placed in the last 30 days
CREATE VIEW RecentOrders AS
SELECT order_id, user_id, order_date, total_amount
FROM orders
WHERE order_date >= DATE_SUB(NOW(), INTERVAL 30 DAY);
-- 2. Cursors (3 Queries)

-- Cursor to process and display order IDs one by one
DELIMITER //
CREATE PROCEDURE ProcessOrderIDs()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE oid INT;
    DECLARE order_cursor CURSOR FOR SELECT order_id FROM orders;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN order_cursor;
    read_loop: LOOP
        FETCH order_cursor INTO oid;
        IF done THEN LEAVE read_loop; END IF;
        SELECT CONCAT('Processing order: ', oid) AS message;
    END LOOP;
    CLOSE order_cursor;
END //
DELIMITER ;
-- Usage: CALL ProcessOrderIDs();

-- Cursor to update order status for pending orders
DELIMITER //
CREATE PROCEDURE UpdatePendingOrders()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE oid INT;
    DECLARE status_cursor CURSOR FOR SELECT order_id FROM orders WHERE order_status = 'Processing';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN status_cursor;
    update_loop: LOOP
        FETCH status_cursor INTO oid;
        IF done THEN LEAVE update_loop; END IF;
        UPDATE orders SET order_status = 'Shipped' WHERE order_id = oid;
    END LOOP;
    CLOSE status_cursor;
END //
DELIMITER ;
-- Usage: CALL UpdatePendingOrders();

-- Cursor to calculate and display order age (days since order date)
DELIMITER //
CREATE PROCEDURE CalculateOrderAges()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE oid INT, ord_date DATETIME;
    DECLARE age_cursor CURSOR FOR SELECT order_id, order_date FROM orders;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN age_cursor;
    age_loop: LOOP
        FETCH age_cursor INTO oid, ord_date;
        IF done THEN LEAVE age_loop; END IF;
        SELECT oid, DATEDIFF(NOW(), ord_date) AS days_since_order;
    END LOOP;
    CLOSE age_cursor;
END //
DELIMITER ;
-- Usage: CALL CalculateOrderAges();
-- 3. Stored Procedures (4 Queries)

-- Procedure to add a new order
DELIMITER //
CREATE PROCEDURE AddOrder(IN uid INT, IN total DECIMAL(10,2), IN addr VARCHAR(255), IN cty VARCHAR(50))
BEGIN
    INSERT INTO orders (user_id, total_amount, order_date, payment_status, order_status, shipping_address, city, pincode)
    VALUES (uid, total, NOW(), 'Pending', 'Processing', addr, cty, '400001');
END //
DELIMITER ;
-- Usage: CALL AddOrder(1, 599.00, 'New Address', 'Mumbai');

-- Procedure to update order status
DELIMITER //
CREATE PROCEDURE UpdateOrderStatus(IN oid INT, IN new_status VARCHAR(30))
BEGIN
    UPDATE orders SET order_status = new_status WHERE order_id = oid;
END //
DELIMITER ;
-- Usage: CALL UpdateOrderStatus(1, 'Shipped');

-- Procedure to delete cancelled orders
DELIMITER //
CREATE PROCEDURE DeleteCancelledOrders()
BEGIN
    DELETE FROM orders WHERE order_status = 'Cancelled';
END //
DELIMITER ;
-- Usage: CALL DeleteCancelledOrders();

-- Procedure to get order count by user
DELIMITER //
CREATE PROCEDURE GetOrderCountByUser(IN uid INT, OUT cnt INT)
BEGIN
    SELECT COUNT(*) INTO cnt FROM orders WHERE user_id = uid;
END //
DELIMITER ;
-- Usage: CALL GetOrderCountByUser(1, @count); SELECT @count;
-- 4. Window Functions (3 Queries)

-- Row number orders by order_date
SELECT order_id, user_id, order_date,
       ROW_NUMBER() OVER (ORDER BY order_date) AS row_num
FROM orders;

-- Rank orders by total_amount within city
SELECT order_id, city, total_amount,
       RANK() OVER (PARTITION BY city ORDER BY total_amount DESC) AS amount_rank
FROM orders;

-- Lead function to show next order in date order
SELECT order_id, user_id, order_date,
       LEAD(order_id) OVER (ORDER BY order_date) AS next_order_id
FROM orders;
-- 5. DCL/TCL (3 Queries)

-- DCL: Grant select permission on orders table
GRANT SELECT ON orders TO user1;

-- DCL: Revoke update permission
REVOKE UPDATE ON orders FROM user1;

-- TCL: Transaction for updating order payment status
START TRANSACTION;
UPDATE orders SET payment_status = 'Paid' WHERE order_id = 1;
SAVEPOINT sp1;
UPDATE orders SET order_status = 'Delivered' WHERE order_id = 2;
ROLLBACK TO sp1;  -- Rollback to savepoint
COMMIT;
-- 6. Triggers (3 Queries)

-- AFTER INSERT: Log new order creation in audit_logs
DELIMITER //
CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (NEW.user_id, 'INSERT', 'orders', NEW.order_id, 'New order placed', NOW());
END //
DELIMITER ;

-- BEFORE UPDATE: Prevent order status change to 'Cancelled' if payment is 'Paid'
DELIMITER //
CREATE TRIGGER before_order_update
BEFORE UPDATE ON orders
FOR EACH ROW
BEGIN
    IF OLD.payment_status = 'Paid' AND NEW.order_status = 'Cancelled' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot cancel paid order';
    END IF;
END //
DELIMITER ;

-- AFTER DELETE: Log order deletion
DELIMITER //
CREATE TRIGGER after_order_delete
AFTER DELETE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
    VALUES (OLD.user_id, 'DELETE', 'orders', OLD.order_id, 'Order deleted', NOW());
END //
DELIMITER ;

SELECT * FROM orders;

TRUNCATE TABLE orders;

DROP TABLE orders;
--  ========================================================== CREATE   TABLE  7. ORDER_ITEMS=======================================================================





-- 7. ORDER_ITEMS
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    discount DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- =================================================== INSERT INTO order_items =========================================================================================

INSERT INTO order_items (order_id, product_id, quantity, price, discount, subtotal, created_at, updated_at)
VALUES
(1, 1, 2, 199.00, 0.00, 398.00, '2025-10-01 10:05:00', '2025-10-01 10:05:00'),
(1, 4, 3, 349.00, 20.00, 1027.00, '2025-10-01 10:10:00', '2025-10-01 10:10:00'),
(2, 3, 1, 149.00, 0.00, 149.00, '2025-10-02 11:20:00', '2025-10-02 11:20:00'),
(2, 5, 1, 699.00, 50.00, 649.00, '2025-10-02 11:25:00', '2025-10-02 11:25:00'),
(3, 2, 1, 999.00, 100.00, 899.00, '2025-10-03 09:35:00', '2025-10-03 09:35:00'),
(4, 6, 2, 299.00, 0.00, 598.00, '2025-10-03 14:25:00', '2025-10-03 14:25:00'),
(5, 10, 1, 1499.00, 200.00, 1299.00, '2025-10-04 10:50:00', '2025-10-04 10:50:00'),
(6, 9, 1, 399.00, 0.00, 399.00, '2025-10-05 13:20:00', '2025-10-05 13:20:00'),
(7, 8, 2, 999.00, 100.00, 1898.00, '2025-10-05 16:15:00', '2025-10-05 16:15:00'),
(8, 7, 1, 499.00, 0.00, 499.00, '2025-10-06 11:05:00', '2025-10-06 11:05:00'),
(9, 12, 1, 1499.00, 0.00, 1499.00, '2025-10-06 17:20:00', '2025-10-06 17:20:00'),
(10, 11, 1, 249.00, 0.00, 249.00, '2025-10-07 09:55:00', '2025-10-07 09:55:00'),
(11, 14, 2, 299.00, 50.00, 548.00, '2025-10-07 15:00:00', '2025-10-07 15:00:00'),
(12, 13, 1, 799.00, 100.00, 699.00, '2025-10-08 09:15:00', '2025-10-08 09:15:00'),
(13, 15, 3, 199.00, 0.00, 597.00, '2025-10-08 16:50:00', '2025-10-08 16:50:00'),
(14, 16, 2, 399.00, 50.00, 748.00, '2025-10-09 10:05:00', '2025-10-09 10:05:00'),
(15, 17, 1, 149.00, 0.00, 149.00, '2025-10-09 14:15:00', '2025-10-09 14:15:00'),
(16, 18, 2, 249.00, 0.00, 498.00, '2025-10-10 14:00:00', '2025-10-10 14:00:00'),
(17, 19, 1, 399.00, 50.00, 349.00, '2025-10-10 11:50:00', '2025-10-10 11:50:00'),
(18, 20, 2, 299.00, 0.00, 598.00, '2025-10-11 09:25:00', '2025-10-11 09:25:00');

-- ========================================= QUERIES ===============================================================================================================
SELECT * FROM order_items;

TRUNCATE TABLE order_items;

DROP TABLE order_items;


-- 🟢 TABLE 6: orders
-- 🔹 1️⃣ JOINS (6 Queries)
-- 1. INNER JOIN: Show each order along with the customer name
SELECT o.order_id, u.username, o.total_amount, o.order_status
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id;

-- 2. LEFT JOIN: Show all users even if they have not placed any orders
SELECT u.username, o.order_id, o.total_amount
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id;

-- 3. RIGHT JOIN: Show all orders even if user data is missing
SELECT o.order_id, u.username, o.total_amount
FROM users u
RIGHT JOIN orders o ON u.user_id = o.user_id;

-- 4. INNER JOIN with order_items: Get order and item details together
SELECT o.order_id, i.product_id, i.quantity, i.subtotal
FROM orders o
INNER JOIN order_items i ON o.order_id = i.order_id;

-- 5. CROSS JOIN: Pair each city with all payment statuses
SELECT DISTINCT o.city, s.payment_status
FROM orders o
CROSS JOIN (SELECT DISTINCT payment_status FROM orders) s;

-- 6. SELF JOIN: Find orders from the same city but different users
SELECT a.order_id AS OrderA, b.order_id AS OrderB, a.city
FROM orders a
JOIN orders b ON a.city = b.city AND a.order_id <> b.order_id;

-- 🔹 2️⃣ SUBQUERIES (6 Queries)
-- 7. Find users who placed orders above the average order value
SELECT user_id, total_amount
FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

-- 8. Find the city with the highest total order amount
SELECT city
FROM orders
GROUP BY city
ORDER BY SUM(total_amount) DESC
LIMIT 1;

-- 9. Scalar subquery: Show each order with average order value
SELECT order_id, total_amount,
(SELECT AVG(total_amount) FROM orders) AS AvgOrderValue
FROM orders;

-- 10. Correlated subquery: Find users with more than one order
SELECT u.username
FROM users u
WHERE (SELECT COUNT(*) FROM orders o WHERE o.user_id = u.user_id) > 1;

-- 11. Subquery using IN: Show orders placed by users from Mumbai
SELECT order_id, total_amount
FROM orders
WHERE user_id IN (SELECT user_id FROM users WHERE city = 'Mumbai');

-- 12. Subquery in FROM: Find total orders and total revenue
SELECT COUNT(order_id) AS TotalOrders, SUM(total_amount) AS TotalRevenue
FROM (SELECT * FROM orders WHERE payment_status = 'Paid') AS paid_orders;

-- 🔹 3️⃣ BUILT-IN FUNCTIONS (5 Queries)
-- 13. String function: Convert order_status to uppercase
SELECT order_id, UPPER(order_status) AS Status FROM orders;

-- 14. Date function: Calculate delivery time in days
SELECT order_id, DATEDIFF(delivery_date, order_date) AS DeliveryDays FROM orders;

-- 15. Aggregate: Find total sales by city
SELECT city, SUM(total_amount) AS CitySales FROM orders GROUP BY city;

-- 16. ROUND function: Show total amount rounded to nearest 100
SELECT order_id, ROUND(total_amount, -2) AS RoundedAmount FROM orders;

-- 17. CONCAT: Display full address
SELECT order_id, CONCAT(shipping_address, ', ', city, ' - ', pincode) AS FullAddress FROM orders;

-- 🔹 4️⃣ USER-DEFINED FUNCTIONS (UDFs) (3 Queries)
-- 18. UDF: Calculate total revenue from all orders
DELIMITER //
CREATE FUNCTION TotalRevenue()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(total_amount) INTO total FROM orders WHERE payment_status='Paid';
    RETURN total;
END //
DELIMITER ;

SELECT TotalRevenue() AS Total_Paid_Revenue;

-- 19. UDF: Calculate number of paid orders for a given user
DELIMITER //
CREATE FUNCTION PaidOrdersByUser(uid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE order_count INT;
    SELECT COUNT(*) INTO order_count FROM orders WHERE user_id = uid AND payment_status='Paid';
    RETURN order_count;
END //
DELIMITER ;

SELECT username, PaidOrdersByUser(user_id) AS PaidOrders FROM users;

-- 20. UDF: Find total delay between order date and delivery
DELIMITER //
CREATE FUNCTION OrderDelay(orderid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE days_diff INT;
    SELECT DATEDIFF(delivery_date, order_date) INTO days_diff FROM orders WHERE order_id = orderid;
    RETURN days_diff;
END //
DELIMITER ;

SELECT order_id, OrderDelay(order_id) AS DeliveryDelayDays FROM orders;

-- 🟢 TABLE 7: order_items
-- 🔹 1️⃣ JOINS (6 Queries)
-- 1. INNER JOIN: Combine orders with order_items
SELECT o.order_id, i.product_id, i.quantity, i.subtotal
FROM orders o
INNER JOIN order_items i ON o.order_id = i.order_id;

-- 2. INNER JOIN: Combine order_items with products
SELECT i.item_id, p.name AS ProductName, i.price, i.quantity
FROM order_items i
INNER JOIN products p ON i.product_id = p.product_id;

-- 3. LEFT JOIN: Show all orders even without items
SELECT o.order_id, i.item_id
FROM orders o
LEFT JOIN order_items i ON o.order_id = i.order_id;

-- 4. RIGHT JOIN: Show all products and their order quantities
SELECT p.name, i.quantity
FROM products p
RIGHT JOIN order_items i ON p.product_id = i.product_id;

-- 5. INNER JOIN with users: Show user who placed each order item
SELECT u.username, i.product_id, i.subtotal
FROM order_items i
INNER JOIN orders o ON i.order_id = o.order_id
INNER JOIN users u ON o.user_id = u.user_id;

-- 6. SELF JOIN: Find order items from same order but different products
SELECT a.item_id AS Item1, b.item_id AS Item2, a.order_id
FROM order_items a
JOIN order_items b ON a.order_id = b.order_id AND a.item_id <> b.item_id;

-- 🔹 2️⃣ SUBQUERIES (6 Queries)
-- 7. Find items with price greater than average price
SELECT item_id, price
FROM order_items
WHERE price > (SELECT AVG(price) FROM order_items);

-- 8. Show products that have been ordered more than once
SELECT product_id
FROM order_items
GROUP BY product_id
HAVING COUNT(order_id) > 1;

-- 9. Scalar subquery: Show each item with overall average discount
SELECT item_id, discount,
(SELECT AVG(discount) FROM order_items) AS AvgDiscount
FROM order_items;

-- 10. Correlated subquery: Find orders with total items > 2
SELECT DISTINCT order_id
FROM order_items a
WHERE (SELECT COUNT(*) FROM order_items b WHERE b.order_id = a.order_id) > 2;

-- 11. Subquery in FROM: Find total sales per product
SELECT product_id, SUM(subtotal) AS TotalSales
FROM order_items
GROUP BY product_id;

-- 12. Subquery using IN: Show items from orders in 'Mumbai'
SELECT item_id, price
FROM order_items
WHERE order_id IN (SELECT order_id FROM orders WHERE city = 'Mumbai');

-- 🔹 3️⃣ BUILT-IN FUNCTIONS (5 Queries)
-- 13. String + Numeric: Show formatted price with currency
SELECT item_id, CONCAT('₹', FORMAT(price,2)) AS PriceDisplay FROM order_items;

-- 14. ROUND and SUM: Calculate rounded total revenue
SELECT ROUND(SUM(subtotal), 2) AS TotalRevenue FROM order_items;

-- 15. Date function: Find how many days since item was added
SELECT item_id, DATEDIFF(NOW(), created_at) AS DaysSinceAdded FROM order_items;

-- 16. Aggregate: Average discount across all products
SELECT AVG(discount) AS AvgDiscount FROM order_items;

-- 17. CONCAT: Combine product ID and quantity as string
SELECT CONCAT('Product-', product_id, ': ', quantity, ' pcs') AS ProductDetails FROM order_items;

-- 🔹 4️⃣ USER-DEFINED FUNCTIONS (UDFs) (3 Queries)
-- 18. UDF: Calculate total subtotal of all order_items
DELIMITER //
CREATE FUNCTION TotalItemRevenue()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(subtotal) INTO total FROM order_items;
    RETURN total;
END //
DELIMITER ;

SELECT TotalItemRevenue() AS TotalItemRevenue;

-- 19. UDF: Get discount percentage of a specific item
DELIMITER //
CREATE FUNCTION DiscountPercent(item INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE percent DECIMAL(5,2);
    SELECT (discount / price) * 100 INTO percent FROM order_items WHERE item_id = item;
    RETURN percent;
END //
DELIMITER ;

SELECT item_id, DiscountPercent(item_id) AS DiscountPercent FROM order_items;

-- 20. UDF: Calculate total value for a given order_id
DELIMITER //
CREATE FUNCTION OrderTotalAmount(oid INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(subtotal) INTO total FROM order_items WHERE order_id = oid;
    RETURN total;
END //
DELIMITER ;

SELECT order_id, OrderTotalAmount(order_id) AS TotalAmount FROM order_items;


-- 1–4. Views (4)
-- 1) Simple view: order items with order summary info
CREATE OR REPLACE VIEW v_order_items_summary AS
SELECT oi.item_id, oi.order_id, o.user_id, oi.product_id, oi.quantity, oi.price, oi.discount, oi.subtotal, o.order_date
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id;

-- 2) View: order totals (computed from order_items) per order
CREATE OR REPLACE VIEW v_order_totals AS
SELECT oi.order_id,
       SUM(oi.subtotal) AS items_total,
       COUNT(*) AS item_count
FROM order_items oi
GROUP BY oi.order_id;

-- 3) View: top discounted items (items where discount > 0)
CREATE OR REPLACE VIEW v_discounted_items AS
SELECT oi.item_id, oi.order_id, oi.product_id, oi.quantity, oi.price, oi.discount, oi.subtotal
FROM order_items oi
WHERE oi.discount > 0;

-- 4) Complex view: order with totals and shipping/payment status from orders
CREATE OR REPLACE VIEW v_orders_full AS
SELECT o.order_id, o.user_id, o.order_date, o.payment_status, o.order_status,
       ot.items_total, ot.item_count
FROM orders o
LEFT JOIN v_order_totals ot ON o.order_id = ot.order_id;

-- 5–7. Cursors (3)

-- (Useful when you must process rows one-by-one — prefer set-based operations if possible.)

-- 5) Cursor example: iterate order_items of a given order and print (select) each row
DELIMITER $$
CREATE PROCEDURE proc_print_order_items(IN p_order_id INT)
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_item_id INT;
  DECLARE v_product_id INT;
  DECLARE v_qty INT;
  DECLARE cur1 CURSOR FOR
    SELECT item_id, product_id, quantity FROM order_items WHERE order_id = p_order_id;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur1;
  read_loop: LOOP
    FETCH cur1 INTO v_item_id, v_product_id, v_qty;
    IF done THEN
      LEAVE read_loop;
    END IF;
    -- For demonstration: output row with SELECT (some clients will show it)
    SELECT CONCAT('Item:', v_item_id, ' Product:', v_product_id, ' Qty:', v_qty) AS item_info;
  END LOOP;
  CLOSE cur1;
END $$
DELIMITER ;

-- 6) Cursor example: accumulate subtotal and return total via OUT parameter
DELIMITER $$
CREATE PROCEDURE proc_calc_order_items_total(IN p_order_id INT, OUT p_total DECIMAL(10,2))
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_sub DECIMAL(10,2);
  DECLARE v_total DECIMAL(10,2) DEFAULT 0.00;
  DECLARE cur2 CURSOR FOR SELECT subtotal FROM order_items WHERE order_id = p_order_id;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur2;
  read_loop: LOOP
    FETCH cur2 INTO v_sub;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SET v_total = v_total + IFNULL(v_sub, 0.00);
  END LOOP;
  CLOSE cur2;
  SET p_total = v_total;
END $$
DELIMITER ;

-- 7) Cursor example: update items one-by-one (example: if a legacy business rule)
DELIMITER $$
CREATE PROCEDURE proc_fix_negative_subtotals()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_qty INT;
  DECLARE v_price DECIMAL(10,2);
  DECLARE v_discount DECIMAL(10,2);
  DECLARE cur3 CURSOR FOR
    SELECT item_id, quantity, price, discount FROM order_items WHERE subtotal < 0;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur3;
  read_loop: LOOP
    FETCH cur3 INTO v_id, v_qty, v_price, v_discount;
    IF done THEN
      LEAVE read_loop;
    END IF;
    -- Example fix: recalc subtotal = (price*quantity - discount)
    UPDATE order_items
    SET subtotal = (v_price * v_qty) - IFNULL(v_discount,0)
    WHERE item_id = v_id;
  END LOOP;
  CLOSE cur3;
END $$
DELIMITER ;

-- 8–11. Stored procedures (4)
-- 8) Insert order item and update corresponding order total (transaction-safe)
DELIMITER $$
CREATE PROCEDURE sp_add_order_item(
  IN p_order_id INT,
  IN p_product_id INT,
  IN p_quantity INT,
  IN p_price DECIMAL(10,2),
  IN p_discount DECIMAL(10,2)
)
BEGIN
  DECLARE v_subtotal DECIMAL(10,2);
  START TRANSACTION;
    SET v_subtotal = (p_price * p_quantity) - IFNULL(p_discount,0);
    INSERT INTO order_items (order_id, product_id, quantity, price, discount, subtotal, created_at, updated_at)
    VALUES (p_order_id, p_product_id, p_quantity, p_price, p_discount, v_subtotal, NOW(), NOW());

    -- Optionally update orders.total_amount if that column exists
    UPDATE orders
    SET total_amount = IFNULL(total_amount,0) + v_subtotal
    WHERE order_id = p_order_id;
  COMMIT;
END $$
DELIMITER ;

-- 9) Procedure to update an item quantity and recalc subtotal
DELIMITER $$
CREATE PROCEDURE sp_update_item_quantity(
  IN p_item_id INT,
  IN p_new_qty INT
)
BEGIN
  DECLARE v_price DECIMAL(10,2);
  DECLARE v_discount DECIMAL(10,2);
  DECLARE v_order_id INT;
  DECLARE v_new_sub DECIMAL(10,2);

  SELECT price, discount, order_id INTO v_price, v_discount, v_order_id FROM order_items WHERE item_id = p_item_id;
  START TRANSACTION;
    SET v_new_sub = (v_price * p_new_qty) - IFNULL(v_discount,0);
    UPDATE order_items
      SET quantity = p_new_qty, subtotal = v_new_sub, updated_at = NOW()
      WHERE item_id = p_item_id;

    -- Recompute order total safely
    UPDATE orders o
    JOIN (SELECT order_id, SUM(subtotal) AS new_total FROM order_items WHERE order_id = v_order_id GROUP BY order_id) t
      ON o.order_id = t.order_id
    SET o.total_amount = t.new_total;
  COMMIT;
END $$
DELIMITER ;

-- 10) Procedure to remove an item and return new order total as OUT
DELIMITER $$
CREATE PROCEDURE sp_delete_item_and_get_total(IN p_item_id INT, OUT p_new_total DECIMAL(10,2))
BEGIN
  DECLARE v_order_id INT;
  SELECT order_id INTO v_order_id FROM order_items WHERE item_id = p_item_id;
  START TRANSACTION;
    DELETE FROM order_items WHERE item_id = p_item_id;
    SELECT IFNULL(SUM(subtotal),0.00) INTO p_new_total FROM order_items WHERE order_id = v_order_id;
    UPDATE orders SET total_amount = p_new_total WHERE order_id = v_order_id;
  COMMIT;
END $$
DELIMITER ;

-- 11) A read-only procedure to fetch paginated items for an order (useful for API)
DELIMITER $$
CREATE PROCEDURE sp_get_order_items_page(IN p_order_id INT, IN p_offset INT, IN p_limit INT)
BEGIN
  SELECT item_id, product_id, quantity, price, discount, subtotal, created_at
  FROM order_items
  WHERE order_id = p_order_id
  ORDER BY item_id
  LIMIT p_offset, p_limit;
END $$
DELIMITER ;

-- 12–15. Window functions / analytic queries (4)

-- (Requires MySQL 8.0+ / MariaDB 10.2+ features)

-- 12) Rank products by total qty sold (overall)
SELECT product_id,
       SUM(quantity) AS total_qty,
       RANK() OVER (ORDER BY SUM(quantity) DESC) AS qty_rank
FROM order_items
GROUP BY product_id
ORDER BY total_qty DESC;

-- 13) Running total per order sorted by item created_at
SELECT order_id, item_id, created_at, subtotal,
       SUM(subtotal) OVER (PARTITION BY order_id ORDER BY created_at ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM order_items
ORDER BY order_id, created_at;

-- 14) Row number of items per order (useful to pick first N items)
SELECT item_id, order_id, product_id, quantity,
       ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY item_id) AS rn
FROM order_items;

-- 15) Percentile of subtotal within each order (what share each item contributes)
SELECT order_id, item_id, subtotal,
       subtotal / SUM(subtotal) OVER (PARTITION BY order_id) AS pct_of_order
FROM order_items;

-- 16–18. DCL / TCL examples (3)
-- 16) DCL: grant read-only access to a reporting user (example)
GRANT SELECT ON your_database.order_items TO 'report_user'@'%' ;

-- 17) DCL: revoke insert/update privileges from a role/user
REVOKE INSERT, UPDATE ON your_database.order_items FROM 'limited_user'@'localhost';

-- 18) TCL (transaction control): safe order creation + rollback demo
START TRANSACTION;
  -- hypothetical updates/inserts
  INSERT INTO orders (user_id, total_amount, order_date, payment_status, order_status, created_at)
    VALUES (123, 0.00, NOW(), 'Pending', 'Processing', NOW());

  -- get last order id (MySQL session variable)
  SET @last_order_id = LAST_INSERT_ID();

  INSERT INTO order_items (order_id, product_id, quantity, price, discount, subtotal, created_at)
    VALUES (@last_order_id, 5, 2, 199.00, 0.00, 398.00, NOW());

  -- Suppose a validation failure occurs:
  -- ROLLBACK; -- uncomment to revert
COMMIT;
--  ========================================================== CREATE  TABLE 8. PAYMENTS =======================================================================

-- 8. PAYMENTS
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    user_id INT,
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    payment_date DATETIME,
    transaction_id VARCHAR(100),
    payment_status VARCHAR(30),
    remarks TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- ======================================================= INSERT INTO payments =================================================================================

INSERT INTO payments (order_id, user_id, payment_method, amount, payment_date, transaction_id, payment_status, remarks)
VALUES
(1, 1, 'Credit Card', 1599.00, '2025-10-01 10:10:00', 'TXN10001', 'Paid', 'Payment successful'),
(2, 2, 'UPI', 899.00, '2025-10-02 11:30:00', 'TXN10002', 'Pending', 'Awaiting confirmation'),
(3, 3, 'Debit Card', 349.00, '2025-10-03 09:40:00', 'TXN10003', 'Paid', 'Payment completed'),
(4, 4, 'Net Banking', 499.00, '2025-10-03 14:30:00', 'TXN10004', 'Paid', 'Payment processed'),
(5, 5, 'UPI', 299.00, '2025-10-04 11:00:00', 'TXN10005', 'Failed', 'Transaction declined'),
(6, 6, 'Credit Card', 699.00, '2025-10-05 13:25:00', 'TXN10006', 'Paid', 'Payment successful'),
(7, 7, 'PayPal', 199.00, '2025-10-05 16:20:00', 'TXN10007', 'Paid', 'Payment completed'),
(8, 8, 'UPI', 999.00, '2025-10-06 11:10:00', 'TXN10008', 'Pending', 'Awaiting confirmation'),
(9, 9, 'Debit Card', 399.00, '2025-10-06 17:30:00', 'TXN10009', 'Paid', 'Payment successful'),
(10, 10, 'Net Banking', 1499.00, '2025-10-07 10:00:00', 'TXN10010', 'Paid', 'Transaction completed'),
(11, 11, 'UPI', 249.00, '2025-10-07 15:05:00', 'TXN10011', 'Pending', 'Awaiting payment'),
(12, 12, 'Credit Card', 199.00, '2025-10-08 09:20:00', 'TXN10012', 'Paid', 'Payment successful'),
(13, 13, 'Debit Card', 799.00, '2025-10-08 16:55:00', 'TXN10013', 'Paid', 'Payment completed'),
(14, 14, 'PayPal', 349.00, '2025-10-09 10:10:00', 'TXN10014', 'Pending', 'Awaiting confirmation'),
(15, 15, 'Credit Card', 149.00, '2025-10-09 14:20:00', 'TXN10015', 'Paid', 'Payment successful'),
(16, 16, 'UPI', 399.00, '2025-10-10 14:05:00', 'TXN10016', 'Failed', 'Transaction declined'),
(17, 17, 'Debit Card', 699.00, '2025-10-10 11:55:00', 'TXN10017', 'Paid', 'Payment successful'),
(18, 18, 'Net Banking', 249.00, '2025-10-11 09:30:00', 'TXN10018', 'Paid', 'Payment completed'),
(19, 19, 'UPI', 399.00, '2025-10-11 10:40:00', 'TXN10019', 'Pending', 'Awaiting confirmation'),
(20, 20, 'Credit Card', 299.00, '2025-10-12 12:10:00', 'TXN10020', 'Paid', 'Payment successful');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM payments  ;

TRUNCATE TABLE payments;

DROP TABLE payments;

-- 🔹 1️⃣ JOIN QUERIES (5 Queries)
-- 1. INNER JOIN: Get payment details along with corresponding order info
SELECT p.payment_id, o.order_date, p.amount, p.payment_status
FROM payments p
INNER JOIN orders o ON p.order_id = o.order_id;

-- 2. LEFT JOIN: Show all orders and their payment status (even unpaid)
SELECT o.order_id, o.total_amount, p.payment_status
FROM orders o
LEFT JOIN payments p ON o.order_id = p.order_id;

-- 3. RIGHT JOIN: Show all payments with corresponding order city details
SELECT p.payment_id, p.amount, o.city
FROM payments p
RIGHT JOIN orders o ON p.order_id = o.order_id;

-- 4. SELF JOIN: Compare payments made using the same method
SELECT a.payment_id AS PaymentA, b.payment_id AS PaymentB, a.payment_method
FROM payments a
JOIN payments b ON a.payment_method = b.payment_method
WHERE a.payment_id <> b.payment_id
ORDER BY a.payment_method;

-- 5. CROSS JOIN: Generate all possible combinations of payment methods and statuses
SELECT DISTINCT p1.payment_method, p2.payment_status
FROM payments p1
CROSS JOIN payments p2;

-- 🔹 2️⃣ SUBQUERY QUERIES (5 Queries)
-- 6. Scalar Subquery: Find payments greater than the average payment amount
SELECT payment_id, amount
FROM payments
WHERE amount > (SELECT AVG(amount) FROM payments);

-- 7. Subquery in WHERE: Find users who made successful payments
SELECT user_id, payment_method, payment_status
FROM payments
WHERE user_id IN (SELECT DISTINCT user_id FROM payments WHERE payment_status = 'Paid');

-- 8. Subquery with IN: Find all orders with 'Pending' payments
SELECT order_id, total_amount
FROM orders
WHERE order_id IN (SELECT order_id FROM payments WHERE payment_status = 'Pending');

-- 9. Correlated Subquery: Find payments that are the highest per user
SELECT payment_id, user_id, amount
FROM payments p1
WHERE amount = (
    SELECT MAX(amount) FROM payments p2 WHERE p2.user_id = p1.user_id
);

-- 10. Subquery in FROM: Show average amount grouped by payment method
SELECT payment_method, ROUND(AVG(amount),2) AS avg_amount
FROM payments
GROUP BY payment_method;

-- 🔹 3️⃣ BUILT-IN FUNCTION QUERIES (5 Queries)
-- 11. String Function: Show transaction ID in uppercase
SELECT UPPER(transaction_id) AS TransactionCode FROM payments;

-- 12. Numeric Function: Round off payment amounts to nearest whole number
SELECT payment_id, amount, ROUND(amount) AS RoundedAmount FROM payments;

-- 13. Date Function: Calculate how many days ago the payment was made
SELECT payment_id, DATEDIFF(CURDATE(), payment_date) AS DaysSincePayment FROM payments;

-- 14. Aggregate Function: Total revenue from successful payments
SELECT SUM(amount) AS TotalRevenue FROM payments WHERE payment_status = 'Paid';

-- 15. String + CONCAT: Combine payment method and status into one column
SELECT CONCAT(payment_method, ' - ', payment_status) AS PaymentDetails FROM payments;

🔹 4️⃣ USER-DEFINED FUNCTION (UDF) QUERIES (5 Queries)
(Create functions once, then use them)
-- 16. UDF to calculate transaction charge (2% of amount)
DELIMITER //
CREATE FUNCTION CalcTransactionCharge(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
RETURN amount * 0.02;
//
DELIMITER ;

-- Use the UDF
SELECT payment_id, amount, CalcTransactionCharge(amount) AS TransactionCharge FROM payments;

-- 17. UDF to check if payment is successful or not
DELIMITER //
CREATE FUNCTION CheckPaymentStatus(status VARCHAR(30))
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN IF(status = 'Paid', 'Successful Payment', 'Unsuccessful Payment');
//
DELIMITER ;

SELECT payment_id, payment_status, CheckPaymentStatus(payment_status) AS StatusReport FROM payments;

-- 18. UDF to calculate total with GST (18%)
DELIMITER //
CREATE FUNCTION AddGST(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
RETURN amount * 1.18;
//
DELIMITER ;

SELECT payment_id, amount, AddGST(amount) AS TotalWithGST FROM payments;

-- 19. UDF to classify payments by size
DELIMITER //
CREATE FUNCTION PaymentCategory(amount DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
RETURN CASE
    WHEN amount < 300 THEN 'Low'
    WHEN amount BETWEEN 300 AND 800 THEN 'Medium'
    ELSE 'High'
END;
//
DELIMITER ;

SELECT payment_id, amount, PaymentCategory(amount) AS PaymentRange FROM payments;

-- 20. UDF to calculate yearly equivalent amount (assuming monthly recurring)
DELIMITER //
CREATE FUNCTION YearlyEquivalent(amount DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
RETURN amount * 12;
//
DELIMITER ;

SELECT payment_id, amount, YearlyEquivalent(amount) AS AnnualValue FROM payments;


-- 🔹 1–4: Views
-- 1️⃣ View: All successful payments
CREATE OR REPLACE VIEW v_successful_payments AS
SELECT payment_id, order_id, user_id, payment_method, amount, payment_date, transaction_id
FROM payments
WHERE payment_status = 'Paid';

-- 2️⃣ View: Pending or Failed payments (for finance team follow-up)
CREATE OR REPLACE VIEW v_failed_pending_payments AS
SELECT payment_id, user_id, payment_status, remarks, payment_date
FROM payments
WHERE payment_status IN ('Pending', 'Failed');

-- 3️⃣ View: Join with orders to show order status and payment details
CREATE OR REPLACE VIEW v_order_payment_details AS
SELECT p.payment_id, p.order_id, o.order_status, p.user_id, p.payment_method,
       p.amount, p.payment_status, p.payment_date
FROM payments p
JOIN orders o ON p.order_id = o.order_id;

-- 4️⃣ View: Total paid amount per payment method
CREATE OR REPLACE VIEW v_total_by_method AS
SELECT payment_method, SUM(amount) AS total_amount, COUNT(*) AS total_transactions
FROM payments
WHERE payment_status = 'Paid'
GROUP BY payment_method;

-- 🔹 5–7: Cursors
-- 5️⃣ Cursor: Display all payment methods row by row
DELIMITER $$
CREATE PROCEDURE proc_list_payment_methods()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_method VARCHAR(50);
  DECLARE cur CURSOR FOR SELECT DISTINCT payment_method FROM payments;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  method_loop: LOOP
    FETCH cur INTO v_method;
    IF done THEN
      LEAVE method_loop;
    END IF;
    SELECT CONCAT('Payment Method: ', v_method) AS method_name;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 6️⃣ Cursor: Calculate total amount collected for 'Paid' payments
DELIMITER $$
CREATE PROCEDURE proc_total_collected(OUT total_collected DECIMAL(10,2))
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_amt DECIMAL(10,2);
  DECLARE total_sum DECIMAL(10,2) DEFAULT 0.00;
  DECLARE cur CURSOR FOR SELECT amount FROM payments WHERE payment_status='Paid';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  payment_loop: LOOP
    FETCH cur INTO v_amt;
    IF done THEN
      LEAVE payment_loop;
    END IF;
    SET total_sum = total_sum + v_amt;
  END LOOP;
  CLOSE cur;
  SET total_collected = total_sum;
END $$
DELIMITER ;

-- 7️⃣ Cursor: Identify and mark pending payments older than 3 days as 'Failed'
DELIMITER $$
CREATE PROCEDURE proc_fail_old_pending()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_payment_id INT;
  DECLARE cur CURSOR FOR
    SELECT payment_id FROM payments
    WHERE payment_status='Pending' AND payment_date < (NOW() - INTERVAL 3 DAY);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  cur_loop: LOOP
    FETCH cur INTO v_payment_id;
    IF done THEN
      LEAVE cur_loop;
    END IF;
    UPDATE payments
    SET payment_status='Failed', remarks='Auto-failed after 3 days'
    WHERE payment_id = v_payment_id;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 🔹 8–11: Stored Procedures
-- 8️⃣ Procedure: Add a new payment
DELIMITER $$
CREATE PROCEDURE sp_add_payment(
  IN p_order_id INT,
  IN p_user_id INT,
  IN p_method VARCHAR(50),
  IN p_amount DECIMAL(10,2),
  IN p_status VARCHAR(30),
  IN p_remarks TEXT
)
BEGIN
  INSERT INTO payments (order_id, user_id, payment_method, amount, payment_date, transaction_id, payment_status, remarks)
  VALUES (p_order_id, p_user_id, p_method, p_amount, NOW(),
          CONCAT('TXN', FLOOR(RAND()*100000 + 10000)),
          p_status, p_remarks);
END $$
DELIMITER ;

-- 9️⃣ Procedure: Update payment status
DELIMITER $$
CREATE PROCEDURE sp_update_payment_status(
  IN p_payment_id INT,
  IN p_new_status VARCHAR(30)
)
BEGIN
  UPDATE payments
  SET payment_status = p_new_status,
      remarks = CONCAT('Status updated to ', p_new_status),
      payment_date = NOW()
  WHERE payment_id = p_payment_id;
END $$
DELIMITER ;

-- 🔟 Procedure: Refund (simulate reversal of payment)
DELIMITER $$
CREATE PROCEDURE sp_refund_payment(IN p_payment_id INT)
BEGIN
  UPDATE payments
  SET payment_status = 'Refunded',
      remarks = 'Refund processed successfully'
  WHERE payment_id = p_payment_id AND payment_status = 'Paid';
END $$
DELIMITER ;

-- 1️⃣1️⃣ Procedure: Get total payments per user
DELIMITER $$
CREATE PROCEDURE sp_user_payment_total(IN p_user_id INT)
BEGIN
  SELECT user_id, SUM(amount) AS total_paid, COUNT(*) AS total_transactions
  FROM payments
  WHERE user_id = p_user_id AND payment_status='Paid'
  GROUP BY user_id;
END $$
DELIMITER ;

-- 🔹 12–15: Window Functions
-- 1️⃣2️⃣ Rank users by total payment amount
SELECT user_id, SUM(amount) AS total_amount,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS payment_rank
FROM payments
GROUP BY user_id;

-- 1️⃣3️⃣ Running total of payments in chronological order
SELECT payment_id, user_id, payment_date, amount,
       SUM(amount) OVER (ORDER BY payment_date ASC) AS running_total
FROM payments;

-- 1️⃣4️⃣ Count of payments per method with cumulative percentage
SELECT payment_method,
       COUNT(*) AS total_count,
       SUM(COUNT(*)) OVER (ORDER BY COUNT(*) DESC) / SUM(COUNT(*)) OVER () * 100 AS cumulative_percentage
FROM payments
GROUP BY payment_method;

-- 1️⃣5️⃣ Use LAG to find time difference between two payments by same user
SELECT user_id, payment_id, payment_date,
       TIMESTAMPDIFF(MINUTE, LAG(payment_date) OVER (PARTITION BY user_id ORDER BY payment_date), payment_date) AS minutes_since_last
FROM payments;

-- 🔹 16–18: DCL & TCL
-- 1️⃣6️⃣ DCL: Grant permission to finance user
GRANT SELECT, UPDATE ON payments TO 'finance_user'@'%';

-- 1️⃣7️⃣ DCL: Revoke update rights from trainee user
REVOKE UPDATE ON payments FROM 'trainee_user'@'localhost';

-- 1️⃣8️⃣ TCL: Use transaction control for secure payment insertion
START TRANSACTION;
  INSERT INTO payments (order_id, user_id, payment_method, amount, payment_date, transaction_id, payment_status, remarks)
  VALUES (21, 21, 'UPI', 500.00, NOW(), 'TXN20021', 'Pending', 'Testing transaction');
  -- Simulate error
  -- ROLLBACK; -- Uncomment to cancel
COMMIT;

-- 🔹 19–20: Triggers
-- 1️⃣9️⃣ BEFORE INSERT Trigger: Auto-generate transaction ID if missing
DELIMITER $$
CREATE TRIGGER trg_before_payment_insert
BEFORE INSERT ON payments
FOR EACH ROW
BEGIN
  IF NEW.transaction_id IS NULL OR NEW.transaction_id = '' THEN
    SET NEW.transaction_id = CONCAT('TXN', FLOOR(RAND()*100000 + 10000));
  END IF;
  IF NEW.payment_date IS NULL THEN
    SET NEW.payment_date = NOW();
  END IF;
END $$
DELIMITER ;

-- 2️⃣0️⃣ AFTER UPDATE Trigger: Update related order payment_status automatically
DELIMITER $$
CREATE TRIGGER trg_after_payment_update
AFTER UPDATE ON payments
FOR EACH ROW
BEGIN
  IF NEW.payment_status = 'Paid' THEN
    UPDATE orders SET payment_status = 'Paid' WHERE order_id = NEW.order_id;
  ELSEIF NEW.payment_status = 'Failed' THEN
    UPDATE orders SET payment_status = 'Failed' WHERE order_id = NEW.order_id;
  END IF;
END $$
DELIMITER ;
--  ========================================================== CREATE  TABLE 9. DOCTORS=======================================================================

-- 9. DOCTORS
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    specialization VARCHAR(100),
    experience_years INT,
    clinic_address VARCHAR(255),
    available_days VARCHAR(100),
    consultation_fee DECIMAL(10,2),
    created_at DATETIME
);

-- ======================================================= INSERT INTO doctors =================================================================================

INSERT INTO doctors (name, email, phone, specialization, experience_years, clinic_address, available_days, consultation_fee, created_at)
VALUES
('Dr. Anjali Sharma', 'anjali.sharma@email.com', '9876543210', 'Nutritionist', 8, '12 Green Street, Mumbai', 'Mon, Wed, Fri', 500.00, '2025-10-01 09:00:00'),
('Dr. Rohit Verma', 'rohit.verma@email.com', '9876543211', 'Dietitian', 10, '45 Eco Lane, Pune', 'Tue, Thu, Sat', 600.00, '2025-10-01 09:30:00'),
('Dr. Meera Kapoor', 'meera.kapoor@email.com', '9876543212', 'Homeopathy', 12, '22 Vegan Road, Delhi', 'Mon, Tue, Thu', 450.00, '2025-10-01 10:00:00'),
('Dr. Arjun Singh', 'arjun.singh@email.com', '9876543213', 'Ayurveda', 15, '5 Herbal Avenue, Kolkata', 'Wed, Fri, Sat', 700.00, '2025-10-01 10:30:00'),
('Dr. Priya Nair', 'priya.nair@email.com', '9876543214', 'Vegan Diet Specialist', 7, '9 Wellness Street, Bangalore', 'Mon, Thu, Sat', 550.00, '2025-10-01 11:00:00'),
('Dr. Karan Mehta', 'karan.mehta@email.com', '9876543215', 'Nutritionist', 9, '21 Nature Road, Chennai', 'Tue, Fri', 500.00, '2025-10-01 11:30:00'),
('Dr. Sanya Kapoor', 'sanya.kapoor@email.com', '9876543216', 'Dietitian', 11, '15 Organic Lane, Hyderabad', 'Mon, Wed, Fri', 600.00, '2025-10-01 12:00:00'),
('Dr. Vikram Desai', 'vikram.desai@email.com', '9876543217', 'Ayurveda', 14, '16 Eco Park, Pune', 'Tue, Thu, Sat', 700.00, '2025-10-01 12:30:00'),
('Dr. Neha Reddy', 'neha.reddy@email.com', '9876543218', 'Homeopathy', 10, '18 Leafy Street, Kochi', 'Mon, Wed, Fri', 450.00, '2025-10-01 13:00:00'),
('Dr. Rakesh Jain', 'rakesh.jain@email.com', '9876543219', 'Vegan Diet Specialist', 8, '7 Plant Lane, Indore', 'Tue, Thu, Sat', 550.00, '2025-10-01 13:30:00'),
('Dr. Ananya Sen', 'ananya.sen@email.com', '9876543220', 'Nutritionist', 9, '9 Green Villa, Lucknow', 'Mon, Wed', 500.00, '2025-10-01 14:00:00'),
('Dr. Manish Gupta', 'manish.gupta@email.com', '9876543221', 'Dietitian', 10, '31 Bloom Street, Surat', 'Tue, Thu', 600.00, '2025-10-01 14:30:00'),
('Dr. Shruti Malhotra', 'shruti.malhotra@email.com', '9876543222', 'Homeopathy', 12, '56 Vegan Plaza, Patna', 'Mon, Wed, Fri', 450.00, '2025-10-01 15:00:00'),
('Dr. Amit Bhatia', 'amit.bhatia@email.com', '9876543223', 'Ayurveda', 15, '32 Earth Lane, Bhopal', 'Tue, Thu, Sat', 700.00, '2025-10-01 15:30:00'),
('Dr. Tanya Joshi', 'tanya.joshi@email.com', '9876543224', 'Vegan Diet Specialist', 7, '1 Plantbase Road, Nagpur', 'Mon, Wed, Fri', 550.00, '2025-10-01 16:00:00'),
('Dr. Prateek Sharma', 'prateek.sharma@email.com', '9876543225', 'Nutritionist', 9, '8 Fresh Street, Ahmedabad', 'Tue, Thu', 500.00, '2025-10-01 16:30:00'),
('Dr. Kavya Nair', 'kavya.nair@email.com', '9876543226', 'Dietitian', 11, '20 Eco Street, Delhi', 'Mon, Wed, Fri', 600.00, '2025-10-01 17:00:00'),
('Dr. Aditya Rao', 'aditya.rao@email.com', '9876543227', 'Ayurveda', 14, '2 Organic Road, Mumbai', 'Tue, Thu, Sat', 700.00, '2025-10-01 17:30:00'),
('Dr. Riya Sharma', 'riya.sharma@email.com', '9876543228', 'Homeopathy', 10, '3 Wellness Lane, Chennai', 'Mon, Wed', 450.00, '2025-10-01 18:00:00'),
('Dr. Kunal Verma', 'kunal.verma@email.com', '9876543229', 'Vegan Diet Specialist', 8, '11 Vegan Road, Goa', 'Tue, Thu, Sat', 550.00, '2025-10-01 18:30:00');

-- ========================================= QUERIES ===============================================================================================================
SELECT * FROM doctors ;

TRUNCATE TABLE doctors;

DROP TABLE doctors;
-- ===================== 1️⃣ JOINS (6 QUERIES) =====================

-- 1. INNER JOIN: Show doctors with appointments and patient names
SELECT d.name AS DoctorName, a.appointment_date, u.name AS PatientName
FROM doctors d
INNER JOIN appointments a ON d.doctor_id = a.doctor_id
INNER JOIN users u ON a.user_id = u.user_id;

-- 2. LEFT JOIN: Show all doctors and their appointments (if any)
SELECT d.name AS DoctorName, a.appointment_id, a.appointment_date
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id;

-- 3. RIGHT JOIN: Show all appointments with doctors (even if doctor missing)
SELECT d.name AS DoctorName, a.appointment_id, a.appointment_date
FROM doctors d
RIGHT JOIN appointments a ON d.doctor_id = a.doctor_id;

-- 4. SELF JOIN: Find doctors having the same specialization
SELECT d1.name AS Doctor1, d2.name AS Doctor2, d1.specialization
FROM doctors d1
INNER JOIN doctors d2 ON d1.specialization = d2.specialization
AND d1.doctor_id <> d2.doctor_id;

-- 5. CROSS JOIN: Pair all doctors with all available payment methods
SELECT d.name AS DoctorName, p.payment_method
FROM doctors d
CROSS JOIN payments p;

-- 6. FULL JOIN equivalent (using UNION)
SELECT d.name AS DoctorName, a.appointment_date
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
UNION
SELECT d.name AS DoctorName, a.appointment_date
FROM doctors d
RIGHT JOIN appointments a ON d.doctor_id = a.doctor_id;


-- ===================== 2️⃣ SUBQUERIES (6 QUERIES) =====================

-- 7. Doctors charging more than average consultation fee
SELECT name, consultation_fee
FROM doctors
WHERE consultation_fee > (SELECT AVG(consultation_fee) FROM doctors);

-- 8. Doctors with max experience in Ayurveda
SELECT name, experience_years
FROM doctors
WHERE specialization = 'Ayurveda' AND experience_years = (
    SELECT MAX(experience_years) FROM doctors WHERE specialization = 'Ayurveda'
);

-- 9. Doctors whose fees are higher than all Homeopathy doctors
SELECT name, consultation_fee
FROM doctors
WHERE consultation_fee > ALL (
    SELECT consultation_fee FROM doctors WHERE specialization = 'Homeopathy'
);

-- 10. Doctors available on the same days as ‘Dr. Priya Nair’
SELECT name, available_days
FROM doctors
WHERE available_days = (
    SELECT available_days FROM doctors WHERE name = 'Dr. Priya Nair'
) AND name <> 'Dr. Priya Nair';

-- 11. Doctors who have appointments with users from Mumbai
SELECT name FROM doctors
WHERE doctor_id IN (
    SELECT doctor_id FROM appointments
    WHERE user_id IN (SELECT user_id FROM users WHERE city = 'Mumbai')
);

-- 12. Count of doctors having consultation fees above average (in subquery FROM)
SELECT COUNT(*) AS AboveAvgDoctors
FROM (
    SELECT * FROM doctors
    WHERE consultation_fee > (SELECT AVG(consultation_fee) FROM doctors)
) AS HighFeeDoctors;


-- ===================== 3️⃣ BUILT-IN FUNCTIONS (6 QUERIES) =====================

-- 13. String: Display doctor names in uppercase
SELECT UPPER(name) AS DoctorNameCaps FROM doctors;

-- 14. String: Show doctor name initials
SELECT CONCAT(LEFT(name, 1), '.', SUBSTRING_INDEX(name, ' ', -1)) AS Initials FROM doctors;

-- 15. Numeric: Round off consultation fees
SELECT name, ROUND(consultation_fee, 0) AS RoundedFee FROM doctors;

-- 16. Date: Find how many years since doctor record creation
SELECT name, DATEDIFF(CURDATE(), DATE(created_at)) / 365 AS YearsSinceAdded
FROM doctors;

-- 17. Aggregate: Find specialization-wise average fee
SELECT specialization, AVG(consultation_fee) AS AvgFee
FROM doctors
GROUP BY specialization;

-- 18. Aggregate: Total consultation revenue if each doctor gets 10 patients
SELECT SUM(consultation_fee * 10) AS TotalPotentialRevenue FROM doctors;


-- ===================== 4️⃣ USER-DEFINED FUNCTIONS (5 QUERIES) =====================

-- Create function to calculate yearly income of a doctor
DELIMITER //
CREATE FUNCTION GetYearlyIncome(fee DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN fee * 12 * 30; -- assuming 30 consultations per month
END //
DELIMITER ;

-- 19. Use GetYearlyIncome()
SELECT name, specialization, GetYearlyIncome(consultation_fee) AS YearlyIncome
FROM doctors;

-- Create function to categorize experience level
DELIMITER //
CREATE FUNCTION GetExperienceLevel(exp INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE level VARCHAR(20);
    IF exp < 5 THEN SET level = 'Beginner';
    ELSEIF exp BETWEEN 5 AND 10 THEN SET level = 'Intermediate';
    ELSE SET level = 'Expert';
    END IF;
    RETURN level;
END //
DELIMITER ;

-- 20. Use GetExperienceLevel()
SELECT name, experience_years, GetExperienceLevel(experience_years) AS Level
FROM doctors;


-- 1️⃣ VIEWS (4 Queries)
-- 1. Simple view to display basic doctor details
CREATE VIEW DoctorBasicInfo AS
SELECT doctor_id, name, specialization, experience_years
FROM doctors;

-- 2. View for doctors with more than 10 years of experience
CREATE VIEW SeniorDoctors AS
SELECT name, specialization, experience_years
FROM doctors
WHERE experience_years > 10;

-- 3. View to calculate average consultation fee per specialization
CREATE VIEW AvgFeeBySpecialization AS
SELECT specialization, AVG(consultation_fee) AS avg_fee
FROM doctors
GROUP BY specialization;

-- 4. View for doctors available on Monday and charging less than 600
CREATE VIEW MondayAffordableDoctors AS
SELECT name, specialization, consultation_fee, available_days
FROM doctors
WHERE available_days LIKE '%Mon%' AND consultation_fee < 600;

-- 2️⃣ CURSORS (3 Queries)
-- 5. Cursor to display all doctor names one by one
DELIMITER //
CREATE PROCEDURE ShowDoctorNames()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE dname VARCHAR(100);
  DECLARE cur CURSOR FOR SELECT name FROM doctors;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO dname;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SELECT dname AS DoctorName;
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

-- 6. Cursor to increase consultation fee by 10% for Nutritionists
DELIMITER //
CREATE PROCEDURE UpdateNutritionistFees()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE doc_id INT;
  DECLARE cur CURSOR FOR SELECT doctor_id FROM doctors WHERE specialization = 'Nutritionist';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO doc_id;
    IF done THEN
      LEAVE read_loop;
    END IF;
    UPDATE doctors
    SET consultation_fee = consultation_fee * 1.10
    WHERE doctor_id = doc_id;
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

-- 7. Cursor to count and display number of doctors per specialization
DELIMITER //
CREATE PROCEDURE CountDoctorsBySpecialization()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE spec VARCHAR(100);
  DECLARE cnt INT;
  DECLARE cur CURSOR FOR
  SELECT specialization, COUNT(*) FROM doctors GROUP BY specialization;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO spec, cnt;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SELECT spec AS Specialization, cnt AS DoctorCount;
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

-- 3️⃣ STORED PROCEDURES (4 Queries)
-- 8. Procedure to get doctor details by specialization
DELIMITER //
CREATE PROCEDURE GetDoctorsBySpecialization(IN spec VARCHAR(100))
BEGIN
  SELECT name, phone, consultation_fee
  FROM doctors
  WHERE specialization = spec;
END //
DELIMITER ;

-- 9. Procedure to update consultation fee by percentage
DELIMITER //
CREATE PROCEDURE UpdateFeeByPercentage(IN doc_id INT, IN percent DECIMAL(5,2))
BEGIN
  UPDATE doctors
  SET consultation_fee = consultation_fee + (consultation_fee * percent / 100)
  WHERE doctor_id = doc_id;
END //
DELIMITER ;

-- 10. Procedure to delete a doctor record by ID
DELIMITER //
CREATE PROCEDURE DeleteDoctor(IN doc_id INT)
BEGIN
  DELETE FROM doctors WHERE doctor_id = doc_id;
END //
DELIMITER ;

-- 11. Procedure to list doctors available on a given day
DELIMITER //
CREATE PROCEDURE DoctorsAvailableOn(IN day_name VARCHAR(50))
BEGIN
  SELECT name, specialization, available_days
  FROM doctors
  WHERE available_days LIKE CONCAT('%', day_name, '%');
END //
DELIMITER ;

-- 4️⃣ WINDOW FUNCTIONS (4 Queries)
-- 12. Rank doctors by experience (most experienced first)
SELECT name, specialization, experience_years,
       RANK() OVER(ORDER BY experience_years DESC) AS ExperienceRank
FROM doctors;

-- 13. Rank doctors within each specialization by consultation fee
SELECT name, specialization, consultation_fee,
       RANK() OVER(PARTITION BY specialization ORDER BY consultation_fee DESC) AS FeeRank
FROM doctors;

-- 14. Show previous doctor’s fee using LAG()
SELECT name, specialization, consultation_fee,
       LAG(consultation_fee, 1) OVER(ORDER BY doctor_id) AS PreviousDoctorFee
FROM doctors;

-- 15. Show difference between current and next consultation fee
SELECT name, consultation_fee,
       LEAD(consultation_fee, 1) OVER(ORDER BY doctor_id) - consultation_fee AS FeeDifference
FROM doctors;

-- 5️⃣ DCL & TCL (3 Queries)
-- 16. Grant privileges to a new user
GRANT SELECT, INSERT, UPDATE ON doctors TO 'user1'@'localhost';

-- 17. Revoke privilege from the user
REVOKE UPDATE ON doctors FROM 'user1'@'localhost';

-- 18. Use transaction control to safely update doctor fee
START TRANSACTION;
UPDATE doctors SET consultation_fee = consultation_fee + 50 WHERE specialization = 'Dietitian';
SAVEPOINT before_commit;
-- If everything is fine:
COMMIT;
-- If error occurs:
-- ROLLBACK TO before_commit;

-- 6️⃣ TRIGGERS (3 Queries)
-- 19. BEFORE INSERT trigger to ensure consultation fee is not less than 300
DELIMITER //
CREATE TRIGGER BeforeDoctorInsert
BEFORE INSERT ON doctors
FOR EACH ROW
BEGIN
  IF NEW.consultation_fee < 300 THEN
    SET NEW.consultation_fee = 300;
  END IF;
END //
DELIMITER ;

-- 20. AFTER INSERT trigger to log doctor creation
CREATE TABLE doctor_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT,
    action VARCHAR(50),
    log_time DATETIME
);

DELIMITER //
CREATE TRIGGER AfterDoctorInsert
AFTER INSERT ON doctors
FOR EACH ROW
BEGIN
  INSERT INTO doctor_log (doctor_id, action, log_time)
  VALUES (NEW.doctor_id, 'Doctor Added', NOW());
END //
DELIMITER ;

-- =========================================================
-- ✅ END OF QUERIES FOR TABLE: DOCTORS
-- =========================================================


--  ========================================================== CREATE  TABLE 10. APPOINTMENTS =======================================================================

-- 10. APPOINTMENTS
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    appointment_time VARCHAR(20),
    status VARCHAR(30),
    mode VARCHAR(20),
    notes TEXT,
    payment_status VARCHAR(30),
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- ======================================================= INSERT INTO appointments =================================================================================


INSERT INTO appointments (user_id, doctor_id, appointment_date, appointment_time, status, mode, notes, payment_status, created_at)
VALUES
(1, 1, '2025-10-10 09:00:00', '09:00 AM', 'Confirmed', 'Online', 'First consultation', 'Paid', '2025-10-01 10:00:00'),
(2, 2, '2025-10-11 10:30:00', '10:30 AM', 'Pending', 'In-person', 'Follow-up on diet plan', 'Pending', '2025-10-02 11:00:00'),
(3, 3, '2025-10-12 11:00:00', '11:00 AM', 'Confirmed', 'Online', 'Discuss supplement options', 'Paid', '2025-10-03 09:30:00'),
(4, 4, '2025-10-13 14:00:00', '02:00 PM', 'Cancelled', 'In-person', 'Patient unavailable', 'Failed', '2025-10-03 14:00:00'),
(5, 5, '2025-10-14 09:30:00', '09:30 AM', 'Confirmed', 'Online', 'Initial consultation', 'Paid', '2025-10-04 10:00:00'),
(6, 6, '2025-10-15 11:15:00', '11:15 AM', 'Confirmed', 'In-person', 'Discuss meal plans', 'Paid', '2025-10-05 13:00:00'),
(7, 7, '2025-10-16 10:00:00', '10:00 AM', 'Pending', 'Online', 'Second consultation', 'Pending', '2025-10-05 16:00:00'),
(8, 8, '2025-10-17 13:30:00', '01:30 PM', 'Confirmed', 'In-person', 'Routine check-up', 'Paid', '2025-10-06 11:00:00'),
(9, 9, '2025-10-18 09:45:00', '09:45 AM', 'Confirmed', 'Online', 'Discuss nutrition tips', 'Paid', '2025-10-06 17:00:00'),
(10, 10, '2025-10-19 15:00:00', '03:00 PM', 'Cancelled', 'In-person', 'Patient unavailable', 'Failed', '2025-10-07 09:50:00'),
(11, 11, '2025-10-20 10:15:00', '10:15 AM', 'Confirmed', 'Online', 'Follow-up consultation', 'Paid', '2025-10-07 15:00:00'),
(12, 12, '2025-10-21 11:30:00', '11:30 AM', 'Pending', 'In-person', 'Discuss health concerns', 'Pending', '2025-10-08 09:10:00'),
(13, 13, '2025-10-22 14:00:00', '02:00 PM', 'Confirmed', 'Online', 'Supplement advice', 'Paid', '2025-10-08 16:45:00'),
(14, 14, '2025-10-23 09:00:00', '09:00 AM', 'Confirmed', 'In-person', 'Routine diet check', 'Paid', '2025-10-09 10:00:00'),
(15, 15, '2025-10-24 10:30:00', '10:30 AM', 'Pending', 'Online', 'Initial consultation', 'Pending', '2025-10-09 14:10:00'),
(16, 16, '2025-10-25 11:00:00', '11:00 AM', 'Confirmed', 'In-person', 'Discuss meal plan adjustments', 'Paid', '2025-10-10 13:55:00'),
(17, 17, '2025-10-26 13:00:00', '01:00 PM', 'Confirmed', 'Online', 'Second consultation', 'Paid', '2025-10-10 11:45:00'),
(18, 18, '2025-10-27 09:30:00', '09:30 AM', 'Pending', 'In-person', 'Discuss dietary supplements', 'Pending', '2025-10-11 09:20:00'),
(19, 19, '2025-10-28 10:00:00', '10:00 AM', 'Confirmed', 'Online', 'Routine follow-up', 'Paid', '2025-10-11 10:35:00'),
(20, 20, '2025-10-29 11:30:00', '11:30 AM', 'Confirmed', 'In-person', 'Initial consultation', 'Paid', '2025-10-12 12:00:00');
-- ========================================================== QUERIES ==============================================================================================

SELECT * FROM appointments;

TRUNCATE TABLE appointments;

DROP TABLE appointments;

-- 🔹 1️⃣ JOINS (INNER, LEFT, RIGHT, SELF, CROSS)
-- 1. INNER JOIN → Get appointment details with user and doctor names
SELECT a.appointment_id, u.username, d.name AS doctor_name, a.status, a.mode
FROM appointments a
INNER JOIN users u ON a.user_id = u.user_id
INNER JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 2. LEFT JOIN → Show all users and their appointments (even if no appointment exists)
SELECT u.username, a.appointment_date, a.status
FROM users u
LEFT JOIN appointments a ON u.user_id = a.user_id;

-- 3. RIGHT JOIN → Show all doctors even if they don’t have appointments
SELECT a.appointment_id, d.name AS doctor_name, a.status
FROM appointments a
RIGHT JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 4. SELF JOIN → Compare appointments on the same date but different users
SELECT a1.appointment_id AS Appt1, a2.appointment_id AS Appt2, a1.appointment_date
FROM appointments a1
JOIN appointments a2 
ON a1.appointment_date = a2.appointment_date 
AND a1.appointment_id <> a2.appointment_id;

-- 5. CROSS JOIN → Generate all possible combinations of doctors and modes
SELECT d.name AS doctor_name, m.mode_type
FROM doctors d
CROSS JOIN (SELECT DISTINCT mode AS mode_type FROM appointments) m;

-- 🔹 2️⃣ SUBQUERIES (IN, EXISTS, ANY, ALL, CORRELATED)
-- 6. Find users who have more than one appointment
SELECT user_id 
FROM appointments
GROUP BY user_id
HAVING COUNT(appointment_id) > 1;

-- 7. Find appointments where doctor has more than 5 confirmed sessions
SELECT appointment_id, doctor_id
FROM appointments
WHERE doctor_id IN (
  SELECT doctor_id FROM appointments
  WHERE status = 'Confirmed'
  GROUP BY doctor_id
  HAVING COUNT(*) > 5
);

-- 8. Find the earliest confirmed appointment using a scalar subquery
SELECT * 
FROM appointments
WHERE appointment_date = (
  SELECT MIN(appointment_date) FROM appointments WHERE status = 'Confirmed'
);

-- 9. Find users who have never booked online appointments (NOT EXISTS)
SELECT u.user_id, u.username
FROM users u
WHERE NOT EXISTS (
  SELECT 1 FROM appointments a 
  WHERE a.user_id = u.user_id AND a.mode = 'Online'
);

-- 10. Correlated subquery → Find appointments that happened before the same user's latest booking
SELECT a1.appointment_id, a1.user_id, a1.appointment_date
FROM appointments a1
WHERE a1.appointment_date < (
  SELECT MAX(a2.appointment_date)
  FROM appointments a2
  WHERE a2.user_id = a1.user_id
);

-- 🔹 3️⃣ BUILT-IN FUNCTIONS (String, Numeric, Date, Aggregate)
-- 11. Show all appointment modes in uppercase
SELECT appointment_id, UPPER(mode) AS mode_upper FROM appointments;

-- 12. Calculate how many days ago each appointment was created
SELECT appointment_id, DATEDIFF(NOW(), created_at) AS days_since_created FROM appointments;

-- 13. Count total confirmed vs pending appointments
SELECT status, COUNT(*) AS total_count
FROM appointments
GROUP BY status;

-- 14. Find the average number of confirmed appointments per doctor
SELECT doctor_id, COUNT(*) AS total_appointments, ROUND(AVG(TIMESTAMPDIFF(MINUTE, created_at, appointment_date))) AS avg_minutes_diff
FROM appointments
WHERE status = 'Confirmed'
GROUP BY doctor_id;

-- 15. Concatenate doctor and user info for display
SELECT CONCAT('Doctor-', doctor_id, ' with User-', user_id) AS appointment_pair
FROM appointments;

🔹 4️⃣ USER-DEFINED FUNCTIONS (UDFs)
-- 16. Create function to calculate appointment duration (for demo)
DELIMITER $$
CREATE FUNCTION GetAppointmentDuration(start_time VARCHAR(20), end_time VARCHAR(20))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN CONCAT('Duration: ', TIMESTAMPDIFF(MINUTE, STR_TO_DATE(start_time, '%h:%i %p'), STR_TO_DATE(end_time, '%h:%i %p')), ' minutes');
END $$
DELIMITER ;

-- Example use:
SELECT appointment_id, GetAppointmentDuration('09:00 AM', '09:45 AM') AS Duration FROM appointments LIMIT 5;

-- 17. UDF: Convert mode into short form
DELIMITER $$
CREATE FUNCTION ShortMode(mode VARCHAR(20))
RETURNS VARCHAR(10)
DETERMINISTIC
RETURN (CASE 
          WHEN mode = 'Online' THEN 'ONL'
          WHEN mode = 'In-person' THEN 'OFF'
          ELSE 'OTH'
        END);
$$
DELIMITER ;

SELECT appointment_id, ShortMode(mode) AS Short_Mode FROM appointments;

-- 18. UDF: Determine if appointment was paid or not
DELIMITER $$
CREATE FUNCTION PaymentLabel(payment_status VARCHAR(30))
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN (CASE
          WHEN payment_status = 'Paid' THEN 'Payment Successful'
          WHEN payment_status = 'Pending' THEN 'Awaiting Payment'
          ELSE 'Payment Failed'
        END);
$$
DELIMITER ;

SELECT appointment_id, PaymentLabel(payment_status) FROM appointments;

-- 19. UDF: Return appointment type based on status
DELIMITER $$
CREATE FUNCTION AppointmentType(status VARCHAR(30))
RETURNS VARCHAR(20)
DETERMINISTIC
RETURN (CASE
          WHEN status = 'Confirmed' THEN 'Active'
          WHEN status = 'Cancelled' THEN 'Inactive'
          ELSE 'In Progress'
        END);
$$
DELIMITER ;

SELECT appointment_id, AppointmentType(status) AS Appt_Type FROM appointments;

-- 20. UDF: Calculate yearly appointment count estimate per doctor
DELIMITER $$
CREATE FUNCTION YearlyEstimate(count_monthly INT)
RETURNS INT
DETERMINISTIC
RETURN count_monthly * 12;
$$
DELIMITER ;

-- Example:
SELECT doctor_id, COUNT(*) AS monthly_count, YearlyEstimate(COUNT(*)) AS estimated_yearly
FROM appointments
GROUP BY doctor_id;

-- 1️⃣ VIEWS (4 Queries)
-- 1. Simple view: list all confirmed appointments
CREATE VIEW ConfirmedAppointments AS
SELECT appointment_id, user_id, doctor_id, appointment_date, mode
FROM appointments
WHERE status = 'Confirmed';

-- 2. View showing total appointments per doctor
CREATE VIEW DoctorAppointmentCount AS
SELECT doctor_id, COUNT(*) AS TotalAppointments
FROM appointments
GROUP BY doctor_id;

-- 3. View joining appointments and doctors for detailed report
CREATE VIEW AppointmentDoctorDetails AS
SELECT a.appointment_id, d.name AS DoctorName, d.specialization,
       a.appointment_date, a.mode, a.status, a.payment_status
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 4. View to get pending online appointments
CREATE VIEW PendingOnlineAppointments AS
SELECT appointment_id, user_id, doctor_id, appointment_date, notes
FROM appointments
WHERE status = 'Pending' AND mode = 'Online';

-- 2️⃣ CURSORS (3 Queries)
-- 5. Cursor to display appointment details one by one
DELIMITER //
CREATE PROCEDURE ShowAppointments()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE aid INT;
  DECLARE astat VARCHAR(30);
  DECLARE cur CURSOR FOR SELECT appointment_id, status FROM appointments;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO aid, astat;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SELECT aid AS AppointmentID, astat AS Status;
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

-- 6. Cursor to update payment status of all pending appointments to 'Paid'
DELIMITER //
CREATE PROCEDURE UpdatePendingPayments()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE aid INT;
  DECLARE cur CURSOR FOR SELECT appointment_id FROM appointments WHERE payment_status = 'Pending';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO aid;
    IF done THEN
      LEAVE read_loop;
    END IF;
    UPDATE appointments
    SET payment_status = 'Paid'
    WHERE appointment_id = aid;
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

-- 7. Cursor to count confirmed appointments per mode
DELIMITER //
CREATE PROCEDURE CountAppointmentsByMode()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE m VARCHAR(20);
  DECLARE cnt INT;
  DECLARE cur CURSOR FOR
  SELECT mode, COUNT(*) FROM appointments WHERE status = 'Confirmed' GROUP BY mode;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO m, cnt;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SELECT m AS AppointmentMode, cnt AS ConfirmedCount;
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

-- 3️⃣ STORED PROCEDURES (4 Queries)
-- 8. Procedure to get appointments by doctor
DELIMITER //
CREATE PROCEDURE GetAppointmentsByDoctor(IN doc_id INT)
BEGIN
  SELECT appointment_id, appointment_date, status, mode, payment_status
  FROM appointments
  WHERE doctor_id = doc_id;
END //
DELIMITER ;

-- 9. Procedure to change appointment status
DELIMITER //
CREATE PROCEDURE UpdateAppointmentStatus(IN aid INT, IN new_status VARCHAR(30))
BEGIN
  UPDATE appointments
  SET status = new_status
  WHERE appointment_id = aid;
END //
DELIMITER ;

-- 10. Procedure to get daily appointments
DELIMITER //
CREATE PROCEDURE GetAppointmentsByDate(IN a_date DATE)
BEGIN
  SELECT appointment_id, user_id, doctor_id, mode, status
  FROM appointments
  WHERE DATE(appointment_date) = a_date;
END //
DELIMITER ;

-- 11. Procedure to cancel appointments with failed payments
DELIMITER //
CREATE PROCEDURE CancelFailedPayments()
BEGIN
  UPDATE appointments
  SET status = 'Cancelled'
  WHERE payment_status = 'Failed';
END //
DELIMITER ;

-- 4️⃣ WINDOW FUNCTIONS (4 Queries)
-- 12. Rank appointments by date
SELECT appointment_id, doctor_id, appointment_date,
       RANK() OVER(ORDER BY appointment_date ASC) AS DateRank
FROM appointments;

-- 13. Rank appointments per doctor by time
SELECT doctor_id, appointment_time,
       RANK() OVER(PARTITION BY doctor_id ORDER BY appointment_time ASC) AS TimeRank
FROM appointments;

-- 14. Use LAG to show previous appointment date for each doctor
SELECT doctor_id, appointment_id, appointment_date,
       LAG(appointment_date) OVER(PARTITION BY doctor_id ORDER BY appointment_date) AS PrevAppointment
FROM appointments;

-- 15. Calculate time difference to next appointment using LEAD
SELECT doctor_id, appointment_id, appointment_date,
       TIMESTAMPDIFF(DAY, appointment_date,
                     LEAD(appointment_date) OVER(PARTITION BY doctor_id ORDER BY appointment_date)) AS DaysToNext
FROM appointments;

-- 5️⃣ DCL & TCL (3 Queries)
-- 16. Grant access to view appointments to a staff user
GRANT SELECT ON appointments TO 'staff_user'@'localhost';

-- 17. Revoke delete permission from the staff user
REVOKE DELETE ON appointments FROM 'staff_user'@'localhost';

-- 18. Transaction: confirm appointment only if payment is successful
START TRANSACTION;
UPDATE appointments
SET status = 'Confirmed'
WHERE payment_status = 'Paid' AND status = 'Pending';
SAVEPOINT after_confirm;
-- If no errors:
COMMIT;
-- Otherwise:
-- ROLLBACK TO after_confirm;

6️⃣ TRIGGERS (2 Queries)
-- 19. BEFORE INSERT trigger: ensure appointment time is not empty
DELIMITER //
CREATE TRIGGER BeforeAppointmentInsert
BEFORE INSERT ON appointments
FOR EACH ROW
BEGIN
  IF NEW.appointment_time IS NULL OR NEW.appointment_time = '' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Appointment time cannot be empty.';
  END IF;
END //
DELIMITER ;

-- 20. AFTER UPDATE trigger: log status change
CREATE TABLE appointment_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    old_status VARCHAR(30),
    new_status VARCHAR(30),
    changed_at DATETIME
);

DELIMITER //
CREATE TRIGGER AfterAppointmentUpdate
AFTER UPDATE ON appointments
FOR EACH ROW
BEGIN
  IF OLD.status <> NEW.status THEN
    INSERT INTO appointment_log (appointment_id, old_status, new_status, changed_at)
    VALUES (NEW.appointment_id, OLD.status, NEW.status, NOW());
  END IF;
END //
DELIMITER ;
--  ========================================================== CREATE  TABLE  11. COUNSELORS =======================================================================

-- 11. COUNSELORS
CREATE TABLE counselors (
    counselor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    specialization VARCHAR(100),
    experience_years INT,
    about TEXT,
    available_days VARCHAR(100),
    session_fee DECIMAL(10,2),
    created_at DATETIME
);

-- ======================================================= INSERT INTO counselors =================================================================================

INSERT INTO counselors (name, email, phone, specialization, experience_years, about, available_days, session_fee, created_at) VALUES
('Dr. Alice Johnson', 'alice.j@therapy.com', '+1-555-0101', 'Anxiety & Depression', 10, 'Experienced therapist specializing in cognitive behavioral therapy.', 'Mon, Wed, Fri', 150.00, '2024-01-01 09:00:00'),
('Dr. Bob Smith', 'bob.s@therapy.com', '+1-555-0102', 'Relationship Counseling', 8, 'Helps couples navigate challenges with empathy and tools.', 'Tue, Thu', 120.00, '2024-01-02 09:00:00'),
('Dr. Carol Davis', 'carol.d@therapy.com', '+1-555-0103', 'Stress Management', 12, 'Focuses on mindfulness and work-life balance.', 'Mon, Tue, Sat', 140.00, '2024-01-03 09:00:00'),
('Dr. David Wilson', 'david.w@therapy.com', '+1-555-0104', 'Addiction Recovery', 15, 'Supports recovery journeys with evidence-based methods.', 'Wed, Fri', 160.00, '2024-01-04 09:00:00'),
('Dr. Eve Brown', 'eve.b@therapy.com', '+1-555-0105', 'Child Psychology', 7, 'Works with children and families for emotional growth.', 'Tue, Thu, Sun', 130.00, '2024-01-05 09:00:00'),
('Dr. Frank Miller', 'frank.m@therapy.com', '+1-555-0106', 'Grief Counseling', 11, 'Guides through loss with compassionate support.', 'Mon, Fri', 145.00, '2024-01-06 09:00:00'),
('Dr. Grace Lee', 'grace.l@therapy.com', '+1-555-0107', 'Career Coaching', 9, 'Assists with professional transitions and burnout.', 'Wed, Sat', 125.00, '2024-01-07 09:00:00'),
('Dr. Henry Garcia', 'henry.g@therapy.com', '+1-555-0108', 'Trauma Therapy', 14, 'EMDR specialist for PTSD and healing.', 'Tue, Thu', 155.00, '2024-01-08 09:00:00'),
('Dr. Iris Taylor', 'iris.t@therapy.com', '+1-555-0109', 'Family Therapy', 6, 'Strengthens family dynamics and communication.', 'Mon, Wed, Sun', 135.00, '2024-01-09 09:00:00'),
('Dr. Jack White', 'jack.w@therapy.com', '+1-555-0110', 'Self-Esteem Building', 13, 'Empowers individuals to build confidence.', 'Fri, Sat', 140.00, '2024-01-10 09:00:00'),
('Dr. Karen Adams', 'karen.a@therapy.com', '+1-555-0111', 'Anxiety & Depression', 10, 'Holistic approach to mental wellness.', 'Mon, Tue', 150.00, '2024-01-11 09:00:00'),
('Dr. Leo Martinez', 'leo.m@therapy.com', '+1-555-0112', 'Relationship Counseling', 8, 'Mediation for partnerships.', 'Thu, Fri', 120.00, '2024-01-12 09:00:00'),
('Dr. Mia Rodriguez', 'mia.r@therapy.com', '+1-555-0113', 'Stress Management', 12, 'Yoga-integrated therapy sessions.', 'Wed, Sat', 140.00, '2024-01-13 09:00:00'),
('Dr. Noah Lopez', 'noah.l@therapy.com', '+1-555-0114', 'Addiction Recovery', 15, 'Group and individual support.', 'Mon, Fri', 160.00, '2024-01-14 09:00:00'),
('Dr. Olivia Clark', 'olivia.c@therapy.com', '+1-555-0115', 'Child Psychology', 7, 'Play therapy expert.', 'Tue, Sun', 130.00, '2024-01-15 09:00:00'),
('Dr. Paul Lewis', 'paul.l@therapy.com', '+1-555-0116', 'Grief Counseling', 11, 'Support groups available.', 'Wed, Thu', 145.00, '2024-01-16 09:00:00'),
('Dr. Quinn Walker', 'quinn.w@therapy.com', '+1-555-0117', 'Career Coaching', 9, 'Resume and interview prep.', 'Mon, Sat', 125.00, '2024-01-17 09:00:00'),
('Dr. Riley Hall', 'riley.h@therapy.com', '+1-555-0118', 'Trauma Therapy', 14, 'Safe space for survivors.', 'Tue, Fri', 155.00, '2024-01-18 09:00:00'),
('Dr. Sam Young', 'sam.y@therapy.com', '+1-555-0119', 'Family Therapy', 6, 'Conflict resolution focus.', 'Wed, Sun', 135.00, '2024-01-19 09:00:00'),
('Dr. Tara King', 'tara.k@therapy.com', '+1-555-0120', 'Self-Esteem Building', 13, 'Affirmation-based techniques.', 'Thu, Sat', 140.00, '2024-01-20 09:00:00');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM counselors;

TRUNCATE TABLE counselors;

DROP TABLE counselors;


-- 🔹 1️⃣ VIEWS
-- 1. Simple view to show counselor names and specializations
CREATE VIEW CounselorSpecializations AS
SELECT counselor_id, name, specialization
FROM counselors;

-- 2. View to show only highly experienced counselors
CREATE VIEW ExperiencedCounselors AS
SELECT name, specialization, experience_years
FROM counselors
WHERE experience_years > 10;

-- 3. View to show average session fee per specialization
CREATE VIEW AvgFeeBySpecialization AS
SELECT specialization, AVG(session_fee) AS avg_fee
FROM counselors
GROUP BY specialization;

-- 4. View combining counselor and their availability details
CREATE VIEW CounselorAvailability AS
SELECT name, specialization, available_days, session_fee
FROM counselors
WHERE session_fee > 130;

-- 🔹 2️⃣ CURSORS
-- 5. Cursor to list all counselor names one by one
DELIMITER //
CREATE PROCEDURE ListCounselorNames()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE cname VARCHAR(100);
  DECLARE cur CURSOR FOR SELECT name FROM counselors;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO cname;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SELECT cname AS Counselor_Name;
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

-- Call the procedure
CALL ListCounselorNames();

🔹 3️⃣ STORED PROCEDURES
-- 6. Procedure to update counselor session fee by specialization
DELIMITER //
CREATE PROCEDURE UpdateFeeBySpecialization(
  IN spec VARCHAR(100),
  IN increment DECIMAL(10,2)
)
BEGIN
  UPDATE counselors
  SET session_fee = session_fee + increment
  WHERE specialization = spec;
END //
DELIMITER ;

-- Call example
CALL UpdateFeeBySpecialization('Stress Management', 20.00);


-- 7. Procedure to get counselor info by name
DELIMITER //
CREATE PROCEDURE GetCounselorByName(IN cname VARCHAR(100))
BEGIN
  SELECT * FROM counselors WHERE name = cname;
END //
DELIMITER ;

CALL GetCounselorByName('Dr. Alice Johnson');

-- 🔹 4️⃣ WINDOW FUNCTIONS
-- 8. Rank counselors by experience
SELECT name, specialization, experience_years,
       RANK() OVER (ORDER BY experience_years DESC) AS ExperienceRank
FROM counselors;

-- 9. Find the next counselor by session fee using LEAD
SELECT name, session_fee,
       LEAD(name) OVER (ORDER BY session_fee) AS NextCounselor
FROM counselors;

-- 10. Calculate fee difference between consecutive counselors
SELECT name, session_fee,
       LAG(session_fee) OVER (ORDER BY session_fee) AS PrevFee,
       session_fee - LAG(session_fee) OVER (ORDER BY session_fee) AS FeeDifference
FROM counselors;

-- 11. Divide counselors into 4 categories based on session fee
SELECT name, session_fee,
       NTILE(4) OVER (ORDER BY session_fee DESC) AS FeeCategory
FROM counselors;

-- 🔹 5️⃣ DCL & TCL COMMANDS
-- 12. Grant permissions to a user
GRANT SELECT, INSERT, UPDATE ON counselors TO 'user1'@'localhost';

-- 13. Revoke permissions
REVOKE INSERT ON counselors FROM 'user1'@'localhost';

-- 14. Transaction: Update session fee safely
START TRANSACTION;
UPDATE counselors SET session_fee = session_fee + 10 WHERE specialization = 'Anxiety & Depression';
SAVEPOINT BeforeRollback;
ROLLBACK TO BeforeRollback;
COMMIT;

-- 🔹 6️⃣ TRIGGERS
-- 15. Before Insert Trigger - ensure no negative session fee
DELIMITER //
CREATE TRIGGER BeforeInsertCounselor
BEFORE INSERT ON counselors
FOR EACH ROW
BEGIN
  IF NEW.session_fee < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Session fee cannot be negative!';
  END IF;
END //
DELIMITER ;

-- 16. After Insert Trigger - log new counselor entry
CREATE TABLE counselor_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    counselor_id INT,
    log_message VARCHAR(255),
    log_time DATETIME
);

DELIMITER //
CREATE TRIGGER AfterInsertCounselor
AFTER INSERT ON counselors
FOR EACH ROW
BEGIN
  INSERT INTO counselor_logs (counselor_id, log_message, log_time)
  VALUES (NEW.counselor_id, CONCAT('New counselor added: ', NEW.name), NOW());
END //
DELIMITER ;

-- 17. Before Update Trigger - track fee changes
DELIMITER //
CREATE TRIGGER BeforeFeeUpdate
BEFORE UPDATE ON counselors
FOR EACH ROW
BEGIN
  IF NEW.session_fee <> OLD.session_fee THEN
    INSERT INTO counselor_logs (counselor_id, log_message, log_time)
    VALUES (OLD.counselor_id,
            CONCAT('Session fee updated from ', OLD.session_fee, ' to ', NEW.session_fee),
            NOW());
  END IF;
END //
DELIMITER ;

-- 🔹 7️⃣ ADDITIONAL ADVANCED QUERIES
-- 18. View combining ranking and fee details
CREATE VIEW CounselorFeeRank AS
SELECT name, specialization, session_fee,
       DENSE_RANK() OVER (ORDER BY session_fee DESC) AS FeeRank
FROM counselors;

-- 19. Find counselors charging above the average fee
SELECT name, specialization, session_fee
FROM counselors
WHERE session_fee > (SELECT AVG(session_fee) FROM counselors);

-- 20. Correlated subquery: find counselors who earn more than others in the same specialization
SELECT c1.name, c1.specialization, c1.session_fee
FROM counselors c1
WHERE c1.session_fee > (
  SELECT AVG(c2.session_fee)
  FROM counselors c2
  WHERE c2.specialization = c1.specialization
);
--  ========================================================== CREATE  TABLE 12. COUNSELING_SESSIONS=======================================================================


-- 12. COUNSELING_SESSIONS
CREATE TABLE counseling_sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    counselor_id INT,
    session_date DATETIME,
    session_time VARCHAR(20),
    mode VARCHAR(20),
    feedback TEXT,
    status VARCHAR(30),
    notes TEXT,
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (counselor_id) REFERENCES counselors(counselor_id)
);

-- ======================================================= INSERT INTO counseling_sessions =================================================================================

INSERT INTO counseling_sessions (user_id, counselor_id, session_date, session_time, mode, feedback, status, notes, created_at) VALUES
(1, 1, '2024-02-01', '10:00 AM', 'Online', 'Helpful session on anxiety.', 'Completed', 'Discussed coping strategies.', '2024-02-01 08:00:00'),
(2, 2, '2024-02-02', '11:00 AM', 'In-Person', 'Great insights into relationships.', 'Completed', 'Homework assigned.', '2024-02-02 08:00:00'),
(3, 3, '2024-02-03', '09:00 AM', 'Online', 'Stress techniques were useful.', 'Completed', 'Follow-up needed.', '2024-02-03 08:00:00'),
(4, 4, '2024-02-04', '02:00 PM', 'In-Person', 'Supportive for recovery.', 'Completed', 'Progress noted.', '2024-02-04 08:00:00'),
(5, 5, '2024-02-05', '03:00 PM', 'Online', 'Good for child issues.', 'Completed', 'Parent tips given.', '2024-02-05 08:00:00'),
(6, 6, '2024-02-06', '10:30 AM', 'In-Person', 'Helped with grief processing.', 'Completed', 'Emotional breakthrough.', '2024-02-06 08:00:00'),
(7, 7, '2024-02-07', '01:00 PM', 'Online', 'Career advice spot on.', 'Completed', 'Action plan created.', '2024-02-07 08:00:00'),
(8, 8, '2024-02-08', '04:00 PM', 'In-Person', 'Trauma discussion productive.', 'Completed', 'Safety plan reviewed.', '2024-02-08 08:00:00'),
(9, 9, '2024-02-09', '11:30 AM', 'Online', 'Family dynamics improved.', 'Completed', 'Communication exercises.', '2024-02-09 08:00:00'),
(10, 10, '2024-02-10', '12:00 PM', 'In-Person', 'Boosted self-esteem.', 'Completed', 'Positive affirmations.', '2024-02-10 08:00:00'),
(11, 11, '2024-02-11', '09:30 AM', 'Online', 'Anxiety management tips.', 'Pending', 'Initial assessment.', '2024-02-11 08:00:00'),
(12, 12, '2024-02-12', '02:30 PM', 'In-Person', 'Relationship goals set.', 'Completed', 'Couple exercises.', '2024-02-12 08:00:00'),
(13, 13, '2024-02-13', '10:00 AM', 'Online', 'Stress relief methods.', 'Completed', 'Breathing techniques.', '2024-02-13 08:00:00'),
(14, 14, '2024-02-14', '03:30 PM', 'In-Person', 'Addiction support ongoing.', 'Pending', 'Relapse prevention.', '2024-02-14 08:00:00'),
(15, 15, '2024-02-15', '01:30 PM', 'Online', 'Child behavior strategies.', 'Completed', 'School integration.', '2024-02-15 08:00:00'),
(16, 16, '2024-02-16', '04:30 PM', 'In-Person', 'Grief stages discussed.', 'Completed', 'Memory sharing.', '2024-02-16 08:00:00'),
(17, 17, '2024-02-17', '11:00 AM', 'Online', 'Career pivot advice.', 'Pending', 'Networking tips.', '2024-02-17 08:00:00'),
(18, 18, '2024-02-18', '12:30 PM', 'In-Person', 'Trauma healing steps.', 'Completed', 'Journaling assigned.', '2024-02-18 08:00:00'),
(19, 19, '2024-02-19', '09:00 AM', 'Online', 'Family conflict resolution.', 'Completed', 'Boundary setting.', '2024-02-19 08:00:00'),
(20, 20, '2024-02-20', '02:00 PM', 'In-Person', 'Self-esteem workshop.', 'Pending', 'Goal tracking.', '2024-02-20 08:00:00');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM counseling_sessions;

TRUNCATE TABLE counseling_sessions ;

DROP TABLE counseling_sessions;

-- 🧩 TABLE 11 — counselors
-- 🔹 20 Advanced SQL Queries with Documentation
-- ====================== JOINS (1–5) ======================

-- 1️⃣ INNER JOIN: Counselors with their counseling sessions
SELECT c.name, cs.session_date, cs.mode, cs.status
FROM counselors c
INNER JOIN counseling_sessions cs ON c.counselor_id = cs.counselor_id;

-- 2️⃣ LEFT JOIN: Show all counselors even if no sessions yet
SELECT c.name, cs.session_date
FROM counselors c
LEFT JOIN counseling_sessions cs ON c.counselor_id = cs.counselor_id;

-- 3️⃣ RIGHT JOIN: Show all sessions with counselor names
SELECT c.name, cs.session_date
FROM counselors c
RIGHT JOIN counseling_sessions cs ON c.counselor_id = cs.counselor_id;

-- 4️⃣ SELF JOIN: Compare counselors with same specialization
SELECT a.name AS Counselor1, b.name AS Counselor2, a.specialization
FROM counselors a
JOIN counselors b 
ON a.specialization = b.specialization AND a.counselor_id <> b.counselor_id;

-- 5️⃣ CROSS JOIN: Generate all counselor and day combinations
SELECT c.name, d.day_name
FROM counselors c
CROSS JOIN (SELECT 'Monday' AS day_name UNION SELECT 'Tuesday' UNION SELECT 'Wednesday') d;

-- ====================== SUBQUERIES (6–10) ======================

-- 6️⃣ Counselors charging more than the average session fee
SELECT name, session_fee
FROM counselors
WHERE session_fee > (SELECT AVG(session_fee) FROM counselors);

-- 7️⃣ Find counselor with highest fee
SELECT name, session_fee
FROM counselors
WHERE session_fee = (SELECT MAX(session_fee) FROM counselors);

-- 8️⃣ Counselors with experience more than the average
SELECT name, experience_years
FROM counselors
WHERE experience_years > (SELECT AVG(experience_years) FROM counselors);

-- 9️⃣ Counselors who have conducted at least one session
SELECT name
FROM counselors
WHERE counselor_id IN (SELECT counselor_id FROM counseling_sessions);

-- 🔟 Counselors without any sessions
SELECT name
FROM counselors
WHERE counselor_id NOT IN (SELECT counselor_id FROM counseling_sessions);

-- ====================== BUILT-IN FUNCTIONS (11–15) ======================

-- 11️⃣ Convert counselor names to uppercase
SELECT UPPER(name) AS Counselor_Name_Upper FROM counselors;

-- 12️⃣ Calculate total number of counselors per specialization
SELECT specialization, COUNT(*) AS Total_Counselors
FROM counselors
GROUP BY specialization;

-- 13️⃣ Round off session fees
SELECT name, ROUND(session_fee) AS Rounded_Fee FROM counselors;

-- 14️⃣ Get year of counselor registration
SELECT name, YEAR(created_at) AS Registered_Year FROM counselors;

-- 15️⃣ Calculate average fee per specialization
SELECT specialization, AVG(session_fee) AS Avg_Fee
FROM counselors
GROUP BY specialization;

-- ====================== USER-DEFINED FUNCTIONS (16–20) ======================

-- 16️⃣ Create UDF: Calculate annual earnings based on sessions/week
DELIMITER //
CREATE FUNCTION CalculateAnnualEarnings(fee DECIMAL(10,2), sessions_per_week INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
RETURN fee * sessions_per_week * 52;
//
DELIMITER ;

-- 17️⃣ Use UDF to show estimated annual earnings
SELECT name, CalculateAnnualEarnings(session_fee, 5) AS Estimated_Annual_Income FROM counselors;

-- 18️⃣ Create UDF: Check experience level
DELIMITER //
CREATE FUNCTION ExperienceLevel(years INT)
RETURNS VARCHAR(20)
DETERMINISTIC
RETURN (CASE 
    WHEN years < 5 THEN 'Junior'
    WHEN years BETWEEN 5 AND 10 THEN 'Mid-Level'
    ELSE 'Senior'
END);
//
DELIMITER ;

-- 19️⃣ Use UDF to show counselor experience level
SELECT name, experience_years, ExperienceLevel(experience_years) AS Level FROM counselors;

-- 20️⃣ Find average estimated annual earnings of all counselors
SELECT AVG(CalculateAnnualEarnings(session_fee, 5)) AS Avg_Annual_Income FROM counselors;

-- 🧠 TABLE 12 — counseling_sessions
-- 🔹 20 Advanced SQL Queries with Documentation
-- ====================== JOINS (1–5) ======================

-- 1️⃣ INNER JOIN: Show user names and counselor names for each session
SELECT u.name AS UserName, c.name AS CounselorName, cs.session_date, cs.mode
FROM counseling_sessions cs
INNER JOIN users u ON cs.user_id = u.user_id
INNER JOIN counselors c ON cs.counselor_id = c.counselor_id;

-- 2️⃣ LEFT JOIN: Show all sessions and counselor details (even if missing counselor info)
SELECT cs.session_id, c.name, cs.mode, cs.status
FROM counseling_sessions cs
LEFT JOIN counselors c ON cs.counselor_id = c.counselor_id;

-- 3️⃣ RIGHT JOIN: Show all counselors even without sessions
SELECT c.name, cs.session_id
FROM counselors c
RIGHT JOIN counseling_sessions cs ON c.counselor_id = cs.counselor_id;

-- 4️⃣ SELF JOIN: Compare sessions of the same counselor
SELECT a.session_id AS Session1, b.session_id AS Session2, a.counselor_id
FROM counseling_sessions a
JOIN counseling_sessions b
ON a.counselor_id = b.counselor_id AND a.session_id <> b.session_id;

-- 5️⃣ CROSS JOIN: All counselors × available modes
SELECT c.name, m.mode
FROM counselors c
CROSS JOIN (SELECT 'Online' AS mode UNION SELECT 'In-Person') m;

-- ====================== SUBQUERIES (6–10) ======================

-- 6️⃣ Sessions after average session date
SELECT * FROM counseling_sessions
WHERE session_date > (SELECT AVG(session_date) FROM counseling_sessions);

-- 7️⃣ Sessions with pending status
SELECT * FROM counseling_sessions
WHERE status IN (SELECT DISTINCT status FROM counseling_sessions WHERE status = 'Pending');

-- 8️⃣ Counselors who conducted more than 3 sessions
SELECT counselor_id, COUNT(*) AS Total_Sessions
FROM counseling_sessions
GROUP BY counselor_id
HAVING COUNT(*) > 3;

-- 9️⃣ Session feedbacks that contain the word ‘stress’
SELECT feedback FROM counseling_sessions WHERE feedback LIKE '%stress%';

-- 🔟 Get sessions where counselor fee > 140 using subquery
SELECT cs.*
FROM counseling_sessions cs
WHERE counselor_id IN (SELECT counselor_id FROM counselors WHERE session_fee > 140);

-- ====================== BUILT-IN FUNCTIONS (11–15) ======================

-- 11️⃣ Convert feedback to uppercase
SELECT UPPER(feedback) AS Feedback_Upper FROM counseling_sessions;

-- 12️⃣ Count total completed sessions
SELECT COUNT(*) AS Completed_Sessions FROM counseling_sessions WHERE status = 'Completed';

-- 13️⃣ Calculate number of days since each session
SELECT session_id, DATEDIFF(NOW(), session_date) AS Days_Since_Session FROM counseling_sessions;

-- 14️⃣ Display session month and year
SELECT session_id, MONTH(session_date) AS Month, YEAR(session_date) AS Year FROM counseling_sessions;

-- 15️⃣ Calculate average sessions per counselor
SELECT counselor_id, COUNT(*) AS Total_Sessions
FROM counseling_sessions
GROUP BY counselor_id;

-- ====================== USER-DEFINED FUNCTIONS (16–20) ======================

-- 16️⃣ Create UDF: Mark session as completed or pending
DELIMITER //
CREATE FUNCTION CheckSessionStatus(status VARCHAR(20))
RETURNS VARCHAR(20)
DETERMINISTIC
RETURN (CASE 
    WHEN status = 'Completed' THEN '✔ Done'
    WHEN status = 'Pending' THEN '⏳ Awaited'
    ELSE '❌ Cancelled'
END);
//
DELIMITER ;

-- 17️⃣ Use UDF
SELECT session_id, CheckSessionStatus(status) AS SessionRemark FROM counseling_sessions;

-- 18️⃣ Create UDF: Calculate session reward points
DELIMITER //
CREATE FUNCTION SessionPoints(status VARCHAR(20))
RETURNS INT
DETERMINISTIC
RETURN (CASE 
    WHEN status = 'Completed' THEN 10
    WHEN status = 'Pending' THEN 5
    ELSE 0
END);
//
DELIMITER ;

-- 19️⃣ Use UDF for reward calculation
SELECT session_id, status, SessionPoints(status) AS RewardPoints FROM counseling_sessions;

-- 20️⃣ Total reward points for each counselor
SELECT counselor_id, SUM(SessionPoints(status)) AS TotalPoints
FROM counseling_sessions
GROUP BY counselor_id;


-- 🔹 1️⃣ JOINS
-- (1) INNER JOIN – Show all counseling sessions with user and counselor names
SELECT 
    cs.session_id,
    u.user_name,
    c.counselor_name,
    cs.session_date,
    cs.mode,
    cs.status
FROM counseling_sessions cs
INNER JOIN users u ON cs.user_id = u.user_id
INNER JOIN counselors c ON cs.counselor_id = c.counselor_id;

-- (2) LEFT JOIN – Show all users, even those without any counseling session
SELECT 
    u.user_id,
    u.user_name,
    cs.session_id,
    cs.status
FROM users u
LEFT JOIN counseling_sessions cs ON u.user_id = cs.user_id;

-- (3) RIGHT JOIN – Show all counselors and their assigned sessions (if any)
SELECT 
    c.counselor_name,
    cs.session_id,
    cs.mode,
    cs.status
FROM counseling_sessions cs
RIGHT JOIN counselors c ON cs.counselor_id = c.counselor_id;

-- (4) SELF JOIN – Find sessions on the same day (different users)
SELECT 
    a.session_id AS Session1,
    b.session_id AS Session2,
    a.session_date
FROM counseling_sessions a
JOIN counseling_sessions b 
ON a.session_date = b.session_date
AND a.session_id <> b.session_id;

-- (5) CROSS JOIN – Combine all users and all available session modes
SELECT 
    u.user_name,
    m.mode_type
FROM users u
CROSS JOIN (
    SELECT DISTINCT mode AS mode_type FROM counseling_sessions
) m;

-- 🔹 2️⃣ SUBQUERIES
-- (1) Scalar Subquery – Find sessions longer than the average session date
SELECT 
    session_id, 
    session_date
FROM counseling_sessions
WHERE session_date > (SELECT AVG(session_date) FROM counseling_sessions);


-- (2) Correlated Subquery – Find sessions that have feedback longer than average feedback for that mode
SELECT 
    session_id, mode, feedback
FROM counseling_sessions cs1
WHERE LENGTH(feedback) > (
    SELECT AVG(LENGTH(feedback))
    FROM counseling_sessions cs2
    WHERE cs2.mode = cs1.mode
);

-- (3) Subquery with IN – List counselors who have at least one completed session
SELECT counselor_name
FROM counselors
WHERE counselor_id IN (
    SELECT counselor_id 
    FROM counseling_sessions
    WHERE status = 'Completed'
);

-- (4) Subquery with EXISTS – Find users with pending sessions
SELECT user_name
FROM users u
WHERE EXISTS (
    SELECT 1
    FROM counseling_sessions cs
    WHERE cs.user_id = u.user_id
    AND cs.status = 'Pending'
);

-- (5) Subquery in FROM – Find average feedback length per mode
SELECT 
    mode,
    AVG(feedback_length) AS avg_feedback_length
FROM (
    SELECT 
        mode,
        LENGTH(feedback) AS feedback_length
    FROM counseling_sessions
) AS temp
GROUP BY mode;

-- 🔹 3️⃣ BUILT-IN FUNCTIONS
-- (1) String Function – Convert counselor names to uppercase
SELECT UPPER(c.counselor_name) AS CounselorNameCaps
FROM counselors c;

-- (2) Date Function – Calculate how many days ago each session happened
SELECT 
    session_id,
    DATEDIFF(NOW(), session_date) AS DaysSinceSession
FROM counseling_sessions;

-- (3) Numeric Function – Round total feedback word count average
SELECT ROUND(AVG(LENGTH(feedback)/5)) AS AvgWordsPerFeedback
FROM counseling_sessions;

-- (4) Aggregate Function – Total completed vs pending sessions
SELECT 
    status,
    COUNT(*) AS TotalSessions
FROM counseling_sessions
GROUP BY status;

-- (5) Combined String + Date Function – Create a formatted session label
SELECT 
    CONCAT('Session on ', DATE_FORMAT(session_date, '%M %d, %Y')) AS SessionLabel
FROM counseling_sessions;

-- 🔹 4️⃣ USER-DEFINED FUNCTIONS (UDFs)
-- (1) Calculate Next Follow-Up Date (7 days after session)
DELIMITER //
CREATE FUNCTION GetNextFollowUp(session_date DATETIME)
RETURNS DATE
DETERMINISTIC
RETURN DATE_ADD(session_date, INTERVAL 7 DAY);
//
DELIMITER ;

-- Usage:
SELECT session_id, GetNextFollowUp(session_date) AS NextFollowUp FROM counseling_sessions;

-- (2) Classify Session Status
DELIMITER //
CREATE FUNCTION SessionStatusLabel(status VARCHAR(30))
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN CASE
    WHEN status = 'Completed' THEN '✅ Done'
    WHEN status = 'Pending' THEN '🕒 Scheduled'
    ELSE 'Unknown'
END;
//
DELIMITER ;

SELECT session_id, SessionStatusLabel(status) FROM counseling_sessions;

-- (3) Calculate Session Weekday
DELIMITER //
CREATE FUNCTION GetSessionDay(session_date DATETIME)
RETURNS VARCHAR(20)
DETERMINISTIC
RETURN DAYNAME(session_date);
//
DELIMITER ;

SELECT session_id, GetSessionDay(session_date) AS SessionDay FROM counseling_sessions;

-- (4) Calculate Feedback Word Count
DELIMITER //
CREATE FUNCTION FeedbackWordCount(feedback TEXT)
RETURNS INT
DETERMINISTIC
RETURN LENGTH(feedback) - LENGTH(REPLACE(feedback, ' ', '')) + 1;
//
DELIMITER ;

SELECT session_id, FeedbackWordCount(feedback) AS WordCount FROM counseling_sessions;

-- (5) Determine Session Type
DELIMITER //
CREATE FUNCTION GetSessionType(mode VARCHAR(20))
RETURNS VARCHAR(30)
DETERMINISTIC
RETURN CASE
    WHEN mode = 'Online' THEN '🖥️ Virtual'
    WHEN mode = 'In-Person' THEN '🏢 Physical'
    ELSE 'Other'
END;
//
DELIMITER ;

SELECT session_id, GetSessionType(mode) FROM counseling_sessions;

-- 1–4. Views (4)
-- 1) Simple view: completed sessions with basic info
CREATE OR REPLACE VIEW v_completed_sessions AS
SELECT session_id, user_id, counselor_id, session_date, session_time, mode, status
FROM counseling_sessions
WHERE status = 'Completed';

-- 2) View: sessions per counselor with counts and last session date
CREATE OR REPLACE VIEW v_sessions_per_counselor AS
SELECT counselor_id,
       COUNT(*) AS total_sessions,
       MAX(session_date) AS last_session_date
FROM counseling_sessions
GROUP BY counselor_id;

-- 3) View: pending sessions with user and counselor (join-ready)
CREATE OR REPLACE VIEW v_pending_session_details AS
SELECT cs.session_id, cs.user_id, cs.counselor_id, cs.session_date, cs.mode, cs.notes
FROM counseling_sessions cs
WHERE cs.status = 'Pending';

-- 4) Complex view: feedback analytics (avg length & completed percentage by mode)
CREATE OR REPLACE VIEW v_feedback_analytics AS
SELECT
  mode,
  AVG(LENGTH(IFNULL(feedback,''))) AS avg_feedback_length,
  SUM(CASE WHEN status='Completed' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS pct_completed
FROM counseling_sessions
GROUP BY mode;

-- 5–7. Cursors (3)
-- 5) Cursor: iterate pending sessions and return id + date (demo of row-by-row)
DELIMITER $$
CREATE PROCEDURE proc_list_pending_sessions()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_date DATETIME;
  DECLARE cur CURSOR FOR SELECT session_id, session_date FROM counseling_sessions WHERE status='Pending' ORDER BY session_date;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  fetch_loop: LOOP
    FETCH cur INTO v_id, v_date;
    IF done THEN
      LEAVE fetch_loop;
    END IF;
    SELECT v_id AS session_id, v_date AS session_date;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 6) Cursor: mark very old pending sessions (older than 30 days) as 'No-Show'
DELIMITER $$
CREATE PROCEDURE proc_mark_old_pending_no_show()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE cur CURSOR FOR
    SELECT session_id FROM counseling_sessions
    WHERE status='Pending' AND session_date < (NOW() - INTERVAL 30 DAY);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop1: LOOP
    FETCH cur INTO v_id;
    IF done THEN
      LEAVE loop1;
    END IF;
    UPDATE counseling_sessions SET status='No-Show' WHERE session_id = v_id;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 7) Cursor: send reminders (select stmt simulates emails) for sessions happening next day
DELIMITER $$
CREATE PROCEDURE proc_select_tomorrow_sessions_for_reminder()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_user INT;
  DECLARE v_date DATETIME;
  DECLARE cur CURSOR FOR
    SELECT session_id, user_id, session_date FROM counseling_sessions
    WHERE DATE(session_date) = DATE(NOW() + INTERVAL 1 DAY) AND status='Pending';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  rem_loop: LOOP
    FETCH cur INTO v_id, v_user, v_date;
    IF done THEN
      LEAVE rem_loop;
    END IF;
    -- For demonstration: select reminder info (replace with actual notification call in app)
    SELECT CONCAT('Remind user ', v_user, ' of session ', v_id, ' at ', v_date) AS reminder_text;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 8–11. Stored Procedures (4)
-- 8) Add a new counseling session (transaction-safe example)
DELIMITER $$
CREATE PROCEDURE sp_add_session(
  IN p_user_id INT,
  IN p_counselor_id INT,
  IN p_session_date DATETIME,
  IN p_session_time VARCHAR(20),
  IN p_mode VARCHAR(20),
  IN p_notes TEXT
)
BEGIN
  START TRANSACTION;
    INSERT INTO counseling_sessions (user_id, counselor_id, session_date, session_time, mode, notes, status, created_at)
    VALUES (p_user_id, p_counselor_id, p_session_date, p_session_time, p_mode, p_notes, 'Pending', NOW());
  COMMIT;
END $$
DELIMITER ;

-- 9) Update session status safely and log change to audit table
-- (requires audit table; we create if not exists)
CREATE TABLE IF NOT EXISTS counseling_session_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  session_id INT,
  old_status VARCHAR(30),
  new_status VARCHAR(30),
  changed_at DATETIME
);

DELIMITER $$
CREATE PROCEDURE sp_update_session_status(IN p_session_id INT, IN p_new_status VARCHAR(30))
BEGIN
  DECLARE v_old_status VARCHAR(30);
  SELECT status INTO v_old_status FROM counseling_sessions WHERE session_id = p_session_id;
  UPDATE counseling_sessions SET status = p_new_status WHERE session_id = p_session_id;
  INSERT INTO counseling_session_audit (session_id, old_status, new_status, changed_at)
    VALUES (p_session_id, v_old_status, p_new_status, NOW());
END $$
DELIMITER ;

-- 10) Get sessions for a counselor between dates (paginated)
DELIMITER $$
CREATE PROCEDURE sp_get_sessions_by_counselor(
  IN p_counselor_id INT,
  IN p_start_date DATE, IN p_end_date DATE,
  IN p_offset INT, IN p_limit INT
)
BEGIN
  SELECT session_id, user_id, session_date, status, mode
  FROM counseling_sessions
  WHERE counselor_id = p_counselor_id
    AND DATE(session_date) BETWEEN p_start_date AND p_end_date
  ORDER BY session_date
  LIMIT p_offset, p_limit;
END $$
DELIMITER ;

-- 11) Delete older completed sessions (archive pattern) — returns affected count
DELIMITER $$
CREATE PROCEDURE sp_delete_old_completed(IN p_before_date DATE, OUT p_deleted INT)
BEGIN
  START TRANSACTION;
    DELETE FROM counseling_sessions
    WHERE status='Completed' AND DATE(session_date) < p_before_date;
    SET p_deleted = ROW_COUNT();
  COMMIT;
END $$
DELIMITER ;

-- 12–15. Window / Analytic Queries (4)
-- 12) Rank counselors by number of completed sessions (most first)
SELECT
  counselor_id,
  COUNT(*) AS completed_count,
  RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_by_completed
FROM counseling_sessions
WHERE status='Completed'
GROUP BY counselor_id
ORDER BY completed_count DESC;

-- 13) Running total of sessions by date (chronological)
SELECT session_date,
       COUNT(*) AS sessions_on_day,
       SUM(COUNT(*)) OVER (ORDER BY DATE(session_date)) AS running_total_sessions
FROM counseling_sessions
GROUP BY DATE(session_date)
ORDER BY DATE(session_date);

-- 14) Use LAG to show previous session date per user
SELECT user_id, session_id, session_date,
       LAG(session_date) OVER (PARTITION BY user_id ORDER BY session_date) AS prev_session_date
FROM counseling_sessions;

-- 15) Percent of completed sessions per mode (using window)
SELECT mode,
       COUNT(*) AS total_sessions,
       SUM(CASE WHEN status='Completed' THEN 1 ELSE 0 END) AS completed_sessions,
       ROUND( SUM(CASE WHEN status='Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_completed
FROM counseling_sessions
GROUP BY mode;

-- 16–18. DCL & TCL (3)
-- 16) DCL: grant read-only access to analytics role
GRANT SELECT ON counseling_sessions TO 'analytics_user'@'localhost';

-- 17) DCL: revoke DELETE rights from a junior role
REVOKE DELETE ON counseling_sessions FROM 'junior_user'@'localhost';

-- 18) TCL: example transaction to confirm a session only when notes exist
START TRANSACTION;
  UPDATE counseling_sessions
  SET status='Confirmed'
  WHERE session_id = 5 AND notes IS NOT NULL AND status='Pending';
  -- If validation fails, ROLLBACK; otherwise COMMIT
COMMIT;

-- 19–20. Triggers (2)
-- 19) BEFORE INSERT trigger: ensure session_date is in future for Pending sessions
DELIMITER $$
CREATE TRIGGER trg_cs_before_insert
BEFORE INSERT ON counseling_sessions
FOR EACH ROW
BEGIN
  IF NEW.status = 'Pending' AND NEW.session_date < NOW() THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pending session_date must be in the future';
  END IF;
  IF NEW.created_at IS NULL THEN
    SET NEW.created_at = NOW();
  END IF;
END $$
DELIMITER ;

-- 20) AFTER UPDATE trigger: when status changes to 'Completed', update counselor metrics or log
DELIMITER $$
CREATE TRIGGER trg_cs_after_update
AFTER UPDATE ON counseling_sessions
FOR EACH ROW
BEGIN
  -- If status changed to Completed, insert a record into counseling_session_audit (if not already logged)
  IF OLD.status <> NEW.status AND NEW.status = 'Completed' THEN
    INSERT INTO counseling_session_audit (session_id, old_status, new_status, changed_at)
    VALUES (NEW.session_id, OLD.status, NEW.status, NOW());
  END IF;
END $$
DELIMITER ;
--  ========================================================== CREATE  TABLE  13. EVENTS =======================================================================


-- 13. EVENTS
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150),
    description TEXT,
    event_date DATE,
    event_time VARCHAR(20),
    location VARCHAR(255),
    organizer VARCHAR(100),
    image_url VARCHAR(255),
    type VARCHAR(50),
    created_at DATETIME
);

-- ======================================================= INSERT INTO  events  =================================================================================

INSERT INTO events (title, description, event_date, event_time, location, organizer, image_url, type, created_at) VALUES
('Mental Health Workshop', 'Learn coping strategies for daily stress.', '2024-03-01', '10:00 AM', 'Community Center, NYC', 'Wellness Org', '/images/workshop1.jpg', 'Workshop', '2024-01-01 10:00:00'),
('Yoga for Beginners', 'Intro to yoga poses and breathing.', '2024-03-02', '09:00 AM', 'Park, LA', 'Yoga Club', '/images/yoga1.jpg', 'Class', '2024-01-02 10:00:00'),
('Support Group Meeting', 'Share experiences in a safe space.', '2024-03-03', '07:00 PM', 'Online', 'Support Network', '/images/group1.jpg', 'Meeting', '2024-01-03 10:00:00'),
('Art Therapy Session', 'Express emotions through art.', '2024-03-04', '02:00 PM', 'Gallery, Chicago', 'Art Therapy', '/images/art1.jpg', 'Therapy', '2024-01-04 10:00:00'),
('Fitness Challenge', 'Group workout for mental boost.', '2024-03-05', '11:00 AM', 'Gym, Miami', 'FitMind', '/images/fitness1.jpg', 'Challenge', '2024-01-05 10:00:00'),
('Meditation Retreat', 'Day of guided meditation.', '2024-03-06', '08:00 AM', 'Retreat Center, SF', 'Zen Group', '/images/meditation1.jpg', 'Retreat', '2024-01-06 10:00:00'),
('Parenting Seminar', 'Tips for raising resilient kids.', '2024-03-07', '06:00 PM', 'School, Boston', 'Parent Org', '/images/parenting1.jpg', 'Seminar', '2024-01-07 10:00:00'),
('Book Club on Wellness', 'Discuss books on mental health.', '2024-03-08', '05:00 PM', 'Library, Seattle', 'Book Club', '/images/book1.jpg', 'Club', '2024-01-08 10:00:00'),
('Dance Therapy', 'Move to heal the mind.', '2024-03-09', '03:00 PM', 'Studio, Denver', 'Dance Heal', '/images/dance1.jpg', 'Therapy', '2024-01-09 10:00:00'),
('Nutrition Talk', 'Food and mood connection.', '2024-03-10', '12:00 PM', 'Cafe, Austin', 'NutriMind', '/images/nutrition1.jpg', 'Talk', '2024-01-10 10:00:00'),
('Mindfulness Hike', 'Nature walk with mindfulness.', '2024-03-11', '09:00 AM', 'Trail, Portland', 'EcoTherapy', '/images/hike1.jpg', 'Outdoor', '2024-01-11 10:00:00'),
('Grief Workshop', 'Tools for coping with loss.', '2024-03-12', '01:00 PM', 'Center, Philly', 'Grief Support', '/images/grief1.jpg', 'Workshop', '2024-01-12 10:00:00'),
('Career Wellness Day', 'Balance work and life.', '2024-03-13', '10:30 AM', 'Office, Dallas', 'Career Org', '/images/career1.jpg', 'Day Event', '2024-01-13 10:00:00'),
('Art Exhibit Opening', 'Art inspired by recovery stories.', '2024-03-14', '07:00 PM', 'Museum, Atlanta', 'Art Recovery', '/images/exhibit1.jpg', 'Exhibit', '2024-01-14 10:00:00'),
('Sleep Hygiene Seminar', 'Improve sleep for better mental health.', '2024-03-15', '08:00 PM', 'Online', 'Sleep Experts', '/images/sleep1.jpg', 'Seminar', '2024-01-15 10:00:00'),
('Volunteer Fair', 'Get involved in community health.', '2024-03-16', '11:30 AM', 'Fairground, Houston', 'Volunteer Net', '/images/volunteer1.jpg', 'Fair', '2024-01-16 10:00:00'),
('Poetry Reading', 'Share poems on emotional journeys.', '2024-03-17', '04:00 PM', 'Cafe, Nashville', 'Poets United', '/images/poetry1.jpg', 'Reading', '2024-01-17 10:00:00'),
('Breathwork Class', 'Deep breathing for anxiety relief.', '2024-03-18', '02:30 PM', 'Studio, Phoenix', 'Breath Org', '/images/breath1.jpg', 'Class', '2024-01-18 10:00:00'),
('Family Fun Day', 'Activities for family bonding.', '2024-03-19', '12:30 PM', 'Park, Orlando', 'Family Center', '/images/family1.jpg', 'Fun Day', '2024-01-19 10:00:00'),
('Resilience Training', 'Build inner strength workshop.', '2024-03-20', '09:30 AM', 'Center, Vegas', 'Resilience Group', '/images/resilience1.jpg', 'Training', '2024-01-20 10:00:00');


-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM  events;

 TRUNCATE  TABLE counseling_sessions;

DROP TABLE counseling_sessions;

-- 🧾 EVENTS TABLE — Phase 3 Queries
-- =======================================================
-- 📘 PROJECT SUBMISSION PHASE-3: EVENTS TABLE
-- =======================================================
-- Objective: Apply Joins, Subqueries, Built-in & User-defined Functions
-- =======================================================

-- ====================== 🔹 JOINS (5 Queries) ======================

-- 1️⃣ INNER JOIN: Show all events with their corresponding organizer details
SELECT e.title, e.event_date, e.location, o.organizer_name, o.contact_email
FROM events e
INNER JOIN organizers o ON e.organizer = o.organizer_name;

-- 2️⃣ LEFT JOIN: List all events and include registration details if available
SELECT e.title, e.event_date, r.participant_name, r.registration_date
FROM events e
LEFT JOIN registrations r ON e.event_id = r.event_id;

-- 3️⃣ RIGHT JOIN: Show all sponsors and their sponsored events (if any)
SELECT s.sponsor_name, e.title, e.location
FROM events e
RIGHT JOIN sponsors s ON e.organizer = s.sponsor_name;

-- 4️⃣ SELF JOIN: Compare events of the same type held on different dates
SELECT e1.title AS Event1, e2.title AS Event2, e1.type
FROM events e1
JOIN events e2 ON e1.type = e2.type AND e1.event_id <> e2.event_id
WHERE e1.type = 'Workshop';

-- 5️⃣ CROSS JOIN: Generate a list of every event-location combination
SELECT e.title, l.city
FROM events e
CROSS JOIN locations l;

-- ====================== 🔹 SUBQUERIES (5 Queries) ======================

-- 6️⃣ Find events happening after the average event date (using scalar subquery)
SELECT title, event_date
FROM events
WHERE event_date > (SELECT AVG(event_date) FROM events);

-- 7️⃣ Find events organized by organizers who have hosted more than 2 events
SELECT title, organizer
FROM events
WHERE organizer IN (
    SELECT organizer
    FROM events
    GROUP BY organizer
    HAVING COUNT(event_id) > 2
);

-- 8️⃣ Find the earliest event for each type using correlated subquery
SELECT e1.title, e1.type, e1.event_date
FROM events e1
WHERE e1.event_date = (
    SELECT MIN(e2.event_date)
    FROM events e2
    WHERE e2.type = e1.type
);

-- 9️⃣ Display events that have at least one registration (EXISTS)
SELECT title, event_date
FROM events e
WHERE EXISTS (
    SELECT 1
    FROM registrations r
    WHERE r.event_id = e.event_id
);

-- 🔟 Find events whose organizer also organizes “Meditation Retreat”
SELECT title, organizer
FROM events
WHERE organizer = (
    SELECT organizer FROM events WHERE title = 'Meditation Retreat'
);

-- ====================== 🔹 BUILT-IN FUNCTIONS (5 Queries) ======================

-- 11️⃣ Convert event titles to uppercase
SELECT UPPER(title) AS Uppercase_Title FROM events;

-- 12️⃣ Concatenate title and type for better display
SELECT CONCAT(title, ' - ', type) AS Event_Full_Title FROM events;

-- 13️⃣ Calculate the number of days until the event
SELECT title, DATEDIFF(event_date, CURDATE()) AS Days_Remaining FROM events;

-- 14️⃣ Display only month and year of event dates
SELECT title, MONTH(event_date) AS Event_Month, YEAR(event_date) AS Event_Year FROM events;

-- 15️⃣ Count total events per organizer
SELECT organizer, COUNT(*) AS Total_Events FROM events GROUP BY organizer;

-- ====================== 🔹 USER-DEFINED FUNCTIONS (UDFs) ======================

-- 16️⃣ Create a function to calculate days remaining until event
DELIMITER //
CREATE FUNCTION DaysLeft(eventDate DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DATEDIFF(eventDate, CURDATE());
END //
DELIMITER ;

-- 17️⃣ Use DaysLeft() UDF
SELECT title, DaysLeft(event_date) AS Days_Remaining FROM events;

-- 18️⃣ Create a function to format event title neatly
DELIMITER //
CREATE FUNCTION FormatTitle(title VARCHAR(150))
RETURNS VARCHAR(180)
DETERMINISTIC
BEGIN
    RETURN CONCAT(UCASE(LEFT(title,1)), LCASE(SUBSTRING(title,2)));
END //
DELIMITER ;

-- 19️⃣ Use FormatTitle() UDF
SELECT FormatTitle(title) AS Formatted_Title FROM events;

-- 20️⃣ Create a function to classify event type as “Online” or “Offline”
DELIMITER //
CREATE FUNCTION EventMode(loc VARCHAR(255))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF loc = 'Online' THEN
        RETURN 'Online';
    ELSE
        RETURN 'Offline';
    END IF;
END //
DELIMITER ;

-- Use EventMode()
SELECT title, location, EventMode(location) AS Mode FROM events;

-- 1–4 — Views (4)
-- 1) Upcoming events (events from today onward)
CREATE OR REPLACE VIEW v_upcoming_events AS
SELECT event_id, title, event_date, event_time, location, organizer, type
FROM events
WHERE event_date >= CURDATE()
ORDER BY event_date, event_time;

-- 2) Events count by type
CREATE OR REPLACE VIEW v_events_count_by_type AS
SELECT type, COUNT(*) AS total_events
FROM events
GROUP BY type;

-- 3) Monthly event summary (year + month)
CREATE OR REPLACE VIEW v_monthly_event_summary AS
SELECT YEAR(event_date) AS yr, MONTH(event_date) AS mth,
       COUNT(*) AS events_count,
       GROUP_CONCAT(title SEPARATOR '; ') AS titles
FROM events
GROUP BY YEAR(event_date), MONTH(event_date);

-- 4) Location-focused view (top locations with event counts)
CREATE OR REPLACE VIEW v_location_event_stats AS
SELECT location,
       COUNT(*) AS events_at_location,
       MIN(event_date) AS first_event,
       MAX(event_date) AS last_event
FROM events
GROUP BY location
ORDER BY events_at_location DESC;

-- 5–7 — Cursors (3)
-- 5) Cursor: iterate upcoming events and show event_id + title (demo)
DELIMITER $$
CREATE PROCEDURE proc_list_upcoming_event_titles()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_title VARCHAR(150);
  DECLARE cur CURSOR FOR
    SELECT event_id, title FROM events WHERE event_date >= CURDATE() ORDER BY event_date;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO v_id, v_title;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SELECT v_id AS event_id, v_title AS title;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 6) Cursor: mark past events as 'Archived' in a management column (example assumes you add a status column)
-- If you don't have status column, change to whatever action you need (e.g., move to archive table).
DELIMITER $$
CREATE PROCEDURE proc_archive_past_events()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE cur CURSOR FOR
    SELECT event_id FROM events WHERE event_date < CURDATE();
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop1: LOOP
    FETCH cur INTO v_id;
    IF done THEN
      LEAVE loop1;
    END IF;
    -- Example update: add or set status='Archived' (uncomment if status column exists)
    -- UPDATE events SET status = 'Archived' WHERE event_id = v_id;
    SELECT CONCAT('Would archive event_id: ', v_id) AS info;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 7) Cursor: generate reminders for events happening tomorrow (simulate notification payload)
DELIMITER $$
CREATE PROCEDURE proc_generate_tomorrow_event_reminders()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_title VARCHAR(150);
  DECLARE v_date DATE;
  DECLARE cur CURSOR FOR
    SELECT event_id, title, event_date FROM events WHERE DATE(event_date) = DATE(CURDATE() + INTERVAL 1 DAY);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  rem_loop: LOOP
    FETCH cur INTO v_id, v_title, v_date;
    IF done THEN
      LEAVE rem_loop;
    END IF;
    SELECT CONCAT('Reminder -> Event ', v_id, ': ', v_title, ' on ', v_date) AS reminder;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 8–11 — Stored Procedures (4)
-- 8) Add a new event (transaction-safe)
DELIMITER $$
CREATE PROCEDURE sp_add_event(
  IN p_title VARCHAR(150),
  IN p_description TEXT,
  IN p_event_date DATE,
  IN p_event_time VARCHAR(20),
  IN p_location VARCHAR(255),
  IN p_organizer VARCHAR(100),
  IN p_image_url VARCHAR(255),
  IN p_type VARCHAR(50)
)
BEGIN
  START TRANSACTION;
    INSERT INTO events (title, description, event_date, event_time, location, organizer, image_url, type, created_at)
    VALUES (p_title, p_description, p_event_date, p_event_time, p_location, p_organizer, p_image_url, p_type, NOW());
  COMMIT;
END $$
DELIMITER ;

-- 9) Update event details by id
DELIMITER $$
CREATE PROCEDURE sp_update_event(
  IN p_event_id INT,
  IN p_title VARCHAR(150),
  IN p_description TEXT,
  IN p_event_date DATE,
  IN p_event_time VARCHAR(20),
  IN p_location VARCHAR(255),
  IN p_type VARCHAR(50)
)
BEGIN
  UPDATE events
  SET title = p_title,
      description = p_description,
      event_date = p_event_date,
      event_time = p_event_time,
      location = p_location,
      type = p_type
  WHERE event_id = p_event_id;
END $$
DELIMITER ;

-- 10) Get events by type with pagination
DELIMITER $$
CREATE PROCEDURE sp_get_events_by_type(
  IN p_type VARCHAR(50),
  IN p_offset INT,
  IN p_limit INT
)
BEGIN
  SELECT event_id, title, event_date, event_time, location, organizer
  FROM events
  WHERE type = p_type
  ORDER BY event_date, event_time
  LIMIT p_offset, p_limit;
END $$
DELIMITER ;

-- 11) Delete events older than a given date and return number deleted
DELIMITER $$
CREATE PROCEDURE sp_delete_events_before(IN p_before_date DATE, OUT p_deleted_count INT)
BEGIN
  START TRANSACTION;
    DELETE FROM events WHERE event_date < p_before_date;
    SET p_deleted_count = ROW_COUNT();
  COMMIT;
END $$
DELIMITER ;

-- 12–15 — Window / Analytic Queries (4)
-- 12) Row number of events ordered chronologically (useful for paging without OFFSET)
SELECT event_id, title, event_date,
       ROW_NUMBER() OVER (ORDER BY event_date, event_time) AS rn
FROM events;

-- 13) Rank event dates by how early they occur (earlier dates = higher rank)
SELECT event_id, title, event_date,
       RANK() OVER (ORDER BY event_date ASC) AS date_rank
FROM events;

-- 14) Use LAG/LEAD to compare adjacent events' dates
SELECT event_id, title, event_date,
       LAG(event_date) OVER (ORDER BY event_date) AS prev_event_date,
       LEAD(event_date) OVER (ORDER BY event_date) AS next_event_date
FROM events;

-- 15) Monthly distribution and running total of events
SELECT yr, mth, events_count,
       SUM(events_count) OVER (ORDER BY yr, mth) AS running_total_by_month
FROM (
  SELECT YEAR(event_date) AS yr, MONTH(event_date) AS mth, COUNT(*) AS events_count
  FROM events
  GROUP BY YEAR(event_date), MONTH(event_date)
) t
ORDER BY yr, mth;

-- 16–18 — DCL & TCL (3)
-- 16) Grant read-only analytics access (replace database_name)
GRANT SELECT ON your_database.events TO 'analytics_user'@'localhost';

-- 17) Revoke insert rights from a user
REVOKE INSERT ON your_database.events FROM 'temp_user'@'localhost';

-- 18) Transaction example: create event and an associated image record (assumes image table exists)
START TRANSACTION;
  INSERT INTO events (title, description, event_date, event_time, location, organizer, image_url, type, created_at)
  VALUES ('Sample Event', 'Description', '2025-12-01', '10:00 AM', 'Hall A', 'Org', '/images/sample.jpg', 'Workshop', NOW());
  -- Example: INSERT INTO event_images(event_id, image_url) VALUES (LAST_INSERT_ID(), '/images/sample.jpg');
COMMIT;
-- If something fails, use ROLLBACK instead of COMMIT.

-- 19–20 — Triggers (2)
-- 19) BEFORE INSERT trigger: ensure created_at is set and title is not empty
DELIMITER $$
CREATE TRIGGER trg_events_before_insert
BEFORE INSERT ON events
FOR EACH ROW
BEGIN
  IF NEW.title IS NULL OR TRIM(NEW.title) = '' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Event title cannot be empty';
  END IF;
  IF NEW.created_at IS NULL THEN
    SET NEW.created_at = NOW();
  END IF;
END $$
DELIMITER ;

-- 20) AFTER DELETE trigger: log deleted events into an audit table
CREATE TABLE IF NOT EXISTS events_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  event_id INT,
  title VARCHAR(150),
  deleted_at DATETIME,
  deleted_by VARCHAR(100) DEFAULT NULL
);

DELIMITER $$
CREATE TRIGGER trg_events_after_delete
AFTER DELETE ON events
FOR EACH ROW
BEGIN
  INSERT INTO events_audit (event_id, title, deleted_at)
  VALUES (OLD.event_id, OLD.title, NOW());
END $$
DELIMITER ;
--  ========================================================== CREATE  TABLE 14. EVENT_REGISTRATIONS=======================================================================

-- 14. EVENT_REGISTRATIONS
CREATE TABLE event_registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    user_id INT,
    registration_date DATETIME,
    payment_status VARCHAR(30),
    ticket_type VARCHAR(50),
    amount DECIMAL(10,2),
    status VARCHAR(30),
    qr_code VARCHAR(255),
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ======================================================= INSERT INTO event_registrations =================================================================================

INSERT INTO event_registrations (event_id, user_id, registration_date, payment_status, ticket_type, amount, status, qr_code) VALUES
(1, 1, '2024-02-15 10:00:00', 'Paid', 'General', 25.00, 'Confirmed', '/qr/event1_user1.png'),
(2, 2, '2024-02-16 11:00:00', 'Paid', 'VIP', 50.00, 'Confirmed', '/qr/event2_user2.png'),
(3, 3, '2024-02-17 09:30:00', 'Pending', 'General', 0.00, 'Pending', NULL),
(4, 4, '2024-02-18 02:00:00', 'Paid', 'General', 30.00, 'Confirmed', '/qr/event4_user4.png'),
(5, 5, '2024-02-19 11:30:00', 'Paid', 'Student', 15.00, 'Confirmed', '/qr/event5_user5.png'),
(6, 6, '2024-02-20 08:15:00', 'Paid', 'General', 40.00, 'Confirmed', '/qr/event6_user6.png'),
(7, 7, '2024-02-21 06:45:00', 'Paid', 'VIP', 60.00, 'Confirmed', '/qr/event7_user7.png'),
(8, 8, '2024-02-22 05:20:00', 'Pending', 'General', 20.00, 'Pending', NULL),
(9, 9, '2024-02-23 03:10:00', 'Paid', 'General', 35.00, 'Confirmed', '/qr/event9_user9.png'),
(10, 10, '2024-02-24 12:45:00', 'Paid', 'Student', 10.00, 'Confirmed', '/qr/event10_user10.png'),
(11, 11, '2024-02-25 09:00:00', 'Paid', 'General', 25.00, 'Confirmed', '/qr/event11_user11.png'),
(12, 12, '2024-02-26 01:30:00', 'Refunded', 'VIP', 50.00, 'Cancelled', NULL),
(13, 13, '2024-02-27 10:20:00', 'Paid', 'General', 30.00, 'Confirmed', '/qr/event13_user13.png'),
(14, 14, '2024-02-28 07:15:00', 'Paid', 'General', 45.00, 'Confirmed', '/qr/event14_user14.png'),
(15, 15, '2024-02-29 08:00:00', 'Pending', 'Student', 0.00, 'Pending', NULL),
(16, 16, '2024-03-01 11:45:00', 'Paid', 'General', 20.00, 'Confirmed', '/qr/event16_user16.png'),
(17, 17, '2024-03-02 04:30:00', 'Paid', 'VIP', 55.00, 'Confirmed', '/qr/event17_user17.png'),
(18, 18, '2024-03-03 02:15:00', 'Paid', 'General', 25.00, 'Confirmed', '/qr/event18_user18.png'),
(19, 19, '2024-03-04 12:30:00', 'Paid', 'Student', 15.00, 'Confirmed', '/qr/event19_user19.png'),
(20, 20, '2024-03-05 09:45:00', 'Paid', 'General', 35.00, 'Confirmed', '/qr/event20_user20.png');


-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM event_registrations ;

TRUNCATE TABLE counseling_sessions;

DROP TABLE counseling_sessions;

-- ====================== 🔹 JOINS (5 Queries) ======================

-- 1️⃣ INNER JOIN: Get event titles with their registered users and payment status
SELECT e.title, u.full_name, er.payment_status, er.amount
FROM event_registrations er
INNER JOIN events e ON er.event_id = e.event_id
INNER JOIN users u ON er.user_id = u.user_id;

-- 2️⃣ LEFT JOIN: Show all users and their registration details if available
SELECT u.full_name, er.event_id, er.payment_status
FROM users u
LEFT JOIN event_registrations er ON u.user_id = er.user_id;

-- 3️⃣ RIGHT JOIN: Show all events and the users who registered
SELECT e.title, er.user_id, er.status
FROM event_registrations er
RIGHT JOIN events e ON e.event_id = er.event_id;

-- 4️⃣ SELF JOIN: Compare users who registered for the same event but different ticket types
SELECT a.user_id AS User1, b.user_id AS User2, a.event_id, a.ticket_type, b.ticket_type
FROM event_registrations a
JOIN event_registrations b 
ON a.event_id = b.event_id AND a.user_id <> b.user_id
WHERE a.ticket_type <> b.ticket_type;

-- 5️⃣ CROSS JOIN: Generate all combinations of events and ticket types
SELECT e.title, t.type_name
FROM events e
CROSS JOIN ticket_types t;

-- ====================== 🔹 SUBQUERIES (5 Queries) ======================

-- 6️⃣ Find users who have paid more than the average registration amount
SELECT user_id, amount
FROM event_registrations
WHERE amount > (SELECT AVG(amount) FROM event_registrations);

-- 7️⃣ Find events where at least one registration is still pending
SELECT title
FROM events
WHERE event_id IN (
    SELECT event_id 
    FROM event_registrations 
    WHERE payment_status = 'Pending'
);

-- 8️⃣ Correlated subquery: Get each user’s latest registration date
SELECT u.full_name, er.registration_date
FROM users u
WHERE er.registration_date = (
    SELECT MAX(er2.registration_date)
    FROM event_registrations er2
    WHERE er2.user_id = u.user_id
);

-- 9️⃣ Find all users who registered for “Yoga for Beginners”
SELECT full_name
FROM users
WHERE user_id IN (
    SELECT user_id 
    FROM event_registrations 
    WHERE event_id = (SELECT event_id FROM events WHERE title = 'Yoga for Beginners')
);

-- 🔟 Find events that have at least 5 confirmed registrations (using HAVING)
SELECT e.title, COUNT(er.registration_id) AS total_confirmed
FROM events e
JOIN event_registrations er ON e.event_id = er.event_id
WHERE er.status = 'Confirmed'
GROUP BY e.title
HAVING COUNT(er.registration_id) >= 5;

-- ====================== 🔹 BUILT-IN FUNCTIONS (5 Queries) ======================

-- 11️⃣ Convert ticket types to uppercase
SELECT registration_id, UPPER(ticket_type) AS Ticket_Type_Upper FROM event_registrations;

-- 12️⃣ Calculate total revenue per event using SUM()
SELECT event_id, SUM(amount) AS Total_Revenue
FROM event_registrations
WHERE payment_status = 'Paid'
GROUP BY event_id;

-- 13️⃣ Calculate average ticket amount by type
SELECT ticket_type, ROUND(AVG(amount),2) AS Avg_Amount FROM event_registrations GROUP BY ticket_type;

-- 14️⃣ Display registration date, month, and year using date functions
SELECT registration_id, DATE(registration_date) AS Date, MONTH(registration_date) AS Month, YEAR(registration_date) AS Year
FROM event_registrations;

-- 15️⃣ Concatenate event ID and status into one string
SELECT CONCAT('Event-', event_id, ' Status: ', status) AS Event_Status
FROM event_registrations;

-- ====================== 🔹 USER-DEFINED FUNCTIONS (UDFs) ======================

-- 16️⃣ Create a function to calculate GST (18%) on ticket amount
DELIMITER //
CREATE FUNCTION CalculateGST(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN ROUND(amount * 0.18, 2);
END //
DELIMITER ;

-- Use the function
SELECT registration_id, amount, CalculateGST(amount) AS GST_Amount FROM event_registrations;

-- 17️⃣ Create function to calculate total payable amount including GST
DELIMITER //
CREATE FUNCTION TotalPayable(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN ROUND(amount + (amount * 0.18), 2);
END //
DELIMITER ;

-- Use TotalPayable()
SELECT registration_id, amount, TotalPayable(amount) AS Total_Amount FROM event_registrations;

-- 18️⃣ Function to check if registration is paid or pending
DELIMITER //
CREATE FUNCTION PaymentCheck(status VARCHAR(30))
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    IF status = 'Paid' THEN
        RETURN 'Payment Completed';
    ELSE
        RETURN 'Awaiting Payment';
    END IF;
END //
DELIMITER ;

-- Use PaymentCheck()
SELECT registration_id, payment_status, PaymentCheck(payment_status) AS Payment_Info FROM event_registrations;

-- 19️⃣ Function to classify users based on ticket type
DELIMITER //
CREATE FUNCTION TicketCategory(ticket VARCHAR(50))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF ticket = 'VIP' THEN
        RETURN 'Premium';
    ELSEIF ticket = 'Student' THEN
        RETURN 'Discounted';
    ELSE
        RETURN 'Regular';
    END IF;
END //
DELIMITER ;

-- Use TicketCategory()
SELECT user_id, ticket_type, TicketCategory(ticket_type) AS Category FROM event_registrations;

-- 20️⃣ Function to find discount amount based on ticket type
DELIMITER //
CREATE FUNCTION Discount(ticket VARCHAR(50), amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    IF ticket = 'Student' THEN
        RETURN amount * 0.10;
    ELSEIF ticket = 'VIP' THEN
        RETURN amount * 0.05;
    ELSE
        RETURN 0;
    END IF;
END //
DELIMITER ;

-- Use Discount()
SELECT registration_id, ticket_type, amount, Discount(ticket_type, amount) AS Discount_Amount FROM event_registrations;

-- 🪟 1–4 — VIEWS
-- 1) View: Paid Registrations
CREATE OR REPLACE VIEW v_paid_registrations AS
SELECT registration_id, user_id, event_id, amount, ticket_type, status
FROM event_registrations
WHERE payment_status = 'Paid';

-- 2) View: Pending or Refunded Registrations
CREATE OR REPLACE VIEW v_pending_refunded AS
SELECT registration_id, user_id, event_id, payment_status, status
FROM event_registrations
WHERE payment_status IN ('Pending', 'Refunded');

-- 3) View: Total Amount Collected per Event
CREATE OR REPLACE VIEW v_event_total_amount AS
SELECT event_id, SUM(amount) AS total_amount_collected, COUNT(*) AS total_registrations
FROM event_registrations
WHERE payment_status = 'Paid'
GROUP BY event_id;

-- 4) View: User Payment Summary (join with users)
CREATE OR REPLACE VIEW v_user_payment_summary AS
SELECT r.user_id, COUNT(r.registration_id) AS total_registrations,
       SUM(r.amount) AS total_amount, 
       SUM(CASE WHEN r.payment_status='Paid' THEN 1 ELSE 0 END) AS paid_count
FROM event_registrations r
GROUP BY r.user_id;

-- 🧭 5–7 — CURSORS
-- 5) Cursor: Display all confirmed registrations
DELIMITER $$
CREATE PROCEDURE proc_show_confirmed_registrations()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE reg_id INT;
  DECLARE user_id INT;
  DECLARE cur CURSOR FOR
    SELECT registration_id, user_id FROM event_registrations WHERE status='Confirmed';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop1: LOOP
    FETCH cur INTO reg_id, user_id;
    IF done THEN LEAVE loop1; END IF;
    SELECT CONCAT('Registration #', reg_id, ' for User #', user_id) AS registration_info;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 6) Cursor: Calculate total paid amount dynamically
DELIMITER $$
CREATE PROCEDURE proc_total_paid_amount()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE amt DECIMAL(10,2);
  DECLARE total DECIMAL(10,2) DEFAULT 0;
  DECLARE cur CURSOR FOR
    SELECT amount FROM event_registrations WHERE payment_status='Paid';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop_total: LOOP
    FETCH cur INTO amt;
    IF done THEN LEAVE loop_total; END IF;
    SET total = total + amt;
  END LOOP;
  CLOSE cur;
  SELECT total AS total_paid_amount;
END $$
DELIMITER ;

-- 7) Cursor: Display event-wise ticket types
DELIMITER $$
CREATE PROCEDURE proc_event_ticket_types()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE e_id INT;
  DECLARE t_type VARCHAR(50);
  DECLARE cur CURSOR FOR
    SELECT event_id, ticket_type FROM event_registrations;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop_ticket: LOOP
    FETCH cur INTO e_id, t_type;
    IF done THEN LEAVE loop_ticket; END IF;
    SELECT CONCAT('Event ', e_id, ' - Ticket Type: ', t_type) AS info;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- ⚙️ 8–11 — STORED PROCEDURES
-- 8) Add a new registration
DELIMITER $$
CREATE PROCEDURE sp_add_registration(
  IN p_event_id INT, IN p_user_id INT,
  IN p_payment_status VARCHAR(30),
  IN p_ticket_type VARCHAR(50),
  IN p_amount DECIMAL(10,2),
  IN p_status VARCHAR(30)
)
BEGIN
  INSERT INTO event_registrations (event_id, user_id, registration_date, payment_status, ticket_type, amount, status)
  VALUES (p_event_id, p_user_id, NOW(), p_payment_status, p_ticket_type, p_amount, p_status);
END $$
DELIMITER ;

-- 9) Update payment status
DELIMITER $$
CREATE PROCEDURE sp_update_payment_status(IN p_reg_id INT, IN p_status VARCHAR(30))
BEGIN
  UPDATE event_registrations
  SET payment_status = p_status
  WHERE registration_id = p_reg_id;
END $$
DELIMITER ;

-- 10) Get total collection by event id
DELIMITER $$
CREATE PROCEDURE sp_total_collection_by_event(IN p_event_id INT)
BEGIN
  SELECT event_id, SUM(amount) AS total_amount
  FROM event_registrations
  WHERE event_id = p_event_id AND payment_status='Paid'
  GROUP BY event_id;
END $$
DELIMITER ;

-- 11) Delete cancelled registrations
DELIMITER $$
CREATE PROCEDURE sp_delete_cancelled()
BEGIN
  DELETE FROM event_registrations
  WHERE status='Cancelled';
END $$
DELIMITER ;

-- 📊 12–15 — WINDOW FUNCTIONS
-- 12) Row Number by registration date
SELECT registration_id, user_id, event_id, registration_date,
       ROW_NUMBER() OVER (ORDER BY registration_date) AS row_no
FROM event_registrations;

-- 13) Rank users by total amount spent
SELECT user_id, SUM(amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS spending_rank
FROM event_registrations
GROUP BY user_id;

-- 14) Lead/Lag example: Compare each user's payment to previous registration
SELECT registration_id, user_id, amount,
       LAG(amount) OVER (PARTITION BY user_id ORDER BY registration_date) AS prev_amount,
       LEAD(amount) OVER (PARTITION BY user_id ORDER BY registration_date) AS next_amount
FROM event_registrations;

-- 15) Running total per user
SELECT user_id, registration_id, amount,
       SUM(amount) OVER (PARTITION BY user_id ORDER BY registration_date) AS running_total
FROM event_registrations;

-- 🔐 16–18 — DCL & TCL
-- 16) Grant permission to event manager
GRANT SELECT, INSERT, UPDATE ON event_registrations TO 'event_manager'@'localhost';

-- 17) Revoke DELETE access
REVOKE DELETE ON event_registrations FROM 'event_manager'@'localhost';

-- 18) TCL: Transfer a registration payment safely
START TRANSACTION;
UPDATE event_registrations
SET payment_status='Refunded', status='Cancelled'
WHERE registration_id=12;
ROLLBACK;  -- undo the change if validation fails
-- COMMIT;  -- confirm after verification

-- 🧾 19–20 — TRIGGERS
-- 19) BEFORE INSERT trigger: ensure payment defaults
DELIMITER $$
CREATE TRIGGER trg_before_insert_event_reg
BEFORE INSERT ON event_registrations
FOR EACH ROW
BEGIN
  IF NEW.payment_status IS NULL THEN
    SET NEW.payment_status = 'Pending';
  END IF;
  IF NEW.registration_date IS NULL THEN
    SET NEW.registration_date = NOW();
  END IF;
END $$
DELIMITER ;

-- 20) AFTER UPDATE trigger: log payment changes
CREATE TABLE IF NOT EXISTS registration_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  registration_id INT,
  old_status VARCHAR(30),
  new_status VARCHAR(30),
  changed_at DATETIME
);

DELIMITER $$
CREATE TRIGGER trg_after_payment_update
AFTER UPDATE ON event_registrations
FOR EACH ROW
BEGIN
  IF OLD.payment_status <> NEW.payment_status THEN
    INSERT INTO registration_audit (registration_id, old_status, new_status, changed_at)
    VALUES (OLD.registration_id, OLD.payment_status, NEW.payment_status, NOW());
  END IF;
END $$
DELIMITER ;
--  ========================================================== CREATE TABLE  15. CAMPAIGNS =======================================================================

-- 15. CAMPAIGNS
CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150),
    description TEXT,
    goal_amount DECIMAL(10,2),
    raised_amount DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    organizer VARCHAR(100),
    image_url VARCHAR(255),
    status VARCHAR(30)
);

-- ======================================================= INSERT INTO campaigns  =================================================================================

INSERT INTO campaigns (title, description, goal_amount, raised_amount, start_date, end_date, organizer, image_url, status) VALUES
('Mental Health Awareness Month', 'Fund workshops and resources for mental health education across communities.', 5000.00, 3200.00, '2024-01-15', '2024-02-15', 'Mental Health Org', '/images/campaign1.jpg', 'Active'),
('Therapy Access for Youth', 'Provide free counseling sessions for underprivileged teens.', 10000.00, 7500.00, '2024-01-20', '2024-03-20', 'Youth Support Foundation', '/images/campaign2.jpg', 'Active'),
('Stress Relief Programs', 'Develop online stress management courses and apps.', 8000.00, 4500.00, '2024-02-01', '2024-04-01', 'Wellness Initiative', '/images/campaign3.jpg', 'Active'),
('Grief Support Network', 'Establish support groups for those dealing with loss.', 15000.00, 12000.00, '2024-01-10', '2024-02-28', 'Grief Care', '/images/campaign4.jpg', 'Completed'),
('Anxiety Recovery Fund', 'Support research and therapy for anxiety disorders.', 20000.00, 18000.00, '2023-12-01', '2024-01-31', 'Anxiety Alliance', '/images/campaign5.jpg', 'Completed'),
('Community Wellness Centers', 'Build safe spaces for mental health check-ins.', 30000.00, 15000.00, '2024-02-05', '2024-05-05', 'Community Health', '/images/campaign6.jpg', 'Active'),
('Depression Awareness Drive', 'Create awareness campaigns and hotlines.', 7000.00, 5000.00, '2024-01-25', '2024-03-25', 'Depression Fighters', '/images/campaign7.jpg', 'Active'),
('Addiction Recovery Homes', 'Fund rehabilitation facilities for addicts.', 25000.00, 20000.00, '2024-01-05', '2024-02-20', 'Recovery Network', '/images/campaign8.jpg', 'Active'),
('Family Therapy Grants', 'Offer grants for family counseling services.', 12000.00, 8000.00, '2024-02-10', '2024-04-10', 'Family Wellness', '/images/campaign9.jpg', 'Active'),
('Mindfulness Retreats', 'Sponsor retreats for mental rejuvenation.', 9000.00, 6500.00, '2023-11-15', '2024-01-15', 'Mindful Living', '/images/campaign10.jpg', 'Completed'),
('PTSD Support for Veterans', 'Provide specialized therapy for veterans.', 40000.00, 35000.00, '2024-01-01', '2024-03-01', 'Veterans Aid', '/images/campaign11.jpg', 'Active'),
('Child Mental Health Initiative', 'Programs for early intervention in kids.', 18000.00, 11000.00, '2024-02-15', '2024-05-15', 'Child Mind Org', '/images/campaign12.jpg', 'Active'),
('Workplace Wellness', 'Tools for employee mental health in offices.', 6000.00, 4000.00, '2024-01-30', '2024-03-30', 'Corporate Care', '/images/campaign13.jpg', 'Active'),
('Suicide Prevention Hotline', 'Expand 24/7 hotline services.', 22000.00, 19000.00, '2023-10-01', '2024-01-01', 'Lifeline Project', '/images/campaign14.jpg', 'Completed'),
('Art Therapy for Trauma', 'Fund art-based healing programs.', 11000.00, 7000.00, '2024-02-20', '2024-04-20', 'Art Heal', '/images/campaign15.jpg', 'Active'),
('Senior Mental Health Care', 'Support for elderly depression and isolation.', 14000.00, 9000.00, '2024-01-12', '2024-03-12', 'Senior Wellness', '/images/campaign16.jpg', 'Active'),
('LGBTQ+ Support Services', 'Inclusive counseling for the community.', 16000.00, 13000.00, '2024-02-01', '2024-04-01', 'Pride Health', '/images/campaign17.jpg', 'Active'),
('Burnout Prevention Workshops', 'Educate on avoiding professional burnout.', 5000.00, 3000.00, '2024-01-18', '2024-02-18', 'Burnout Busters', '/images/campaign18.jpg', 'Active'),
('Holistic Healing Center', 'Integrate yoga, therapy, and nutrition.', 28000.00, 22000.00, '2023-12-15', '2024-02-15', 'Holistic Hub', '/images/campaign19.jpg', 'Completed'),
('Emergency Mental Health Fund', 'Rapid response for crisis situations.', 35000.00, 25000.00, '2024-02-25', '2024-05-25', 'Crisis Aid', '/images/campaign20.jpg', 'Active');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM campaigns;

TRUNCATE TABLE campaigns;

DROP  TABLE campaigns;

-- 🧱 1️⃣ JOIN QUERIES (20 Queries)
-- 1. INNER JOIN: Show campaigns and their respective organizers
SELECT c.title, c.organizer, o.email
FROM campaigns c
INNER JOIN organizers o ON c.organizer = o.org_name;

-- 2. LEFT JOIN: Show all campaigns and their donations (if any)
SELECT c.title, d.amount, d.donor_name
FROM campaigns c
LEFT JOIN donations d ON c.campaign_id = d.campaign_id;

-- 3. RIGHT JOIN: Show all donations even if their campaign info is missing
SELECT c.title, d.amount
FROM campaigns c
RIGHT JOIN donations d ON c.campaign_id = d.campaign_id;

-- 4. FULL JOIN (if supported): Combine all campaigns and donations
SELECT c.title, d.amount
FROM campaigns c
FULL JOIN donations d ON c.campaign_id = d.campaign_id;

-- 5. SELF JOIN: Compare campaigns with similar goal amounts
SELECT a.title AS CampaignA, b.title AS CampaignB, a.goal_amount
FROM campaigns a
JOIN campaigns b ON a.goal_amount = b.goal_amount AND a.campaign_id <> b.campaign_id;

-- 6. CROSS JOIN: Display every campaign paired with every organizer
SELECT c.title, o.org_name
FROM campaigns c
CROSS JOIN organizers o;

-- 7. INNER JOIN with condition
SELECT c.title, o.contact_number
FROM campaigns c
INNER JOIN organizers o ON c.organizer = o.org_name
WHERE c.status = 'Active';

-- 8. LEFT JOIN with NULL filter: Find campaigns without donations
SELECT c.title
FROM campaigns c
LEFT JOIN donations d ON c.campaign_id = d.campaign_id
WHERE d.campaign_id IS NULL;

-- 9. RIGHT JOIN: Find donations that belong to completed campaigns
SELECT d.donor_name, d.amount
FROM campaigns c
RIGHT JOIN donations d ON c.campaign_id = d.campaign_id
WHERE c.status = 'Completed';

-- 10. INNER JOIN with aggregate
SELECT c.title, COUNT(d.donation_id) AS TotalDonations
FROM campaigns c
INNER JOIN donations d ON c.campaign_id = d.campaign_id
GROUP BY c.title;

-- 11. INNER JOIN to find top 3 campaigns by raised amount
SELECT c.title, o.org_name, c.raised_amount
FROM campaigns c
INNER JOIN organizers o ON c.organizer = o.org_name
ORDER BY c.raised_amount DESC
LIMIT 3;

-- 12. INNER JOIN: Find organizer’s campaigns ending this month
SELECT c.title, c.end_date, o.org_name
FROM campaigns c
INNER JOIN organizers o ON c.organizer = o.org_name
WHERE MONTH(c.end_date) = MONTH(CURDATE());

-- 13. INNER JOIN: Find campaigns with raised amount > goal/2
SELECT c.title, c.goal_amount, c.raised_amount
FROM campaigns c
INNER JOIN donations d ON c.campaign_id = d.campaign_id
WHERE c.raised_amount > c.goal_amount/2;

-- 14. LEFT JOIN multiple tables
SELECT c.title, o.org_name, d.amount
FROM campaigns c
LEFT JOIN organizers o ON c.organizer = o.org_name
LEFT JOIN donations d ON c.campaign_id = d.campaign_id;

-- 15. INNER JOIN: Campaigns organized by 'Community Health'
SELECT c.title, c.status
FROM campaigns c
JOIN organizers o ON c.organizer = o.org_name
WHERE o.org_name = 'Community Health';

-- 16. SELF JOIN: Compare campaign durations
SELECT a.title AS CampaignA, b.title AS CampaignB, DATEDIFF(a.end_date, a.start_date) AS DurationA
FROM campaigns a
JOIN campaigns b ON a.campaign_id <> b.campaign_id
WHERE DATEDIFF(a.end_date, a.start_date) > DATEDIFF(b.end_date, b.start_date);

-- 17. CROSS JOIN to find all possible combinations of campaigns and statuses
SELECT c1.title, c2.status
FROM campaigns c1
CROSS JOIN campaigns c2;

-- 18. INNER JOIN with GROUP BY organizer
SELECT c.organizer, SUM(c.raised_amount) AS TotalRaised
FROM campaigns c
JOIN organizers o ON c.organizer = o.org_name
GROUP BY c.organizer;

-- 19. LEFT JOIN to show campaigns with zero donations
SELECT c.title, COALESCE(SUM(d.amount), 0) AS TotalDonated
FROM campaigns c
LEFT JOIN donations d ON c.campaign_id = d.campaign_id
GROUP BY c.title;

-- 20. INNER JOIN: Campaigns and their volunteer coordinators
SELECT c.title, v.volunteer_name
FROM campaigns c
JOIN volunteers v ON c.organizer = v.assigned_org;

-- 🧮 2️⃣ SUBQUERY QUERIES (20 Queries)
-- 1. Campaigns that raised above average
SELECT title, raised_amount
FROM campaigns
WHERE raised_amount > (SELECT AVG(raised_amount) FROM campaigns);

-- 2. Campaigns with highest goal amount
SELECT title
FROM campaigns
WHERE goal_amount = (SELECT MAX(goal_amount) FROM campaigns);

-- 3. Campaigns by organizers who also have completed campaigns
SELECT title
FROM campaigns
WHERE organizer IN (
    SELECT organizer FROM campaigns WHERE status = 'Completed'
);

-- 4. Campaigns ending soonest
SELECT title, end_date
FROM campaigns
WHERE end_date = (SELECT MIN(end_date) FROM campaigns);

-- 5. Campaigns with more donations than average
SELECT title
FROM campaigns
WHERE campaign_id IN (
    SELECT campaign_id FROM donations
    GROUP BY campaign_id
    HAVING COUNT(donation_id) > (
        SELECT AVG(cnt) FROM (
            SELECT COUNT(*) AS cnt FROM donations GROUP BY campaign_id
        ) AS temp
    )
);

-- 6. Scalar subquery: show total campaigns
SELECT (SELECT COUNT(*) FROM campaigns) AS TotalCampaigns;

-- 7. Subquery in FROM: Show average raised per organizer
SELECT organizer, AVG(raised_amount) AS AvgRaised
FROM (SELECT * FROM campaigns) AS c
GROUP BY organizer;

-- 8. Correlated subquery: Find campaigns with raised > avg for that organizer
SELECT c1.title, c1.organizer, c1.raised_amount
FROM campaigns c1
WHERE c1.raised_amount > (
    SELECT AVG(c2.raised_amount)
    FROM campaigns c2
    WHERE c2.organizer = c1.organizer
);

-- 9. Subquery using EXISTS
SELECT title
FROM campaigns c
WHERE EXISTS (
    SELECT 1 FROM donations d WHERE d.campaign_id = c.campaign_id
);

-- 10. Subquery using NOT EXISTS
SELECT title
FROM campaigns c
WHERE NOT EXISTS (
    SELECT 1 FROM donations d WHERE d.campaign_id = c.campaign_id
);

-- 11. Campaigns started after average start date
SELECT title, start_date
FROM campaigns
WHERE start_date > (SELECT AVG(start_date) FROM campaigns);

-- 12. Campaigns with goal less than max raised
SELECT title
FROM campaigns
WHERE goal_amount < (SELECT MAX(raised_amount) FROM campaigns);

-- 13. Top 3 campaigns by raised amount using subquery
SELECT title, raised_amount
FROM campaigns
WHERE raised_amount IN (
    SELECT raised_amount FROM campaigns ORDER BY raised_amount DESC LIMIT 3
);

-- 14. Subquery using ALL
SELECT title
FROM campaigns
WHERE goal_amount > ALL (SELECT raised_amount FROM campaigns WHERE status='Completed');

-- 15. Subquery using ANY
SELECT title
FROM campaigns
WHERE raised_amount > ANY (SELECT goal_amount FROM campaigns WHERE status='Active');

-- 16. Subquery with JOIN in subquery
SELECT title
FROM campaigns
WHERE campaign_id IN (
    SELECT d.campaign_id FROM donations d
    JOIN donors dn ON d.donor_id = dn.donor_id
);

-- 17. Campaigns with lowest raised amount per organizer
SELECT title, raised_amount
FROM campaigns c
WHERE raised_amount = (
    SELECT MIN(c2.raised_amount)
    FROM campaigns c2
    WHERE c2.organizer = c.organizer
);

-- 18. Campaigns where difference between goal and raised is above average
SELECT title
FROM campaigns
WHERE (goal_amount - raised_amount) > (
    SELECT AVG(goal_amount - raised_amount) FROM campaigns
);

-- 19. Subquery with COUNT comparison
SELECT title
FROM campaigns
WHERE campaign_id IN (
    SELECT campaign_id FROM donations GROUP BY campaign_id HAVING COUNT(*) > 5
);

-- 20. Subquery to find top organizer by total raised
SELECT organizer
FROM campaigns
GROUP BY organizer
HAVING SUM(raised_amount) = (
    SELECT MAX(total_raised)
    FROM (SELECT organizer, SUM(raised_amount) AS total_raised FROM campaigns GROUP BY organizer) AS t
);

-- ⚙️ 3️⃣ BUILT-IN FUNCTION QUERIES (10)
SELECT UPPER(title) AS CampaignName FROM campaigns;
SELECT LOWER(organizer) AS OrganizerLower FROM campaigns;
SELECT CONCAT(title, ' - ', status) AS Summary FROM campaigns;
SELECT ROUND(goal_amount - raised_amount, 2) AS Remaining FROM campaigns;
SELECT DATEDIFF(end_date, start_date) AS DurationDays FROM campaigns;
SELECT YEAR(start_date) AS StartYear, MONTH(start_date) AS StartMonth FROM campaigns;
SELECT COUNT(*) AS TotalActive FROM campaigns WHERE status='Active';
SELECT AVG(raised_amount) AS AvgRaised FROM campaigns;
SELECT MIN(goal_amount), MAX(goal_amount) FROM campaigns;
SELECT NOW() AS CurrentDateTime;

-- 🧠 4️⃣ USER-DEFINED FUNCTIONS (UDFs) (5)
-- 1. Calculate campaign completion percentage
CREATE FUNCTION CompletionPercent(goal DECIMAL(10,2), raised DECIMAL(10,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
RETURN (raised / goal) * 100;

-- 2. Calculate remaining amount to reach goal
CREATE FUNCTION RemainingGoal(goal DECIMAL(10,2), raised DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
RETURN goal - raised;

-- 3. Classify campaign status based on percentage raised
CREATE FUNCTION CampaignLevel(goal DECIMAL(10,2), raised DECIMAL(10,2))
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN (
  CASE
    WHEN (raised/goal)*100 >= 100 THEN 'Achieved'
    WHEN (raised/goal)*100 >= 75 THEN 'On Track'
    ELSE 'Needs Support'
  END
);

-- 4. Calculate campaign duration
CREATE FUNCTION CampaignDuration(start_d DATE, end_d DATE)
RETURNS INT
DETERMINISTIC
RETURN DATEDIFF(end_d, start_d);

-- 5. Get short campaign title
CREATE FUNCTION ShortTitle(full_title VARCHAR(150))
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN SUBSTRING(full_title, 1, 50);

-- Using UDFs:
SELECT title, CompletionPercent(goal_amount, raised_amount) AS Completion,
       RemainingGoal(goal_amount, raised_amount) AS Remaining,
       CampaignLevel(goal_amount, raised_amount) AS Level,
       CampaignDuration(start_date, end_date) AS DurationDays,
       ShortTitle(title) AS ShortName
FROM campaigns;


-- 1️⃣ VIEWS (20 Queries)
-- 1. Active campaigns
CREATE VIEW ActiveCampaigns AS
SELECT * FROM campaigns WHERE status = 'Active';

-- 2. Completed campaigns
CREATE VIEW CompletedCampaigns AS
SELECT title, organizer, raised_amount
FROM campaigns WHERE status = 'Completed';

-- 3. Campaigns exceeding 50% goal
CREATE VIEW HalfGoalReached AS
SELECT title, (raised_amount/goal_amount)*100 AS PercentReached
FROM campaigns WHERE raised_amount >= goal_amount * 0.5;

-- 4. Campaigns ending soon (within 30 days)
CREATE VIEW EndingSoon AS
SELECT title, end_date
FROM campaigns WHERE end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

-- 5. Campaign summary with days remaining
CREATE VIEW CampaignSummary AS
SELECT title, DATEDIFF(end_date, start_date) AS TotalDays, goal_amount, raised_amount
FROM campaigns;

-- 6. Campaign organizer performance
CREATE VIEW OrganizerPerformance AS
SELECT organizer, COUNT(*) AS TotalCampaigns, SUM(raised_amount) AS TotalRaised
FROM campaigns GROUP BY organizer;

-- 7. Top 5 campaigns by raised amount
CREATE VIEW Top5Campaigns AS
SELECT title, raised_amount FROM campaigns ORDER BY raised_amount DESC LIMIT 5;

-- 8. Campaigns with low funding (< 30%)
CREATE VIEW LowFundedCampaigns AS
SELECT title, raised_amount, goal_amount FROM campaigns
WHERE raised_amount < (goal_amount * 0.3);

-- 9. Completed campaign percentages
CREATE VIEW CompletedPercent AS
SELECT title, (raised_amount/goal_amount)*100 AS CompletionRate
FROM campaigns WHERE status = 'Completed';

-- 10. Campaign duration overview
CREATE VIEW CampaignDuration AS
SELECT title, DATEDIFF(end_date, start_date) AS DurationDays FROM campaigns;

-- 11. Organizer success percentage
CREATE VIEW OrganizerSuccess AS
SELECT organizer, 
       SUM(raised_amount)/SUM(goal_amount)*100 AS SuccessPercent
FROM campaigns GROUP BY organizer;

-- 12. Most funded organizers
CREATE VIEW TopOrganizers AS
SELECT organizer, SUM(raised_amount) AS TotalRaised
FROM campaigns GROUP BY organizer ORDER BY TotalRaised DESC;

-- 13. Average goal per organizer
CREATE VIEW AvgGoalPerOrganizer AS
SELECT organizer, AVG(goal_amount) AS AvgGoal FROM campaigns GROUP BY organizer;

-- 14. Campaigns started in 2024
CREATE VIEW Campaigns2024 AS
SELECT title, start_date FROM campaigns WHERE YEAR(start_date) = 2024;

-- 15. Campaign financial gap
CREATE VIEW FundingGap AS
SELECT title, (goal_amount - raised_amount) AS AmountLeft FROM campaigns;

-- 16. Overfunded campaigns
CREATE VIEW OverFundedCampaigns AS
SELECT * FROM campaigns WHERE raised_amount > goal_amount;

-- 17. Short duration campaigns (< 30 days)
CREATE VIEW ShortCampaigns AS
SELECT title FROM campaigns WHERE DATEDIFF(end_date, start_date) < 30;

-- 18. Campaigns with similar goals
CREATE VIEW SimilarGoals AS
SELECT goal_amount, COUNT(*) AS Total
FROM campaigns GROUP BY goal_amount HAVING COUNT(*) > 1;

-- 19. Longest campaign
CREATE VIEW LongestCampaign AS
SELECT title FROM campaigns ORDER BY DATEDIFF(end_date, start_date) DESC LIMIT 1;

-- 20. Organizer campaign count
CREATE VIEW OrganizerCampaignCount AS
SELECT organizer, COUNT(*) AS Campaigns FROM campaigns GROUP BY organizer;

-- 2️⃣ CURSORS (20 Queries)
-- 1. Cursor to list all campaign titles
DELIMITER //
CREATE PROCEDURE ShowCampaignTitles()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE c_title VARCHAR(150);
  DECLARE cur CURSOR FOR SELECT title FROM campaigns;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO c_title;
    IF done THEN LEAVE read_loop; END IF;
    SELECT c_title;
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

-- Similarly, you can create variants:
-- 2. Cursor for active campaigns
-- 3. Cursor for completed campaigns
-- 4. Cursor to update status
-- 5. Cursor for campaign organizers
-- 6. Cursor to calculate percent raised
-- 7. Cursor to show low-funded campaigns
-- 8. Cursor to list campaigns starting in 2024
-- 9. Cursor to find campaigns exceeding target
-- 10. Cursor to mark expired campaigns as "Completed"
-- 11. Cursor to print total raised per organizer
-- 12. Cursor for campaigns ending this month
-- 13. Cursor to calculate total days of all campaigns
-- 14. Cursor to display campaign duration
-- 15. Cursor for campaigns underfunded (<40%)
-- 16. Cursor for campaigns with “Health” keyword
-- 17. Cursor for all goal amounts
-- 18. Cursor for top 5 campaigns
-- 19. Cursor to find campaigns by same organizer
-- 20. Cursor for all active campaign organizers

-- 3️⃣ STORED PROCEDURES (20 Queries)
-- 1. Update campaign status
CREATE PROCEDURE UpdateCampaignStatus(IN cid INT, IN new_status VARCHAR(30))
BEGIN
  UPDATE campaigns SET status = new_status WHERE campaign_id = cid;
END;

-- 2. Get campaigns by organizer
CREATE PROCEDURE GetCampaignsByOrganizer(IN org VARCHAR(100))
BEGIN
  SELECT * FROM campaigns WHERE organizer = org;
END;

-- 3. Increase raised amount
CREATE PROCEDURE AddRaisedAmount(IN cid INT, IN amount DECIMAL(10,2))
BEGIN
  UPDATE campaigns SET raised_amount = raised_amount + amount WHERE campaign_id = cid;
END;

-- 4. Calculate total raised by all campaigns
CREATE PROCEDURE TotalRaised()
BEGIN
  SELECT SUM(raised_amount) AS TotalRaised FROM campaigns;
END;

-- 5. List active campaigns
CREATE PROCEDURE ActiveCampaignsProc()
BEGIN
  SELECT * FROM campaigns WHERE status='Active';
END;

-- 6–20: (Similar variations like filtering by date, status, goal range, etc.)

-- 4️⃣ WINDOW FUNCTIONS (20 Queries)
-- 1. Rank campaigns by raised amount
SELECT title, raised_amount,
RANK() OVER(ORDER BY raised_amount DESC) AS RankByRaised
FROM campaigns;

-- 2. Dense rank by goal amount
SELECT title, goal_amount,
DENSE_RANK() OVER(ORDER BY goal_amount DESC) AS GoalRank
FROM campaigns;

-- 3. Row number by start date
SELECT title, ROW_NUMBER() OVER(ORDER BY start_date) AS CampaignOrder FROM campaigns;

-- 4. Organizer rank by total raised
SELECT organizer, SUM(raised_amount),
RANK() OVER(ORDER BY SUM(raised_amount) DESC) AS OrganizerRank
FROM campaigns GROUP BY organizer;

-- 5–20: (LEAD, LAG, NTILE, etc. examples)

-- 5️⃣ DCL & TCL (20 Queries)
-- 1. Grant select
GRANT SELECT ON campaigns TO user1;

-- 2. Grant insert
GRANT INSERT ON campaigns TO user1;

-- 3. Revoke select
REVOKE SELECT ON campaigns FROM user1;

-- 4. Start transaction
START TRANSACTION;

-- 5. Update raised amount
UPDATE campaigns SET raised_amount = raised_amount + 500 WHERE campaign_id = 1;

-- 6. Savepoint
SAVEPOINT before_change;

-- 7. Rollback to savepoint
ROLLBACK TO before_change;

-- 8. Commit transaction
COMMIT;

-- (9–20 similar: multi-table transfers, partial rollbacks, etc.)

-- 6️⃣ TRIGGERS (20 Queries)
-- 1. Trigger after insert to log new campaign
CREATE TABLE campaign_audit (
  audit_id INT AUTO_INCREMENT PRIMARY KEY,
  campaign_id INT,
  action VARCHAR(50),
  action_time DATETIME
);

CREATE TRIGGER after_campaign_insert
AFTER INSERT ON campaigns
FOR EACH ROW
INSERT INTO campaign_audit (campaign_id, action, action_time)
VALUES (NEW.campaign_id, 'INSERT', NOW());

-- 2. Before update trigger to prevent raised_amount > goal_amount
CREATE TRIGGER before_update_campaign
BEFORE UPDATE ON campaigns
FOR EACH ROW
BEGIN
  IF NEW.raised_amount > NEW.goal_amount THEN
    SET NEW.raised_amount = NEW.goal_amount;
  END IF;
END;


--  ========================================================== CREATE TABLE 16. DONATIONS =======================================================================

-- 16. DONATIONS
CREATE TABLE donations (
    donation_id INT PRIMARY KEY AUTO_INCREMENT,
    campaign_id INT,
    user_id INT,
    amount DECIMAL(10,2),
    donation_date DATETIME,
    payment_method VARCHAR(50),
    transaction_id VARCHAR(100),
    message TEXT,
    status VARCHAR(30),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);

-- ======================================================= INSERT INTO donations =================================================================================

INSERT INTO donations (campaign_id, user_id, amount, donation_date, payment_method, transaction_id, message, status) VALUES
(1, 1, 50.00, '2024-02-01 10:00:00', 'Credit Card', 'TXN001234', 'Supporting mental health awareness!', 'Completed'),
(2, 2, 100.00, '2024-02-02 11:30:00', 'PayPal', 'TXN001235', 'Great cause for youth therapy.', 'Completed'),
(3, 3, 25.00, '2024-02-03 09:15:00', 'Bank Transfer', 'TXN001236', NULL, 'Completed'),
(4, 4, 200.00, '2024-02-04 14:20:00', 'Credit Card', 'TXN001237', 'Helping with grief support.', 'Completed'),
(5, 5, 75.00, '2024-02-05 16:45:00', 'PayPal', 'TXN001238', 'Anxiety recovery is important.', 'Pending'),
(6, 6, 150.00, '2024-02-06 12:10:00', 'Credit Card', 'TXN001239', 'For community centers.', 'Completed'),
(7, 7, 30.00, '2024-02-07 08:30:00', 'Bank Transfer', 'TXN001240', 'Awareness drives save lives.', 'Completed'),
(8, 8, 300.00, '2024-02-08 13:00:00', 'Credit Card', 'TXN001241', 'Supporting addiction recovery.', 'Completed'),
(9, 9, 40.00, '2024-02-09 10:45:00', 'PayPal', 'TXN001242', NULL, 'Completed'),
(10, 10, 120.00, '2024-02-10 15:20:00', 'Credit Card', 'TXN001243', 'Mindfulness for all.', 'Completed'),
(11, 11, 250.00, '2024-02-11 11:15:00', 'Bank Transfer', 'TXN001244', 'Thank you for veterans.', 'Completed'),
(12, 12, 60.00, '2024-02-12 17:00:00', 'PayPal', 'TXN001245', 'Child mental health matters.', 'Pending'),
(13, 13, 80.00, '2024-02-13 09:50:00', 'Credit Card', 'TXN001246', 'Workplace wellness is key.', 'Completed'),
(14, 14, 500.00, '2024-02-14 14:30:00', 'Bank Transfer', 'TXN001247', 'Lifeline for many.', 'Completed'),
(15, 15, 35.00, '2024-02-15 12:25:00', 'PayPal', 'TXN001248', 'Art heals the soul.', 'Completed'),
(16, 16, 90.00, '2024-02-16 10:40:00', 'Credit Card', 'TXN001249', NULL, 'Completed'),
(17, 17, 110.00, '2024-02-17 16:10:00', 'Credit Card', 'TXN001250', 'Inclusive support needed.', 'Completed'),
(18, 18, 20.00, '2024-02-18 08:55:00', 'PayPal', 'TXN001251', 'Preventing burnout.', 'Failed'),
(19, 19, 180.00, '2024-02-19 13:35:00', 'Bank Transfer', 'TXN001252', 'Holistic healing rocks.', 'Completed'),
(20, 20, 70.00, '2024-02-20 11:20:00', 'Credit Card', 'TXN001253', 'Emergency fund is crucial.', 'Completed');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM donations ;

TRUNCATE TABLE donations ;

DROP TABLE donations ;

🧩 1️⃣ JOIN QUERIES (5)
-- 1. INNER JOIN: Show all donations with corresponding campaign names
SELECT d.donation_id, c.campaign_name, d.amount, d.status
FROM donations d
INNER JOIN campaigns c ON d.campaign_id = c.campaign_id;

-- 2. LEFT JOIN: Display all campaigns even if they have no donations
SELECT c.campaign_id, c.campaign_name, d.amount
FROM campaigns c
LEFT JOIN donations d ON c.campaign_id = d.campaign_id;

-- 3. RIGHT JOIN: Show all donors even if they haven’t donated yet
SELECT u.user_id, u.user_name, d.amount, d.status
FROM donations d
RIGHT JOIN users u ON d.user_id = u.user_id;

-- 4. SELF JOIN: Find donations made on the same date but by different users
SELECT a.donation_id AS donation1, b.donation_id AS donation2, a.donation_date
FROM donations a
INNER JOIN donations b 
ON a.donation_date = b.donation_date AND a.user_id <> b.user_id;

-- 5. CROSS JOIN: Generate all possible combinations of campaigns and payment methods
SELECT c.campaign_name, p.method
FROM campaigns c
CROSS JOIN (SELECT DISTINCT payment_method AS method FROM donations) p;

-- 🔍 2️⃣ SUBQUERIES (5)
-- 6. Scalar Subquery: Show donations higher than the average donation amount
SELECT donation_id, amount
FROM donations
WHERE amount > (SELECT AVG(amount) FROM donations);

-- 7. IN Subquery: Find users who donated to any campaign with status 'Completed'
SELECT user_id, user_name
FROM users
WHERE user_id IN (
    SELECT user_id FROM donations WHERE status = 'Completed'
);

-- 8. EXISTS Subquery: Show campaigns that have received donations
SELECT campaign_name
FROM campaigns c
WHERE EXISTS (
    SELECT 1 FROM donations d WHERE d.campaign_id = c.campaign_id
);

-- 9. Correlated Subquery: Find donations higher than the campaign’s average donation
SELECT donation_id, amount, campaign_id
FROM donations d1
WHERE amount > (
    SELECT AVG(amount) FROM donations d2 WHERE d1.campaign_id = d2.campaign_id
);

-- 10. Subquery in FROM: Show top 5 highest donations using a derived table
SELECT * 
FROM (
    SELECT donation_id, amount FROM donations ORDER BY amount DESC LIMIT 5
) AS top_donations;

-- 🧮 3️⃣ BUILT-IN FUNCTIONS (5)
-- 11. String Function: Show transaction IDs in uppercase
SELECT UPPER(transaction_id) AS transaction_code FROM donations;

-- 12. Numeric Function: Round off donation amounts to nearest integer
SELECT donation_id, ROUND(amount) AS rounded_amount FROM donations;

-- 13. Date Function: Display donation year and month
SELECT donation_id, YEAR(donation_date) AS year, MONTH(donation_date) AS month FROM donations;

-- 14. Aggregate Function: Find total amount donated per payment method
SELECT payment_method, SUM(amount) AS total_donated
FROM donations
GROUP BY payment_method;

-- 15. Conditional Function: Label donations as 'High' if >100 else 'Low'
SELECT donation_id, amount,
CASE 
    WHEN amount > 100 THEN 'High'
    ELSE 'Low'
END AS donation_level
FROM donations;

-- 🧠 4️⃣ USER-DEFINED FUNCTIONS (5)
-- 16. Function: Calculate yearly donation projection (assuming monthly average)
DELIMITER //
CREATE FUNCTION yearly_projection(avg_monthly DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
RETURN avg_monthly * 12;
DELIMITER ;

-- 17. Function: Check if donation status is completed
DELIMITER //
CREATE FUNCTION is_completed(status VARCHAR(30))
RETURNS VARCHAR(10)
DETERMINISTIC
RETURN IF(status = 'Completed', 'Yes', 'No');
DELIMITER ;

-- 18. Function: Calculate 10% platform fee deduction
DELIMITER //
CREATE FUNCTION net_donation(amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
RETURN amount - (amount * 0.10);
DELIMITER ;

-- 19. Function: Classify donations based on amount range
DELIMITER //
CREATE FUNCTION donation_category(amount DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE category VARCHAR(20);
    IF amount >= 200 THEN
        SET category = 'Platinum Donor';
    ELSEIF amount >= 100 THEN
        SET category = 'Gold Donor';
    ELSEIF amount >= 50 THEN
        SET category = 'Silver Donor';
    ELSE
        SET category = 'Bronze Donor';
    END IF;
    RETURN category;
END;
DELIMITER ;

-- 20. Using UDFs together
SELECT donation_id, amount, 
       net_donation(amount) AS after_fee,
       donation_category(amount) AS donor_level,
       is_completed(status) AS completed_status
FROM donations;


-- 1–4 — Views (4)
-- 1) View: Completed donations
CREATE OR REPLACE VIEW v_completed_donations AS
SELECT donation_id, campaign_id, user_id, amount, donation_date, payment_method, transaction_id
FROM donations
WHERE status = 'Completed';

-- 2) View: Pending or failed donations
CREATE OR REPLACE VIEW v_pending_failed_donations AS
SELECT donation_id, campaign_id, user_id, amount, status, donation_date
FROM donations
WHERE status IN ('Pending', 'Failed');

-- 3) View: Total donations per campaign
CREATE OR REPLACE VIEW v_total_donations_by_campaign AS
SELECT campaign_id, COUNT(*) AS donation_count, SUM(amount) AS total_amount
FROM donations
WHERE status = 'Completed'
GROUP BY campaign_id;

-- 4) View: Recent donations (last 30 days)
CREATE OR REPLACE VIEW v_recent_donations AS
SELECT donation_id, campaign_id, user_id, amount, donation_date
FROM donations
WHERE donation_date >= (NOW() - INTERVAL 30 DAY)
ORDER BY donation_date DESC;

-- 5–7 — Cursors (3)
-- 5) Cursor: iterate completed donations and display id + amount
DELIMITER $$
CREATE PROCEDURE proc_list_completed_donations()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_amt DECIMAL(10,2);
  DECLARE cur CURSOR FOR SELECT donation_id, amount FROM donations WHERE status='Completed' ORDER BY donation_date;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop1: LOOP
    FETCH cur INTO v_id, v_amt;
    IF done THEN LEAVE loop1; END IF;
    SELECT v_id AS donation_id, v_amt AS amount;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 6) Cursor: mark pending donations older than 7 days as 'Failed'
DELIMITER $$
CREATE PROCEDURE proc_fail_old_pending_donations()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE cur CURSOR FOR
    SELECT donation_id FROM donations
    WHERE status='Pending' AND donation_date < (NOW() - INTERVAL 7 DAY);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop2: LOOP
    FETCH cur INTO v_id;
    IF done THEN LEAVE loop2; END IF;
    UPDATE donations SET status='Failed' WHERE donation_id = v_id;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 7) Cursor: sum donations per payment_method (row-by-row demo)
DELIMITER $$
CREATE PROCEDURE proc_sum_by_payment_method()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_method VARCHAR(50);
  DECLARE v_sum DECIMAL(12,2);
  DECLARE cur CURSOR FOR SELECT DISTINCT payment_method FROM donations;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  method_loop: LOOP
    FETCH cur INTO v_method;
    IF done THEN LEAVE method_loop; END IF;
    SELECT v_method AS payment_method, 
           (SELECT IFNULL(SUM(amount),0) FROM donations WHERE payment_method = v_method AND status='Completed') AS total_collected;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 8–11 — Stored Procedures (4)
-- 8) Add a donation (transaction-safe). Returns last insert id via SELECT
DELIMITER $$
CREATE PROCEDURE sp_add_donation(
  IN p_campaign_id INT,
  IN p_user_id INT,
  IN p_amount DECIMAL(10,2),
  IN p_payment_method VARCHAR(50),
  IN p_transaction_id VARCHAR(100),
  IN p_message TEXT
)
BEGIN
  START TRANSACTION;
    INSERT INTO donations (campaign_id, user_id, amount, donation_date, payment_method, transaction_id, message, status)
    VALUES (p_campaign_id, p_user_id, p_amount, NOW(), p_payment_method, p_transaction_id, p_message, 'Pending');
    SELECT LAST_INSERT_ID() AS new_donation_id;
  COMMIT;
END $$
DELIMITER ;

-- 9) Update donation status and optionally update campaign raised_amount
DELIMITER $$
CREATE PROCEDURE sp_update_donation_status(
  IN p_donation_id INT,
  IN p_new_status VARCHAR(30),
  IN p_apply_to_campaign BOOLEAN
)
BEGIN
  DECLARE v_cid INT;
  DECLARE v_amt DECIMAL(10,2);
  SELECT campaign_id, amount INTO v_cid, v_amt FROM donations WHERE donation_id = p_donation_id;
  START TRANSACTION;
    UPDATE donations SET status = p_new_status WHERE donation_id = p_donation_id;
    IF p_apply_to_campaign AND p_new_status = 'Completed' THEN
      UPDATE campaigns SET raised_amount = IFNULL(raised_amount,0) + v_amt WHERE campaign_id = v_cid;
    END IF;
  COMMIT;
END $$
DELIMITER ;

-- 10) Get donations for a campaign (paginated)
DELIMITER $$
CREATE PROCEDURE sp_get_donations_by_campaign(
  IN p_campaign_id INT,
  IN p_offset INT,
  IN p_limit INT
)
BEGIN
  SELECT donation_id, user_id, amount, donation_date, payment_method, status
  FROM donations
  WHERE campaign_id = p_campaign_id
  ORDER BY donation_date DESC
  LIMIT p_offset, p_limit;
END $$
DELIMITER ;

-- 11) Delete failed donations older than N days and return count (OUT param)
DELIMITER $$
CREATE PROCEDURE sp_delete_old_failed_donations(IN p_days INT, OUT p_deleted INT)
BEGIN
  START TRANSACTION;
    DELETE FROM donations WHERE status='Failed' AND donation_date < (NOW() - INTERVAL p_days DAY);
    SET p_deleted = ROW_COUNT();
  COMMIT;
END $$
DELIMITER ;

-- 12–15 — Window / Analytic Queries (4)
-- 12) Rank donors by total donated amount (top donors)
SELECT user_id, SUM(amount) AS total_donated,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS donor_rank
FROM donations
WHERE status='Completed'
GROUP BY user_id
ORDER BY total_donated DESC;

-- 13) Running total of donations by campaign ordered by date
SELECT donation_id, campaign_id, donation_date, amount,
       SUM(amount) OVER (PARTITION BY campaign_id ORDER BY donation_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM donations
WHERE status='Completed'
ORDER BY campaign_id, donation_date;

-- 14) Use LAG to compare previous donation amount by same user
SELECT donation_id, user_id, donation_date, amount,
       LAG(amount) OVER (PARTITION BY user_id ORDER BY donation_date) AS prev_amount
FROM donations;

-- 15) Percent contribution per donation within its campaign
SELECT donation_id, campaign_id, amount,
       ROUND(amount / SUM(amount) OVER (PARTITION BY campaign_id) * 100, 2) AS pct_of_campaign
FROM donations
WHERE status='Completed';

-- 16–18 — DCL & TCL (3)
-- 16) Grant analytics user read-only access to donations
GRANT SELECT ON donations TO 'analytics_user'@'localhost';

-- 17) Revoke DELETE permission from temp role
REVOKE DELETE ON donations FROM 'temp_user'@'localhost';

-- 18) TCL example: mark donation completed and update campaign with rollback safety
START TRANSACTION;
  -- suppose donation_id = 5
  UPDATE donations SET status='Completed' WHERE donation_id = 5;
  -- update campaign raised_amount
  UPDATE campaigns c JOIN (SELECT campaign_id, amount FROM donations WHERE donation_id = 5) d
    ON c.campaign_id = d.campaign_id
  SET c.raised_amount = c.raised_amount + d.amount;
-- If a check fails: ROLLBACK; otherwise:
COMMIT;

-- 19–20 — Triggers (2)
-- 19) BEFORE INSERT trigger: ensure donation_date and default status
DELIMITER $$
CREATE TRIGGER trg_donations_before_insert
BEFORE INSERT ON donations
FOR EACH ROW
BEGIN
  IF NEW.donation_date IS NULL THEN
    SET NEW.donation_date = NOW();
  END IF;
  IF NEW.status IS NULL OR NEW.status = '' THEN
    SET NEW.status = 'Pending';
  END IF;
END $$
DELIMITER ;

-- 20) AFTER UPDATE trigger: when donation status becomes 'Completed', update campaigns.raised_amount and log audit
CREATE TABLE IF NOT EXISTS donation_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  donation_id INT,
  old_status VARCHAR(30),
  new_status VARCHAR(30),
  changed_at DATETIME
);

DELIMITER $$
CREATE TRIGGER trg_donations_after_update
AFTER UPDATE ON donations
FOR EACH ROW
BEGIN
  IF OLD.status <> NEW.status THEN
    INSERT INTO donation_audit (donation_id, old_status, new_status, changed_at)
      VALUES (NEW.donation_id, OLD.status, NEW.status, NOW());
    IF NEW.status = 'Completed' THEN
      UPDATE campaigns SET raised_amount = IFNULL(raised_amount,0) + NEW.amount WHERE campaign_id = NEW.campaign_id;
    END IF;
  END IF;
END $$
DELIMITER ;

--  ========================================================== CREATE   TABLE17. REVIEWS =======================================================================

-- 17. REVIEWS
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    rating INT,
    comment TEXT,
    created_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ======================================================= INSERT INTO reviews =================================================================================

INSERT INTO reviews (user_id, product_id, rating, comment, created_at, updated_at, status) VALUES
(1, 1, 5, 'This mindfulness journal has really helped me track my daily thoughts and reduce stress. Highly recommend!', '2024-02-01 10:00:00', '2024-02-01 10:00:00', 'Approved'),
(2, 2, 4, 'Great essential oils for relaxation. The lavender scent is calming, but wish it lasted longer.', '2024-02-02 11:30:00', '2024-02-02 11:30:00', 'Approved'),
(3, 3, 3, 'The herbal tea is okay for sleep, but I didn\'t notice much difference after a week.', '2024-02-03 09:15:00', '2024-02-03 09:15:00', 'Approved'),
(4, 4, 5, 'Excellent yoga mat – comfortable and non-slip. Perfect for home workouts.', '2024-02-04 14:20:00', '2024-02-04 14:20:00', 'Approved'),
(5, 5, 2, 'The stress ball didn\'t help much with anxiety. Feels cheap.', '2024-02-05 16:45:00', '2024-02-05 16:45:00', 'Approved'),
(6, 6, 4, 'Good book on cognitive therapy. Insightful, but a bit dense for beginners.', '2024-02-06 12:10:00', '2024-02-06 12:10:00', 'Approved'),
(7, 7, 5, 'These supplements boosted my energy without jitters. Love the natural ingredients.', '2024-02-07 08:30:00', '2024-02-07 08:30:00', 'Approved'),
(8, 8, 1, 'Disappointed with the meditation app subscription – too many ads.', '2024-02-08 13:00:00', '2024-02-08 13:00:00', 'Approved'),
(9, 9, 4, 'Aromatherapy diffuser works well and looks stylish on my desk.', '2024-02-09 10:45:00', '2024-02-09 10:45:00', 'Approved'),
(10, 10, 5, 'Fantastic guided audio sessions for sleep. Helped me fall asleep faster.', '2024-02-10 15:20:00', '2024-02-10 15:20:00', 'Approved'),
(11, 11, 3, 'The fitness tracker is accurate for steps, but battery life is short.', '2024-02-11 11:15:00', '2024-02-11 11:15:00', 'Pending'),
(12, 12, 5, 'Best vitamin pack for mood support. Feeling more balanced already.', '2024-02-12 17:00:00', '2024-02-12 17:00:00', 'Approved'),
(13, 13, 4, 'Journal prompts are creative and therapeutic. Great for self-reflection.', '2024-02-13 09:50:00', '2024-02-13 09:50:00', 'Approved'),
(14, 14, 2, 'Not impressed with the herbal remedy – no noticeable effects on anxiety.', '2024-02-14 14:30:00', '2024-02-14 14:30:00', 'Approved'),
(15, 15, 5, 'This breathing exercise tool is simple yet effective for quick calm.', '2024-02-15 12:25:00', '2024-02-15 12:25:00', 'Approved'),
(16, 16, 3, 'Okay affirmation cards, but the quality of paper could be better.', '2024-02-16 10:40:00', '2024-02-16 10:40:00', 'Approved'),
(17, 17, 4, 'The wellness planner helps organize my self-care routine perfectly.', '2024-02-17 16:10:00', '2024-02-18 09:00:00', 'Approved'),
(18, 18, 5, 'Amazing CBD gummies for relaxation. Natural and effective without drowsiness.', '2024-02-18 08:55:00', '2024-02-18 08:55:00', 'Approved'),
(19, 19, 1, 'Poor experience with the online course – content was outdated.', '2024-02-19 13:35:00', '2024-02-19 13:35:00', 'Rejected'),
(20, 20, 4, 'Solid noise-cancelling headphones for focus during meditation sessions.', '2024-02-20 11:20:00', '2024-02-20 11:20:00', 'Approved');


-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM campaigns;

TRUNCATE  TABLE reviews ;

DROP TABLE reviews ;


-- 🟢 1️⃣ JOINS (5 Queries)

-- 1. INNER JOIN → Fetch review details with product names and user IDs.

SELECT r.review_id, u.user_id, p.product_name, r.rating, r.comment
FROM reviews r
INNER JOIN users u ON r.user_id = u.user_id
INNER JOIN products p ON r.product_id = p.product_id;


-- 2. LEFT JOIN → Display all users and their reviews (even users without reviews).

SELECT u.user_id, u.username, r.review_id, r.comment
FROM users u
LEFT JOIN reviews r ON u.user_id = r.user_id;


-- 3. RIGHT JOIN → Show all products even if they have no reviews.

SELECT p.product_id, p.product_name, r.review_id, r.rating
FROM reviews r
RIGHT JOIN products p ON r.product_id = p.product_id;


-- 4. SELF JOIN → Compare reviews with same rating.

SELECT r1.review_id AS Review1, r2.review_id AS Review2, r1.rating
FROM reviews r1
JOIN reviews r2 ON r1.rating = r2.rating AND r1.review_id <> r2.review_id;


-- 5. CROSS JOIN → Pair all users with all products (for recommendation logic).

SELECT u.user_id, u.username, p.product_name
FROM users u
CROSS JOIN products p;

-- 🟡 2️⃣ SUBQUERIES (5 Queries)

-- 6. Scalar Subquery → Find reviews with ratings above average.

SELECT review_id, rating, comment
FROM reviews
WHERE rating > (SELECT AVG(rating) FROM reviews);


-- 7. Correlated Subquery → Find users who reviewed more than once.

SELECT user_id, comment
FROM reviews r1
WHERE (SELECT COUNT(*) FROM reviews r2 WHERE r2.user_id = r1.user_id) > 1;


-- 8. IN Subquery → Reviews for products with average rating ≥ 4.

SELECT review_id, product_id, rating
FROM reviews
WHERE product_id IN (
  SELECT product_id FROM reviews GROUP BY product_id HAVING AVG(rating) >= 4
);


-- 9. EXISTS Subquery → Find users who have reviewed at least one “approved” review.

SELECT user_id
FROM users u
WHERE EXISTS (
  SELECT 1 FROM reviews r WHERE r.user_id = u.user_id AND r.status = 'Approved'
);


-- 10. Subquery in FROM Clause → Calculate rating difference from average.

SELECT review_id, rating, (rating - avg_rating) AS RatingDifference
FROM (
  SELECT review_id, rating, (SELECT AVG(rating) FROM reviews) AS avg_rating
  FROM reviews
) AS temp;

-- 🔵 3️⃣ BUILT-IN FUNCTIONS (5 Queries)

-- 11. String Function (UPPER & CONCAT)

SELECT CONCAT('Review: ', UPPER(comment)) AS ReviewDetails FROM reviews;


-- 12. Numeric Function (ROUND)

SELECT product_id, ROUND(AVG(rating), 2) AS AverageRating
FROM reviews
GROUP BY product_id;


-- 13. Date Function (DATEDIFF)

SELECT review_id, DATEDIFF(updated_at, created_at) AS DaysDifference
FROM reviews;


-- 14. Aggregate Function (COUNT)

SELECT status, COUNT(*) AS TotalReviews
FROM reviews
GROUP BY status;


-- 15. String Function (SUBSTRING)

SELECT review_id, SUBSTRING(comment, 1, 30) AS ShortComment
FROM reviews;

-- 🟣 4️⃣ USER-DEFINED FUNCTIONS (UDFs) (5 Queries)

-- 16. Function: Calculate Review Age (Days since created)

DELIMITER //
CREATE FUNCTION GetReviewAge(reviewDate DATETIME)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN DATEDIFF(NOW(), reviewDate);
END //
DELIMITER ;


-- 17. Function: Check if Review is Positive

DELIMITER //
CREATE FUNCTION IsPositiveReview(rating INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  IF rating >= 4 THEN
    RETURN 'Positive';
  ELSE
    RETURN 'Negative';
  END IF;
END //
DELIMITER ;


-- 18. Function: GetReviewStatusCount(status_name VARCHAR(20))

DELIMITER //
CREATE FUNCTION GetReviewStatusCount(status_name VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE cnt INT;
  SELECT COUNT(*) INTO cnt FROM reviews WHERE status = status_name;
  RETURN cnt;
END //
DELIMITER ;


-- 19. Function: Calculate Star Value (rating × 20)

DELIMITER //
CREATE FUNCTION StarValue(rating INT)
RETURNS INT
DETERMINISTIC
RETURN rating * 20;
DELIMITER ;




-- 20. Function: GetProductAverageRating(productId INT)

DELIMITER //
CREATE FUNCTION GetProductAverageRating(productId INT)
RETURNS DECIMAL(4,2)
DETERMINISTIC
BEGIN
  DECLARE avgRating DECIMAL(4,2);
  SELECT AVG(rating) INTO avgRating FROM reviews WHERE product_id = productId;
  RETURN avgRating;
END //
DELIMITER ;



-- 1–4 — Views (4)
-- 1) View: Approved reviews (basic)
CREATE OR REPLACE VIEW v_approved_reviews AS
SELECT review_id, user_id, product_id, rating, comment, created_at
FROM reviews
WHERE status = 'Approved';

-- 2) View: Average rating per product
CREATE OR REPLACE VIEW v_avg_rating_per_product AS
SELECT product_id, ROUND(AVG(rating),2) AS avg_rating, COUNT(*) AS review_count
FROM reviews
WHERE status = 'Approved'
GROUP BY product_id;

-- 3) View: Recent reviews (last 30 days)
CREATE OR REPLACE VIEW v_recent_reviews AS
SELECT review_id, user_id, product_id, rating, comment, created_at
FROM reviews
WHERE created_at >= (NOW() - INTERVAL 30 DAY)
ORDER BY created_at DESC;

-- 4) View: Reviews summary by status
CREATE OR REPLACE VIEW v_reviews_status_summary AS
SELECT status, COUNT(*) AS count_reviews, AVG(rating) AS avg_rating
FROM reviews
GROUP BY status;

-- 5–7 — Cursors (3)
-- 5) Cursor: iterate pending reviews and show id + user
DELIMITER $$
CREATE PROCEDURE proc_list_pending_reviews()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_user INT;
  DECLARE cur CURSOR FOR SELECT review_id, user_id FROM reviews WHERE status='Pending' ORDER BY created_at;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop1: LOOP
    FETCH cur INTO v_id, v_user;
    IF done THEN LEAVE loop1; END IF;
    SELECT CONCAT('Review ', v_id, ' by User ', v_user) AS pending_info;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 6) Cursor: approve old pending reviews older than X days (example 14 days)
DELIMITER $$
CREATE PROCEDURE proc_approve_old_pending()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE cur CURSOR FOR
    SELECT review_id FROM reviews WHERE status='Pending' AND created_at < (NOW() - INTERVAL 14 DAY);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop2: LOOP
    FETCH cur INTO v_id;
    IF done THEN LEAVE loop2; END IF;
    UPDATE reviews SET status='Approved', updated_at = NOW() WHERE review_id = v_id;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 7) Cursor: flag low-rated reviews (rating <= 2) for moderation
DELIMITER $$
CREATE PROCEDURE proc_flag_low_rated()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE cur CURSOR FOR SELECT review_id FROM reviews WHERE rating <= 2 AND status <> 'Flagged';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop3: LOOP
    FETCH cur INTO v_id;
    IF done THEN LEAVE loop3; END IF;
    UPDATE reviews SET status='Flagged', updated_at = NOW() WHERE review_id = v_id;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 8–11 — Stored Procedures (4)
-- 8) Add a review
DELIMITER $$
CREATE PROCEDURE sp_add_review(
  IN p_user_id INT,
  IN p_product_id INT,
  IN p_rating INT,
  IN p_comment TEXT
)
BEGIN
  INSERT INTO reviews (user_id, product_id, rating, comment, created_at, updated_at, status)
  VALUES (p_user_id, p_product_id, p_rating, p_comment, NOW(), NOW(), 'Pending');
  SELECT LAST_INSERT_ID() AS new_review_id;
END $$
DELIMITER ;

-- 9) Update review (rating/comment) and refresh updated_at
DELIMITER $$
CREATE PROCEDURE sp_update_review(
  IN p_review_id INT,
  IN p_rating INT,
  IN p_comment TEXT
)
BEGIN
  UPDATE reviews
  SET rating = p_rating,
      comment = p_comment,
      updated_at = NOW()
  WHERE review_id = p_review_id;
END $$
DELIMITER ;

-- 10) Change review status (Approved/Rejected/Flagged) with audit logging
CREATE TABLE IF NOT EXISTS review_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  review_id INT,
  old_status VARCHAR(30),
  new_status VARCHAR(30),
  changed_at DATETIME
);

DELIMITER $$
CREATE PROCEDURE sp_change_review_status(
  IN p_review_id INT,
  IN p_new_status VARCHAR(30)
)
BEGIN
  DECLARE v_old_status VARCHAR(30);
  SELECT status INTO v_old_status FROM reviews WHERE review_id = p_review_id;
  UPDATE reviews SET status = p_new_status, updated_at = NOW() WHERE review_id = p_review_id;
  INSERT INTO review_audit (review_id, old_status, new_status, changed_at)
    VALUES (p_review_id, v_old_status, p_new_status, NOW());
END $$
DELIMITER ;

-- 11) Get top N products by average rating (Approved reviews only)
DELIMITER $$
CREATE PROCEDURE sp_top_products_by_rating(IN p_limit INT)
BEGIN
  SELECT product_id, ROUND(AVG(rating),2) AS avg_rating, COUNT(*) AS reviews_count
  FROM reviews
  WHERE status='Approved'
  GROUP BY product_id
  ORDER BY avg_rating DESC, reviews_count DESC
  LIMIT p_limit;
END $$
DELIMITER ;

-- 12–15 — Window / Analytic Queries (4)
-- 12) Rank reviews per product by newest first
SELECT review_id, product_id, user_id, rating, created_at,
       ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY created_at DESC) AS rn
FROM reviews;

-- 13) Average rating and percentile per product
SELECT product_id,
       AVG(rating) AS avg_rating,
       PERCENT_RANK() OVER (ORDER BY AVG(rating) DESC) AS product_percentile
FROM reviews
WHERE status='Approved'
GROUP BY product_id;

-- 14) LAG to compare previous rating by same user
SELECT review_id, user_id, product_id, rating, created_at,
       LAG(rating) OVER (PARTITION BY user_id ORDER BY created_at) AS prev_rating
FROM reviews;

-- 15) Running average rating per product over time
SELECT review_id, product_id, created_at, rating,
       ROUND( AVG(rating) OVER (PARTITION BY product_id ORDER BY created_at ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2) AS running_avg
FROM reviews
WHERE status='Approved';

-- 16–18 — DCL & TCL (3)
-- 16) Grant read & insert to review managers
GRANT SELECT, INSERT ON reviews TO 'review_manager'@'localhost';

-- 17) Revoke delete to junior users
REVOKE DELETE ON reviews FROM 'junior_user'@'localhost';

-- 18) Transaction example: approve a review and update product aggregate (simulate safe update)
START TRANSACTION;
  UPDATE reviews SET status='Approved', updated_at=NOW() WHERE review_id = 5 AND status='Pending';
  -- Optionally, update product aggregate table if you maintain one:
  -- UPDATE product_review_summary SET avg_rating = (SELECT AVG(rating) FROM reviews WHERE product_id = <pid> AND status='Approved') WHERE product_id = <pid>;
COMMIT;

-- 19–20 — Triggers (2)
-- 19) BEFORE INSERT trigger: set timestamps and enforce rating bounds (1-5)
DELIMITER $$
CREATE TRIGGER trg_reviews_before_insert
BEFORE INSERT ON reviews
FOR EACH ROW
BEGIN
  IF NEW.created_at IS NULL THEN
    SET NEW.created_at = NOW();
  END IF;
  SET NEW.updated_at = IFNULL(NEW.updated_at, NEW.created_at);
  IF NEW.rating < 1 THEN SET NEW.rating = 1; END IF;
  IF NEW.rating > 5 THEN SET NEW.rating = 5; END IF;
  IF NEW.status IS NULL OR NEW.status = '' THEN
    SET NEW.status = 'Pending';
  END IF;
END $$
DELIMITER ;

-- 20) AFTER INSERT/UPDATE trigger: maintain product_review_summary and log changes
CREATE TABLE IF NOT EXISTS product_review_summary (
  product_id INT PRIMARY KEY,
  avg_rating DECIMAL(4,2),
  review_count INT,
  last_updated DATETIME
);

DELIMITER $$
CREATE TRIGGER trg_reviews_after_write
AFTER INSERT ON reviews
FOR EACH ROW
BEGIN
  -- Recompute summary for the product (Approved reviews only)
  INSERT INTO product_review_summary (product_id, avg_rating, review_count, last_updated)
    VALUES (NEW.product_id,
            (SELECT ROUND(AVG(rating),2) FROM reviews WHERE product_id = NEW.product_id AND status='Approved'),
            (SELECT COUNT(*) FROM reviews WHERE product_id = NEW.product_id AND status='Approved'),
            NOW())
  ON DUPLICATE KEY UPDATE
    avg_rating = (SELECT ROUND(AVG(rating),2) FROM reviews WHERE product_id = NEW.product_id AND status='Approved'),
    review_count = (SELECT COUNT(*) FROM reviews WHERE product_id = NEW.product_id AND status='Approved'),
    last_updated = NOW();
END $$
DELIMITER ;

-- (Also create a similar AFTER UPDATE trigger to refresh summary on status/rating changes)
DELIMITER $$
CREATE TRIGGER trg_reviews_after_update
AFTER UPDATE ON reviews
FOR EACH ROW
BEGIN
  IF OLD.rating <> NEW.rating OR OLD.status <> NEW.status OR OLD.product_id <> NEW.product_id THEN
    INSERT INTO product_review_summary (product_id, avg_rating, review_count, last_updated)
      VALUES (NEW.product_id,
              (SELECT ROUND(AVG(rating),2) FROM reviews WHERE product_id = NEW.product_id AND status='Approved'),
              (SELECT COUNT(*) FROM reviews WHERE product_id = NEW.product_id AND status='Approved'),
              NOW())
    ON DUPLICATE KEY UPDATE
      avg_rating = (SELECT ROUND(AVG(rating),2) FROM reviews WHERE product_id = NEW.product_id AND status='Approved'),
      review_count = (SELECT COUNT(*) FROM reviews WHERE product_id = NEW.product_id AND status='Approved'),
      last_updated = NOW();
  END IF;
END $$
DELIMITER ;
--  ========================================================== CREATE  TABLE 18. COMMUNITY_POSTS =======================================================================

-- 18. COMMUNITY_POSTS
CREATE TABLE community_posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(150),
    content TEXT,
    category VARCHAR(50),
    image_url VARCHAR(255),
    created_at DATETIME,
    likes INT,
    comments_count INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ======================================================= INSERT INTO community_posts =================================================================================

INSERT INTO community_posts (user_id, title, content, category, image_url, created_at, likes, comments_count) VALUES
(1, 'Struggling with Daily Anxiety', 'Hi everyone, I\'ve been dealing with anxiety that makes even simple tasks overwhelming. Anyone have tips for grounding techniques that actually work? Sharing my experience to connect with others.', 'Anxiety', '/images/post1.jpg', '2024-03-01 10:00:00', 15, 3),
(2, 'My Journey with Meditation', 'Started meditating 10 minutes a day and it\'s changed my focus. What apps or routines do you recommend for beginners? Grateful for this community!', 'Meditation', '/images/post2.jpg', '2024-03-02 11:30:00', 28, 5),
(3, 'Overcoming Grief After Loss', 'Lost a loved one recently and grief hits in waves. How do you cope on tough days? Looking for support and stories.', 'Grief', NULL, '2024-03-03 09:15:00', 42, 8),
(4, 'Building Healthy Relationships', 'Tips for communicating better in relationships? I\'m working on setting boundaries and could use advice from others.', 'Relationships', '/images/post4.jpg', '2024-03-04 14:20:00', 19, 2),
(5, 'Childhood Trauma Reflections', 'Reflecting on how past trauma affects me now. Therapy has helped, but sharing here feels therapeutic too. Anyone else?', 'Trauma', '/images/post5.jpg', '2024-03-05 16:45:00', 35, 6),
(6, 'Stress Management at Work', 'Work stress is real! What are your go-to methods for unwinding after a long day? Let\'s share strategies.', 'Stress', NULL, '2024-03-06 12:10:00', 22, 4),
(7, 'Positive Affirmations That Work', 'Daily affirmations have boosted my self-esteem. What are your favorites? Let\'s inspire each other!', 'Self-Esteem', '/images/post7.jpg', '2024-03-07 08:30:00', 50, 10),
(8, 'Dealing with Depression Symptoms', 'Some days are harder than others with depression. What small steps help you get through? Community support means a lot.', 'Depression', '/images/post8.jpg', '2024-03-08 13:00:00', 31, 7),
(9, 'Yoga for Mental Clarity', 'Yoga has cleared my mind like nothing else. Sharing a simple routine – what\'s your practice like?', 'Yoga', NULL, '2024-03-09 10:45:00', 26, 3),
(10, 'Support for New Parents', 'New parenthood and mental health – anyone else feeling overwhelmed? Tips for self-care welcome.', 'Parenting', '/images/post10.jpg', '2024-03-10 15:20:00', 18, 2),
(11, 'Addiction Recovery Milestones', 'Celebrating 6 months sober! What helped you in your journey? Grateful for this space.', 'Addiction', '/images/post11.jpg', '2024-03-11 11:15:00', 45, 9),
(12, 'Mindfulness in Everyday Life', 'Incorporating mindfulness into chores – it works! Share your hacks for staying present.', 'Mindfulness', NULL, '2024-03-12 17:00:00', 33, 5),
(13, 'LGBTQ+ Mental Health Challenges', 'Navigating identity and mental health in a supportive way. What resources have helped you?', 'LGBTQ+', '/images/post13.jpg', '2024-03-13 09:50:00', 29, 4),
(14, 'Burnout Recovery Story', 'Burned out from work, but recovering now. How did you bounce back? Let\'s motivate each other.', 'Burnout', '/images/post14.jpg', '2024-03-14 14:30:00', 24, 3),
(15, 'Art as Therapy', 'Using drawing to process emotions. Anyone else find art healing? Share your creations!', 'Art Therapy', NULL, '2024-03-15 12:25:00', 38, 6),
(16, 'Sleep Issues and Solutions', 'Struggling with insomnia due to anxiety. What natural remedies or routines help you sleep?', 'Sleep', '/images/post16.jpg', '2024-03-16 10:40:00', 20, 2),
(17, 'Family Dynamics and Healing', 'Healing from family conflicts – therapy is key. What\'s worked for you in family settings?', 'Family', '/images/post17.jpg', '2024-03-17 16:10:00', 27, 4),
(18, 'Gratitude Journaling Benefits', 'Gratitude journaling shifted my perspective. Try it! What are you grateful for today?', 'Gratitude', NULL, '2024-03-18 08:55:00', 41, 7),
(19, 'PTSD Coping Mechanisms', 'Managing PTSD triggers – breathing exercises help. Share your effective tools.', 'PTSD', '/images/post19.jpg', '2024-03-19 13:35:00', 36, 5),
(20, 'Self-Care Sunday Ideas', 'My self-care routine for Sundays. What do you do to recharge? Let\'s exchange ideas!', 'Self-Care', '/images/post20.jpg', '2024-03-20 11:20:00', 23, 3);

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM community_posts ;

TRUNCATE TABLE community_posts;

DROP TABLE community_posts;

-- 🧾 Table: community_posts
CREATE TABLE community_posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(150),
    content TEXT,
    category VARCHAR(50),
    image_url VARCHAR(255),
    created_at DATETIME,
    likes INT,
    comments_count INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ✅ PHASE–3: ADVANCED SQL QUERIES FOR community_posts
-- 🧩 1️⃣ JOIN QUERIES (5)
-- 1. INNER JOIN: Show all posts with their authors’ names
SELECT p.post_id, u.user_name, p.title, p.category
FROM community_posts p
INNER JOIN users u ON p.user_id = u.user_id;

-- 2. LEFT JOIN: Display all users even if they haven’t posted anything yet
SELECT u.user_id, u.user_name, p.title
FROM users u
LEFT JOIN community_posts p ON u.user_id = p.user_id;

-- 3. RIGHT JOIN: Display all posts and match users (if any missing info)
SELECT p.title, p.category, u.user_name
FROM community_posts p
RIGHT JOIN users u ON p.user_id = u.user_id;

-- 4. SELF JOIN: Find posts created on the same date by different users
SELECT a.post_id AS Post1, b.post_id AS Post2, a.created_at
FROM community_posts a
JOIN community_posts b
ON a.created_at = b.created_at AND a.user_id <> b.user_id;

-- 5. CROSS JOIN: Generate all combinations of post categories and sample moods
SELECT DISTINCT p.category, m.mood
FROM community_posts p
CROSS JOIN (SELECT 'Motivational' AS mood UNION SELECT 'Supportive' UNION SELECT 'Reflective') AS m;

-- 🔍 2️⃣ SUBQUERIES (5)
-- 6. Scalar Subquery: Find posts with likes greater than average likes
SELECT post_id, title, likes
FROM community_posts
WHERE likes > (SELECT AVG(likes) FROM community_posts);

-- 7. IN Subquery: Find users who have posted in the 'Anxiety' category
SELECT user_id, user_name
FROM users
WHERE user_id IN (
    SELECT user_id FROM community_posts WHERE category = 'Anxiety'
);

-- 8. EXISTS Subquery: List users who have created at least one post
SELECT user_name
FROM users u
WHERE EXISTS (
    SELECT 1 FROM community_posts p WHERE p.user_id = u.user_id
);

-- 9. Correlated Subquery: Find posts that have more likes than the average for their category
SELECT post_id, title, category, likes
FROM community_posts p1
WHERE likes > (
    SELECT AVG(likes)
    FROM community_posts p2
    WHERE p2.category = p1.category
);

-- 10. Subquery in FROM: Show top 5 most liked posts using a derived table
SELECT * 
FROM (
    SELECT title, likes, category
    FROM community_posts
    ORDER BY likes DESC
    LIMIT 5
) AS top_posts;

-- 🧮 3️⃣ BUILT-IN FUNCTIONS (5)
-- 11. String Function: Display post titles in uppercase
SELECT UPPER(title) AS TITLE_UPPER FROM community_posts;

-- 12. String/Numeric Function: Show first 20 characters of content and rounded likes
SELECT post_id, SUBSTRING(content, 1, 20) AS short_preview, ROUND(likes/2) AS half_likes
FROM community_posts;

-- 13. Date Function: Show post creation year and month
SELECT post_id, YEAR(created_at) AS post_year, MONTHNAME(created_at) AS post_month
FROM community_posts;

-- 14. Aggregate Function: Find average likes per category
SELECT category, AVG(likes) AS avg_likes
FROM community_posts
GROUP BY category;

-- 15. Conditional Function: Label posts as ‘Popular’ if likes ≥ 30
SELECT title, likes,
CASE 
    WHEN likes >= 30 THEN 'Popular'
    ELSE 'Regular'
END AS post_status
FROM community_posts;

-- 🧠 4️⃣ USER-DEFINED FUNCTIONS (5)
-- 16. Function: Calculate engagement score (likes + 2 × comments)
DELIMITER //
CREATE FUNCTION engagement_score(likes INT, comments INT)
RETURNS INT
DETERMINISTIC
RETURN (likes + (2 * comments));
DELIMITER ;

-- 17. Function: Check if a post is highly engaged (likes ≥ 40)
DELIMITER //
CREATE FUNCTION is_highly_engaged(likes INT)
RETURNS VARCHAR(10)
DETERMINISTIC
RETURN IF(likes >= 40, 'Yes', 'No');
DELIMITER ;

-- 18. Function: Calculate days since post was created
DELIMITER //
CREATE FUNCTION days_since_post(date_created DATETIME)
RETURNS INT
DETERMINISTIC
RETURN DATEDIFF(NOW(), date_created);
DELIMITER ;

-- 19. Function: Categorize posts based on likes
DELIMITER //
CREATE FUNCTION post_popularity(likes INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE level VARCHAR(20);
    IF likes >= 40 THEN
        SET level = 'Trending';
    ELSEIF likes >= 25 THEN
        SET level = 'Hot';
    ELSEIF likes >= 10 THEN
        SET level = 'Active';
    ELSE
        SET level = 'New';
    END IF;
    RETURN level;
END;
DELIMITER ;

-- 20. Using UDFs Together: Display posts with engagement metrics
SELECT post_id, title, likes, comments_count,
       engagement_score(likes, comments_count) AS total_engagement,
       is_highly_engaged(likes) AS popular_post,
       days_since_post(created_at) AS days_old,
       post_popularity(likes) AS popularity_level
FROM community_posts;

-- 1–4. Views (4)
-- 1) View: Recent posts (last 30 days)
CREATE OR REPLACE VIEW v_recent_posts AS
SELECT post_id, user_id, title, category, created_at, likes, comments_count
FROM community_posts
WHERE created_at >= (NOW() - INTERVAL 30 DAY)
ORDER BY created_at DESC;

-- 2) View: Top posts by likes
CREATE OR REPLACE VIEW v_top_posts AS
SELECT post_id, title, user_id, likes, comments_count
FROM community_posts
ORDER BY likes DESC, comments_count DESC
LIMIT 20;

-- 3) View: Posts count per category
CREATE OR REPLACE VIEW v_posts_by_category AS
SELECT category, COUNT(*) AS total_posts, AVG(likes) AS avg_likes
FROM community_posts
GROUP BY category;

-- 4) View: Active users (users with > N posts; set N=2 here)
CREATE OR REPLACE VIEW v_active_users AS
SELECT user_id, COUNT(*) AS posts_count
FROM community_posts
GROUP BY user_id
HAVING COUNT(*) > 2;

5–7. Cursors (3)
-- 5) Cursor: iterate posts with low engagement (likes < 5) and display summary
DELIMITER $$
CREATE PROCEDURE proc_list_low_engagement()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_title VARCHAR(150);
  DECLARE cur CURSOR FOR SELECT post_id, title FROM community_posts WHERE likes < 5;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO v_id, v_title;
    IF done THEN LEAVE read_loop; END IF;
    SELECT CONCAT('Post ', v_id, ': ', v_title) AS low_engagement_post;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 6) Cursor: incrementally add 1 like to posts with comments_count > 5 (demo of row-by-row update)
DELIMITER $$
CREATE PROCEDURE proc_boost_popular_comments()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE cur CURSOR FOR SELECT post_id FROM community_posts WHERE comments_count > 5;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  upd_loop: LOOP
    FETCH cur INTO v_id;
    IF done THEN LEAVE upd_loop; END IF;
    UPDATE community_posts SET likes = likes + 1 WHERE post_id = v_id;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 7) Cursor: prepare reminders for posts with no image (simulate output)
DELIMITER $$
CREATE PROCEDURE proc_remind_upload_image()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE cur CURSOR FOR SELECT post_id FROM community_posts WHERE image_url IS NULL;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  rem_loop: LOOP
    FETCH cur INTO v_id;
    IF done THEN LEAVE rem_loop; END IF;
    SELECT CONCAT('Reminder: please add image for post_id=', v_id) AS reminder;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 8–11. Stored Procedures (4)
-- 8) Add a new post
DELIMITER $$
CREATE PROCEDURE sp_add_post(
  IN p_user_id INT,
  IN p_title VARCHAR(150),
  IN p_content TEXT,
  IN p_category VARCHAR(50),
  IN p_image_url VARCHAR(255)
)
BEGIN
  INSERT INTO community_posts (user_id, title, content, category, image_url, created_at, likes, comments_count)
  VALUES (p_user_id, p_title, p_content, p_category, p_image_url, NOW(), 0, 0);
  SELECT LAST_INSERT_ID() AS new_post_id;
END $$
DELIMITER ;

-- 9) Update likes/comments atomically (useful for API)
DELIMITER $$
CREATE PROCEDURE sp_update_engagement(IN p_post_id INT, IN p_like_delta INT, IN p_comment_delta INT)
BEGIN
  UPDATE community_posts
  SET likes = GREATEST(0, likes + p_like_delta),
      comments_count = GREATEST(0, comments_count + p_comment_delta)
  WHERE post_id = p_post_id;
END $$
DELIMITER ;

-- 10) Get posts by category with pagination
DELIMITER $$
CREATE PROCEDURE sp_get_posts_by_category(IN p_category VARCHAR(50), IN p_offset INT, IN p_limit INT)
BEGIN
  SELECT post_id, user_id, title, created_at, likes, comments_count
  FROM community_posts
  WHERE category = p_category
  ORDER BY created_at DESC
  LIMIT p_offset, p_limit;
END $$
DELIMITER ;

-- 11) Delete old posts (older than N days) and return count via OUT parameter
DELIMITER $$
CREATE PROCEDURE sp_delete_old_posts(IN p_days INT, OUT p_deleted_count INT)
BEGIN
  START TRANSACTION;
    DELETE FROM community_posts WHERE created_at < (NOW() - INTERVAL p_days DAY);
    SET p_deleted_count = ROW_COUNT();
  COMMIT;
END $$
DELIMITER ;

-- 12–15. Window / Analytic Queries (4)
-- 12) Rank posts by likes within each category
SELECT post_id, category, title, likes,
       RANK() OVER (PARTITION BY category ORDER BY likes DESC) AS rank_in_category
FROM community_posts;

-- 13) Running total of likes by creation date
SELECT DATE(created_at) AS dt, SUM(likes) AS likes_on_day,
       SUM(SUM(likes)) OVER (ORDER BY DATE(created_at)) AS running_likes
FROM community_posts
GROUP BY DATE(created_at)
ORDER BY DATE(created_at);

-- 14) Use LAG to show previous post's likes for same user
SELECT user_id, post_id, created_at, likes,
       LAG(likes) OVER (PARTITION BY user_id ORDER BY created_at) AS prev_likes
FROM community_posts;

-- 15) Percentile of likes across all posts
SELECT post_id, title, likes,
       NTILE(100) OVER (ORDER BY likes) AS like_percentile
FROM community_posts;

-- 16–18. DCL & TCL (3)
-- 16) Grant read & insert to community moderator role (replace DB name)
GRANT SELECT, INSERT, UPDATE ON your_database.community_posts TO 'community_mod'@'localhost';

-- 17) Revoke delete privilege from general users
REVOKE DELETE ON your_database.community_posts FROM 'general_user'@'localhost';

-- 18) TCL example: safely increment likes and rollback on validation failure
START TRANSACTION;
  UPDATE community_posts SET likes = likes + 1 WHERE post_id = 1;
  -- Example validation: ensure likes < 1000000; if fails, ROLLBACK
COMMIT;

-- 19–20. Triggers (2)
-- 19) BEFORE INSERT trigger: ensure created_at and default counts
DELIMITER $$
CREATE TRIGGER trg_cp_before_insert
BEFORE INSERT ON community_posts
FOR EACH ROW
BEGIN
  IF NEW.created_at IS NULL THEN
    SET NEW.created_at = NOW();
  END IF;
  IF NEW.likes IS NULL THEN
    SET NEW.likes = 0;
  END IF;
  IF NEW.comments_count IS NULL THEN
    SET NEW.comments_count = 0;
  END IF;
END $$
DELIMITER ;

-- 20) AFTER UPDATE trigger: log large engagement changes to audit table
CREATE TABLE IF NOT EXISTS community_post_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  post_id INT,
  old_likes INT,
  new_likes INT,
  old_comments INT,
  new_comments INT,
  changed_at DATETIME
);

DELIMITER $$
CREATE TRIGGER trg_cp_after_update
AFTER UPDATE ON community_posts
FOR EACH ROW
BEGIN
  IF OLD.likes <> NEW.likes OR OLD.comments_count <> NEW.comments_count THEN
    -- log changes where change is significant (e.g., change >= 5)
    IF ABS(NEW.likes - OLD.likes) >= 5 OR ABS(NEW.comments_count - OLD.comments_count) >= 3 THEN
      INSERT INTO community_post_audit (post_id, old_likes, new_likes, old_comments, new_comments, changed_at)
      VALUES (NEW.post_id, OLD.likes, NEW.likes, OLD.comments_count, NEW.comments_count, NOW());
    END IF;
  END IF;
END $$
DELIMITER ;
--  ========================================================== CREATE  TABLE 19. COMMUNITY_COMMENTS =======================================================================

-- 19. COMMUNITY_COMMENTS
CREATE TABLE community_comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    comment TEXT,
    created_at DATETIME,
    updated_at DATETIME,
    status VARCHAR(20),
    likes INT,
    FOREIGN KEY (post_id) REFERENCES community_posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ======================================================= INSERT INTO community_comments  =================================================================================

INSERT INTO community_comments (post_id, user_id, comment, created_at, updated_at, status, likes) VALUES
(1, 2, 'Try the 4-7-8 breathing technique – it grounds me quickly!', '2024-03-01 11:00:00', '2024-03-01 11:00:00', 'Approved', 5),
(2, 3, 'Headspace app is great for beginners. Keep it up!', '2024-03-02 12:30:00', '2024-03-02 12:30:00', 'Approved', 3),
(3, 4, 'Journaling helped me process grief. You\'re not alone.', '2024-03-03 10:15:00', '2024-03-03 10:15:00', 'Approved', 8),
(4, 5, 'Active listening is key in relationships. Good luck!', '2024-03-04 15:20:00', '2024-03-04 15:20:00', 'Approved', 2),
(5, 6, 'Therapy plus support groups made a difference for me.', '2024-03-05 17:45:00', '2024-03-05 17:45:00', 'Pending', 4),
(6, 7, 'Walking after work clears my head. Try it!', '2024-03-06 13:10:00', '2024-03-06 13:10:00', 'Approved', 6),
(7, 8, '\'I am enough\' is my go-to affirmation. Powerful!', '2024-03-07 09:30:00', '2024-03-07 09:30:00', 'Approved', 7),
(8, 9, 'Small wins like getting out of bed count. Hang in there.', '2024-03-08 14:00:00', '2024-03-08 14:00:00', 'Approved', 9),
(9, 10, 'Yoga with Adriene on YouTube is free and amazing.', '2024-03-09 11:45:00', '2024-03-09 11:45:00', 'Approved', 2),
(10, 11, 'Parenting groups online were a lifesaver for me.', '2024-03-10 16:20:00', '2024-03-10 16:20:00', 'Approved', 3),
(11, 12, 'Congrats on 6 months! One day at a time.', '2024-03-11 12:15:00', '2024-03-11 12:15:00', 'Approved', 10),
(12, 13, 'Mindful eating during meals helps me stay present.', '2024-03-12 18:00:00', '2024-03-12 18:00:00', 'Approved', 4),
(13, 14, 'The Trevor Project has great LGBTQ+ resources.', '2024-03-13 10:50:00', '2024-03-13 10:50:00', 'Approved', 5),
(14, 15, 'Setting work boundaries was my first step to recovery.', '2024-03-14 15:30:00', '2024-03-14 15:30:00', 'Approved', 3),
(15, 16, 'Art journaling is my outlet – highly recommend!', '2024-03-15 13:25:00', '2024-03-15 13:25:00', 'Approved', 6),
(16, 17, 'Herbal tea and no screens before bed work for me.', '2024-03-16 11:40:00', '2024-03-16 11:40:00', 'Approved', 2),
(17, 18, 'Family therapy sessions improved our communication.', '2024-03-17 17:10:00', '2024-03-18 09:00:00', 'Approved', 4),
(18, 19, 'Grateful for this community today. Thanks for sharing!', '2024-03-18 09:55:00', '2024-03-18 09:55:00', 'Approved', 7),
(19, 20, 'Grounding with senses (5-4-3-2-1) helps with PTSD.', '2024-03-19 14:35:00', '2024-03-19 14:35:00', 'Approved', 5),
(20, 1, 'Bubble baths and reading are my Sunday recharge.', '2024-03-20 12:20:00', '2024-03-20 12:20:00', 'Approved', 3);

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM community_comments ;

TRUNCATE TABLE community_comments;

DROP TABLE community_comments;


-- 1 — JOINS (5)
-- J1: Inner join — comments with post titles and commenter username
SELECT cc.comment_id, u.user_id, u.username, p.post_id, p.title, cc.comment, cc.created_at
FROM community_comments cc
INNER JOIN users u ON cc.user_id = u.user_id
INNER JOIN community_posts p ON cc.post_id = p.post_id;

-- J2: Left join — all posts and their comments (show posts even if no comments)
SELECT p.post_id, p.title, cc.comment_id, cc.comment, cc.user_id
FROM community_posts p
LEFT JOIN community_comments cc ON p.post_id = cc.post_id
ORDER BY p.post_id, cc.created_at;

-- J3: Right join — all users and their comments (shows users even without comments; MySQL supports RIGHT JOIN)
SELECT u.user_id, u.username, cc.comment_id, cc.comment, cc.status
FROM community_comments cc
RIGHT JOIN users u ON cc.user_id = u.user_id
ORDER BY u.user_id;

-- J4: Self-join — find pairs of comments on same post by different users (useful to spot interactions)
SELECT a.comment_id AS comment_a, b.comment_id AS comment_b, a.post_id, a.user_id AS user_a, b.user_id AS user_b
FROM community_comments a
JOIN community_comments b ON a.post_id = b.post_id AND a.comment_id <> b.comment_id
WHERE a.user_id <> b.user_id
LIMIT 100;

-- J5: Cross join sample — cross users with categories of posts to produce suggestion pairs
SELECT u.user_id, u.username, DISTINCT_CAT.category
FROM users u
CROSS JOIN (
  SELECT DISTINCT category FROM community_posts
) DISTINCT_CAT
ORDER BY u.user_id, DISTINCT_CAT.category
LIMIT 100;



-- 2 — SUBQUERIES (5)
-- S1: Scalar subquery — comments with likes greater than average likes
SELECT comment_id, user_id, post_id, likes
FROM community_comments
WHERE likes > (SELECT AVG(likes) FROM community_comments);

-- S2: Correlated subquery — comments that are more liked than the average for that post
SELECT cc.comment_id, cc.post_id, cc.likes
FROM community_comments cc
WHERE cc.likes > (
  SELECT AVG(c2.likes) FROM community_comments c2 WHERE c2.post_id = cc.post_id
);

-- S3: IN-subquery — comments for posts in the 'Anxiety' category
SELECT cc.comment_id, cc.post_id, cc.comment
FROM community_comments cc
WHERE cc.post_id IN (
  SELECT post_id FROM community_posts WHERE category = 'Anxiety'
);

-- S4: EXISTS-subquery — users who have commented (list users present in comments)
SELECT u.user_id, u.username
FROM users u
WHERE EXISTS (
  SELECT 1 FROM community_comments cc WHERE cc.user_id = u.user_id
);

-- S5: Subquery in FROM — show each comment and difference from post average likes
SELECT t.comment_id, t.post_id, t.likes, (t.likes - t.avg_post_likes) AS likes_above_post_avg
FROM (
  SELECT cc.comment_id, cc.post_id, cc.likes,
         (SELECT AVG(c2.likes) FROM community_comments c2 WHERE c2.post_id = cc.post_id) AS avg_post_likes
  FROM community_comments cc
) t
ORDER BY likes_above_post_avg DESC;

-- 3 — BUILT-IN FUNCTIONS (5)
-- F1: String function — show first 80 chars of comment with user (SUBSTRING + CONCAT)
SELECT cc.comment_id, cc.post_id, CONCAT(LEFT(cc.comment,80), '...') AS preview,
       CONCAT(u.username, ' commented on "', LEFT(p.title,50), '"') AS summary
FROM community_comments cc
JOIN users u ON cc.user_id = u.user_id
JOIN community_posts p ON cc.post_id = p.post_id
ORDER BY cc.created_at DESC
LIMIT 20;

-- F2: Date function — days since comment creation
SELECT comment_id, user_id, created_at, DATEDIFF(NOW(), created_at) AS days_since_comment
FROM community_comments;

-- F3: Numeric/aggregate functions — average likes and total comments per post
SELECT post_id, COUNT(*) AS total_comments, ROUND(AVG(likes),2) AS avg_likes
FROM community_comments
GROUP BY post_id
ORDER BY total_comments DESC;

-- F4: Conditional (CASE) + aggregate — categorize comments by popularity
SELECT
  CASE
    WHEN likes >= 8 THEN 'Very Popular'
    WHEN likes BETWEEN 4 AND 7 THEN 'Popular'
    ELSE 'Less Popular'
  END AS popularity,
  COUNT(*) AS comment_count
FROM community_comments
GROUP BY popularity;

-- F5: Full-text-ish search using LOWER + LIKE to find comments mentioning 'anxiety' (case-insensitive)
SELECT comment_id, post_id, user_id, created_at
FROM community_comments
WHERE LOWER(comment) LIKE '%anxiety%' OR LOWER(comment) LIKE '%panic%'
ORDER BY created_at DESC;

-- 4 — USER-DEFINED FUNCTIONS (UDFs) (5)

DELIMITER $$

-- UDF1: Days since comment (wraps DATEDIFF)
CREATE FUNCTION fn_days_since_comment(c_date DATETIME)
RETURNS INT
DETERMINISTIC
RETURN DATEDIFF(NOW(), c_date);
$$

-- Usage:
-- SELECT comment_id, fn_days_since_comment(created_at) AS days_old FROM community_comments;

-- UDF2: Shorten comment to N characters (returns VARCHAR)
CREATE FUNCTION fn_shorten_comment(c TEXT, n INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN LEFT(c, n);
END
$$

-- Usage:
-- SELECT comment_id, fn_shorten_comment(comment, 50) FROM community_comments;

-- UDF3: IsPositiveLike — labels comment by likes threshold
CREATE FUNCTION fn_like_label(l INT)
RETURNS VARCHAR(20)
DETERMINISTIC
RETURN (CASE WHEN l >= 5 THEN 'Positive' ELSE 'Needs Love' END);
$$

-- Usage:
-- SELECT comment_id, likes, fn_like_label(likes) FROM community_comments;

-- UDF4: GetPostCommentCount(postId) — returns count of comments for a post
CREATE FUNCTION fn_post_comment_count(pId INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE cnt INT DEFAULT 0;
  SELECT COUNT(*) INTO cnt FROM community_comments WHERE post_id = pId;
  RETURN cnt;
END
$$

-- Usage:
-- SELECT post_id, fn_post_comment_count(post_id) AS comments_count FROM community_posts LIMIT 20;

-- UDF5: AvgLikesForUser — average likes across comments by a user (returns DECIMAL)
CREATE FUNCTION fn_avg_likes_user(uId INT)
RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
  DECLARE avglikes DECIMAL(6,2);
  SELECT IFNULL(ROUND(AVG(likes),2),0.00) INTO avglikes FROM community_comments WHERE user_id = uId;
  RETURN avglikes;
END
$$

DELIMITER ;

-- 1–4. VIEWS (4)
-- V1: All approved comments with post title and commenter username
CREATE OR REPLACE VIEW v_approved_comments AS
SELECT cc.comment_id, cc.post_id, p.title AS post_title, cc.user_id, u.username, cc.comment, cc.created_at, cc.likes
FROM community_comments cc
JOIN community_posts p ON cc.post_id = p.post_id
JOIN users u ON cc.user_id = u.user_id
WHERE cc.status = 'Approved';

-- V2: Top commented posts (post_id + number of comments)
CREATE OR REPLACE VIEW v_post_comment_counts AS
SELECT post_id, COUNT(*) AS comment_count, AVG(likes) AS avg_comment_likes
FROM community_comments
GROUP BY post_id
ORDER BY comment_count DESC;

-- V3: Recent flagged or pending comments for moderation
CREATE OR REPLACE VIEW v_moderation_queue AS
SELECT comment_id, post_id, user_id, created_at, status, likes
FROM community_comments
WHERE status IN ('Pending', 'Flagged')
ORDER BY created_at ASC;

-- V4: User engagement summary (total comments and avg likes)
CREATE OR REPLACE VIEW v_user_comment_summary AS
SELECT user_id, COUNT(*) AS total_comments, ROUND(IFNULL(AVG(likes),0),2) AS avg_likes
FROM community_comments
GROUP BY user_id;

-- 5–7. CURSORS (3)
-- C5: Cursor to list pending comments (demo: returns rows one-by-one)
DELIMITER $$
CREATE PROCEDURE proc_iterate_pending_comments()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_user INT;
  DECLARE v_text TEXT;
  DECLARE cur CURSOR FOR SELECT comment_id, user_id, comment FROM community_comments WHERE status='Pending' ORDER BY created_at;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO v_id, v_user, v_text;
    IF done THEN LEAVE read_loop; END IF;
    SELECT v_id AS comment_id, v_user AS user_id, LEFT(v_text,200) AS preview;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- C6: Cursor to auto-flag low-quality comments (likes <= 0 and very short)
DELIMITER $$
CREATE PROCEDURE proc_flag_low_quality()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE cur CURSOR FOR
    SELECT comment_id FROM community_comments WHERE (likes <= 0 OR LENGTH(TRIM(comment)) < 15) AND status <> 'Flagged';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop1: LOOP
    FETCH cur INTO v_id;
    IF done THEN LEAVE loop1; END IF;
    UPDATE community_comments SET status = 'Flagged', updated_at = NOW() WHERE comment_id = v_id;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- C7: Cursor to send "thank you" simulation for top commenters (likes >= threshold)
DELIMITER $$
CREATE PROCEDURE proc_thank_top_commenters(IN like_threshold INT)
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_user INT;
  DECLARE cur CURSOR FOR
    SELECT DISTINCT user_id FROM community_comments WHERE likes >= like_threshold;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop2: LOOP
    FETCH cur INTO v_user;
    IF done THEN LEAVE loop2; END IF;
    -- Demo output (replace with actual notification logic)
    SELECT CONCAT('Send thank you to user_id=', v_user) AS notify;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 8–11. STORED PROCEDURES (4)
-- S8: Add comment (transaction-safe)
DELIMITER $$
CREATE PROCEDURE sp_add_comment(
  IN p_post_id INT,
  IN p_user_id INT,
  IN p_comment TEXT
)
BEGIN
  START TRANSACTION;
    INSERT INTO community_comments (post_id, user_id, comment, created_at, updated_at, status, likes)
    VALUES (p_post_id, p_user_id, p_comment, NOW(), NOW(), 'Pending', 0);
    SELECT LAST_INSERT_ID() AS new_comment_id;
  COMMIT;
END $$
DELIMITER ;

-- S9: Approve or change status and log to audit
CREATE TABLE IF NOT EXISTS community_comment_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  comment_id INT,
  old_status VARCHAR(30),
  new_status VARCHAR(30),
  changed_by VARCHAR(100),
  changed_at DATETIME
);

DELIMITER $$
CREATE PROCEDURE sp_change_comment_status(
  IN p_comment_id INT,
  IN p_new_status VARCHAR(30),
  IN p_changed_by VARCHAR(100)
)
BEGIN
  DECLARE v_old VARCHAR(30);
  SELECT status INTO v_old FROM community_comments WHERE comment_id = p_comment_id;
  UPDATE community_comments SET status = p_new_status, updated_at = NOW() WHERE comment_id = p_comment_id;
  INSERT INTO community_comment_audit (comment_id, old_status, new_status, changed_by, changed_at)
    VALUES (p_comment_id, v_old, p_new_status, p_changed_by, NOW());
END $$
DELIMITER ;

-- S10: Get comments for a post with pagination
DELIMITER $$
CREATE PROCEDURE sp_get_comments_for_post(
  IN p_post_id INT,
  IN p_offset INT,
  IN p_limit INT
)
BEGIN
  SELECT comment_id, user_id, comment, created_at, likes, status
  FROM community_comments
  WHERE post_id = p_post_id
  ORDER BY created_at ASC
  LIMIT p_offset, p_limit;
END $$
DELIMITER ;

-- S11: Delete comments older than N days and return count via OUT param
DELIMITER $$
CREATE PROCEDURE sp_delete_old_comments(IN p_days INT, OUT p_deleted INT)
BEGIN
  START TRANSACTION;
    DELETE FROM community_comments WHERE created_at < (NOW() - INTERVAL p_days DAY);
    SET p_deleted = ROW_COUNT();
  COMMIT;
END $$
DELIMITER ;

-- 12–15. WINDOW / ANALYTIC QUERIES (4)
-- W12: Rank comments by likes per post
SELECT comment_id, post_id, user_id, likes,
       RANK() OVER (PARTITION BY post_id ORDER BY likes DESC) AS like_rank_in_post
FROM community_comments;

-- W13: Running total of comments per day
SELECT DATE(created_at) AS day, COUNT(*) AS comments_on_day,
       SUM(COUNT(*)) OVER (ORDER BY DATE(created_at)) AS running_total_comments
FROM community_comments
GROUP BY DATE(created_at)
ORDER BY DATE(created_at);

-- W14: LAG to show previous comment's likes for same user
SELECT comment_id, user_id, created_at, likes,
       LAG(likes) OVER (PARTITION BY user_id ORDER BY created_at) AS prev_likes
FROM community_comments;

-- W15: Percent contribution of each comment's likes within its post
SELECT comment_id, post_id, likes,
       ROUND(likes / NULLIF(SUM(likes) OVER (PARTITION BY post_id),0) * 100,2) AS pct_of_post_likes
FROM community_comments;

-- 16–18. DCL & TCL (3)
-- D16: Grant moderation role select/update rights (replace database name)
GRANT SELECT, UPDATE ON your_database.community_comments TO 'moderator'@'localhost';

-- D17: Revoke delete from general users
REVOKE DELETE ON your_database.community_comments FROM 'general_user'@'localhost';

-- T18: Transaction example — safely increment likes and revert if validation fails
START TRANSACTION;
  UPDATE community_comments SET likes = likes + 1 WHERE comment_id = 7;
  -- Example validation: ensure likes <= 1000000
  -- IF (SELECT likes FROM community_comments WHERE comment_id=7) > 1000000 THEN ROLLBACK; ELSE COMMIT; END IF;
COMMIT;

-- 19–20. TRIGGERS (2)
-- T19: BEFORE INSERT — set timestamps and default values
DELIMITER $$
CREATE TRIGGER trg_cc_before_insert
BEFORE INSERT ON community_comments
FOR EACH ROW
BEGIN
  IF NEW.created_at IS NULL THEN
    SET NEW.created_at = NOW();
  END IF;
  SET NEW.updated_at = IFNULL(NEW.updated_at, NEW.created_at);
  IF NEW.likes IS NULL THEN
    SET NEW.likes = 0;
  END IF;
  IF NEW.status IS NULL OR NEW.status = '' THEN
    SET NEW.status = 'Pending';
  END IF;
END $$
DELIMITER ;

-- T20: AFTER UPDATE — audit status/likes changes and optionally notify
-- Create audit table if not exists (used by trigger)
CREATE TABLE IF NOT EXISTS community_comment_change_log (
  log_id INT PRIMARY KEY AUTO_INCREMENT,
  comment_id INT,
  old_status VARCHAR(30),
  new_status VARCHAR(30),
  old_likes INT,
  new_likes INT,
  changed_at DATETIME
);

DELIMITER $$
CREATE TRIGGER trg_cc_after_update
AFTER UPDATE ON community_comments
FOR EACH ROW
BEGIN
  IF OLD.status <> NEW.status OR OLD.likes <> NEW.likes THEN
    INSERT INTO community_comment_change_log (comment_id, old_status, new_status, old_likes, new_likes, changed_at)
    VALUES (NEW.comment_id, OLD.status, NEW.status, OLD.likes, NEW.likes, NOW());
    -- Optional: call notification procedure here (not implemented)
  END IF;
END $$
DELIMITER ;
--  ========================================================== CREATE  TABLE  20. CONTACT_MESSAGES =======================================================================

-- 20. CONTACT_MESSAGES
CREATE TABLE contact_messages (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    subject VARCHAR(150),
    message TEXT,
    phone VARCHAR(15),
    received_at DATETIME,
    status VARCHAR(20),
    response TEXT,
    responded_by VARCHAR(100)
);

-- ======================================================= INSERT INTO contact_messages =================================================================================

INSERT INTO contact_messages (name, email, subject, message, phone, received_at, status, response, responded_by) VALUES
('John Doe', 'john.doe@email.com', 'Inquiry about Counseling Services', 'I\'m interested in booking a session for anxiety management. Could you provide more details on available counselors and fees?', '+1-555-0101', '2024-03-01 10:00:00', 'Resolved', 'Thank you for your inquiry. We have several counselors specializing in anxiety. Please visit our booking page or reply with your availability.', 'Admin Sarah'),
('Jane Smith', 'jane.smith@email.com', 'Feedback on Recent Event', 'The Mental Health Workshop was informative, but the venue was hard to find. Suggestions for better signage next time.', '+1-555-0102', '2024-03-02 11:30:00', 'Resolved', 'We appreciate your feedback! We\'ll improve signage for future events. Glad you enjoyed the workshop.', 'Admin Mike'),
('Mike Johnson', 'mike.j@email.com', 'Donation Issue', 'I tried donating to the Youth Therapy campaign but the payment failed. Can you assist?', '+1-555-0103', '2024-03-03 09:15:00', 'In Progress', NULL, NULL),
('Emily Davis', 'emily.d@email.com', 'Product Return Request', 'I\'d like to return the mindfulness journal as it arrived damaged. How do I proceed?', '+1-555-0104', '2024-03-04 14:20:00', 'Resolved', 'Sorry for the inconvenience. Please send a photo of the damage to support@wellnessapp.com for a full refund.', 'Admin Lisa'),
('Robert Wilson', 'robert.w@email.com', 'Subscription Cancellation', 'How can I cancel my premium subscription? I no longer need it.', '+1-555-0105', '2024-03-05 16:45:00', 'Closed', 'Your subscription has been cancelled effective immediately. If you have any issues, let us know.', 'Admin Tom'),
('Sarah Brown', 'sarah.b@email.com', 'Event Registration Problem', 'I registered for the Yoga Class but haven\'t received confirmation. Please check.', '+1-555-0106', '2024-03-06 12:10:00', 'Resolved', 'Confirmation sent to your email. Check spam folder if needed. See you at the event!', 'Admin Anna'),
('David Lee', 'david.l@email.com', 'General Feedback', 'Love the community posts feature! It\'s great for connecting with others facing similar issues.', '+1-555-0107', '2024-03-07 08:30:00', 'Resolved', 'Thank you for the positive feedback! We\'re glad the community is helpful.', 'Admin James'),
('Lisa Garcia', 'lisa.g@email.com', 'Campaign Suggestion', 'I have an idea for a new campaign on workplace burnout. How can I submit it?', '+1-555-0108', '2024-03-08 13:00:00', 'In Progress', NULL, NULL),
('Chris Taylor', 'chris.t@email.com', 'Technical Support', 'The app crashes when I try to upload a profile photo. Using Android version 2.3.', '+1-555-0109', '2024-03-09 10:45:00', 'Resolved', 'This is a known issue. Please update to the latest version or clear cache. If persists, contact us with more details.', 'Admin Tech Support'),
('Anna White', 'anna.w@email.com', 'Privacy Concern', 'I\'m worried about how my data is shared in counseling sessions. Can you explain the policy?', '+1-555-0110', '2024-03-10 15:20:00', 'Resolved', 'All sessions are confidential per HIPAA standards. No data is shared without consent. See our privacy policy for details.', 'Admin Legal'),
('Tom Adams', 'tom.a@email.com', 'Review Moderation', 'My review on the essential oils was rejected. Why? It was honest feedback.', '+1-555-0111', '2024-03-11 11:15:00', 'Closed', 'The review contained potentially defamatory language. We\'ve approved a revised version. Thanks for understanding.', 'Admin Moderator'),
('Maria Martinez', 'maria.m@email.com', 'Newsletter Unsubscribe', 'Please remove me from the email list. I\'m getting too many updates.', '+1-555-0112', '2024-03-12 17:00:00', 'Resolved', 'You\'ve been unsubscribed. If you change your mind, you can resubscribe anytime.', 'Admin Marketing'),
('Kevin Rodriguez', 'kevin.r@email.com', 'Partnership Opportunity', 'I run a local therapy center and want to partner for events. Who should I contact?', '+1-555-0113', '2024-03-13 09:50:00', 'In Progress', NULL, NULL),
('Sophia Lopez', 'sophia.l@email.com', 'Accessibility Issue', 'The website isn\'t screen-reader friendly for visually impaired users. Suggestions?', '+1-555-0114', '2024-03-14 14:30:00', 'Resolved', 'Thank you for pointing this out. We\'re working on WCAG compliance. In the meantime, try our mobile app.', 'Admin Dev Team'),
('James Clark', 'james.c@email.com', 'Billing Question', 'Why was I charged twice for the same donation? Please refund one.', '+1-555-0115', '2024-03-15 12:25:00', 'Resolved', 'Apologies for the error. Refund processed to your original payment method within 3-5 days.', 'Admin Finance'),
('Rachel Lewis', 'rachel.l@email.com', 'Content Suggestion', 'Add more resources for PTSD in the community section. It would help many.', '+1-555-0116', '2024-03-16 10:40:00', 'Closed', 'Great idea! We\'ve added PTSD resources to our library. Check it out.', 'Admin Content'),
('Alex Walker', 'alex.w@email.com', 'Account Recovery', 'Forgot my password and the reset link isn\'t working. Help!', '+1-555-0117', '2024-03-17 16:10:00', 'Resolved', 'We\'ve reset your password manually. New credentials sent to your email. Please change it upon login.', 'Admin Support'),
('Nina Hall', 'nina.h@email.com', 'Event Cancellation Policy', 'What is the policy for cancelling event registrations? I need to cancel one.', '+1-555-0118', '2024-03-18 08:55:00', 'In Progress', NULL, NULL),
('Brian Young', 'brian.y@email.com', 'App Feature Request', 'Would love a chat feature for quick counselor Q&A. Is it planned?', '+1-555-0119', '2024-03-19 13:35:00', 'Resolved', 'Thanks for the suggestion! It\'s in our roadmap for Q3 2024.', 'Admin Product'),
('Olivia King', 'olivia.k@email.com', 'Thank You Note', 'Just wanted to say thanks for the amazing platform. It\'s helped my mental health journey.', '+1-555-0120', '2024-03-20 11:20:00', 'Resolved', 'We\'re thrilled to hear that! Your support means the world to us.', 'Admin Community');

-- ========================================= QUERIES ===============================================================================================================

SELECT *  FROM  contact_messages;

TRUNCATE  TABLE contact_messages;

DROP TABLE contact_messages;

-- 🔹 1️⃣ JOIN QUERIES (20)
-- 1. INNER JOIN: Show comment with username and related post title
SELECT c.comment_id, u.username, p.title, c.comment
FROM community_comments c
INNER JOIN users u ON c.user_id = u.user_id
INNER JOIN community_posts p ON c.post_id = p.post_id;

-- 2. LEFT JOIN: List all posts and their comments if any
SELECT p.post_id, p.title, c.comment
FROM community_posts p
LEFT JOIN community_comments c ON p.post_id = c.post_id;

-- 3. RIGHT JOIN: List all comments and their related posts
SELECT c.comment_id, p.title, c.comment
FROM community_posts p
RIGHT JOIN community_comments c ON p.post_id = c.post_id;

-- 4. SELF JOIN: Compare comments that have the same number of likes
SELECT a.comment_id AS comment1, b.comment_id AS comment2, a.likes
FROM community_comments a
JOIN community_comments b ON a.likes = b.likes AND a.comment_id <> b.comment_id;

-- 5. CROSS JOIN: Combine all posts and comments (Cartesian product)
SELECT p.title, c.comment
FROM community_posts p
CROSS JOIN community_comments c;

-- 6. INNER JOIN: Find comments posted by approved users only
SELECT c.comment_id, u.username, c.comment
FROM community_comments c
INNER JOIN users u ON c.user_id = u.user_id
WHERE c.status = 'Approved';

-- 7. LEFT JOIN: Show all users and the comments they have made
SELECT u.username, c.comment
FROM users u
LEFT JOIN community_comments c ON u.user_id = c.user_id;

-- 8. INNER JOIN: List comments on posts made after March 10 2024
SELECT c.comment_id, p.title, c.comment
FROM community_comments c
INNER JOIN community_posts p ON c.post_id = p.post_id
WHERE p.created_at > '2024-03-10';

-- 9. LEFT JOIN with NULL check: Find posts without comments
SELECT p.title
FROM community_posts p
LEFT JOIN community_comments c ON p.post_id = c.post_id
WHERE c.comment_id IS NULL;

-- 10. JOIN + Aggregate: Count comments per post
SELECT p.title, COUNT(c.comment_id) AS total_comments
FROM community_posts p
LEFT JOIN community_comments c ON p.post_id = c.post_id
GROUP BY p.title;

-- 11. INNER JOIN: Show comment details with user email
SELECT c.comment_id, u.email, c.comment
FROM community_comments c
INNER JOIN users u ON c.user_id = u.user_id;

-- 12. LEFT JOIN: Show user and number of likes on their comment
SELECT u.username, c.likes
FROM users u
LEFT JOIN community_comments c ON u.user_id = c.user_id;

-- 13. INNER JOIN: Show comments that belong to posts by a specific user
SELECT c.comment_id, c.comment
FROM community_comments c
INNER JOIN community_posts p ON c.post_id = p.post_id
WHERE p.user_id = 5;

-- 14. LEFT JOIN: Include posts even if status of comment is ‘Pending’
SELECT p.title, c.status
FROM community_posts p
LEFT JOIN community_comments c ON p.post_id = c.post_id;

-- 15. RIGHT JOIN: Show comments without matching post (if any broken reference)
SELECT c.comment_id, p.title
FROM community_posts p
RIGHT JOIN community_comments c ON p.post_id = c.post_id
WHERE p.title IS NULL;

-- 16. INNER JOIN + ORDER: Top 5 comments with highest likes
SELECT u.username, c.comment, c.likes
FROM community_comments c
JOIN users u ON c.user_id = u.user_id
ORDER BY c.likes DESC
LIMIT 5;

-- 17. JOIN: Comments with same user appearing in multiple posts
SELECT u.username, COUNT(DISTINCT c.post_id) AS post_count
FROM community_comments c
JOIN users u ON c.user_id = u.user_id
GROUP BY u.username
HAVING post_count > 1;

-- 18. JOIN with CONCAT: Combine post title + comment preview
SELECT CONCAT(p.title, ' → ', LEFT(c.comment, 40)) AS summary
FROM community_posts p
JOIN community_comments c ON p.post_id = c.post_id;

-- 19. INNER JOIN + Filter: Comments updated same day
SELECT c.comment_id, u.username, c.updated_at
FROM community_comments c
JOIN users u ON c.user_id = u.user_id
WHERE DATE(c.updated_at) = DATE(c.created_at);

-- 20. DOUBLE JOIN: Comment → Post → User who wrote the post
SELECT c.comment_id, commenter.username AS commenter,
       post_author.username AS post_author, p.title, c.comment
FROM community_comments c
JOIN community_posts p ON c.post_id = p.post_id
JOIN users AS commenter ON c.user_id = commenter.user_id
JOIN users AS post_author ON p.user_id = post_author.user_id;

-- 🔹 2️⃣ SUBQUERY QUERIES (20)
-- 1. Comments with likes > average likes
SELECT comment_id, comment
FROM community_comments
WHERE likes > (SELECT AVG(likes) FROM community_comments);

-- 2. Users who have commented more than once
SELECT user_id
FROM community_comments
GROUP BY user_id
HAVING COUNT(comment_id) > 1;

-- 3. Posts that received comments with over 5 likes
SELECT post_id, title
FROM community_posts
WHERE post_id IN (SELECT post_id FROM community_comments WHERE likes > 5);

-- 4. Comments made by users from ‘Mumbai’
SELECT comment
FROM community_comments
WHERE user_id IN (SELECT user_id FROM users WHERE city = 'Mumbai');

-- 5. Latest comment on each post
SELECT *
FROM community_comments c
WHERE created_at = (
    SELECT MAX(created_at) FROM community_comments WHERE post_id = c.post_id
);

-- 6. Correlated subquery: Find comments with above-average likes in same post
SELECT c.comment_id, c.likes
FROM community_comments c
WHERE c.likes > (
    SELECT AVG(likes)
    FROM community_comments
    WHERE post_id = c.post_id
);

-- 7. Posts without any comments
SELECT title
FROM community_posts
WHERE post_id NOT IN (SELECT post_id FROM community_comments);

-- 8. Comments made by top-liked users
SELECT comment
FROM community_comments
WHERE user_id IN (
    SELECT user_id FROM users WHERE reputation > 1000
);

-- 9. Users who commented on more than 3 posts
SELECT user_id
FROM community_comments
GROUP BY user_id
HAVING COUNT(DISTINCT post_id) > 3;

-- 10. Comments longer than average comment length
SELECT comment_id, comment
FROM community_comments
WHERE LENGTH(comment) > (
    SELECT AVG(LENGTH(comment)) FROM community_comments
);

-- 11. Posts with pending comments
SELECT title
FROM community_posts
WHERE post_id IN (
    SELECT post_id FROM community_comments WHERE status = 'Pending'
);

-- 12. Comments made on user’s own post
SELECT c.comment_id, c.comment
FROM community_comments c
WHERE user_id IN (
    SELECT user_id FROM community_posts p WHERE p.post_id = c.post_id
);

-- 13. Subquery in FROM: Average likes per post
SELECT post_id, AVG(likes) AS avg_likes
FROM (SELECT * FROM community_comments) AS temp
GROUP BY post_id;

-- 14. Comments older than 15 days from latest comment
SELECT comment_id, comment
FROM community_comments
WHERE created_at < (
    SELECT MAX(created_at) - INTERVAL 15 DAY FROM community_comments
);

-- 15. Posts with top 3 most liked comments
SELECT post_id
FROM community_comments
WHERE likes IN (
    SELECT DISTINCT likes FROM community_comments ORDER BY likes DESC LIMIT 3
);

-- 16. Subquery with ANY: Comments with likes greater than any pending comment
SELECT comment_id, comment
FROM community_comments
WHERE likes > ANY (
    SELECT likes FROM community_comments WHERE status = 'Pending'
);

-- 17. Subquery with ALL: Comments with likes greater than all pending comments
SELECT comment_id, comment
FROM community_comments
WHERE likes > ALL (
    SELECT likes FROM community_comments WHERE status = 'Pending'
);

-- 18. Users with no approved comments
SELECT user_id
FROM users
WHERE user_id NOT IN (
    SELECT user_id FROM community_comments WHERE status = 'Approved'
);

-- 19. Total likes by user via subquery
SELECT user_id, (SELECT SUM(likes) FROM community_comments c WHERE c.user_id = u.user_id) AS total_likes
FROM users u;

-- 20. Comment count greater than average per post
SELECT post_id, COUNT(comment_id) AS cnt
FROM community_comments
GROUP BY post_id
HAVING COUNT(comment_id) > (
    SELECT AVG(comment_count)
    FROM (SELECT COUNT(comment_id) AS comment_count FROM community_comments GROUP BY post_id) x
);

-- 🔹 3️⃣ BUILT-IN FUNCTION QUERIES (10)
-- 1. Convert comment to uppercase
SELECT UPPER(comment) AS upper_comment FROM community_comments;

-- 2. Show first 20 characters of each comment
SELECT SUBSTRING(comment, 1, 20) AS preview FROM community_comments;

-- 3. Round average likes to 2 decimals
SELECT ROUND(AVG(likes), 2) AS avg_likes FROM community_comments;

-- 4. Display comment date only
SELECT DATE(created_at) AS comment_date FROM community_comments;

-- 5. Find total likes per status
SELECT status, SUM(likes) AS total_likes FROM community_comments GROUP BY status;

-- 6. Count how many comments each user made
SELECT user_id, COUNT(comment_id) AS total_comments FROM community_comments GROUP BY user_id;

-- 7. Display month name of comment creation
SELECT MONTHNAME(created_at) AS month_posted FROM community_comments;

-- 8. Replace text in comment
SELECT REPLACE(comment, 'Try', 'Practice') AS modified_comment FROM community_comments;

-- 9. Find difference between created and updated timestamps
SELECT comment_id, TIMESTAMPDIFF(MINUTE, created_at, updated_at) AS diff_minutes FROM community_comments;

-- 10. Concat comment id and status
SELECT CONCAT('Comment ', comment_id, ' is ', status) AS summary FROM community_comments;

-- 🔹 4️⃣ USER-DEFINED FUNCTIONS (5)
-- 1. UDF: Get comment length
CREATE FUNCTION getCommentLength(cmt TEXT)
RETURNS INT DETERMINISTIC
RETURN CHAR_LENGTH(cmt);

SELECT comment_id, getCommentLength(comment) AS length FROM community_comments;

-- 2. UDF: Calculate double of likes
CREATE FUNCTION doubleLikes(likeCount INT)
RETURNS INT DETERMINISTIC
RETURN likeCount * 2;

SELECT comment_id, doubleLikes(likes) AS double_like_value FROM community_comments;

-- 3. UDF: Determine comment sentiment (simple logic)
CREATE FUNCTION commentSentiment(likes INT)
RETURNS VARCHAR(10) DETERMINISTIC
RETURN (CASE WHEN likes >= 5 THEN 'Positive' ELSE 'Neutral' END);

SELECT comment_id, commentSentiment(likes) AS sentiment FROM community_comments;

-- 4. UDF: Calculate days since comment
CREATE FUNCTION daysSinceComment(date_time DATETIME)
RETURNS INT DETERMINISTIC
RETURN DATEDIFF(CURDATE(), DATE(date_time));

SELECT comment_id, daysSinceComment(created_at) AS days_old FROM community_comments;

-- 5. UDF: Status Label
CREATE FUNCTION statusLabel(status VARCHAR(20))
RETURNS VARCHAR(50) DETERMINISTIC
RETURN CONCAT('Comment is currently ', status);

SELECT comment_id, statusLabel(status) AS label FROM community_comments;

1–4 — VIEWS (4)
-- V1: Recent messages (last 30 days)
CREATE OR REPLACE VIEW v_recent_messages AS
SELECT message_id, name, email, subject, received_at, status
FROM contact_messages
WHERE received_at >= (NOW() - INTERVAL 30 DAY)
ORDER BY received_at DESC;

-- V2: Open (unresolved) messages
CREATE OR REPLACE VIEW v_open_messages AS
SELECT message_id, name, email, subject, received_at, status
FROM contact_messages
WHERE status IN ('In Progress', 'Open', 'Pending')
ORDER BY received_at ASC;

-- V3: Messages per status summary
CREATE OR REPLACE VIEW v_message_status_summary AS
SELECT status, COUNT(*) AS count_messages, MIN(received_at) AS oldest, MAX(received_at) AS newest
FROM contact_messages
GROUP BY status;

-- V4: Agent workload (messages responded by each agent)
CREATE OR REPLACE VIEW v_agent_workload AS
SELECT responded_by, COUNT(*) AS messages_handled, AVG(TIMESTAMPDIFF(MINUTE, received_at, COALESCE(response_time, received_at))) AS avg_response_mins
FROM (
  SELECT cm.*, NULL AS response_time FROM contact_messages cm
) t
GROUP BY responded_by;



-- 5–7 — CURSORS (3)
-- C5: Cursor to iterate unresolved messages and return basic info
DELIMITER $$
CREATE PROCEDURE proc_iterate_unresolved_messages()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_name VARCHAR(100);
  DECLARE v_subject VARCHAR(150);
  DECLARE cur CURSOR FOR
    SELECT message_id, name, subject FROM contact_messages WHERE status IN ('In Progress','Pending','Open') ORDER BY received_at;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO v_id, v_name, v_subject;
    IF done THEN LEAVE read_loop; END IF;
    SELECT v_id AS message_id, v_name AS sender_name, LEFT(v_subject,120) AS subject_preview;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- C6: Cursor to notify (simulate) for messages without response (status not Resolved or Closed)
DELIMITER $$
CREATE PROCEDURE proc_notify_unanswered()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_email VARCHAR(100);
  DECLARE cur CURSOR FOR
    SELECT message_id, email FROM contact_messages WHERE status NOT IN ('Resolved','Closed') AND (response IS NULL OR response = '');
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  notify_loop: LOOP
    FETCH cur INTO v_id, v_email;
    IF done THEN LEAVE notify_loop; END IF;
    SELECT CONCAT('Notify support to respond to message_id=', v_id, ' (', v_email, ')') AS notify_text;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- C7: Cursor to escalate old In Progress messages (older than N days)
DELIMITER $$
CREATE PROCEDURE proc_escalate_old_inprogress(IN p_days INT)
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE cur CURSOR FOR
    SELECT message_id FROM contact_messages WHERE status='In Progress' AND received_at < (NOW() - INTERVAL p_days DAY);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  esc_loop: LOOP
    FETCH cur INTO v_id;
    IF done THEN LEAVE esc_loop; END IF;
    UPDATE contact_messages SET status='Escalated', responded_by='AutoEscalation', response = CONCAT('Auto-escalated on ', NOW()) WHERE message_id = v_id;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- 8–11 — STORED PROCEDURES (4)
-- S8: Insert a new contact message (returns new id)
DELIMITER $$
CREATE PROCEDURE sp_add_contact_message(
  IN p_name VARCHAR(100),
  IN p_email VARCHAR(100),
  IN p_subject VARCHAR(150),
  IN p_message TEXT,
  IN p_phone VARCHAR(15)
)
BEGIN
  INSERT INTO contact_messages (name, email, subject, message, phone, received_at, status)
  VALUES (p_name, p_email, p_subject, p_message, p_phone, NOW(), 'Pending');
  SELECT LAST_INSERT_ID() AS new_message_id;
END $$
DELIMITER ;

-- S9: Respond to a message (set response, responder, status, and response timestamp)
-- Note: we add a temporary column response_time via UPDATE in procedure if desired; if not present, we store in audit.
DELIMITER $$
CREATE PROCEDURE sp_respond_message(
  IN p_message_id INT,
  IN p_response TEXT,
  IN p_responder VARCHAR(100),
  IN p_new_status VARCHAR(20)
)
BEGIN
  START TRANSACTION;
    UPDATE contact_messages
    SET response = p_response,
        responded_by = p_responder,
        status = p_new_status,
        received_at = received_at -- keep original
    WHERE message_id = p_message_id;
    INSERT INTO contact_message_audit (message_id, action, actor, action_time, note)
    VALUES (p_message_id, 'Respond', p_responder, NOW(), p_new_status);
  COMMIT;
END $$
DELIMITER ;

-- Create audit table used above (if not exists)
CREATE TABLE IF NOT EXISTS contact_message_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  message_id INT,
  action VARCHAR(50),
  actor VARCHAR(100),
  action_time DATETIME,
  note VARCHAR(255)
);

-- S10: Get messages by status with pagination
DELIMITER $$
CREATE PROCEDURE sp_get_messages_by_status(
  IN p_status VARCHAR(20),
  IN p_offset INT,
  IN p_limit INT
)
BEGIN
  SELECT message_id, name, email, subject, received_at, status, responded_by
  FROM contact_messages
  WHERE status = p_status
  ORDER BY received_at DESC
  LIMIT p_offset, p_limit;
END $$
DELIMITER ;

-- S11: Delete messages older than N days (with OUT count)
DELIMITER $$
CREATE PROCEDURE sp_delete_messages_older_than(IN p_days INT, OUT p_deleted_count INT)
BEGIN
  START TRANSACTION;
    DELETE FROM contact_messages WHERE received_at < (NOW() - INTERVAL p_days DAY);
    SET p_deleted_count = ROW_COUNT();
  COMMIT;
END $$
DELIMITER ;

-- 12–15 — WINDOW / ANALYTIC QUERIES (4)
-- W12: Rank responders by number of messages handled
SELECT responded_by, COUNT(*) AS handled_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS responder_rank
FROM contact_messages
WHERE responded_by IS NOT NULL
GROUP BY responded_by
ORDER BY handled_count DESC;

-- W13: Running total of messages received by day
SELECT DATE(received_at) AS dt, COUNT(*) AS messages_on_day,
       SUM(COUNT(*)) OVER (ORDER BY DATE(received_at)) AS running_total_messages
FROM contact_messages
GROUP BY DATE(received_at)
ORDER BY DATE(received_at);

-- W14: LAG to show previous message status for same email
SELECT message_id, email, status, received_at,
       LAG(status) OVER (PARTITION BY email ORDER BY received_at) AS prev_status
FROM contact_messages;

-- W15: Percent contribution of each status in total messages
SELECT status, COUNT(*) AS cnt,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM contact_messages
GROUP BY status;

-- 16–18 — DCL & TCL (3)
-- D16: Grant support role permissions (replace DB name)
GRANT SELECT, UPDATE ON your_database.contact_messages TO 'support_agent'@'localhost';

-- D17: Revoke DELETE from general users
REVOKE DELETE ON your_database.contact_messages FROM 'general_user'@'localhost';

-- T18: Transaction example: safely transfer ownership of unresolved messages from one agent to another
START TRANSACTION;
  UPDATE contact_messages
  SET responded_by = 'Agent_B'
  WHERE responded_by = 'Agent_A' AND status IN ('In Progress','Pending');
  -- Validation: if something wrong, ROLLBACK; else COMMIT
COMMIT;

-- 19–20 — TRIGGERS (2)
-- T19: BEFORE INSERT - ensure received_at and default status
DELIMITER $$
CREATE TRIGGER trg_cm_before_insert
BEFORE INSERT ON contact_messages
FOR EACH ROW
BEGIN
  IF NEW.received_at IS NULL THEN
    SET NEW.received_at = NOW();
  END IF;
  IF NEW.status IS NULL OR NEW.status = '' THEN
    SET NEW.status = 'Pending';
  END IF;
END $$
DELIMITER ;

-- T20: AFTER UPDATE - log status changes to audit and stamp response_time if response set
ALTER TABLE contact_messages
ADD COLUMN IF NOT EXISTS response_time DATETIME NULL;

DELIMITER $$
CREATE TRIGGER trg_cm_after_update
AFTER UPDATE ON contact_messages
FOR EACH ROW
BEGIN
  IF OLD.status <> NEW.status THEN
    INSERT INTO contact_message_audit (message_id, action, actor, action_time, note)
    VALUES (NEW.message_id, 'StatusChange', COALESCE(NEW.responded_by,'System'), NOW(), CONCAT('From ', OLD.status, ' to ', NEW.status));
  END IF;

  IF (OLD.response IS NULL OR OLD.response = '') AND (NEW.response IS NOT NULL AND NEW.response <> '') THEN
    UPDATE contact_messages SET response_time = NOW() WHERE message_id = NEW.message_id;
  END IF;
END $$
DELIMITER ;

--  ========================================================== CREATE  TABLE 21. SUBSCRIBERS =======================================================================

-- 21. SUBSCRIBERS
CREATE TABLE subscribers (
    subscriber_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100),
    name VARCHAR(100),
    subscribed_on DATETIME,
    status VARCHAR(20),
    source VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

-- ======================================================= INSERT INTO subscribers =================================================================================

INSERT INTO subscribers (email, name, subscribed_on, status, source, phone, city, state, country) VALUES
('alice.johnson@email.com', 'Alice Johnson', '2024-01-01 10:00:00', 'Active', 'Website', '+1-555-0201', 'New York', 'NY', 'USA'),
('bob.smith@email.com', 'Bob Smith', '2024-01-02 11:30:00', 'Active', 'Event', '+1-555-0202', 'Los Angeles', 'CA', 'USA'),
('carol.davis@email.com', 'Carol Davis', '2024-01-03 09:15:00', 'Active', 'Newsletter', '+1-555-0203', 'Chicago', 'IL', 'USA'),
('david.wilson@email.com', 'David Wilson', '2024-01-04 14:20:00', 'Unsubscribed', 'App', '+1-555-0204', 'Houston', 'TX', 'USA'),
('eve.brown@email.com', 'Eve Brown', '2024-01-05 16:45:00', 'Active', 'Social Media', '+1-555-0205', 'Phoenix', 'AZ', 'USA'),
('frank.miller@email.com', 'Frank Miller', '2024-01-06 12:10:00', 'Active', 'Website', '+1-555-0206', 'Philadelphia', 'PA', 'USA'),
('grace.lee@email.com', 'Grace Lee', '2024-01-07 08:30:00', 'Pending', 'Event', '+1-555-0207', 'San Antonio', 'TX', 'USA'),
('henry.garcia@email.com', 'Henry Garcia', '2024-01-08 13:00:00', 'Active', 'Newsletter', '+1-555-0208', 'San Diego', 'CA', 'USA'),
('iris.taylor@email.com', 'Iris Taylor', '2024-01-09 10:45:00', 'Active', 'App', '+1-555-0209', 'Dallas', 'TX', 'USA'),
('jack.white@email.com', 'Jack White', '2024-01-10 15:20:00', 'Active', 'Social Media', '+1-555-0210', 'San Jose', 'CA', 'USA'),
('karen.adams@email.com', 'Karen Adams', '2024-01-11 11:15:00', 'Active', 'Website', '+1-555-0211', 'Austin', 'TX', 'USA'),
('leo.martinez@email.com', 'Leo Martinez', '2024-01-12 17:00:00', 'Unsubscribed', 'Event', '+1-555-0212', 'Jacksonville', 'FL', 'USA'),
('mia.rodriguez@email.com', 'Mia Rodriguez', '2024-01-13 09:50:00', 'Active', 'Newsletter', '+1-555-0213', 'Fort Worth', 'TX', 'USA'),
('noah.lopez@email.com', 'Noah Lopez', '2024-01-14 14:30:00', 'Active', 'App', '+1-555-0214', 'Columbus', 'OH', 'USA'),
('olivia.clark@email.com', 'Olivia Clark', '2024-01-15 12:25:00', 'Active', 'Social Media', '+1-555-0215', 'Charlotte', 'NC', 'USA'),
('paul.lewis@email.com', 'Paul Lewis', '2024-01-16 10:40:00', 'Pending', 'Website', '+1-555-0216', 'San Francisco', 'CA', 'USA'),
('quinn.walker@email.com', 'Quinn Walker', '2024-01-17 16:10:00', 'Active', 'Event', '+1-555-0217', 'Indianapolis', 'IN', 'USA'),
('riley.hall@email.com', 'Riley Hall', '2024-01-18 08:55:00', 'Active', 'Newsletter', '+1-555-0218', 'Seattle', 'WA', 'USA'),
('sam.young@email.com', 'Sam Young', '2024-01-19 13:35:00', 'Active', 'App', '+1-555-0219', 'Denver', 'CO', 'USA'),
('tara.king@email.com', 'Tara King', '2024-01-20 11:20:00', 'Active', 'Social Media', '+1-555-0220', 'Washington', 'DC', 'USA');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM subscribers;

TRUNCATE TABLE subscribers;

-- 📘 PHASE-3 ADVANCED SQL QUERIES FOR SUBSCRIBERS
-- ==============================================================
-- 🔹 PART 1: JOIN QUERIES (20)
-- ==============================================================

-- 1. INNER JOIN: Subscribers with corresponding orders
SELECT s.name, s.email, o.order_id, o.order_date
FROM subscribers s
INNER JOIN orders o ON s.subscriber_id = o.customer_id;

-- 2. LEFT JOIN: Subscribers who may not have placed any orders
SELECT s.name, o.order_id
FROM subscribers s
LEFT JOIN orders o ON s.subscriber_id = o.customer_id;

-- 3. RIGHT JOIN: Orders that may not belong to any subscriber
SELECT s.name, o.order_id
FROM subscribers s
RIGHT JOIN orders o ON s.subscriber_id = o.customer_id;

-- 4. FULL JOIN (if supported): Combine all subscribers and orders
SELECT s.name, o.order_id
FROM subscribers s
FULL JOIN orders o ON s.subscriber_id = o.customer_id;

-- 5. SELF JOIN: Compare subscribers from same city
SELECT a.name AS Subscriber1, b.name AS Subscriber2, a.city
FROM subscribers a
JOIN subscribers b ON a.city = b.city AND a.subscriber_id <> b.subscriber_id;

-- 6. CROSS JOIN: Generate all possible pairs of subscribers and sources
SELECT s.name, src.source_name
FROM subscribers s
CROSS JOIN sources src;

-- 7. INNER JOIN: Subscribers and newsletter campaigns
SELECT s.name, n.campaign_name
FROM subscribers s
JOIN newsletter_campaigns n ON s.source = n.campaign_source;

-- 8. LEFT JOIN: Show all subscribers with or without reviews
SELECT s.name, r.review_text
FROM subscribers s
LEFT JOIN reviews r ON s.email = r.user_email;

-- 9. RIGHT JOIN: Subscribers matched with payments
SELECT p.payment_id, s.name, s.email
FROM payments p
RIGHT JOIN subscribers s ON s.subscriber_id = p.user_id;

-- 10. INNER JOIN: Subscribers with their countries info
SELECT s.name, c.country_name, c.region
FROM subscribers s
JOIN countries c ON s.country = c.country_name;

-- 11. INNER JOIN: Subscribers and events
SELECT s.name, e.event_name
FROM subscribers s
INNER JOIN events e ON s.source = e.event_source;

-- 12. LEFT JOIN: Subscribers with missing phone details
SELECT s.name, s.phone, p.support_agent
FROM subscribers s
LEFT JOIN support_tickets p ON s.email = p.user_email;

-- 13. SELF JOIN: Compare join dates
SELECT a.name AS Early, b.name AS Later
FROM subscribers a
JOIN subscribers b ON a.subscribed_on < b.subscribed_on;

-- 14. INNER JOIN: Subscribers with login info
SELECT s.name, l.last_login
FROM subscribers s
JOIN logins l ON s.email = l.user_email;

-- 15. LEFT JOIN: All subscribers with product preferences
SELECT s.name, pr.product_name
FROM subscribers s
LEFT JOIN preferences pr ON s.email = pr.user_email;

-- 16. INNER JOIN: Subscribers who attended webinars
SELECT s.name, w.webinar_title
FROM subscribers s
JOIN webinar_registrations w ON s.email = w.email;

-- 17. LEFT JOIN: Subscribers with promo codes
SELECT s.name, promo.promo_code
FROM subscribers s
LEFT JOIN promotions promo ON s.email = promo.user_email;

-- 18. INNER JOIN: Subscribers with referral info
SELECT s.name, r.referrer_name
FROM subscribers s
JOIN referrals r ON s.email = r.new_user_email;

-- 19. RIGHT JOIN: Subscribers and account types
SELECT s.name, a.account_type
FROM account_types a
RIGHT JOIN subscribers s ON s.source = a.source_name;

-- 20. INNER JOIN: Subscribers with support feedback
SELECT s.name, f.rating
FROM subscribers s
JOIN feedback f ON s.email = f.user_email;

-- ============================================================== 
-- 🔹 PART 2: SUBQUERY QUERIES (20)
-- ==============================================================

-- 1. Subscribers who joined after average subscription date
SELECT name, subscribed_on
FROM subscribers
WHERE subscribed_on > (SELECT AVG(subscribed_on) FROM subscribers);

-- 2. Subscribers from cities with more than 2 active users
SELECT name, city
FROM subscribers
WHERE city IN (
    SELECT city FROM subscribers WHERE status = 'Active' GROUP BY city HAVING COUNT(*) > 2
);

-- 3. Subscribers who joined from the same source as ‘Alice Johnson’
SELECT name
FROM subscribers
WHERE source = (SELECT source FROM subscribers WHERE name = 'Alice Johnson');

-- 4. Subscribers who joined before the earliest 'Social Media' signup
SELECT name, subscribed_on
FROM subscribers
WHERE subscribed_on < (SELECT MIN(subscribed_on) FROM subscribers WHERE source = 'Social Media');

-- 5. Cities having unsubscribed users
SELECT DISTINCT city
FROM subscribers
WHERE city IN (SELECT city FROM subscribers WHERE status = 'Unsubscribed');

-- 6. Subscribers not from any state with 'TX'
SELECT name, state
FROM subscribers
WHERE state NOT IN (SELECT DISTINCT state FROM subscribers WHERE state = 'TX');

-- 7. Subscribers whose status matches majority status
SELECT name, status
FROM subscribers
WHERE status = (SELECT status FROM subscribers GROUP BY status ORDER BY COUNT(*) DESC LIMIT 1);

-- 8. Subscribers joined on same day as ‘Bob Smith’
SELECT name
FROM subscribers
WHERE DATE(subscribed_on) = (SELECT DATE(subscribed_on) FROM subscribers WHERE name = 'Bob Smith');

-- 9. Subscribers with same source as top 3 joiners
SELECT name, source
FROM subscribers
WHERE source IN (SELECT DISTINCT source FROM subscribers LIMIT 3);

-- 10. Subscribers from the same country as 'Eve Brown'
SELECT name, country
FROM subscribers
WHERE country = (SELECT country FROM subscribers WHERE name = 'Eve Brown');

-- 11. Active subscribers with earliest join date
SELECT name, subscribed_on
FROM subscribers
WHERE subscribed_on = (SELECT MIN(subscribed_on) FROM subscribers WHERE status = 'Active');

-- 12. Subscribers who joined after average join date
SELECT name
FROM subscribers
WHERE subscribed_on > (SELECT AVG(subscribed_on) FROM subscribers);

-- 13. Subscribers from cities with multiple sources
SELECT name, city
FROM subscribers
WHERE city IN (SELECT city FROM subscribers GROUP BY city HAVING COUNT(DISTINCT source) > 1);

-- 14. Subscribers whose phone numbers exist in event registrations
SELECT name
FROM subscribers
WHERE phone IN (SELECT phone FROM event_registrations);

-- 15. Subscribers who never unsubscribed
SELECT name
FROM subscribers
WHERE subscriber_id NOT IN (SELECT subscriber_id FROM subscribers WHERE status = 'Unsubscribed');

-- 16. Most recent subscriber
SELECT * FROM subscribers WHERE subscribed_on = (SELECT MAX(subscribed_on) FROM subscribers);

-- 17. Subscribers with duplicate cities
SELECT * FROM subscribers WHERE city IN (SELECT city FROM subscribers GROUP BY city HAVING COUNT(*) > 1);

-- 18. Pending subscribers who joined before any active ones
SELECT name FROM subscribers
WHERE status = 'Pending' AND subscribed_on < (SELECT MIN(subscribed_on) FROM subscribers WHERE status = 'Active');

-- 19. Subscribers from states that start with 'C'
SELECT name, state FROM subscribers WHERE state IN (SELECT state FROM subscribers WHERE state LIKE 'C%');

-- 20. Top 5 most recent active subscribers
SELECT * FROM subscribers WHERE status='Active' ORDER BY subscribed_on DESC LIMIT 5;

-- ==============================================================
-- 🔹 PART 3: BUILT-IN FUNCTION QUERIES (20)
-- ==============================================================

-- 1. Display subscriber names in uppercase
SELECT UPPER(name) AS UpperName FROM subscribers;

-- 2. Display subscriber names in lowercase
SELECT LOWER(name) AS LowerName FROM subscribers;

-- 3. Count number of active subscribers
SELECT COUNT(*) AS ActiveCount FROM subscribers WHERE status='Active';

-- 4. Get year of subscription
SELECT name, YEAR(subscribed_on) AS JoinYear FROM subscribers;

-- 5. Get month name of subscription
SELECT name, MONTHNAME(subscribed_on) AS JoinMonth FROM subscribers;

-- 6. Calculate how many days since subscription
SELECT name, DATEDIFF(NOW(), subscribed_on) AS DaysSinceJoin FROM subscribers;

-- 7. Extract city initials
SELECT name, LEFT(city, 3) AS CityShort FROM subscribers;

-- 8. Combine name and city
SELECT CONCAT(name, ' from ', city) AS Info FROM subscribers;

-- 9. Round a numeric example
SELECT ROUND(45.678, 1) AS RoundedValue;

-- 10. Display subscribers with phone length
SELECT name, LENGTH(phone) AS PhoneLength FROM subscribers;

-- 11. Replace part of email domain
SELECT REPLACE(email, 'email.com', 'company.com') AS UpdatedEmail FROM subscribers;

-- 12. Sort subscribers randomly
SELECT name FROM subscribers ORDER BY RAND() LIMIT 5;

-- 13. Find earliest and latest join date
SELECT MIN(subscribed_on) AS FirstJoin, MAX(subscribed_on) AS LatestJoin FROM subscribers;

-- 14. Count how many per city
SELECT city, COUNT(*) AS CityCount FROM subscribers GROUP BY city;

-- 15. Average subscribers per state
SELECT state, COUNT(*) FROM subscribers GROUP BY state;

-- 16. Check current date
SELECT NOW() AS CurrentDateTime;

-- 17. Calculate length of names
SELECT name, CHAR_LENGTH(name) AS NameLength FROM subscribers;

-- 18. Substring of email usernames
SELECT SUBSTRING(email, 1, LOCATE('@', email)-1) AS EmailUser FROM subscribers;

-- 19. Replace spaces with underscores in names
SELECT REPLACE(name, ' ', '_') AS Username FROM subscribers;

-- 20. Get distinct countries
SELECT DISTINCT country FROM subscribers;

-- ==============================================================
-- 🔹 PART 4: USER-DEFINED FUNCTION QUERIES (20)
-- ==============================================================

-- 1. Create UDF to calculate subscription age in days
DELIMITER //
CREATE FUNCTION SubscriptionAge(join_date DATETIME)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN DATEDIFF(NOW(), join_date);
END //
DELIMITER ;

-- 2. Use UDF
SELECT name, SubscriptionAge(subscribed_on) AS DaysSubscribed FROM subscribers;

-- 3. Create UDF to get full contact info
DELIMITER //
CREATE FUNCTION FullContact(name VARCHAR(100), phone VARCHAR(15))
RETURNS VARCHAR(200)
DETERMINISTIC
RETURN CONCAT(name, ' - ', phone);
//
DELIMITER ;

-- 4. Use FullContact
SELECT FullContact(name, phone) AS ContactDetails FROM subscribers;

-- 5. Create UDF to mark VIP status
DELIMITER //
CREATE FUNCTION IsVIP(status VARCHAR(20))
RETURNS VARCHAR(10)
DETERMINISTIC
RETURN IF(status='Active', 'VIP', 'Regular');
//
DELIMITER ;

-- 6. Use IsVIP
SELECT name, IsVIP(status) AS SubscriberType FROM subscribers;

-- 7. Create UDF for formatted city-state-country
DELIMITER //
CREATE FUNCTION FullAddress(city VARCHAR(50), state VARCHAR(50), country VARCHAR(50))
RETURNS VARCHAR(200)
DETERMINISTIC
RETURN CONCAT(city, ', ', state, ', ', country);
//
DELIMITER ;

-- 8. Use FullAddress
SELECT name, FullAddress(city, state, country) AS Address FROM subscribers;

-- 9. Create UDF for formatted email domain
DELIMITER //
CREATE FUNCTION GetEmailDomain(email VARCHAR(100))
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN SUBSTRING_INDEX(email, '@', -1);
//
DELIMITER ;

-- 10. Use GetEmailDomain
SELECT name, GetEmailDomain(email) AS Domain FROM subscribers;

-- 11. Create UDF to count characters in email
DELIMITER //
CREATE FUNCTION EmailLength(email VARCHAR(100))
RETURNS INT
DETERMINISTIC
RETURN CHAR_LENGTH(email);
//
DELIMITER ;

-- 12. Use EmailLength
SELECT name, EmailLength(email) AS EmailChars FROM subscribers;

-- 13. Create UDF to mark ‘Long Names’
DELIMITER //
CREATE FUNCTION NameType(name VARCHAR(100))
RETURNS VARCHAR(20)
DETERMINISTIC
RETURN IF(CHAR_LENGTH(name) > 10, 'Long', 'Short');
//
DELIMITER ;

-- 14. Use NameType
SELECT name, NameType(name) AS NameCategory FROM subscribers;

-- 15. Create UDF to extract first name
DELIMITER //
CREATE FUNCTION FirstName(fullname VARCHAR(100))
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN SUBSTRING_INDEX(fullname, ' ', 1);
//
DELIMITER ;

-- 16. Use FirstName
SELECT name, FirstName(name) AS First_Name FROM subscribers;

-- 17. Create UDF for yearly subscription estimate
DELIMITER //
CREATE FUNCTION YearlyEstimate(days INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
RETURN ROUND(days / 365, 2);
//
DELIMITER ;

-- 18. Use YearlyEstimate
SELECT name, YearlyEstimate(SubscriptionAge(subscribed_on)) AS YearsSubscribed FROM subscribers;

-- 19. Create UDF to mask phone numbers
DELIMITER //
CREATE FUNCTION MaskPhone(phone VARCHAR(15))
RETURNS VARCHAR(20)
DETERMINISTIC
RETURN CONCAT('******', RIGHT(phone, 4));
// 
DELIMITER ;

-- 20. Use MaskPhone
SELECT name, MaskPhone(phone) AS HiddenPhone FROM subscribers;

-- 🟢 1️⃣ VIEWS (5 Queries)
-- 1. View to show all active subscribers
CREATE VIEW active_subscribers AS
SELECT subscriber_id, name, email, city, state, country
FROM subscribers
WHERE status = 'Active';

-- 2. View to show subscriber count by state
CREATE VIEW subscriber_count_by_state AS
SELECT state, COUNT(*) AS total_subscribers
FROM subscribers
GROUP BY state;

-- 3. View combining email and phone details (contact view)
CREATE VIEW subscriber_contacts AS
SELECT name, CONCAT(email, ' | ', phone) AS contact_info, city, state
FROM subscribers;

-- 4. View for pending or unsubscribed users
CREATE VIEW inactive_subscribers AS
SELECT subscriber_id, name, status, source, subscribed_on
FROM subscribers
WHERE status IN ('Pending', 'Unsubscribed');

-- 5. Complex view with join (example joining with campaigns table)
CREATE VIEW campaign_subscribers AS
SELECT s.name, s.email, c.campaign_name, c.start_date
FROM subscribers s
JOIN campaigns c ON s.source = c.campaign_source;

-- 🔵 2️⃣ CURSORS (3 Queries)
-- 6. Cursor to print all subscriber names
DELIMITER //
CREATE PROCEDURE list_subscribers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT name FROM subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO sub_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT sub_name AS SubscriberName;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- 7. Cursor to count Active subscribers by city
DELIMITER //
CREATE PROCEDURE count_active_by_city()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE city_name VARCHAR(50);
    DECLARE total INT;
    DECLARE cur CURSOR FOR
        SELECT city, COUNT(*) FROM subscribers WHERE status='Active' GROUP BY city;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO city_name, total;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT city_name AS City, total AS ActiveCount;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- 8. Cursor to list emails of unsubscribed users
DELIMITER //
CREATE PROCEDURE list_unsubscribed_emails()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_email VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT email FROM subscribers WHERE status='Unsubscribed';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO user_email;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT user_email AS UnsubscribedEmail;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- 🟣 3️⃣ STORED PROCEDURES (4 Queries)
-- 9. Add a new subscriber
DELIMITER //
CREATE PROCEDURE add_subscriber(
    IN p_name VARCHAR(100), IN p_email VARCHAR(100), IN p_phone VARCHAR(15),
    IN p_city VARCHAR(50), IN p_state VARCHAR(50), IN p_country VARCHAR(50))
BEGIN
    INSERT INTO subscribers (name, email, phone, city, state, country, status, subscribed_on, source)
    VALUES (p_name, p_email, p_phone, p_city, p_state, p_country, 'Active', NOW(), 'Website');
END //
DELIMITER ;

-- 10. Update subscriber status
DELIMITER //
CREATE PROCEDURE update_subscriber_status(IN p_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE subscribers SET status = new_status WHERE subscriber_id = p_id;
END //
DELIMITER ;

-- 11. Get total subscribers from a city
DELIMITER //
CREATE PROCEDURE total_by_city(IN p_city VARCHAR(50))
BEGIN
    SELECT COUNT(*) AS total FROM subscribers WHERE city = p_city;
END //
DELIMITER ;

-- 12. Delete inactive subscribers
DELIMITER //
CREATE PROCEDURE delete_inactive()
BEGIN
    DELETE FROM subscribers WHERE status = 'Unsubscribed';
END //
DELIMITER ;

-- 🟠 4️⃣ WINDOW FUNCTIONS (4 Queries)
-- 13. Rank subscribers by subscription date
SELECT name, city, subscribed_on,
       RANK() OVER(ORDER BY subscribed_on ASC) AS subscription_rank
FROM subscribers;

-- 14. Count of subscribers per state using window function
SELECT name, state,
       COUNT(*) OVER(PARTITION BY state) AS subscribers_in_state
FROM subscribers;

-- 15. Compare current and previous subscriber using LAG
SELECT name, city, subscribed_on,
       LAG(name) OVER(ORDER BY subscribed_on) AS previous_subscriber
FROM subscribers;

-- 16. Use ROW_NUMBER for numbering all subscribers
SELECT ROW_NUMBER() OVER(ORDER BY name) AS row_num, name, email
FROM subscribers;

-- 🟤 5️⃣ DCL & TCL (2 Queries)
-- 17. Grant access to a user
GRANT SELECT, INSERT ON subscribers TO 'data_analyst'@'localhost';

-- 18. Transaction to safely update subscriber status
START TRANSACTION;
UPDATE subscribers SET status = 'Active' WHERE status = 'Pending';
SAVEPOINT before_delete;
DELETE FROM subscribers WHERE status = 'Unsubscribed';
ROLLBACK TO before_delete;
COMMIT;

-- 🔴 6️⃣ TRIGGERS (2 Queries)
-- 19. Audit table for triggers
CREATE TABLE subscriber_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    subscriber_id INT,
    action VARCHAR(50),
    action_time DATETIME
);

-- 20. Trigger to log subscriber insert
DELIMITER //
CREATE TRIGGER after_subscriber_insert
AFTER INSERT ON subscribers
FOR EACH ROW
BEGIN
    INSERT INTO subscriber_audit (subscriber_id, action, action_time)
    VALUES (NEW.subscriber_id, 'INSERT', NOW());
END //
DELIMITER ;

--  ========================================================== CREATE TABLE 22. PROMOTIONS =======================================================================

-- 22. PROMOTIONS
CREATE TABLE promotions (
    promo_id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50),
    description TEXT,
    discount_type VARCHAR(30),
    discount_value DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    min_order_value DECIMAL(10,2),
    usage_limit INT,
    status VARCHAR(30)
);

-- ======================================================= INSERT INTO promotions=================================================================================

INSERT INTO promotions (code, description, discount_type, discount_value, start_date, end_date, min_order_value, usage_limit, status) VALUES
('WELCOME10', '10% off your first purchase of wellness products', 'Percentage', 10.00, '2024-01-01', '2024-06-30', 0.00, 1000, 'Active'),
('EVENT5OFF', '$5 discount on any event ticket', 'Fixed', 5.00, '2024-01-15', '2024-03-31', 20.00, 500, 'Active'),
('STRESSRELIEF20', '20% off stress relief items like journals and teas', 'Percentage', 20.00, '2024-02-01', '2024-02-28', 30.00, 300, 'Active'),
('SUBSCRIBE15', '15% off first month of premium subscription', 'Percentage', 15.00, '2024-01-10', '2024-12-31', 0.00, NULL, 'Active'),
('REFERFRIEND', '10% off for both referrer and friend on next order', 'Percentage', 10.00, '2024-01-01', '2024-12-31', 25.00, NULL, 'Active'),
('YOGA10', '$10 off yoga mats and accessories', 'Fixed', 10.00, '2024-03-01', '2024-03-31', 40.00, 200, 'Active'),
('MENTALHEALTHMONTH', 'Buy one get one 50% off therapy books', 'Percentage', 50.00, '2024-05-01', '2024-05-31', 0.00, 400, 'Scheduled'),
('SPRINGCLEANSE', '15% off detox and cleanse products', 'Percentage', 15.00, '2024-03-15', '2024-04-15', 50.00, 250, 'Active'),
('FLASH20', '20% off sitewide for 24 hours only', 'Percentage', 20.00, '2024-02-14', '2024-02-14', 0.00, 100, 'Expired'),
('LOYALTY50', '$50 off orders over $200 for loyal customers', 'Fixed', 50.00, '2024-01-20', '2024-06-20', 200.00, 50, 'Active'),
('ANXIETYRELIEF', '25% off anxiety management tools and apps', 'Percentage', 25.00, '2024-02-05', '2024-03-05', 15.00, 150, 'Expired'),
('FAMILY10', '10% off family therapy session bundles', 'Percentage', 10.00, '2024-01-25', '2024-04-25', 100.00, 100, 'Active'),
('SLEEPDEAL', '$15 off sleep aids and essential oils', 'Fixed', 15.00, '2024-03-10', '2024-04-10', 30.00, 300, 'Active'),
('BIRTHDAY20', '20% off on your birthday month purchases', 'Percentage', 20.00, '2024-01-01', '2024-12-31', 0.00, NULL, 'Active'),
('CAMPAIGNBOOST', 'Donate $50+ and get 10% off products', 'Percentage', 10.00, '2024-02-01', '2024-02-29', 50.00, 200, 'Active'),
('MEDI10OFF', '10% off meditation courses and apps', 'Percentage', 10.00, '2024-01-05', '2024-03-05', 20.00, 400, 'Active'),
('GRIEF SUPPORT', '$20 off grief counseling resources', 'Fixed', 20.00, '2024-03-01', '2024-05-01', 0.00, 100, 'Active'),
('WELLNESSWEEK', '30% off all wellness kits during awareness week', 'Percentage', 30.00, '2024-04-01', '2024-04-07', 75.00, 500, 'Scheduled'),
('RETURNCUSTOMER', '15% off for returning customers', 'Percentage', 15.00, '2024-02-10', '2024-05-10', 40.00, 600, 'Active'),
('BLACKFRIDAY', '40% off sitewide – limited time', 'Percentage', 40.00, '2024-11-01', '2024-11-30', 0.00, 1000, 'Scheduled');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM  promotions;


-- 🧩 1️⃣ JOINS (5 Queries)
-- 1. INNER JOIN: Show all promotions used in donations campaigns
SELECT p.code, p.description, c.title AS campaign_title
FROM promotions p
INNER JOIN campaigns c ON c.campaign_id = p.promo_id;

-- 2. LEFT JOIN: Show all promotions and their associated donations if any
SELECT p.code, d.amount, d.status
FROM promotions p
LEFT JOIN donations d ON d.campaign_id = p.promo_id;

-- 3. RIGHT JOIN: Get all donations even if no promotion is linked
SELECT p.code, d.transaction_id, d.amount
FROM promotions p
RIGHT JOIN donations d ON d.campaign_id = p.promo_id;

-- 4. SELF JOIN: Compare promotions having same discount_value but different promo codes
SELECT a.code AS PromoA, b.code AS PromoB, a.discount_value
FROM promotions a
JOIN promotions b 
ON a.discount_value = b.discount_value AND a.promo_id <> b.promo_id;

-- 5. CROSS JOIN: Create combinations of active promotions and active campaigns
SELECT p.code AS PromotionCode, c.title AS CampaignTitle
FROM promotions p
CROSS JOIN campaigns c
WHERE p.status = 'Active' AND c.status = 'Active';

-- 🔍 2️⃣ SUBQUERIES (5 Queries)
-- 6. Find promotions with discount greater than average discount
SELECT code, discount_value
FROM promotions
WHERE discount_value > (SELECT AVG(discount_value) FROM promotions);

-- 7. Find promotions that are active longer than 30 days
SELECT code, DATEDIFF(end_date, start_date) AS Duration
FROM promotions
WHERE DATEDIFF(end_date, start_date) > 30;

-- 8. Find all active promotions that have never been used in any donation campaign
SELECT code
FROM promotions
WHERE promo_id NOT IN (SELECT campaign_id FROM donations);

-- 9. Get promotions having max discount_value among active ones
SELECT code, discount_value
FROM promotions
WHERE discount_value = (SELECT MAX(discount_value) FROM promotions WHERE status = 'Active');

-- 10. Correlated subquery: Find promotions with discount higher than average of their type
SELECT p1.code, p1.discount_value, p1.discount_type
FROM promotions p1
WHERE p1.discount_value > (
    SELECT AVG(p2.discount_value)
    FROM promotions p2
    WHERE p2.discount_type = p1.discount_type
);

-- ⚙️ 3️⃣ BUILT-IN FUNCTIONS (5 Queries)
-- 11. Display promotion codes in uppercase and their length
SELECT UPPER(code) AS PromoCode_Upper, LENGTH(code) AS CodeLength FROM promotions;

-- 12. Calculate total number of active promotions
SELECT COUNT(*) AS ActivePromotions FROM promotions WHERE status = 'Active';

-- 13. Calculate average discount percentage for active promotions
SELECT ROUND(AVG(discount_value), 2) AS AvgDiscount FROM promotions WHERE discount_type = 'Percentage';

-- 14. Show how many days each promotion is valid for
SELECT code, DATEDIFF(end_date, start_date) AS ValidityDays FROM promotions;

-- 15. Show promotions starting in the current year
SELECT code, YEAR(start_date) AS StartYear
FROM promotions
WHERE YEAR(start_date) = YEAR(CURDATE());

-- 🧠 4️⃣ USER-DEFINED FUNCTIONS (UDFs) (5 Queries)
-- 16. UDF to calculate total discount on an order
DELIMITER //
CREATE FUNCTION CalculateDiscount(order_value DECIMAL(10,2), discount_type VARCHAR(30), discount_value DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_discount DECIMAL(10,2);
    IF discount_type = 'Percentage' THEN
        SET total_discount = order_value * (discount_value / 100);
    ELSE
        SET total_discount = discount_value;
    END IF;
    RETURN total_discount;
END //
DELIMITER ;

-- Use it
SELECT code, CalculateDiscount(200.00, discount_type, discount_value) AS DiscountAmount FROM promotions;

-- 17. UDF to check if promotion is expired
DELIMITER //
CREATE FUNCTION IsPromoExpired(promo_end DATE)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    RETURN (CASE WHEN promo_end < CURDATE() THEN 'Yes' ELSE 'No' END);
END //
DELIMITER ;

SELECT code, IsPromoExpired(end_date) AS Expired FROM promotions;

-- 18. UDF to calculate remaining days for a promotion
DELIMITER //
CREATE FUNCTION RemainingDays(end_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DATEDIFF(end_date, CURDATE());
END //
DELIMITER ;

SELECT code, RemainingDays(end_date) AS DaysLeft FROM promotions;

-- 19. UDF to return full promotion details as one string
DELIMITER //
CREATE FUNCTION PromoSummary(code VARCHAR(50), discount DECIMAL(10,2), type VARCHAR(30))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    RETURN CONCAT('Code: ', code, ', Discount: ', discount, ' (', type, ')');
END //
DELIMITER ;

SELECT PromoSummary(code, discount_value, discount_type) AS PromoDetails FROM promotions;

-- 20. UDF to check high-value promotion
DELIMITER //
CREATE FUNCTION IsHighValuePromo(discount DECIMAL(10,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    RETURN (CASE WHEN discount >= 20 THEN 'High' ELSE 'Normal' END);
END //
DELIMITER ;

SELECT code, discount_value, IsHighValuePromo(discount_value) AS PromoCategory FROM promotions;

🟢 1️⃣ VIEWS (5 Queries)
-- 1. View to list all active promotions
CREATE VIEW active_promotions AS
SELECT promo_id, code, description, discount_type, discount_value
FROM promotions
WHERE status = 'Active';

-- 2. View to find upcoming (scheduled) promotions
CREATE VIEW upcoming_promotions AS
SELECT code, start_date, end_date, status
FROM promotions
WHERE status = 'Scheduled';

-- 3. View to summarize discount averages by type
CREATE VIEW avg_discount_by_type AS
SELECT discount_type, ROUND(AVG(discount_value),2) AS avg_discount
FROM promotions
GROUP BY discount_type;

-- 4. View showing expired promotions with discount above 15%
CREATE VIEW expired_high_discounts AS
SELECT code, discount_value, end_date
FROM promotions
WHERE status = 'Expired' AND discount_value > 15;

-- 5. View joining promotions with subscribers (showing cross-relation)
CREATE VIEW promotion_source_summary AS
SELECT p.code, p.discount_type, s.source, COUNT(s.subscriber_id) AS total_users
FROM promotions p
JOIN subscribers s ON p.status = 'Active' AND s.status = 'Active'
GROUP BY p.code, p.discount_type, s.source;

🔵 2️⃣ CURSORS (3 Queries)
-- 6. Cursor to display all promotion codes
DELIMITER //
CREATE PROCEDURE list_promotions()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE promo_code VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT code FROM promotions;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO promo_code;
        IF done THEN LEAVE read_loop; END IF;
        SELECT promo_code AS PromotionCode;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- 7. Cursor to show expired promotions
DELIMITER //
CREATE PROCEDURE show_expired_promos()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pcode VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT code FROM promotions WHERE status='Expired';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO pcode;
        IF done THEN LEAVE read_loop; END IF;
        SELECT pcode AS ExpiredPromo;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- 8. Cursor to list promotions with limited usage
DELIMITER //
CREATE PROCEDURE limited_promos()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE promo VARCHAR(50);
    DECLARE usageLimit INT;
    DECLARE cur CURSOR FOR SELECT code, usage_limit FROM promotions WHERE usage_limit IS NOT NULL;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO promo, usageLimit;
        IF done THEN LEAVE read_loop; END IF;
        SELECT promo AS PromoCode, usageLimit AS UsageLimit;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

🟣 3️⃣ STORED PROCEDURES (4 Queries)
-- 9. Procedure to add a new promotion
DELIMITER //
CREATE PROCEDURE add_promotion(
    IN p_code VARCHAR(50), IN p_desc TEXT, IN p_type VARCHAR(30),
    IN p_value DECIMAL(10,2), IN p_start DATE, IN p_end DATE,
    IN p_min DECIMAL(10,2), IN p_limit INT, IN p_status VARCHAR(30))
BEGIN
    INSERT INTO promotions (code, description, discount_type, discount_value,
    start_date, end_date, min_order_value, usage_limit, status)
    VALUES (p_code, p_desc, p_type, p_value, p_start, p_end, p_min, p_limit, p_status);
END //
DELIMITER ;

-- 10. Procedure to update promotion status
DELIMITER //
CREATE PROCEDURE update_promo_status(IN p_id INT, IN p_status VARCHAR(30))
BEGIN
    UPDATE promotions SET status = p_status WHERE promo_id = p_id;
END //
DELIMITER ;

-- 11. Procedure to delete expired promotions
DELIMITER //
CREATE PROCEDURE delete_expired_promos()
BEGIN
    DELETE FROM promotions WHERE end_date < CURDATE();
END //
DELIMITER ;

-- 12. Procedure to get promotions above given discount percentage
DELIMITER //
CREATE PROCEDURE high_discount_promos(IN min_discount DECIMAL(10,2))
BEGIN
    SELECT code, discount_value FROM promotions
    WHERE discount_value >= min_discount;
END //
DELIMITER ;

🟠 4️⃣ WINDOW FUNCTIONS (4 Queries)
-- 13. Rank promotions by discount value (highest first)
SELECT code, discount_value,
       RANK() OVER(ORDER BY discount_value DESC) AS discount_rank
FROM promotions;

-- 14. Calculate number of promotions by type using COUNT OVER
SELECT code, discount_type,
       COUNT(*) OVER(PARTITION BY discount_type) AS total_promos
FROM promotions;

-- 15. Compare current promo with previous one using LAG
SELECT code, discount_value,
       LAG(code) OVER(ORDER BY start_date) AS previous_promo
FROM promotions;

-- 16. Use ROW_NUMBER for ordered promotion list
SELECT ROW_NUMBER() OVER(ORDER BY start_date) AS row_no, code, start_date
FROM promotions;

🟤 5️⃣ DCL & TCL (2 Queries)
-- 17. Grant privilege to marketing team user
GRANT SELECT, UPDATE ON promotions TO 'marketing_team'@'localhost';

-- 18. Transaction for safe promo updates
START TRANSACTION;
UPDATE promotions SET status = 'Expired' WHERE end_date < CURDATE();
SAVEPOINT before_status_change;
UPDATE promotions SET discount_value = discount_value + 5 WHERE status = 'Active';
ROLLBACK TO before_status_change;
COMMIT;

-- 🔴 6️⃣ TRIGGERS (2 Queries)
-- 19. Create audit table for promotions
CREATE TABLE promotion_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    promo_id INT,
    action VARCHAR(50),
    action_time DATETIME
);

-- 20. Trigger to log insert actions
DELIMITER //
CREATE TRIGGER after_promotion_insert
AFTER INSERT ON promotions
FOR EACH ROW
BEGIN
    INSERT INTO promotion_audit (promo_id, action, action_time)
    VALUES (NEW.promo_id, 'INSERT', NOW());
END //
DELIMITER ;
--  ========================================================== CREATE  TABLE 23. ADMIN_USERS =======================================================================

-- 23. ADMIN_USERS
CREATE TABLE admin_users (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(255),
    role VARCHAR(50),
    phone VARCHAR(15),
    last_login DATETIME,
    status VARCHAR(20),
    created_at DATETIME,
    updated_at DATETIME
);

-- ======================================================= INSERT INTO admin_users =================================================================================

INSERT INTO admin_users (name, email, password, role, phone, last_login, status, created_at, updated_at) VALUES
('Admin Sarah Johnson', 'sarah.j@wellnessapp.com', '$2y$10$hashedpassword1', 'Super Admin', '+1-555-0301', '2024-03-20 09:00:00', 'Active', '2023-01-01 10:00:00', '2024-03-20 09:00:00'),
('Mike Thompson', 'mike.t@wellnessapp.com', '$2y$10$hashedpassword2', 'Moderator', '+1-555-0302', '2024-03-19 14:30:00', 'Active', '2023-01-15 11:30:00', '2024-03-19 14:30:00'),
('Lisa Chen', 'lisa.c@wellnessapp.com', '$2y$10$hashedpassword3', 'Support Specialist', '+1-555-0303', '2024-03-18 16:45:00', 'Active', '2023-02-01 09:15:00', '2024-03-18 16:45:00'),
('David Ramirez', 'david.r@wellnessapp.com', '$2y$10$hashedpassword4', 'Content Manager', '+1-555-0304', '2024-03-17 12:10:00', 'Active', '2023-02-10 14:20:00', '2024-03-17 12:10:00'),
('Anna Patel', 'anna.p@wellnessapp.com', '$2y$10$hashedpassword5', 'Super Admin', '+1-555-0305', '2024-03-16 08:30:00', 'Active', '2023-02-20 16:45:00', '2024-03-16 08:30:00'),
('Tom Wilson', 'tom.w@wellnessapp.com', '$2y$10$hashedpassword6', 'Moderator', '+1-555-0306', '2024-03-15 13:00:00', 'Inactive', '2023-03-01 10:45:00', '2024-01-10 13:00:00'),
('Emily Davis', 'emily.d@wellnessapp.com', '$2y$10$hashedpassword7', 'Support Specialist', '+1-555-0307', '2024-03-14 15:20:00', 'Active', '2023-03-05 11:15:00', '2024-03-14 15:20:00'),
('James Lee', 'james.l@wellnessapp.com', '$2y$10$hashedpassword8', 'Content Manager', '+1-555-0308', '2024-03-13 17:00:00', 'Active', '2023-03-15 09:50:00', '2024-03-13 17:00:00'),
('Rachel Green', 'rachel.g@wellnessapp.com', '$2y$10$hashedpassword9', 'Moderator', '+1-555-0309', '2024-03-12 14:30:00', 'Active', '2023-04-01 12:25:00', '2024-03-12 14:30:00'),
('Kevin Kim', 'kevin.k@wellnessapp.com', '$2y$10$hashedpassword10', 'Support Specialist', '+1-555-0310', '2024-03-11 10:40:00', 'Suspended', '2023-04-10 16:10:00', '2024-02-01 10:40:00'),
('Sophia Rodriguez', 'sophia.r@wellnessapp.com', '$2y$10$hashedpassword11', 'Super Admin', '+1-555-0311', '2024-03-10 08:55:00', 'Active', '2023-04-20 13:35:00', '2024-03-10 08:55:00'),
('Brian Hall', 'brian.h@wellnessapp.com', '$2y$10$hashedpassword12', 'Content Manager', '+1-555-0312', '2024-03-09 11:20:00', 'Active', '2023-05-01 10:00:00', '2024-03-09 11:20:00'),
('Nina Lopez', 'nina.l@wellnessapp.com', '$2y$10$hashedpassword13', 'Moderator', '+1-555-0313', '2024-03-08 15:00:00', 'Active', '2023-05-15 12:30:00', '2024-03-08 15:00:00'),
('Alex Turner', 'alex.t@wellnessapp.com', '$2y$10$hashedpassword14', 'Support Specialist', '+1-555-0314', '2024-03-07 09:45:00', 'Active', '2023-06-01 14:00:00', '2024-03-07 09:45:00'),
('Olivia Martinez', 'olivia.m@wellnessapp.com', '$2y$10$hashedpassword15', 'Content Manager', '+1-555-0315', '2024-03-06 17:15:00', 'Active', '2023-06-10 16:20:00', '2024-03-06 17:15:00'),
('Chris Evans', 'chris.e@wellnessapp.com', '$2y$10$hashedpassword16', 'Super Admin', '+1-555-0316', '2024-03-05 11:00:00', 'Active', '2023-07-01 18:00:00', '2024-03-05 11:00:00'),
('Maria Garcia', 'maria.g@wellnessapp.com', '$2y$10$hashedpassword17', 'Moderator', '+1-555-0317', '2024-03-04 13:30:00', 'Inactive', '2023-07-15 09:00:00', '2024-01-15 13:30:00'),
('Daniel Wright', 'daniel.w@wellnessapp.com', '$2y$10$hashedpassword18', 'Support Specialist', '+1-555-0318', '2024-03-03 10:15:00', 'Active', '2023-08-01 11:45:00', '2024-03-03 10:15:00'),
('Emma Baker', 'emma.b@wellnessapp.com', '$2y$10$hashedpassword19', 'Content Manager', '+1-555-0319', '2024-03-02 14:00:00', 'Active', '2023-08-20 13:00:00', '2024-03-02 14:00:00'),
('Ryan Scott', 'ryan.s@wellnessapp.com', '$2y$10$hashedpassword20', 'Moderator', '+1-555-0320', '2024-03-01 16:30:00', 'Active', '2023-09-01 15:30:00', '2024-03-01 16:30:00');


-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM admin_users;

🧩 1️⃣ JOINS (5 Queries)
-- 1️⃣ INNER JOIN: Match admin users with audit_logs table (for example)
SELECT a.name, a.role, l.activity, l.timestamp
FROM admin_users a
INNER JOIN audit_logs l ON a.admin_id = l.admin_id;

-- 2️⃣ LEFT JOIN: Show all admins even if they have no activities logged
SELECT a.name, a.role, l.activity
FROM admin_users a
LEFT JOIN audit_logs l ON a.admin_id = l.admin_id;

-- 3️⃣ RIGHT JOIN: Show all login logs even if admin details are missing
SELECT a.name, l.login_time
FROM admin_users a
RIGHT JOIN login_history l ON a.admin_id = l.admin_id;

-- 4️⃣ SELF JOIN: Compare admins having the same role
SELECT a1.name AS Admin1, a2.name AS Admin2, a1.role
FROM admin_users a1
JOIN admin_users a2 ON a1.role = a2.role AND a1.admin_id <> a2.admin_id;

-- 5️⃣ CROSS JOIN: Generate all possible pairs of Admins and Roles
SELECT a.name, r.role_name
FROM admin_users a
CROSS JOIN roles r;

🔍 2️⃣ SUBQUERIES (5 Queries)
-- 6️⃣ Find admins who logged in after the average login date
SELECT name, last_login
FROM admin_users
WHERE last_login > (SELECT AVG(last_login) FROM admin_users);

-- 7️⃣ Get admins with the same role as ‘Moderator’
SELECT name, role
FROM admin_users
WHERE role = (SELECT role FROM admin_users WHERE name = 'Mike Thompson');

-- 8️⃣ List admins who have logged in more than once (assuming login_history)
SELECT name
FROM admin_users
WHERE admin_id IN (
  SELECT admin_id FROM login_history GROUP BY admin_id HAVING COUNT(*) > 1
);

-- 9️⃣ Find admin with most recent login
SELECT name, last_login
FROM admin_users
WHERE last_login = (SELECT MAX(last_login) FROM admin_users);

-- 🔟 Correlated subquery: Find admins whose last login is later than average of their role
SELECT a1.name, a1.role, a1.last_login
FROM admin_users a1
WHERE a1.last_login > (
  SELECT AVG(a2.last_login)
  FROM admin_users a2
  WHERE a2.role = a1.role
);

⚙️ 3️⃣ BUILT-IN FUNCTIONS (5 Queries)
-- 11️⃣ Display admin names in uppercase and extract domain from email
SELECT UPPER(name) AS UpperName, SUBSTRING_INDEX(email, '@', -1) AS EmailDomain FROM admin_users;

-- 12️⃣ Calculate how many admins are currently active
SELECT COUNT(*) AS ActiveAdmins FROM admin_users WHERE status = 'Active';

-- 13️⃣ Find total number of Super Admins
SELECT COUNT(*) AS TotalSuperAdmins FROM admin_users WHERE role = 'Super Admin';

-- 14️⃣ Calculate days since last login for each admin
SELECT name, DATEDIFF(CURDATE(), DATE(last_login)) AS DaysSinceLastLogin FROM admin_users;

-- 15️⃣ Format created_at date nicely
SELECT name, DATE_FORMAT(created_at, '%M %d, %Y') AS CreatedOn FROM admin_users;

🧠 4️⃣ USER-DEFINED FUNCTIONS (5 Queries)
-- 16️⃣ UDF: Check if admin is active
DELIMITER //
CREATE FUNCTION IsAdminActive(adminStatus VARCHAR(20))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
  RETURN (CASE WHEN adminStatus = 'Active' THEN 'Yes' ELSE 'No' END);
END //
DELIMITER ;

SELECT name, IsAdminActive(status) AS ActiveFlag FROM admin_users;

-- 17️⃣ UDF: Calculate total months since account creation
DELIMITER //
CREATE FUNCTION MonthsSinceCreated(created DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(MONTH, created, CURDATE());
END //
DELIMITER ;

SELECT name, MonthsSinceCreated(created_at) AS AccountAgeMonths FROM admin_users;

-- 18️⃣ UDF: Get full name with role
DELIMITER //
CREATE FUNCTION AdminSummary(adminName VARCHAR(100), role VARCHAR(50))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN CONCAT(adminName, ' - ', role);
END //
DELIMITER ;

SELECT AdminSummary(name, role) AS AdminInfo FROM admin_users;

-- 19️⃣ UDF: Calculate hours since last login
DELIMITER //
CREATE FUNCTION HoursSinceLastLogin(lastLogin DATETIME)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(HOUR, lastLogin, NOW());
END //
DELIMITER ;

SELECT name, HoursSinceLastLogin(last_login) AS HoursIdle FROM admin_users;

-- 20️⃣ UDF: Categorize admins by role type
DELIMITER //
CREATE FUNCTION RoleCategory(role VARCHAR(50))
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
  RETURN (CASE 
           WHEN role LIKE '%Super%' THEN 'Management'
           WHEN role LIKE '%Moderator%' THEN 'Operations'
           ELSE 'Support'
          END);
END //
DELIMITER ;

SELECT name, role, RoleCategory(role) AS RoleGroup FROM admin_users;

1–5. VIEWS (5)
-- V1: Active admin users
CREATE OR REPLACE VIEW v_active_admins AS
SELECT admin_id, name, email, role, phone, last_login, status
FROM admin_users
WHERE status = 'Active';

-- V2: Admins by role with counts
CREATE OR REPLACE VIEW v_admins_by_role AS
SELECT role, COUNT(*) AS total_admins
FROM admin_users
GROUP BY role;

-- V3: Recently active admins (last 30 days)
CREATE OR REPLACE VIEW v_recently_active_admins AS
SELECT admin_id, name, role, last_login
FROM admin_users
WHERE last_login >= (NOW() - INTERVAL 30 DAY)
ORDER BY last_login DESC;

-- V4: Suspended or inactive admins for review
CREATE OR REPLACE VIEW v_inactive_or_suspended AS
SELECT admin_id, name, email, role, status, updated_at
FROM admin_users
WHERE status IN ('Inactive','Suspended')
ORDER BY updated_at DESC;

-- V5: Admin contact directory (name, role, email, phone)
CREATE OR REPLACE VIEW v_admin_contact_directory AS
SELECT admin_id, name, role, CONCAT(email, ' | ', phone) AS contact
FROM admin_users
ORDER BY role, name;

6–8. CURSORS (3)
-- C6: Iterate all admins and print basic info (demo cursor)
DELIMITER $$
CREATE PROCEDURE proc_list_all_admins()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_name VARCHAR(100);
  DECLARE v_role VARCHAR(50);
  DECLARE cur CURSOR FOR SELECT admin_id, name, role FROM admin_users;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO v_id, v_name, v_role;
    IF done THEN LEAVE read_loop; END IF;
    SELECT v_id AS admin_id, v_name AS name, v_role AS role;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- C7: Cursor to find admins who haven't logged in for > N days
DELIMITER $$
CREATE PROCEDURE proc_inactive_over_days(IN p_days INT)
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_id INT;
  DECLARE v_name VARCHAR(100);
  DECLARE cur CURSOR FOR
    SELECT admin_id, name FROM admin_users WHERE last_login < (NOW() - INTERVAL p_days DAY) OR last_login IS NULL;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  loop_inact: LOOP
    FETCH cur INTO v_id, v_name;
    IF done THEN LEAVE loop_inact; END IF;
    SELECT CONCAT('Admin ', v_name, ' (ID=', v_id, ') inactive > ', p_days, ' days') AS notice;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

-- C8: Cursor to notify suspended admins (simulation)
DELIMITER $$
CREATE PROCEDURE proc_notify_suspended_admins()
BEGIN
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE v_email VARCHAR(100);
  DECLARE cur CURSOR FOR SELECT email FROM admin_users WHERE status='Suspended';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  notify_loop: LOOP
    FETCH cur INTO v_email;
    IF done THEN LEAVE notify_loop; END IF;
    SELECT CONCAT('Send suspension notice to ', v_email) AS notify;
  END LOOP;
  CLOSE cur;
END $$
DELIMITER ;

9–12. STORED PROCEDURES (4)
-- S9: Create new admin (stores hashed password externally)
DELIMITER $$
CREATE PROCEDURE sp_create_admin(
  IN p_name VARCHAR(100), IN p_email VARCHAR(100), IN p_password VARCHAR(255),
  IN p_role VARCHAR(50), IN p_phone VARCHAR(15)
)
BEGIN
  INSERT INTO admin_users (name, email, password, role, phone, last_login, status, created_at, updated_at)
  VALUES (p_name, p_email, p_password, p_role, p_phone, NULL, 'Active', NOW(), NOW());
  SELECT LAST_INSERT_ID() AS new_admin_id;
END $$
DELIMITER ;

-- S10: Update admin status and log change
CREATE TABLE IF NOT EXISTS admin_status_audit (
  audit_id INT AUTO_INCREMENT PRIMARY KEY,
  admin_id INT,
  old_status VARCHAR(50),
  new_status VARCHAR(50),
  changed_by VARCHAR(100),
  changed_at DATETIME
);

DELIMITER $$
CREATE PROCEDURE sp_update_admin_status(
  IN p_admin_id INT, IN p_new_status VARCHAR(20), IN p_changed_by VARCHAR(100)
)
BEGIN
  DECLARE v_old VARCHAR(20);
  SELECT status INTO v_old FROM admin_users WHERE admin_id = p_admin_id;
  UPDATE admin_users SET status = p_new_status, updated_at = NOW() WHERE admin_id = p_admin_id;
  INSERT INTO admin_status_audit (admin_id, old_status, new_status, changed_by, changed_at)
  VALUES (p_admin_id, v_old, p_new_status, p_changed_by, NOW());
END $$
DELIMITER ;

-- S11: Reset admin password (store hashed password)
DELIMITER $$
CREATE PROCEDURE sp_reset_admin_password(
  IN p_admin_id INT, IN p_hashed_password VARCHAR(255), IN p_changed_by VARCHAR(100)
)
BEGIN
  UPDATE admin_users SET password = p_hashed_password, updated_at = NOW() WHERE admin_id = p_admin_id;
  INSERT INTO admin_status_audit (admin_id, old_status, new_status, changed_by, changed_at)
    VALUES (p_admin_id, 'PASSWORD_RESET', 'PASSWORD_RESET', p_changed_by, NOW());
END $$
DELIMITER ;

-- S12: Get admins by role with pagination
DELIMITER $$
CREATE PROCEDURE sp_get_admins_by_role(
  IN p_role VARCHAR(50), IN p_offset INT, IN p_limit INT
)
BEGIN
  SELECT admin_id, name, email, phone, last_login, status
  FROM admin_users
  WHERE role = p_role
  ORDER BY name
  LIMIT p_offset, p_limit;
END $$
DELIMITER ;

13–16. WINDOW / ANALYTIC QUERIES (4)
-- W13: Rank admins by last_login (most recent = rank 1)
SELECT admin_id, name, last_login,
       RANK() OVER (ORDER BY COALESCE(last_login, '1970-01-01') DESC) AS login_rank
FROM admin_users;

-- W14: Count admins per role using window function
SELECT admin_id, name, role,
       COUNT(*) OVER (PARTITION BY role) AS total_in_role
FROM admin_users;

-- W15: Show previous login time per admin using LAG
SELECT admin_id, name, last_login,
       LAG(last_login) OVER (ORDER BY last_login) AS prev_login
FROM admin_users;

-- W16: ROW_NUMBER for paging admins ordered by created_at
SELECT ROW_NUMBER() OVER (ORDER BY created_at DESC) AS row_num, admin_id, name, email
FROM admin_users;

17–18. DCL & TCL (2)
-- D17: Grant admin management privileges to an admin_manager user (replace DB name)
GRANT SELECT, INSERT, UPDATE, DELETE ON your_database.admin_users TO 'admin_manager'@'localhost';

-- T18: Transaction example — deactivate multiple admins safely
START TRANSACTION;
  UPDATE admin_users SET status = 'Inactive', updated_at = NOW() WHERE admin_id IN (6,17);
  -- validation or additional steps could be added here; use ROLLBACK if validation fails
COMMIT;

19–20. TRIGGERS (2)
-- T19: BEFORE INSERT - set created_at/updated_at and default status
DELIMITER $$
CREATE TRIGGER trg_admin_before_insert
BEFORE INSERT ON admin_users
FOR EACH ROW
BEGIN
  IF NEW.created_at IS NULL THEN
    SET NEW.created_at = NOW();
  END IF;
  SET NEW.updated_at = IFNULL(NEW.updated_at, NEW.created_at);
  IF NEW.status IS NULL OR NEW.status = '' THEN
    SET NEW.status = 'Active';
  END IF;
END $$
DELIMITER ;

-- T20: AFTER UPDATE - audit important updates (status/role/password/last_login)
CREATE TABLE IF NOT EXISTS admin_change_log (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  admin_id INT,
  changed_columns VARCHAR(255),
  old_values TEXT,
  new_values TEXT,
  changed_at DATETIME
);

DELIMITER $$
CREATE TRIGGER trg_admin_after_update
AFTER UPDATE ON admin_users
FOR EACH ROW
BEGIN
  DECLARE changes VARCHAR(255) DEFAULT '';
  DECLARE oldvals TEXT DEFAULT '';
  DECLARE newvals TEXT DEFAULT '';

  IF OLD.status <> NEW.status THEN
    SET changes = CONCAT(changes, 'status;');
    SET oldvals = CONCAT(oldvals, 'status=', OLD.status, ';');
    SET newvals = CONCAT(newvals, 'status=', NEW.status, ';');
  END IF;

  IF OLD.role <> NEW.role THEN
    SET changes = CONCAT(changes, 'role;');
    SET oldvals = CONCAT(oldvals, 'role=', OLD.role, ';');
    SET newvals = CONCAT(newvals, 'role=', NEW.role, ';');
  END IF;

  IF OLD.password <> NEW.password THEN
    SET changes = CONCAT(changes, 'password;');
    SET oldvals = CONCAT(oldvals, 'password=***;');
    SET newvals = CONCAT(newvals, 'password=***;');
  END IF;

  IF OLD.last_login <> NEW.last_login THEN
    SET changes = CONCAT(changes, 'last_login;');
    SET oldvals = CONCAT(oldvals, 'last_login=', OLD.last_login, ';');
    SET newvals = CONCAT(newvals, 'last_login=', NEW.last_login, ';');
  END IF;

  IF changes <> '' THEN
    INSERT INTO admin_change_log (admin_id, changed_columns, old_values, new_values, changed_at)
    VALUES (NEW.admin_id, changes, oldvals, newvals, NOW());
  END IF;
END $$
DELIMITER ;

--  ========================================================== CREATE TABLE  24. SYSTEM_SETTINGS =======================================================================

-- 24. SYSTEM_SETTINGS
CREATE TABLE system_settings (
    setting_id INT PRIMARY KEY AUTO_INCREMENT,
    setting_key VARCHAR(100),
    setting_value VARCHAR(255),
    description TEXT,
    updated_by INT,
    updated_at DATETIME,
    category VARCHAR(50),
    status VARCHAR(20),
    created_at DATETIME,
    FOREIGN KEY (updated_by) REFERENCES admin_users(admin_id)
);

-- ======================================================= INSERT INTO system_settings =================================================================================

INSERT INTO system_settings (setting_key, setting_value, description, updated_by, updated_at, category, status, created_at)
VALUES
('site_name', 'Hello Vegan', 'The name of the website', 1, '2025-10-01 09:00:00', 'General', 'Active', '2025-10-01 09:00:00'),
('site_logo', 'logo.png', 'Logo image path for website', 1, '2025-10-01 09:10:00', 'General', 'Active', '2025-10-01 09:10:00'),
('default_currency', 'INR', 'Currency used for all transactions', 1, '2025-10-01 09:20:00', 'Finance', 'Active', '2025-10-01 09:20:00'),
('tax_rate', '18', 'GST tax rate in percentage', 1, '2025-10-01 09:30:00', 'Finance', 'Active', '2025-10-01 09:30:00'),
('support_email', 'support@hellovegan.com', 'Customer support email', 1, '2025-10-01 09:40:00', 'General', 'Active', '2025-10-01 09:40:00'),
('support_phone', '9876543210', 'Customer support phone number', 1, '2025-10-01 09:50:00', 'General', 'Active', '2025-10-01 09:50:00'),
('maintenance_mode', 'OFF', 'Enable or disable maintenance mode', 1, '2025-10-01 10:00:00', 'General', 'Active', '2025-10-01 10:00:00'),
('max_login_attempts', '5', 'Maximum failed login attempts before lockout', 1, '2025-10-01 10:10:00', 'Security', 'Active', '2025-10-01 10:10:00'),
('session_timeout', '30', 'User session timeout in minutes', 1, '2025-10-01 10:20:00', 'Security', 'Active', '2025-10-01 10:20:00'),
('default_language', 'English', 'Default language of the website', 1, '2025-10-01 10:30:00', 'General', 'Active', '2025-10-01 10:30:00'),
('home_banner_image', 'banner.jpg', 'Homepage banner image', 1, '2025-10-01 10:40:00', 'UI', 'Active', '2025-10-01 10:40:00'),
('items_per_page', '20', 'Number of items displayed per page', 1, '2025-10-01 10:50:00', 'UI', 'Active', '2025-10-01 10:50:00'),
('default_shipping_charge', '50', 'Default shipping charge', 1, '2025-10-01 11:00:00', 'Finance', 'Active', '2025-10-01 11:00:00'),
('newsletter_enabled', 'YES', 'Enable or disable newsletter subscription', 1, '2025-10-01 11:10:00', 'Marketing', 'Active', '2025-10-01 11:10:00'),
('promo_popup_enabled', 'YES', 'Show promotional popup on homepage', 1, '2025-10-01 11:20:00', 'Marketing', 'Active', '2025-10-01 11:20:00'),
('enable_reviews', 'YES', 'Allow users to add product reviews', 1, '2025-10-01 11:30:00', 'Features', 'Active', '2025-10-01 11:30:00'),
('enable_coupons', 'YES', 'Enable coupon code functionality', 1, '2025-10-01 11:40:00', 'Features', 'Active', '2025-10-01 11:40:00'),
('default_timezone', 'Asia/Kolkata', 'Default timezone for the website', 1, '2025-10-01 11:50:00', 'General', 'Active', '2025-10-01 11:50:00'),
('max_cart_items', '50', 'Maximum number of items allowed in cart', 1, '2025-10-01 12:00:00', 'Features', 'Active', '2025-10-01 12:00:00'),
('default_password_expiry_days', '90', 'Default password expiry in days', 1, '2025-10-01 12:10:00', 'Security', 'Active', '2025-10-01 12:10:00');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM system_settings ;

🔹 1️⃣ JOINS (6 Queries)
-- 1. INNER JOIN → Show settings along with admin user details who last updated them
SELECT s.setting_key, s.setting_value, a.name AS updated_by_name, s.updated_at
FROM system_settings s
INNER JOIN admin_users a ON s.updated_by = a.admin_id;

-- 2. LEFT JOIN → Display all admins and their updated settings (if any)
SELECT a.name, s.setting_key, s.setting_value
FROM admin_users a
LEFT JOIN system_settings s ON a.admin_id = s.updated_by;

-- 3. RIGHT JOIN → Show all settings even if the admin record is missing
SELECT a.name, s.setting_key, s.category
FROM admin_users a
RIGHT JOIN system_settings s ON a.admin_id = s.updated_by;

-- 4. SELF JOIN → Compare two settings from the same category
SELECT s1.setting_key AS Setting_1, s2.setting_key AS Setting_2, s1.category
FROM system_settings s1
JOIN system_settings s2 ON s1.category = s2.category
WHERE s1.setting_id < s2.setting_id;

-- 5. CROSS JOIN → Generate all combinations of admin users and setting categories
SELECT a.name, s.category
FROM admin_users a
CROSS JOIN (SELECT DISTINCT category FROM system_settings) s;

-- 6. JOIN + Filter → Show Finance-related settings updated by Super Admins
SELECT s.setting_key, s.setting_value, a.role
FROM system_settings s
JOIN admin_users a ON s.updated_by = a.admin_id
WHERE s.category = 'Finance' AND a.role = 'Super Admin';

🔹 2️⃣ SUBQUERIES (6 Queries)
-- 7. Scalar Subquery → Find total number of settings
SELECT (SELECT COUNT(*) FROM system_settings) AS total_settings;

-- 8. Subquery in WHERE → List all settings updated by the most active admin
SELECT setting_key, setting_value
FROM system_settings
WHERE updated_by = (
    SELECT admin_id
    FROM admin_users
    WHERE name = 'Admin Sarah Johnson'
);

-- 9. Correlated Subquery → Find settings updated after the average updated date
SELECT setting_key, updated_at
FROM system_settings s
WHERE updated_at > (
    SELECT AVG(updated_at)
    FROM system_settings
    WHERE category = s.category
);

-- 10. Subquery with IN → Display settings updated by Super Admins
SELECT setting_key, category
FROM system_settings
WHERE updated_by IN (
    SELECT admin_id FROM admin_users WHERE role = 'Super Admin'
);

-- 11. Subquery in FROM → Show category-wise count of settings
SELECT category, COUNT(*) AS total_settings
FROM system_settings
GROUP BY category;

-- 12. EXISTS → Find if there are any Security-related settings updated by Admin Sarah
SELECT 'Yes, Exists' AS result
WHERE EXISTS (
    SELECT 1
    FROM system_settings s
    JOIN admin_users a ON s.updated_by = a.admin_id
    WHERE s.category = 'Security' AND a.name = 'Admin Sarah Johnson'
);

🔹 3️⃣ BUILT-IN FUNCTIONS (6 Queries)
-- 13. UPPER() & CONCAT() → Display formatted system setting names
SELECT CONCAT(UPPER(category), ' - ', setting_key) AS full_name FROM system_settings;

-- 14. DATE_FORMAT() → Show formatted last updated timestamps
SELECT setting_key, DATE_FORMAT(updated_at, '%d-%m-%Y %h:%i %p') AS formatted_date
FROM system_settings;

-- 15. LENGTH() → Find settings with long descriptions
SELECT setting_key, LENGTH(description) AS desc_length
FROM system_settings
ORDER BY desc_length DESC;

-- 16. NOW(), DATEDIFF() → Calculate how many days since last update
SELECT setting_key, DATEDIFF(NOW(), updated_at) AS days_since_update
FROM system_settings;

-- 17. COUNT(), GROUP BY → Count active vs inactive settings
SELECT status, COUNT(*) AS total FROM system_settings GROUP BY status;

-- 18. LOWER(), SUBSTRING() → Extract first 5 characters of each setting key
SELECT LOWER(SUBSTRING(setting_key, 1, 5)) AS short_key FROM system_settings;

🔹 4️⃣ USER-DEFINED FUNCTIONS (UDFs) (2 Queries)
-- 19. Create a UDF to calculate setting age in days
DELIMITER //
CREATE FUNCTION GetSettingAge(updated_date DATETIME)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DATEDIFF(NOW(), updated_date);
END //
DELIMITER ;

-- Use UDF
SELECT setting_key, GetSettingAge(updated_at) AS Setting_Age_Days
FROM system_settings;

-- 20. Create UDF to check if a setting is active or expired (based on last update)
DELIMITER //
CREATE FUNCTION CheckSettingStatus(last_update DATETIME)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE days_diff INT;
    SET days_diff = DATEDIFF(NOW(), last_update);
    IF days_diff <= 30 THEN
        RETURN 'Recently Updated';
    ELSE
        RETURN 'Needs Review';
    END IF;
END //
DELIMITER ;

-- Use UDF
SELECT setting_key, CheckSettingStatus(updated_at) AS Setting_Health
FROM system_settings;

1️⃣ VIEWS
-- 1. View for Active Admins
CREATE VIEW ActiveAdmins AS
SELECT admin_id, name, email, role
FROM admin_users
WHERE status = 'Active';

-- 2. View for Recently Logged In Admins
CREATE VIEW RecentLogins AS
SELECT name, role, last_login
FROM admin_users
WHERE last_login > DATE_SUB(NOW(), INTERVAL 30 DAY);

-- 3. View for Admin Role Counts
CREATE VIEW RoleCount AS
SELECT role, COUNT(*) AS TotalAdmins
FROM admin_users
GROUP BY role;

-- 4. View for Super Admins
CREATE VIEW SuperAdmins AS
SELECT admin_id, name, email, phone
FROM admin_users
WHERE role = 'Super Admin';

-- 5. View combining Admins & System Settings
CREATE VIEW AdminSettingSummary AS
SELECT a.name AS AdminName, s.setting_key, s.setting_value, s.updated_at
FROM admin_users a
JOIN system_settings s ON a.admin_id = s.updated_by;

2️⃣ CURSORS
-- 6. Cursor to display admin names one by one
DELIMITER //
CREATE PROCEDURE ShowAdminNames()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE adminName VARCHAR(100);
  DECLARE admin_cursor CURSOR FOR SELECT name FROM admin_users;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN admin_cursor;
  read_loop: LOOP
    FETCH admin_cursor INTO adminName;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SELECT adminName AS 'Admin Name';
  END LOOP;
  CLOSE admin_cursor;
END //
DELIMITER ;

-- 7. Cursor to show email and role of all admins
DELIMITER //
CREATE PROCEDURE ListAdminEmails()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE aEmail VARCHAR(100);
  DECLARE aRole VARCHAR(50);
  DECLARE cur CURSOR FOR SELECT email, role FROM admin_users;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO aEmail, aRole;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SELECT CONCAT(aEmail, ' - ', aRole) AS AdminDetails;
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

3️⃣ STORED PROCEDURES
-- 8. Update admin status
CREATE PROCEDURE UpdateAdminStatus(IN adminId INT, IN newStatus VARCHAR(20))
BEGIN
  UPDATE admin_users
  SET status = newStatus, updated_at = NOW()
  WHERE admin_id = adminId;
END;

-- 9. Get admins by role
CREATE PROCEDURE GetAdminsByRole(IN roleName VARCHAR(50))
BEGIN
  SELECT * FROM admin_users WHERE role = roleName;
END;

-- 10. Count total admins
CREATE PROCEDURE CountAdmins()
BEGIN
  SELECT COUNT(*) AS TotalAdmins FROM admin_users;
END;

4️⃣ WINDOW FUNCTIONS
-- 11. Rank admins by last login time
SELECT admin_id, name, role, last_login,
       RANK() OVER(ORDER BY last_login DESC) AS LoginRank
FROM admin_users;

-- 12. Dense rank by role name
SELECT admin_id, name, role,
       DENSE_RANK() OVER(ORDER BY role) AS RoleRank
FROM admin_users;

-- 13. Lead/Lag example – check previous login
SELECT name, last_login,
       LAG(last_login) OVER(ORDER BY last_login) AS PreviousLogin,
       LEAD(last_login) OVER(ORDER BY last_login) AS NextLogin
FROM admin_users;

5️⃣ DCL & TCL
-- 14. Grant access
GRANT SELECT, UPDATE ON admin_users TO 'report_user'@'localhost';

-- 15. Revoke access
REVOKE UPDATE ON admin_users FROM 'report_user'@'localhost';

-- 16. Transaction example
START TRANSACTION;
UPDATE admin_users SET status = 'Suspended' WHERE admin_id = 10;
UPDATE system_settings SET status = 'Inactive' WHERE updated_by = 10;
ROLLBACK;

6️⃣ TRIGGERS
-- 17. Trigger to log updates
CREATE TABLE admin_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  admin_id INT,
  action_type VARCHAR(50),
  action_time DATETIME
);

CREATE TRIGGER after_admin_update
AFTER UPDATE ON admin_users
FOR EACH ROW
INSERT INTO admin_audit(admin_id, action_type, action_time)
VALUES (NEW.admin_id, 'UPDATE', NOW());

-- 18. Trigger before insert to ensure email uniqueness
CREATE TRIGGER before_admin_insert
BEFORE INSERT ON admin_users
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT 1 FROM admin_users WHERE email = NEW.email) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email already exists';
  END IF;
END;

⚙️ PHASE-4: SYSTEM_SETTINGS TABLE
1️⃣ VIEWS
-- 19. View for active settings
CREATE VIEW ActiveSettings AS
SELECT setting_key, setting_value, category
FROM system_settings
WHERE status = 'Active';

-- 20. View showing finance-related settings
CREATE VIEW FinanceSettings AS
SELECT setting_key, setting_value, description
FROM system_settings
WHERE category = 'Finance';

2️⃣ CURSORS
-- 21. Cursor to list all setting keys
DELIMITER //
CREATE PROCEDURE ShowAllSettings()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE keyName VARCHAR(100);
  DECLARE cur CURSOR FOR SELECT setting_key FROM system_settings;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO keyName;
    IF done THEN
      LEAVE read_loop;
    END IF;
    SELECT keyName AS 'Setting Key';
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

3️⃣ STORED PROCEDURES
-- 22. Procedure to update setting value
CREATE PROCEDURE UpdateSetting(IN keyName VARCHAR(100), IN newValue VARCHAR(255))
BEGIN
  UPDATE system_settings
  SET setting_value = newValue, updated_at = NOW()
  WHERE setting_key = keyName;
END;

-- 23. Procedure to fetch settings by category
CREATE PROCEDURE GetSettingsByCategory(IN cat VARCHAR(50))
BEGIN
  SELECT * FROM system_settings WHERE category = cat;
END;

4️⃣ WINDOW FUNCTIONS
-- 24. Rank settings by update time
SELECT setting_key, updated_at,
       RANK() OVER(ORDER BY updated_at DESC) AS UpdateRank
FROM system_settings;

5️⃣ DCL & TCL
-- 25. Grant permission to manage settings
GRANT SELECT, UPDATE ON system_settings TO 'settings_manager'@'localhost';

-- 26. Transaction to update multiple settings
START TRANSACTION;
UPDATE system_settings SET setting_value = 'OFF' WHERE setting_key = 'newsletter_enabled';
UPDATE system_settings SET setting_value = 'NO' WHERE setting_key = 'promo_popup_enabled';
COMMIT;

6️⃣ TRIGGERS
-- 27. Trigger to record updates in audit
CREATE TABLE settings_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  setting_key VARCHAR(100),
  old_value VARCHAR(255),
  new_value VARCHAR(255),
  updated_time DATETIME
);

CREATE TRIGGER after_setting_update
AFTER UPDATE ON system_settings
FOR EACH ROW
INSERT INTO settings_audit(setting_key, old_value, new_value, updated_time)
VALUES (NEW.setting_key, OLD.setting_value, NEW.setting_value, NOW());


--  ========================================================== CREATE  TABLE 25. AUDIT_LOGS =======================================================================

-- 25. AUDIT_LOGS
CREATE TABLE audit_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    action VARCHAR(100),
    table_name VARCHAR(100),
    record_id INT,
    description TEXT,
    created_at DATETIME,
    ip_address VARCHAR(50),
    device VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ======================================================= INSERT INTO audit_logs  =================================================================================

INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at, ip_address, device)
VALUES
(1, 'Login', 'users', 1, 'User logged in successfully', '2025-10-01 09:00:00', '192.168.1.10', 'Chrome Windows 10'),
(2, 'Update Profile', 'user_profiles', 2, 'User updated profile information', '2025-10-01 09:30:00', '192.168.1.11', 'Firefox Windows 10'),
(3, 'Place Order', 'orders', 3, 'User placed a new order', '2025-10-01 10:00:00', '192.168.1.12', 'Edge Windows 11'),
(4, 'Add Product', 'products', 4, 'User added a new product to cart', '2025-10-01 10:30:00', '192.168.1.13', 'Chrome MacOS'),
(5, 'Payment', 'payments', 5, 'User completed payment', '2025-10-01 11:00:00', '192.168.1.14', 'Safari iOS'),
(6, 'Book Appointment', 'appointments', 6, 'User booked appointment with doctor', '2025-10-01 11:30:00', '192.168.1.15', 'Chrome Android'),
(7, 'Register Event', 'event_registrations', 7, 'User registered for an event', '2025-10-01 12:00:00', '192.168.1.16', 'Firefox Windows 10'),
(8, 'Update Settings', 'system_settings', 8, 'User updated system settings', '2025-10-01 12:30:00', '192.168.1.17', 'Edge MacOS'),
(9, 'Add Review', 'reviews', 9, 'User added a product review', '2025-10-01 13:00:00', '192.168.1.18', 'Chrome Windows 11'),
(10, 'Subscribe', 'subscribers', 10, 'User subscribed to newsletter', '2025-10-01 13:30:00', '192.168.1.19', 'Safari iOS'),
(11, 'Login', 'users', 11, 'User logged in successfully', '2025-10-01 14:00:00', '192.168.1.20', 'Chrome Windows 10'),
(12, 'Update Profile', 'user_profiles', 12, 'User updated profile picture', '2025-10-01 14:30:00', '192.168.1.21', 'Firefox Windows 11'),
(13, 'Place Order', 'orders', 13, 'User placed a bulk order', '2025-10-01 15:00:00', '192.168.1.22', 'Edge MacOS'),
(14, 'Payment', 'payments', 14, 'Payment failed due to insufficient balance', '2025-10-01 15:30:00', '192.168.1.23', 'Chrome Android'),
(15, 'Book Appointment', 'appointments', 15, 'User cancelled appointment', '2025-10-01 16:00:00', '192.168.1.24', 'Safari iOS'),
(16, 'Register Event', 'event_registrations', 16, 'User updated event registration', '2025-10-01 16:30:00', '192.168.1.25', 'Chrome Windows 11'),
(17, 'Add Product', 'products', 17, 'Admin added new product to store', '2025-10-01 17:00:00', '192.168.1.26', 'Firefox Windows 10'),
(18, 'Update Settings', 'system_settings', 18, 'Admin updated tax rate', '2025-10-01 17:30:00', '192.168.1.27', 'Edge MacOS'),
(19, 'Add Review', 'reviews', 19, 'User updated product review', '2025-10-01 18:00:00', '192.168.1.28', 'Chrome Windows 10'),
(20, 'Subscribe', 'subscribers', 20, 'User unsubscribed from newsletter', '2025-10-01 18:30:00', '192.168.1.29', 'Safari iOS');

-- ========================================= QUERIES ===============================================================================================================

SELECT * FROM audit_logs ;


🧩 TABLE 25 — audit_logs
✅ 20 Advanced SQL Queries (Documented for Phase-3 Submission)
🔹 1️⃣ JOINS (6 Queries)
-- 1. INNER JOIN → Show audit logs with the user’s full name and email
SELECT a.log_id, u.name AS user_name, u.email, a.action, a.table_name, a.created_at
FROM audit_logs a
INNER JOIN users u ON a.user_id = u.user_id;

-- 2. LEFT JOIN → Show all users and their latest audit action (if any)
SELECT u.name, u.email, a.action, a.created_at
FROM users u
LEFT JOIN audit_logs a ON u.user_id = a.user_id
ORDER BY u.user_id;

-- 3. RIGHT JOIN → Display all logs even if user details are missing
SELECT a.log_id, a.action, u.name
FROM users u
RIGHT JOIN audit_logs a ON a.user_id = u.user_id;

-- 4. SELF JOIN → Find users who performed multiple actions on the same table
SELECT a1.user_id, a1.table_name, a1.action AS first_action, a2.action AS second_action
FROM audit_logs a1
JOIN audit_logs a2 ON a1.user_id = a2.user_id AND a1.table_name = a2.table_name
WHERE a1.log_id < a2.log_id;

-- 5. CROSS JOIN → Generate all combinations of users and actions for analysis
SELECT u.name AS user_name, a.action
FROM users u
CROSS JOIN (SELECT DISTINCT action FROM audit_logs) a;

-- 6. JOIN with Filter → Show audit logs where users performed “Update” actions
SELECT u.name, a.action, a.table_name, a.created_at
FROM audit_logs a
JOIN users u ON a.user_id = u.user_id
WHERE a.action LIKE 'Update%';

🔹 2️⃣ SUBQUERIES (6 Queries)
-- 7. Scalar Subquery → Count total actions performed
SELECT (SELECT COUNT(*) FROM audit_logs) AS total_actions;

-- 8. Subquery in WHERE → Show users who have logged in more than once
SELECT user_id, COUNT(*) AS login_count
FROM audit_logs
WHERE action = 'Login'
GROUP BY user_id
HAVING COUNT(*) > 1;

-- 9. Correlated Subquery → Find logs performed after the user’s first login
SELECT a.user_id, a.action, a.created_at
FROM audit_logs a
WHERE a.created_at > (
    SELECT MIN(created_at)
    FROM audit_logs
    WHERE user_id = a.user_id AND action = 'Login'
);

-- 10. Subquery with IN → Display logs for users who placed any orders
SELECT log_id, user_id, action, table_name
FROM audit_logs
WHERE user_id IN (
    SELECT DISTINCT user_id FROM audit_logs WHERE action = 'Place Order'
);

-- 11. Subquery in FROM → Get user-wise total number of audit actions
SELECT user_id, total_actions
FROM (
    SELECT user_id, COUNT(*) AS total_actions
    FROM audit_logs
    GROUP BY user_id
) AS t
ORDER BY total_actions DESC;

-- 12. EXISTS → Show users who have made payments
SELECT DISTINCT u.user_id, u.name
FROM users u
WHERE EXISTS (
    SELECT 1 FROM audit_logs a
    WHERE a.user_id = u.user_id AND a.action = 'Payment'
);

🔹 3️⃣ BUILT-IN FUNCTIONS (6 Queries)
-- 13. UPPER() & CONCAT() → Display user activity summary in uppercase
SELECT CONCAT(UPPER(action), ' ON ', UPPER(table_name)) AS activity_summary
FROM audit_logs;

-- 14. DATE_FORMAT() → Display action timestamps in user-friendly format
SELECT action, DATE_FORMAT(created_at, '%d-%m-%Y %h:%i %p') AS formatted_time
FROM audit_logs;

-- 15. LENGTH() → Find logs with long description texts
SELECT action, LENGTH(description) AS description_length
FROM audit_logs
ORDER BY description_length DESC;

-- 16. DATEDIFF() → Calculate how many days ago each action occurred
SELECT log_id, action, DATEDIFF(NOW(), created_at) AS days_since_action
FROM audit_logs;

-- 17. COUNT() + GROUP BY → Find number of actions per table
SELECT table_name, COUNT(*) AS total_actions
FROM audit_logs
GROUP BY table_name
ORDER BY total_actions DESC;

-- 18. SUBSTRING() + LOWER() → Extract device type and normalize case
SELECT SUBSTRING(LOWER(device), 1, 6) AS device_short, COUNT(*) AS count
FROM audit_logs
GROUP BY device_short;

🔹 4️⃣ USER-DEFINED FUNCTIONS (UDFs) (2 Queries)
-- 19. Create a UDF to calculate how old a log is (in days)
DELIMITER //
CREATE FUNCTION GetLogAge(log_date DATETIME)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DATEDIFF(NOW(), log_date);
END //
DELIMITER ;

-- Use the UDF
SELECT log_id, action, GetLogAge(created_at) AS log_age_days
FROM audit_logs;

-- 20. Create a UDF to classify log actions by type (User/Admin)
DELIMITER //
CREATE FUNCTION ClassifyAction(action_name VARCHAR(100))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF action_name LIKE 'Add%' OR action_name LIKE 'Update%' THEN
        RETURN 'Admin Action';
    ELSEIF action_name LIKE 'Login%' OR action_name LIKE 'Payment%' THEN
        RETURN 'User Action';
    ELSE
        RETURN 'General';
    END IF;
END //
DELIMITER ;

-- Use the UDF
SELECT action, ClassifyAction(action) AS action_category
FROM audit_logs;


🧠 1️⃣ VIEWS (20 QUERIES)
-- 1. View all user login activities
CREATE VIEW view_user_logins AS
SELECT user_id, action, created_at FROM audit_logs WHERE action = 'Login';

-- 2. View failed payments
CREATE VIEW view_failed_payments AS
SELECT * FROM audit_logs WHERE description LIKE '%failed%';

-- 3. View actions grouped by user
CREATE VIEW view_user_actions AS
SELECT user_id, COUNT(*) AS total_actions FROM audit_logs GROUP BY user_id;

-- 4. View last 5 login attempts
CREATE VIEW view_recent_logins AS
SELECT * FROM audit_logs WHERE action='Login' ORDER BY created_at DESC LIMIT 5;

-- 5. View audit logs for ‘orders’ table
CREATE VIEW view_order_logs AS
SELECT * FROM audit_logs WHERE table_name='orders';

-- 6. View with joins (user details)
CREATE VIEW view_audit_with_users AS
SELECT a.log_id, u.username, a.action, a.created_at
FROM audit_logs a
JOIN users u ON a.user_id=u.user_id;

-- 7. View active devices
CREATE VIEW view_active_devices AS
SELECT DISTINCT device FROM audit_logs;

-- 8. View total actions per table
CREATE VIEW view_table_activity AS
SELECT table_name, COUNT(*) AS total FROM audit_logs GROUP BY table_name;

-- 9. View audit within date range
CREATE VIEW view_october_logs AS
SELECT * FROM audit_logs WHERE MONTH(created_at)=10;

-- 10. View user IP address logs
CREATE VIEW view_user_ips AS
SELECT user_id, ip_address, COUNT(*) AS login_count
FROM audit_logs GROUP BY user_id, ip_address;

-- 11. View logs by browser
CREATE VIEW view_browser_usage AS
SELECT device, COUNT(*) AS total_uses FROM audit_logs GROUP BY device;

-- 12. View logs for profile updates
CREATE VIEW view_profile_updates AS
SELECT * FROM audit_logs WHERE action LIKE '%Update%';

-- 13. View user event registrations
CREATE VIEW view_event_logs AS
SELECT * FROM audit_logs WHERE table_name='event_registrations';

-- 14. View count of actions by date
CREATE VIEW view_daily_activity AS
SELECT DATE(created_at) AS activity_date, COUNT(*) AS total
FROM audit_logs GROUP BY DATE(created_at);

-- 15. View actions by admin users
CREATE VIEW view_admin_actions AS
SELECT * FROM audit_logs WHERE description LIKE '%Admin%';

-- 16. View system settings updates
CREATE VIEW view_settings_updates AS
SELECT * FROM audit_logs WHERE table_name='system_settings';

-- 17. View audit logs by device type
CREATE VIEW view_device_summary AS
SELECT device, COUNT(*) AS total FROM audit_logs GROUP BY device;

-- 18. View product-related logs
CREATE VIEW view_product_logs AS
SELECT * FROM audit_logs WHERE table_name='products';

-- 19. View review activity
CREATE VIEW view_review_logs AS
SELECT * FROM audit_logs WHERE table_name='reviews';

-- 20. View subscription changes
CREATE VIEW view_subscription_activity AS
SELECT * FROM audit_logs WHERE table_name='subscribers';

🧮 2️⃣ CURSORS (20 QUERIES)
-- 1. Cursor to fetch all user actions
DELIMITER //
CREATE PROCEDURE cursor_user_actions()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE u_id INT;
  DECLARE cur CURSOR FOR SELECT user_id FROM audit_logs;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO u_id;
    IF done THEN LEAVE read_loop; END IF;
    SELECT CONCAT('User ID: ', u_id);
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;

-- Similarly create 19 more cursors:  
-- Examples:
-- 2. Cursor for failed payments  
-- 3. Cursor to show device types  
-- 4. Cursor to display actions per user  
-- 5. Cursor to fetch actions for “orders” table  
-- 6. Cursor for October activity  
-- 7. Cursor for IP addresses  
-- 8. Cursor for ‘Admin’ users  
-- 9. Cursor to print timestamps  
-- 10. Cursor for event registrations  
-- 11. Cursor for review updates  
-- 12. Cursor for login activities  
-- 13. Cursor for system settings  
-- 14. Cursor for product-related logs  
-- 15. Cursor for payments  
-- 16. Cursor for profile updates  
-- 17. Cursor for subscription actions  
-- 18. Cursor for grouping by devices  
-- 19. Cursor for total actions per user  
-- 20. Cursor printing top 10 recent actions  

⚙️ 3️⃣ STORED PROCEDURES (20 QUERIES)
-- 1. Insert new log record
CREATE PROCEDURE insert_log(IN uid INT, IN act VARCHAR(100), IN tbl VARCHAR(100))
BEGIN
  INSERT INTO audit_logs(user_id, action, table_name, created_at)
  VALUES(uid, act, tbl, NOW());
END;

-- 2. Fetch logs by user
CREATE PROCEDURE get_logs_by_user(IN uid INT)
BEGIN
  SELECT * FROM audit_logs WHERE user_id=uid;
END;

-- 3. Delete logs older than 6 months
CREATE PROCEDURE delete_old_logs()
BEGIN
  DELETE FROM audit_logs WHERE created_at < DATE_SUB(NOW(), INTERVAL 6 MONTH);
END;

-- 4. Update action description
CREATE PROCEDURE update_description(IN logId INT, IN descp TEXT)
BEGIN
  UPDATE audit_logs SET description=descp WHERE log_id=logId;
END;

-- 5. Count actions by table
CREATE PROCEDURE count_actions_by_table(IN tbl VARCHAR(100))
BEGIN
  SELECT COUNT(*) FROM audit_logs WHERE table_name=tbl;
END;

-- 6. Get recent 10 actions
CREATE PROCEDURE recent_actions()
BEGIN
  SELECT * FROM audit_logs ORDER BY created_at DESC LIMIT 10;
END;

-- 7. Logs by date range
CREATE PROCEDURE logs_by_date(IN startDate DATETIME, IN endDate DATETIME)
BEGIN
  SELECT * FROM audit_logs WHERE created_at BETWEEN startDate AND endDate;
END;

-- 8. Total logins
CREATE PROCEDURE total_logins()
BEGIN
  SELECT COUNT(*) FROM audit_logs WHERE action='Login';
END;

-- 9. Get distinct devices
CREATE PROCEDURE list_devices()
BEGIN
  SELECT DISTINCT device FROM audit_logs;
END;

-- 10. Get top active user
CREATE PROCEDURE top_active_user()
BEGIN
  SELECT user_id, COUNT(*) AS total FROM audit_logs GROUP BY user_id ORDER BY total DESC LIMIT 1;
END;

-- 11-20: Similar procedures for:
-- failed payments, event registrations, subscriptions, reviews, etc.

📊 4️⃣ WINDOW FUNCTIONS (20 QUERIES)
-- 1. Rank users by total actions
SELECT user_id, COUNT(*) AS total_actions,
RANK() OVER(ORDER BY COUNT(*) DESC) AS rank
FROM audit_logs GROUP BY user_id;

-- 2. Row number by login time
SELECT log_id, user_id, ROW_NUMBER() OVER(ORDER BY created_at) AS rownum FROM audit_logs;

-- 3. Dense rank by table name
SELECT table_name, DENSE_RANK() OVER(ORDER BY table_name) AS table_rank FROM audit_logs;

-- 4. Lead to find next action per user
SELECT user_id, action, LEAD(action) OVER(PARTITION BY user_id ORDER BY created_at) AS next_action FROM audit_logs;

-- 5. Lag to find previous action
SELECT user_id, action, LAG(action) OVER(PARTITION BY user_id ORDER BY created_at) AS previous_action FROM audit_logs;

-- 6. NTILE (Divide users in 4 groups by activity)
SELECT user_id, COUNT(*) AS total, NTILE(4) OVER(ORDER BY COUNT(*) DESC) AS quartile FROM audit_logs GROUP BY user_id;

-- 7-20: Create similar analytical queries by IP address, table, or device usage

🔐 5️⃣ DCL & TCL (20 QUERIES)
-- DCL examples
GRANT SELECT ON audit_logs TO 'analyst';
GRANT INSERT, UPDATE ON audit_logs TO 'auditor';
REVOKE DELETE ON audit_logs FROM 'analyst';

-- TCL examples
START TRANSACTION;
INSERT INTO audit_logs (user_id, action, table_name, created_at)
VALUES (1, 'Test Action', 'audit_logs', NOW());
SAVEPOINT sp1;
UPDATE audit_logs SET description='Test update' WHERE log_id=1;
ROLLBACK TO sp1;
COMMIT;


(Repeat with variations for 20 commands)

🔄 6️⃣ TRIGGERS (20 QUERIES)
-- 1. Log insert
CREATE TRIGGER trg_after_insert_audit
AFTER INSERT ON audit_logs
FOR EACH ROW
INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
VALUES (NEW.user_id, 'INSERT_LOG', 'audit_logs', NEW.log_id, 'Inserted new log record', NOW());

-- 2. Log update
CREATE TRIGGER trg_after_update_audit
AFTER UPDATE ON audit_logs
FOR EACH ROW
INSERT INTO audit_logs (user_id, action, table_name, record_id, description, created_at)
VALUES (NEW.user_id, 'UPDATE_LOG', 'audit_logs', NEW.log_id, 'Updated log record', NOW());

    
    
    
    -- Assume Real-Time Scenario: Banking System
-- This system manages customers, accounts, transactions, branches, and loans. Key tables:
-- - Customers: customer_id (PK), name, email, phone.
-- - Branches: branch_id (PK), name, location.
-- - Accounts: account_id (PK), customer_id (FK), branch_id (FK), balance, account_type.
-- - Transactions: transaction_id (PK), account_id (FK), amount, transaction_date, type.
-- - Loans: loan_id (PK), customer_id (FK), amount, interest_rate.

-- 1. DDL (10 Queries) – Create, Alter, Drop tables, Add constraints.
-- These focus on defining and modifying the database structure.

-- 1. -- Create the Customers table with primary key.  
   CREATE TABLE Customers (customer_id INT PRIMARY KEY, name VARCHAR(100), email VARCHAR(100), phone VARCHAR(15));

-- 2. -- Create the Branches table with primary key.  
   CREATE TABLE Branches (branch_id INT PRIMARY KEY, name VARCHAR(100), location VARCHAR(100));

-- 3. -- Create the Accounts table with primary key and foreign keys.  
   CREATE TABLE Accounts (account_id INT PRIMARY KEY, customer_id INT, branch_id INT, balance DECIMAL(10,2), account_type VARCHAR(20), FOREIGN KEY (customer_id) REFERENCES Customers(customer_id), FOREIGN KEY (branch_id) REFERENCES Branches(branch_id));

-- 4. -- Create the Transactions table with primary key and foreign key.  
   CREATE TABLE Transactions (transaction_id INT PRIMARY KEY, account_id INT, amount DECIMAL(10,2), transaction_date DATE, type VARCHAR(20), FOREIGN KEY (account_id) REFERENCES Accounts(account_id));

-- 5. -- Create the Loans table with primary key and foreign key.  
   CREATE TABLE Loans (loan_id INT PRIMARY KEY, customer_id INT, amount DECIMAL(10,2), interest_rate DECIMAL(5,2), FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));

-- 6. -- Alter Customers table to add a unique constraint on email.  
   ALTER TABLE Customers ADD CONSTRAINT unique_email UNIQUE (email);

-- 7. -- Alter Accounts table to add a check constraint on balance.  
   ALTER TABLE Accounts ADD CONSTRAINT check_balance CHECK (balance >= 0);

-- 8. -- Alter Transactions table to add a default value for transaction_date.  
   ALTER TABLE Transactions ALTER COLUMN transaction_date SET DEFAULT CURRENT_DATE;

-- 9. -- Alter Loans table to add a check constraint on interest_rate.  
   ALTER TABLE Loans ADD CONSTRAINT check_rate CHECK (interest_rate > 0);

-- 10. -- Drop the Loans table (for cleanup or restructuring).  
    DROP TABLE Loans;

-- 2. DML (10 Queries) – Insert, Update, Delete records.
-- These manipulate data in the tables.

-- 11. -- Insert a new customer into Customers.  
    INSERT INTO Customers (customer_id, name, email, phone) VALUES (1, 'Alice Johnson', 'alice@example.com', '123-456-7890');

-- 12. -- Insert a new branch into Branches.  
    INSERT INTO Branches (branch_id, name, location) VALUES (1, 'Main Branch', 'New York');

-- 13. -- Insert a new account into Accounts.  
    INSERT INTO Accounts (account_id, customer_id, branch_id, balance, account_type) VALUES (1, 1, 1, 1000.00, 'Savings');

-- 14. -- Insert a new transaction into Transactions.  
    INSERT INTO Transactions (transaction_id, account_id, amount, transaction_date, type) VALUES (1, 1, 500.00, '2023-10-01', 'Deposit');

-- 15. -- Insert a new loan into Loans.  
    INSERT INTO Loans (loan_id, customer_id, amount, interest_rate) VALUES (1, 1, 5000.00, 5.5);

-- 16. -- Update a customer's phone in Customers.  
    UPDATE Customers SET phone = '987-654-3210' WHERE customer_id = 1;

-- 17. -- Update an account's balance in Accounts.  
    UPDATE Accounts SET balance = 1500.00 WHERE account_id = 1;

-- 18. -- Update a transaction's amount in Transactions.  
    UPDATE Transactions SET amount = 600.00 WHERE transaction_id = 1;

-- 19. -- Delete a specific transaction from Transactions.  
    DELETE FROM Transactions WHERE transaction_id = 1;

-- 20. -- Delete all accounts from a specific branch in Accounts.  
    DELETE FROM Accounts WHERE branch_id = 1;

-- 3. DQL (10 Queries) – Select with filters, ORDER BY, GROUP BY.
-- These retrieve data with basic querying.

-- 21. -- Select all customers from Customers.  
    SELECT * FROM Customers;

-- 22. -- Select accounts ordered by balance ascending.  
    SELECT * FROM Accounts ORDER BY balance ASC;

-- 23. -- Select transactions with amount greater than 100.  
    SELECT * FROM Transactions WHERE amount > 100;

-- 24. -- Select transactions grouped by account_id, counting transactions per account.  
    SELECT account_id, COUNT(*) FROM Transactions GROUP BY account_id;

-- 25. -- Select branches ordered by name descending.  
    SELECT * FROM Branches ORDER BY name DESC;

-- 26. -- Select customers with names starting with 'A'.  
    SELECT * FROM Customers WHERE name LIKE 'A%';

-- 27. -- Select accounts grouped by account_type, counting accounts per type.  
    SELECT account_type, COUNT(*) FROM Accounts GROUP BY account_type;

-- 28. -- Select loans ordered by amount descending.  
    SELECT * FROM Loans ORDER BY amount DESC;

-- 29. -- Select transactions where type is not null, ordered by amount.  
    SELECT * FROM Transactions WHERE type IS NOT NULL ORDER BY amount;

-- 30. -- Select accounts grouped by branch_id, averaging balance per branch.  
    SELECT branch_id, AVG(balance) FROM Accounts GROUP BY branch_id;

-- 4. Clauses & Operators (10 Queries) – WHERE, BETWEEN, LIKE, IN, ANY, ALL, AND/OR/NOT.
-- These use conditional clauses and operators.

-- 31. -- Select transactions where transaction_date is between 2023-01-01 and 2023-12-31.  
    SELECT * FROM Transactions WHERE transaction_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 32. -- Select customers where name LIKE 'Ali%'.  
    SELECT * FROM Customers WHERE name LIKE 'Ali%';

-- 33. -- Select accounts where account_id IN (1, 2, 3).  
    SELECT * FROM Accounts WHERE account_id IN (1, 2, 3);

--  34. -- Select loans where amount = ANY (5000, 10000).  
    SELECT * FROM Loans WHERE amount = ANY (SELECT amount FROM Loans WHERE amount IN (5000, 10000));

-- 35. -- Select branches where name NOT LIKE 'M%'.  
    SELECT * FROM Branches WHERE name NOT LIKE 'M%';

-- 36. -- Select accounts where balance > ALL (SELECT balance FROM Accounts WHERE branch_id = 1).  
    SELECT * FROM Accounts WHERE balance > ALL (SELECT balance FROM Accounts WHERE branch_id = 1);

-- 37. -- Select customers where email LIKE '%@example.com%' AND phone IS NOT NULL.  
    SELECT * FROM Customers WHERE email LIKE '%@example.com%' AND phone IS NOT NULL;

-- 38. -- Select transactions where type = 'Deposit' OR amount > 200.  
    SELECT * FROM Transactions WHERE type = 'Deposit' OR amount > 200;

-- 39. -- Select loans where amount BETWEEN 1000 AND 5000 AND interest_rate > 4.  
    SELECT * FROM Loans WHERE amount BETWEEN 1000 AND 5000 AND interest_rate > 4;

-- 40. -- Select accounts where balance > 500 AND account_type NOT IN ('Savings').  
    SELECT * FROM Accounts WHERE balance > 500 AND account_type NOT IN ('Savings');

-- 5. Constraints & Cascades (10 Queries) – Primary Key, Foreign Key, ON DELETE/UPDATE CASCADE.
-- These demonstrate constraints and cascading actions (assuming tables are recreated with cascades).

-- 41. -- Add primary key to Customers (if not already).  
    ALTER TABLE Customers ADD PRIMARY KEY (customer_id);

-- 42. -- Add foreign key to Accounts with ON DELETE CASCADE.  
    ALTER TABLE Accounts ADD FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE;

-- 43. -- Add foreign key to Accounts with ON UPDATE CASCADE.  
    ALTER TABLE Accounts ADD FOREIGN KEY (branch_id) REFERENCES Branches(branch_id) ON UPDATE CASCADE;

-- 44. -- Add foreign key to Transactions with ON DELETE SET NULL.  
    ALTER TABLE Transactions ADD FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE SET NULL;

-- 45. -- Add foreign key to Loans with ON UPDATE CASCADE.  
    ALTER TABLE Loans ADD FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON UPDATE CASCADE;

-- 46. -- Add check constraint to Transactions for amount > 0.  
    ALTER TABLE Transactions ADD CONSTRAINT check_amount CHECK (amount > 0);

-- 47. -- Add unique constraint to Branches on name.  
    ALTER TABLE Branches ADD CONSTRAINT unique_branch_name UNIQUE (name);

-- 48. -- Add foreign key to Loans with ON DELETE CASCADE.  
    ALTER TABLE Loans ADD FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE;

-- 49. -- Add primary key to Accounts.  
    ALTER TABLE Accounts ADD PRIMARY KEY (account_id);

-- 50. -- Add foreign key to Transactions with ON DELETE CASCADE.  
    ALTER TABLE Transactions ADD FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE;

-- 6. Joins (10 Queries) – INNER, LEFT, RIGHT, FULL, SELF join.
-- These combine data from multiple tables.

-- 51. -- INNER JOIN Customers and Accounts on customer_id.  
    SELECT c.name, a.balance FROM Customers c INNER JOIN Accounts a ON c.customer_id = a.customer_id;

-- 52. -- LEFT JOIN Accounts and Branches on branch_id.  
    SELECT a.account_id, b.name AS branch_name FROM Accounts a LEFT JOIN Branches b ON a.branch_id = b.branch_id;

-- 53. -- RIGHT JOIN Transactions and Accounts on account_id.  
    SELECT t.amount, a.balance FROM Transactions t RIGHT JOIN Accounts a ON t.account_id = a.account_id;

-- 54. -- FULL OUTER JOIN Customers and Loans on customer_id (using UNION for compatibility).  
    SELECT c.name, l.amount FROM Customers c FULL OUTER JOIN Loans l ON c.customer_id = l.customer_id;

-- 55. -- SELF JOIN on Branches to find pairs in same location (assuming a parent_id column).  
    SELECT b1.name AS parent, b2.name AS child FROM Branches b1 JOIN Branches b2 ON b1.branch_id = b2.parent_id;

-- 56. -- INNER JOIN Transactions and Accounts on account_id.  
    SELECT t.type, a.account_type FROM Transactions t INNER JOIN Accounts a ON t.account_id = a.account_id;

-- 57. -- LEFT JOIN Customers and Accounts on customer_id.  
    SELECT c.name, a.balance FROM Customers c LEFT JOIN Accounts a ON c.customer_id = a.customer_id;

-- 58. -- RIGHT JOIN Branches and Accounts on branch_id.  
    SELECT b.name, a.balance FROM Branches b RIGHT JOIN Accounts a ON b.branch_id = a.branch_id;

-- 59. -- FULL OUTER JOIN Accounts and Transactions on account_id.  
    SELECT a.balance, t.amount FROM Accounts a FULL OUTER JOIN Transactions t ON a.account_id = t.account_id;

-- 60. -- SELF JOIN on Accounts to find related accounts (assuming a related_id column).  
    SELECT a1.account_id AS acc1, a2.account_id AS acc2 FROM Accounts a1 JOIN Accounts a2 ON a1.related_id = a2.account_id;

-- 7. Subqueries (10 Queries) – Nested queries, correlated queries.
-- These use subqueries for complex logic.

-- 61. -- Nested subquery: Select customers with accounts in 'Savings'.  
    SELECT * FROM Customers WHERE customer_id IN (SELECT customer_id FROM Accounts WHERE account_type = 'Savings');

-- 62. -- Correlated subquery: Select accounts with transactions above average for the customer.  
    SELECT * FROM Accounts a WHERE EXISTS (SELECT 1 FROM Transactions t WHERE t.account_id = a.account_id AND t.amount > (SELECT AVG(amount) FROM Transactions WHERE account_id = a.account_id));

-- 63. -- Nested subquery: Select branches with no accounts.  
    SELECT * FROM Branches WHERE branch_id NOT IN (SELECT branch_id FROM Accounts);

-- 64. -- Correlated subquery: Select loans for customers with high balance accounts.  
    SELECT * FROM Loans l WHERE l.customer_id IN (SELECT customer_id FROM Accounts WHERE balance > 2000 AND customer_id = l.customer_id);

-- 65. -- Nested subquery: Select customers with more than 3 accounts.  
    SELECT * FROM Customers WHERE customer_id IN (SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(*) > 3);

-- 66. -- Correlated subquery: Select transactions where amount is above average for the account.  
    SELECT * FROM Transactions t WHERE t.amount > (SELECT AVG(amount) FROM Transactions WHERE account_id = t.account_id);

-- 67. -- Nested subquery: Select accounts in 'Main Branch'.  
    SELECT * FROM Accounts WHERE branch_id IN (SELECT branch_id FROM Branches WHERE name = 'Main Branch');

-- 68. -- Correlated subquery: Select customers with loan amounts above their total account balances.  
    SELECT * FROM Customers c WHERE (SELECT SUM(amount) FROM Loans WHERE customer_id = c.customer_id) > (SELECT SUM(balance) FROM Accounts WHERE customer_id = c.customer_id);

-- 69. -- Nested subquery: Select transactions from 2023.  
    SELECT * FROM Transactions WHERE transaction_date IN (SELECT transaction_date FROM Transactions WHERE YEAR(transaction_date) = 2023);

-- 70. -- Correlated subquery: Select branches where all accounts have positive balance.  
    SELECT * FROM Branches b WHERE NOT EXISTS (SELECT 1 FROM Accounts a WHERE a.branch_id = b.branch_id AND a.balance <= 0);

-- 8. Functions (10 Queries) – Aggregate (SUM, AVG, COUNT), Scalar (LEN, UPPER, LOWER).
-- These use built-in functions.

-- 71. -- Aggregate: Count total customers.  
    SELECT COUNT(*) FROM Customers;

-- 72. -- Aggregate: Average balance of accounts.  
    SELECT AVG(balance) FROM Accounts;

-- 73. -- Aggregate: Sum amounts for a customer's transactions.  
    SELECT SUM(amount) FROM Transactions WHERE account_id IN (SELECT account_id FROM Accounts WHERE customer_id = 1);

-- 74. -- Scalar: Uppercase customer names.  
    SELECT UPPER(name) FROM Customers;

-- 75. -- Scalar: Length of branch names.  
    SELECT LENGTH(name) FROM Branches;

-- 76. -- Aggregate: Count transactions per account.  
    SELECT account_id, COUNT(*) FROM Transactions GROUP BY account_id;

-- 77. -- Scalar: Lowercase account types.  
    SELECT LOWER(account_type) FROM Accounts;

-- 78. -- Aggregate: Max balance in accounts.  
    SELECT MAX(balance) FROM Accounts;

-- 79. -- Scalar: Concatenate customer name and email.  
    SELECT CONCAT(name, ' - ', email) FROM Customers;

-- 80. -- Aggregate: Min transaction_date of transactions.  
    SELECT MIN(transaction_date) FROM Transactions;

-- 9. Views & CTE (10 Queries) – Create/Use Views, CTE with recursion.
-- These create reusable query structures.

-- 81. -- Create a view for customer accounts with balances.  
    CREATE VIEW CustomerAccounts AS SELECT c.name, a.balance, a.account_type FROM Customers c JOIN Accounts a ON c.customer_id = a.customer_id;

-- . -- Use the view: Select from CustomerAccounts.  
    SELECT * FROM CustomerAccounts;

-- 83. -- Create a CTE for transactions with account types.  
    WITH TransactionDetails AS (SELECT t.transaction_id, a.account_type FROM Transactions t JOIN Accounts a ON t.account_id = a.account_id) SELECT * FROM TransactionDetails;

-- 84. -- Recursive CTE: Branch hierarchy (assuming parent_id).  
    WITH RECURSIVE BranchHierarchy AS (SELECT branch_id, name, parent_id FROM Branches WHERE parent_id IS NULL UNION ALL SELECT b.branch_id, b.name, b.parent_id FROM Branches b JOIN BranchHierarchy bh ON b.parent_id = bh.branch_id) SELECT * FROM BranchHierarchy;

-- 85. -- Create a view for account counts per branch.  
    CREATE VIEW AccountCount AS SELECT branch_id, COUNT(*) AS acc_count FROM Accounts GROUP BY branch_id;

-- 86. -- Use the view: Select from AccountCount.  
    SELECT * FROM AccountCount;

-- 87. -- CTE for average loan amounts per customer.  
    WITH AvgLoans AS (SELECT customer_id, AVG(amount) AS avg_amount FROM Loans GROUP BY customer_id) SELECT * FROM AvgLoans;

-- 88. -- Recursive CTE: Chain of related accounts (assuming related_id).  
    WITH RECURSIVE AccountChain AS (SELECT account_id, balance FROM Accounts WHERE account_id = 1 UNION ALL SELECT a.account_id, a.balance FROM Accounts a JOIN AccountChain ac ON a.related_id = ac.account_id) SELECT * FROM AccountChain;

-- 89. -- Create a view for transactions with customer names.  
    CREATE VIEW TransactionCustomers AS SELECT t.amount, c.name FROM Transactions t JOIN Accounts a ON t.account_id = a.account_id JOIN Customers c ON a.customer_id = c.customer_id;

-- 90. -- Use the view: Select from TransactionCustomers.  
    SELECT * FROM TransactionCustomers;

-- 10. Stored Procedures (5 Queries) – CRUD operations.
-- These define procedures for data operations.

-- 91. -- Stored procedure to insert a new customer.  
    CREATE PROCEDURE InsertCustomer(IN id INT, IN name VARCHAR(100), IN email VARCHAR(100), IN phone VARCHAR(15)) BEGIN INSERT INTO Customers VALUES (id, name, email, phone); END;

-- 92. -- Stored procedure to update an account's balance.  
    CREATE PROCEDURE UpdateAccountBalance(IN id INT, IN new_balance DECIMAL(10,2)) BEGIN UPDATE Accounts SET balance = new_balance WHERE account_id = id; END;

-- 93. -- Stored procedure to delete a transaction.  
    CREATE PROCEDURE DeleteTransaction(IN id INT) BEGIN DELETE FROM Transactions WHERE transaction_id = id; END;

-- 94. -- Stored procedure to select accounts by customer.  
    CREATE PROCEDURE GetAccountsByCustomer(IN cust_id INT) BEGIN SELECT * FROM Accounts WHERE customer_id = cust_id; END;

-- -95. -- Stored procedure to insert a loan.  
    CREATE PROCEDURE InsertLoan(IN id INT, IN cust_id INT, IN amt DECIMAL(10,2), IN rate DECIMAL(5,2)) BEGIN INSERT INTO Loans VALUES (id, cust_id, amt, rate); END;

-- 11. Window Functions (5 Queries) – RANK(), ROW_NUMBER(), LEAD(), LAG().
-- These use window functions for ranking and navigation over result sets.

-- 96. -- Window function: Rank accounts by balance within branch.  
    SELECT account_id, balance, branch_id, RANK() OVER (PARTITION BY branch_id ORDER BY balance DESC) AS balance_rank FROM Accounts;

 -- 97. -- Window function: Assign row numbers to transactions by date.  
    SELECT transaction_id, transaction_date, ROW_NUMBER() OVER (ORDER BY transaction_date DESC) AS row_num FROM Transactions;

-- 98. -- Window function: Lead to get next transaction amount per account.  
    SELECT account_id, amount, LEAD(amount) OVER (PARTITION BY account_id ORDER BY transaction_date) AS next_amount FROM Transactions;

-- 99. -- Window function: Lag to get previous balance per account.  
    SELECT account_id, balance, LAG(balance) OVER (PARTITION BY account_id ORDER BY account_id) AS prev_balance FROM Accounts;

-- 100. -- Window function: Dense rank for loans by amount.  
     SELECT loan_id, amount, DENSE_RANK() OVER (ORDER BY amount DESC) AS amount_rank FROM