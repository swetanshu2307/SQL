-- University Database Management System - Complete Solution
-- ========================================================

-- TASK 1: Database and Table Creation
-- ====================================

-- 1. Create University Database
CREATE DATABASE TechUniversity;
USE TechUniversity;

-- 2. Create College Table
CREATE TABLE College_Table (
    College_ID INT PRIMARY KEY,
    College_Name VARCHAR(100) NOT NULL,
    College_Area VARCHAR(100) NOT NULL
);

-- Create Department Table
CREATE TABLE Department_Table (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100) NOT NULL,
    Dept_Facility VARCHAR(100) NOT NULL,
    College_ID INT,
    FOREIGN KEY (College_ID) REFERENCES College_Table(College_ID)
);

-- Create Professor Table
CREATE TABLE Professor_Table (
    Professor_ID INT PRIMARY KEY,
    Professor_Name VARCHAR(100) NOT NULL,
    Professor_Subject VARCHAR(100) NOT NULL
);

-- Create Student Table
CREATE TABLE Student_Table (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100) NOT NULL,
    Student_Stream VARCHAR(100) NOT NULL,
    Professor_ID INT,
    FOREIGN KEY (Professor_ID) REFERENCES Professor_Table(Professor_ID)
);

-- 5. Insert Records into College_Table
INSERT INTO College_Table VALUES
(1, 'College of Engineering', 'North Campus'),
(2, 'College of Arts', 'South Campus'),
(3, 'College of Science', 'East Campus'),
(4, 'College of Commerce', 'West Campus'),
(5, 'College of Medicine', 'Central Campus'),
(6, 'College of Agriculture', 'Rural Campus'),
(7, 'College of Architecture', 'Downtown'),
(8, 'College of Pharmacy', 'Medical District'),
(9, 'College of Law', 'Legal District'),
(10, 'College of Education', 'Academic Area');

-- Insert Records into Department_Table
INSERT INTO Department_Table VALUES
(1, 'Computer Science', 'Advanced Lab Facility', 1),
(2, 'Mechanical Engineering', 'Workshop Facility', 1),
(3, 'English Literature', 'Library Facility', 2),
(4, 'Fine Arts', 'Studio Facility', 2),
(5, 'Physics', 'Research Lab', 3),
(6, 'Chemistry', 'Chemical Lab', 3),
(7, 'Finance', 'Trading Floor', 4),
(8, 'Marketing', 'Case Study Room', 4),
(9, 'General Medicine', 'Hospital Facility', 5),
(10, 'Crop Science', 'Field Station', 6);

-- Insert Records into Professor_Table
INSERT INTO Professor_Table VALUES
(1, 'Dr. John Smith', 'Data Structures'),
(2, 'Dr. Sarah Johnson', 'Thermodynamics'),
(3, 'Dr. Michael Brown', 'Shakespeare Studies'),
(4, 'Dr. Emily Davis', 'Modern Art'),
(5, 'Dr. Robert Wilson', 'Quantum Physics'),
(6, 'Dr. Lisa Anderson', 'Organic Chemistry'),
(7, 'Dr. David Miller', 'Financial Management'),
(8, 'Dr. Jennifer Taylor', 'Consumer Behavior'),
(9, 'Dr. Christopher Lee', 'Internal Medicine'),
(10, 'Dr. Amanda White', 'Plant Pathology');

-- Insert Records into Student_Table
INSERT INTO Student_Table VALUES
(1, 'Alice Cooper', 'Computer Science', 1),
(2, 'Bob Johnson', 'Mechanical Engineering', 2),
(3, 'Charlie Brown', 'English Literature', 3),
(4, 'Diana Prince', 'Fine Arts', 4),
(5, 'Edward Norton', 'Physics', 5),
(6, 'Fiona Apple', 'Chemistry', 6),
(7, 'George Lucas', 'Finance', 7),
(8, 'Hannah Montana', 'Marketing', 8),
(9, 'Ian Fleming', 'Medicine', 9),
(10, 'Julia Roberts', 'Agriculture', 10);

-- ====================================
-- TASK 2: Basic Queries and Modifications
-- ====================================

-- 1. Give the information of College_ID and College_name from College_Table
SELECT College_ID, College_Name 
FROM College_Table;

-- 2. Show Top 5 rows from Student table
SELECT TOP 5 * FROM Student_Table;


-- 3. What is the name of professor whose ID is 5
SELECT Professor_Name 
FROM Professor_Table 
WHERE Professor_ID = 5;

-- 4. Convert the name of the Professor into Upper case
SELECT Professor_ID, UPPER(Professor_Name) AS Professor_Name_Upper, Professor_Subject
FROM Professor_Table;

-- 5. Show me the names of those students whose name starts with 'a'
SELECT Student_Name 
FROM Student_Table 
WHERE Student_Name LIKE 'A%';

-- 6. Give the name of those colleges whose name ends with 'a'
SELECT College_Name 
FROM College_Table 
WHERE College_Name LIKE '%a';

-- 7. Add one Salary Column in Professor_Table
ALTER TABLE Professor_Table 
ADD Salary DECIMAL(10,2);

