--# SQL Assignment Solutions - Complete Guide


-- EmployeeDetails Table
CREATE TABLE EmployeeDetails (
    EmpId INT PRIMARY KEY,
    FullName VARCHAR(100),
    ManagerId INT,
    DateOfJoining DATE,
    City VARCHAR(100)
);

-- EmployeeSalary Table
CREATE TABLE EmployeeSalary (
    EmpId INT,
    Project VARCHAR(50),
    Salary DECIMAL(10, 2),
    Variable DECIMAL(10, 2),
    FOREIGN KEY (EmpId) REFERENCES EmployeeDetails(EmpId)
);


---# Data Insertion

-- Insert EmployeeDetails records
INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, DateOfJoining, City) VALUES
(101, 'Alice Johnson', 321, '2022-05-15', 'New York'),
(102, 'Bob Smith', 876, '2020-03-12', 'Los Angeles'),
(103, 'Charlie Brown', 986, '2021-08-23', 'Chicago'),
(104, 'David Williams', 876, '2019-11-05', 'Houston'),
(105, 'Eve Davis', 321, '2023-01-07', 'Phoenix'),
(106, 'Frank Miller', 986, '2018-12-19', 'Philadelphia'),
(107, 'Grace Wilson', 876, '2022-03-28', 'San Antonio'),
(108, 'Hank Moore', 321, '2021-09-14', 'San Diego'),
(109, 'Ivy Taylor', 986, '2020-02-11', 'Dallas'),
(110, 'Jack Anderson', 876, '2022-11-30', 'San Jose'),
(111, 'Karen Thomas', 321, '2021-07-16', 'Austin'),
(112, 'Liam Jackson', 986, '2023-04-21', 'Fort Worth'),
(113, 'Mia White', 876, '2019-06-03', 'Columbus'),
(114, 'Noah Harris', 321, '2020-12-10', 'Charlotte'),
(115, 'Olivia Martin', 986, '2021-10-25', 'San Francisco'),
(116, 'Paul Garcia', 876, '2023-07-18', 'Indianapolis'),
(117, 'Quinn Martinez', 321, '2022-09-07', 'Seattle'),
(118, 'Rachel Rodriguez', 986, '2020-01-15', 'Denver'),
(119, 'Steve Clark', 876, '2021-03-19', 'Washington'),
(120, 'Tina Lewis', 321, '2019-08-31', 'Boston');

-- Insert EmployeeSalary records
INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable) VALUES
(101, 'P1', 7500, 500),
(102, 'P2', 9200, 700),
(103, 'P1', 6700, 600),
(104, 'P3', 8300, 900),
(105, 'P2', 7800, 800),
(106, 'P3', 9100, 1000),
(107, 'P1', 6200, 400),
(108, 'P2', 8800, 750),
(109, 'P3', 9500, 1100),
(110, 'P1', 7200, 650),
(111, 'P2', 8700, 850),
(112, 'P3', 9300, 1200),
(113, 'P1', 7900, 550),
(114, 'P2', 6800, 450),
(115, 'P3', 8400, 900),
(116, 'P1', 7600, 500),
(117, 'P2', 8900, 1000),
(118, 'P3', 9200, 1100),
(119, 'P1', 8100, 600),
(120, 'P2', 8300, 750);


--- PART 1 - Basics and Intermediate Questions

---# Q1) SQL Query to fetch records that are present in one table but not in another table

-- Records in EmployeeDetails but not in EmployeeSalary
SELECT ed.EmpId, ed.FullName
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId
WHERE es.EmpId IS NULL;

-- Records in EmployeeSalary but not in EmployeeDetails
SELECT es.EmpId, es.Project
FROM EmployeeSalary es
LEFT JOIN EmployeeDetails ed ON es.EmpId = ed.EmpId
WHERE ed.EmpId IS NULL;


---# Q2) SQL query to fetch all the employees who are not working on any project

