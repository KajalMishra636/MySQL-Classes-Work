-- single line comments

/*
Multiline 
Comments
*/

## This is also used for single line comment in sql

/*
Usage of Comments

1. Documentation: Comments can be used to document the purpose of a SQL query or the logic 
behind complex operations.
2.Debugging: You can temporarily disable parts of your SQL code by commenting them out, 
which is useful for debugging.
3. Collaboration: When working in teams, comments help communicate the intent and 
functionality of the code to other developers.
*/


-- ---------------------------------------------- Database Queries -----------------------------------------------

-- create a database
Create database Sahyog;

-- to work on it, you need to use it first
use sahyog;

-- delete database
-- to execute query(ctrl+enter)
drop database Sahyog;

-- SQL is not a case sensitive language, ex- AGE or Age or age will be treated as same word

-- ---------------------------------------- Database Analysis ----------------------------------------

/*
T1 : Student(id,name,std,address,age)

T2 : Teachers(TeacherID,Name,Subject,Experience,Email)

T3 : Classes(ClassID,ClassName,Section,TotalStudents,TeacherID)

T4 : Subjects(SubjectID,SubjectName,Credits,ClassID)

T5 : Exams(ExamID,ExamName,Date,TotalMarks,ClassID)

T6 : Attendance(AttendanceID,StudentID,ClassID,Date,Status)

T7 : Grades(GradeID,StudentID,SubjectID,Marks)

T8 : Library(BookID,Title,Author,ISBN,AvailableCopies)

T9 : ExtracurricularActivities(ActivityID,ActivityName,Description,ClassID)

T10: ParentDetails(ParentID,StudentID,ParentName,Relationship,ContactNumber)

*/

-- --------------------------------------- Basic Concepts -----------------------------------------------------

/*
Data types: ensure types of data and size of data to br stored in an attributes'
               ex. int ,varchar(10),date..
              
Constraint : used to apply some rules /restriction on a attribute
             ex. unique,not null,primary key

Commands : used to interact with database and tables as - 
		   DDL(Data Definition Language),
           DML(Data Manipulation Language),
           DQL(Data Query Language),
           DCL(Data Control Language),
           TCL(Transaction Control Language)
           ex. ceate,insert,select,drop,truncate....

Clause :used to add some extra information/condition in commmnad 
         ex. select * from student;,
             select* from student where name="kavya".
*/

-- --------------------------------------- Table Related Queries ---------------------------------

-- Table-1 Student

create table Student(
id int primary key,  -- primary key = unique + not null
name varchar(100) not null,
std varchar(10) not null,
address varchar(200),
age int
);

-- to display/retrive table data
select * from student;

-- to insert a single record
insert into Student(id,name,std,address,age)
values 
(1,'Vikram', '1st', 'Dombivli',5);

-- to insert a single record without writing attributes name
insert into Student
values 
(2,'Pranay', '1st', 'Dombivli',5);

-- to insert multiple records together
insert into Student
values 
(3,'Yusuf', '1st', 'Dombivli',5),
(4,'Shoeb', '1st', 'Dombivli',5),
(5,'Kajal', '1st', 'Dombivli',5),
(6,'Trisha', '1st', 'Dombivli',5),
(7,'Khushi', '1st', 'Dombivli',5),
(8,'Mitali', '1st', 'Dombivli',5),
(9,'Anjali', '1st', 'Dombivli',5),
(10,'Priya', '1st', 'Dombivli',5);

-- to remove complete records from table
truncate table student;

-- to remove complete records and attributes from table
drop table student;


-- Table 2: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(100),
    Subject VARCHAR(50),
    Experience INT,
    Email VARCHAR(100)
);

-- to display/retrive table data
select * from Teachers;

INSERT INTO Teachers (TeacherID, Name, Subject, Experience, Email) VALUES
(1, 'Mr. Rajesh Kumar', 'Mathematics', 10, 'rajesh.kumar@example.com'),
(2, 'Ms. Anita Desai', 'Science', 8, 'anita.desai@example.com'),
(3, 'Mr. Sanjay Gupta', 'English', 12, 'sanjay.gupta@example.com'),
(4, 'Ms. Priya Sharma', 'History', 5, 'priya.sharma@example.com'),
(5, 'Mr. Rakesh Mehta', 'Geography', 15, 'rakesh.mehta@example.com');

-- to remove complete records from table
truncate table Teachers;

-- to remove complete records and attributes from table
drop table Teachers;


-- -------------------------------------- Foreign Key -------------------------------------------------------------

/*
What is a Foreign Key in SQL?

--> A Foreign Key is a column (or a set of columns) in one table that refers to the Primary Key in another table.
--> It helps establish a parent-child relationship between tables.
--> A foreign key ensures that the value in the referencing column must exist in the referenced table's primary key.
--> It is used to enforce referential integrity in the database.

Why Use Foreign Keys?

--> To logically connect related data across multiple tables.
--> To avoid data redundancy and maintain normalized database design.
--> To maintain data accuracy and consistency through relationships.
--> To restrict invalid data entries (e.g., preventing a student being assigned to a non-existent class).

Key Properties of Foreign Key:

--> A foreign key refers to a primary key (or unique key) in another table.
--> Multiple foreign keys can exist in a table.
--> The referencing column can accept NULL values (unless explicitly marked NOT NULL).
--> Prevents insertion of invalid values (i.e., values not present in the parent table).
--> Can use ON DELETE or ON UPDATE rules like CASCADE, SET NULL, RESTRICT, etc.
--> Helps implement one-to-many and many-to-one relationships.

Real-World Example – School Database Relationships:

1.  Classes ------- Teachers  
    --> Each class is assigned a teacher.  
    --> Foreign Key: Classes.teacher_id → Teachers.teacher_id

2.  Subjects ------- Classes  
    --> Each subject is taught in a specific class.  
    --> Foreign Key: Subjects.class_id → Classes.class_id

3.  Exams --------- Classes  
    --> Exams are scheduled for each class.  
    --> Foreign Key: Exams.class_id → Classes.class_id

4.  Attendance ---- Classes, Students  
    --> Attendance records are maintained per student per class.  
    --> Foreign Keys: Attendance.student_id → Students.student_id  
                    Attendance.class_id → Classes.class_id

5.  Grades -------- Students, Subjects  
    --> Grades are assigned to students per subject.  
    --> Foreign Keys: Grades.student_id → Students.student_id  
                    Grades.subject_id → Subjects.subject_id

Conclusion:

--> Foreign Keys are essential to maintain structured, connected, and meaningful relational data.
--> They make the database more reliable by enforcing valid references between records.

*/