-- Update salary values for demonstration
UPDATE Professor_Table SET Salary = 75000 WHERE Professor_ID = 1;
UPDATE Professor_Table SET Salary = 80000 WHERE Professor_ID = 2;
UPDATE Professor_Table SET Salary = 70000 WHERE Professor_ID = 3;
UPDATE Professor_Table SET Salary = 72000 WHERE Professor_ID = 4;
UPDATE Professor_Table SET Salary = 85000 WHERE Professor_ID = 5;
UPDATE Professor_Table SET Salary = 78000 WHERE Professor_ID = 6;
UPDATE Professor_Table SET Salary = 82000 WHERE Professor_ID = 7;
UPDATE Professor_Table SET Salary = 76000 WHERE Professor_ID = 8;
UPDATE Professor_Table SET Salary = 90000 WHERE Professor_ID = 9;
UPDATE Professor_Table SET Salary = 74000 WHERE Professor_ID = 10;

-- 8. Add one Contact Column in Student_table
ALTER TABLE Student_Table 
ADD Contact VARCHAR(15);

-- Update contact values for demonstration
UPDATE Student_Table SET Contact = '9876543210' WHERE Student_ID = 1;
UPDATE Student_Table SET Contact = '9876543211' WHERE Student_ID = 2;
UPDATE Student_Table SET Contact = '9876543212' WHERE Student_ID = 3;
UPDATE Student_Table SET Contact = '9876543213' WHERE Student_ID = 4;
UPDATE Student_Table SET Contact = '9876543214' WHERE Student_ID = 5;
UPDATE Student_Table SET Contact = '9876543215' WHERE Student_ID = 6;
UPDATE Student_Table SET Contact = '9876543216' WHERE Student_ID = 7;
UPDATE Student_Table SET Contact = '9876543217' WHERE Student_ID = 8;
UPDATE Student_Table SET Contact = '9876543218' WHERE Student_ID = 9;
UPDATE Student_Table SET Contact = '9876543219' WHERE Student_ID = 10;

-- 9. Find the total Salary of Professor
SELECT SUM(Salary) AS Total_Salary 
FROM Professor_Table;

-- 10. Change datatype of any one column of any one Table
ALTER TABLE Student_Table 
ALTER COLUMN Contact VARCHAR(20);

-- ====================================
-- TASK 3: Advanced Queries and Operations
-- ====================================

-- 1. Show first 5 records from Students table and Professor table Combined
SELECT TOP 5 'Student' AS Type, Student_ID AS ID, Student_Name AS Name, Student_Stream AS Details
FROM Student_Table
UNION ALL
SELECT TOP 5 'Professor' AS Type, Professor_ID AS ID, Professor_Name AS Name, Professor_Subject AS Details
FROM Professor_Table;



-- 2. Apply Inner join on all 4 tables together (Syntax is mandatory)
SELECT 
    c.College_ID, c.College_Name, c.College_Area,
    d.Dept_ID, d.Dept_Name, d.Dept_Facility,
    p.Professor_ID, p.Professor_Name, p.Professor_Subject, p.Salary,
    s.Student_ID, s.Student_Name, s.Student_Stream, s.Contact
FROM College_Table c
INNER JOIN Department_Table d ON c.College_ID = d.College_ID
INNER JOIN Professor_Table p ON d.Dept_ID = p.Professor_ID  -- Assuming logical relationship
INNER JOIN Student_Table s ON p.Professor_ID = s.Professor_ID;

-- 3. Show Some null values from Department table and Professor table
-- First, let's insert some records with NULL values for demonstration
INSERT INTO Department_Table VALUES (11, 'Physics Lab', NULL, 3);
INSERT INTO Department_Table VALUES (12, NULL, 'Research Facility', 3);
INSERT INTO Professor_Table VALUES (11, 'Dr. Test Professor', NULL);

-- Query to show NULL values
SELECT 'Department' as Table_Name, Dept_ID, Dept_Name, Dept_Facility
FROM Department_Table 
WHERE Dept_Name IS NULL OR Dept_Facility IS NULL
UNION ALL
SELECT 'Professor' as Table_Name, Professor_ID, Professor_Name, Professor_Subject
FROM Professor_Table 
WHERE Professor_Name IS NULL OR Professor_Subject IS NULL;

-- 4. Create a View from College Table and give those records whose college name starts with C
CREATE VIEW College_Starting_With_C AS
SELECT College_ID, College_Name, College_Area
FROM College_Table
WHERE College_Name LIKE 'C%';

-- Query the view
SELECT * FROM College_Starting_With_C;

-- 5. Create Stored Procedure of Professor table - show whole records for given Professor ID


CREATE PROCEDURE GetProfessorDetails
    @prof_id INT
AS
BEGIN
    SELECT Professor_ID, Professor_Name, Professor_Subject, Salary
    FROM Professor_Table
    WHERE Professor_ID = @prof_id;
END;

Execute: EXEC GetProfessorDetails @prof_id = 5;

-- 6. Rename the College_Table to College_Tables_Data

EXEC sp_rename 'College_Table', 'College_Tables_Data';


SELECT * FROM College_Tables_Data;