SELECT ed.EmpId, ed.FullName
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId
WHERE es.Project IS NULL;


---# Q3) SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020

SELECT *
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;


---# Q4) Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary

SELECT ed.*
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;


---# Q5) Write an SQL query to fetch a project-wise count of employees

SELECT Project, COUNT(*) as EmployeeCount
FROM EmployeeSalary
GROUP BY Project;


---# Q6) Fetch employee names and salaries even if the salary value is not present for the employee

SELECT ed.FullName, es.Salary, es.Variable
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;


---# Q7) Write an SQL query to fetch all the Employees who are also managers

SELECT DISTINCT ed1.EmpId, ed1.FullName
FROM EmployeeDetails ed1
INNER JOIN EmployeeDetails ed2 ON ed1.EmpId = ed2.ManagerId;


---# Q8) Write an SQL query to fetch duplicate records from EmployeeDetails

SELECT FullName, ManagerId, DateOfJoining, City, COUNT(*) as DuplicateCount
FROM EmployeeDetails
GROUP BY FullName, ManagerId, DateOfJoining, City
HAVING COUNT(*) > 1;


---# Q9) Write an SQL query to fetch only odd rows from the table

SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY EmpId) as RowNum
    FROM EmployeeDetails
) as NumberedRows
WHERE RowNum % 2 = 1;


---# Q10) Write a query to find the 3rd highest salary from a table without top or limit keyword

SELECT DISTINCT Salary
FROM EmployeeSalary s1
WHERE 3 = (
    SELECT COUNT(DISTINCT Salary)
    FROM EmployeeSalary s2
    WHERE s2.Salary >= s1.Salary
);


--- PART 2 - Intermediate Questions

---# Q1) Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – '986'

SELECT EmpId, FullName
FROM EmployeeDetails
WHERE ManagerId = 986;


---# Q2) Write an SQL query to fetch the different projects available from the EmployeeSalary table

SELECT DISTINCT Project
FROM EmployeeSalary;


---# Q3) Write an SQL query to fetch the count of employees working in project 'P1'

SELECT COUNT(*) as EmployeeCount
FROM EmployeeSalary
WHERE Project = 'P1';


---# Q4) Write an SQL query to find the maximum, minimum, and average salary of the employees

SELECT 
    MAX(Salary) as MaxSalary,
    MIN(Salary) as MinSalary,
    AVG(Salary) as AvgSalary
FROM EmployeeSalary;


---# Q5) Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000

SELECT EmpId
FROM EmployeeSalary
WHERE Salary BETWEEN 9000 AND 15000;


---# Q6) Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321

SELECT *
FROM EmployeeDetails
WHERE City = 'Toronto' AND ManagerId = 321;


---# Q7) Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321

SELECT *
FROM EmployeeDetails
WHERE City = 'California' OR ManagerId = 321;


---# Q8) Write an SQL query to fetch all those employees who work on Projects other than P1

SELECT ed.*, es.Project
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.EmpId = es.EmpId
WHERE es.Project != 'P1';


---# Q9) Write an SQL query to display the total salary of each employee adding the Salary with Variable value

SELECT 
    ed.EmpId,
    ed.FullName,
    es.Salary,
    es.Variable,
    (es.Salary + es.Variable) as TotalSalary
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;


---# Q10) Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text "hn" and ends with any sequence of characters

SELECT *
FROM EmployeeDetails
WHERE FullName LIKE '__hn%';


--- PART 3 - Advanced String and Set Operations

---# Q1) Write an SQL query to fetch all the EmpIds which are present in either of the tables – 'EmployeeDetails' and 'EmployeeSalary'

SELECT EmpId FROM EmployeeDetails
UNION
SELECT EmpId FROM EmployeeSalary;


---# Q2) Write an SQL query to fetch common records between two tables

SELECT ed.EmpId, ed.FullName
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;


---# Q3) Write an SQL query to fetch records that are present in one table but not in another table

-- Records in EmployeeDetails but not in EmployeeSalary
SELECT ed.EmpId, ed.FullName
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId
WHERE es.EmpId IS NULL;


---# Q4) Write an SQL query to fetch the EmpIds that are present in both the tables – 'EmployeeDetails' and 'EmployeeSalary'

SELECT ed.EmpId
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;


---# Q5) Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary

SELECT ed.EmpId
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId
WHERE es.EmpId IS NULL;


---# Q6) Write an SQL query to fetch the employee's full names and replace the space

SELECT 
    EmpId,
    FullName,
    REPLACE(FullName, ' ', '_') as ModifiedName
FROM EmployeeDetails;


---# Q7) Write an SQL query to fetch the position of a given character(s) in a field

-- Find position of 'a' in FullName
SELECT 
    EmpId,
    FullName,
    CHARINDEX('a', FullName) as PositionOfA
FROM EmployeeDetails;


---# Q8) Write an SQL query to display both the EmpId and ManagerId together

SELECT 
    EmpId,
    ManagerId,
    CONCAT(EmpId, '-', ManagerId) as EmpId_ManagerId
FROM EmployeeDetails;


---# Q9) Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table

SELECT 
    EmpId,
    FullName,
    LEFT(FullName, CHARINDEX(' ', FullName) - 1) as FirstName
FROM EmployeeDetails
WHERE CHARINDEX(' ', FullName) > 0;


---# Q10) Write an SQL query to uppercase the name of the employee and lowercase the city values

SELECT 
    EmpId,
    UPPER(FullName) as UppercaseName,
    LOWER(City) as LowercaseCity
FROM EmployeeDetails;


--- PART 4 - Advanced Functions and Operations

---# Q1) Write an SQL query to find the count of the total occurrences of a particular character – 'n' in the FullName field

SELECT 
    EmpId,
    FullName,
    (LEN(FullName) - LEN(REPLACE(FullName, 'n', ''))) as CountOfN
FROM EmployeeDetails;


---# Q2) Write an SQL query to update the employee names by removing leading and trailing spaces

UPDATE EmployeeDetails
SET FullName = TRIM(FullName);


---# Q3) Fetch all the employees who are not working on any project

SELECT ed.EmpId, ed.FullName
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId
WHERE es.Project IS NULL;


---# Q4) Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000

SELECT ed.FullName, es.Salary
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.EmpId = es.EmpId
WHERE es.Salary BETWEEN 5000 AND 10000;


---# Q5) Write an SQL query to find the current date-time

SELECT CURRENT_TIMESTAMP as CurrentDateTime;
-- Alternative: SELECT NOW() as CurrentDateTime;


---# Q6) Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020

SELECT *
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;


---# Q7) Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table

SELECT ed.*
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;


---# Q8) Write an SQL query to fetch the project-wise count of employees sorted by project's count in descending order

SELECT Project, COUNT(*) as EmployeeCount
FROM EmployeeSalary
GROUP BY Project
ORDER BY COUNT(*) DESC;


---# Q9) Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee

SELECT 
    ed.EmpId,
    ed.FullName,
    es.Salary,
    es.Variable,
    es.Project
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;


---# Q10) Write an SQL query to join 3 tables

-- Creating a third table for demonstration
CREATE TABLE EmployeeProjects (
    EmpId INT,
    ProjectName VARCHAR(50),
    StartDate DATE,
    FOREIGN KEY (EmpId) REFERENCES EmployeeDetails(EmpId)
);

-- Sample data for the third table
INSERT INTO EmployeeProjects VALUES
(101, 'Project Alpha', '2022-01-01'),
(102, 'Project Beta', '2021-06-15'),
(103, 'Project Gamma', '2022-03-10');

-- Query to join 3 tables
SELECT 
    ed.EmpId,
    ed.FullName,
    es.Salary,
    ep.ProjectName,
    ep.StartDate
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.EmpId = es.EmpId
INNER JOIN EmployeeProjects ep ON ed.EmpId = ep.EmpId;

