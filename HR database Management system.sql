--HR Database Management System - Complete Solutions

--Database Overview

--The HR Database consists of 7 interconnected tables:
- --employees-- (40 records) - Employee information
- --jobs-- (11 records) - Job titles and salary ranges
- --departments-- (11 records) - Department information
- --dependents-- (30 records) - Employee dependents
- --locations-- (7 records) - Department locations
- --countries-- (25 records) - Country information
- --regions-- (4 records) - Regional groupings

---

--## TASK 1: Basic SQL Queries

---- 1) SELECT Statements

Create  database HRDatabaseManagementSystem;

use HRDatabaseManagementSystem;

CREATE TABLE regions (
region_id INT PRIMARY KEY,
region_name VARCHAR (25) DEFAULT NULL
);

CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40) DEFAULT NULL,
    region_id INT NOT NULL,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(40) DEFAULT NULL,
    postal_code VARCHAR(12) DEFAULT NULL,
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25) DEFAULT NULL,
    country_id CHAR(2) NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);CREATE TABLE jobs (
job_id INT PRIMARY KEY,
job_title VARCHAR (35) NOT NULL,
min_salary DECIMAL (8, 2) DEFAULT NULL,
max_salary DECIMAL (8, 2) DEFAULT NULL
);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    location_id INT DEFAULT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(20) DEFAULT NULL,
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) DEFAULT NULL,
    hire_date DATE NOT NULL,
    job_id INT NOT NULL,
    salary DECIMAL(8,2) NOT NULL,
    manager_id INT DEFAULT NULL,
    department_id INT DEFAULT NULL,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);CREATE TABLE dependents (
    dependent_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    relationship VARCHAR(25) NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);/*Data for the table regions */INSERT INTO regions(region_id,region_name) VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name)
VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name)
VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name)
VALUES (4,'Middle East and Africa');/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id)VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('ZW','Zimbabwe',4);/*Data for the table locations */

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2700,'Schwanthalerstr 7031','80925','Munich','Bavaria','DE');/*Data for the table jobs */

INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (1,'Public Accountant',420000,900000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (2,'Accounting Manager',820000,1600000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (3,'Administration Assistant',300000,600000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (4,'President',2000000,4000000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (5,'Administration Vice President',1500000,3000000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (6,'Accountant',420000,900000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (7,'Finance Manager',820000,1600000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (8,'Human Resources Representative',400000,900000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (9,'Programmer',400000,1000000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (10,'Marketing Manager',900000,1500000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (11,'Marketing Representative',400000,900000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)VALUES (12,'Public Relations Representative',450000,1050000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (13,'Purchasing Clerk',250000,550000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (14,'Purchasing Manager',800000,1500000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (15,'Sales Manager',1000000,2000000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (16,'Sales Representative',600000,1200000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (17,'Shipping Clerk',250000,550000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (18,'Stock Clerk',200000,500000);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (19,'Stock Manager',550000,850000);

/*Data for the table departments */

INSERT INTO departments(department_id,department_name,location_id)
VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (4,'Human Resources',2400);INSERT INTO departments(department_id,department_name,location_id)
VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (11,'Accounting',1700);


/*Data for the table employees */

INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (100,'Steven','King','stevenking@sqltutorialorg','5151234567','1987-06-17',4,2400000,NULL,9);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,
department_id)
VALUES (101,'Neena','Kochhar','neenakochhar@sqltutorialorg','5151234568','1989-09-21',5,1700000,100,9);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)VALUES (102,'Lex','De Haan','lexde haan@sqltutorialorg','5151234569','1993-01-13',5,1700000,100,9);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (103,'Alexander','Hunold','alexanderhunold@sqltutorialorg','5904234567','1990-01-03',9,900000,102,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (104,'Bruce','Ernst','bruceernst@sqltutorialorg','5904234568','1991-05-21',9,600000,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (105,'David','Austin','davidaustin@sqltutorialorg','5904234569','1997-06-25',9,480000,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (106,'Valli','Pataballa','vallipataballa@sqltutorialorg','5904234560','1998-02-05',9,480000,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (107,'Diana','Lorentz','dianalorentz@sqltutorialorg','5904235567','1999-02-07',9,420000,103,6);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (108,'Nancy','Greenberg','nancygreenberg@sqltutorialorg','5151244569','1994-08-17',7,1200000,101,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)VALUES (109,'Daniel','Faviet','danielfaviet@sqltutorialorg','5151244169','1994-08-16',6,900000,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (110,'John','Chen','johnchen@sqltutorialorg','5151244269','1997-09-28',6,820000,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (111,'Ismael','Sciarra','ismaelsciarra@sqltutorialorg','5151244369','1997-09-30',6,770000,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (112,'Jose Manuel','Urman','jose manuelurman@sqltutorialorg','5151244469','1998-03-07',6,780000,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (113,'Luis','Popp','luispopp@sqltutorialorg','5151244567','1999-12-07',6,690000,108,10);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (114,'Den','Raphaely','denraphaely@sqltutorialorg','5151274561','1994-12-07',14,1100000,100,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (115,'Alexander','Khoo','alexanderkhoo@sqltutorialorg','5151274562','1995-05-18',13,310000,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (116,'Shelli','Baida','shellibaida@sqltutorialorg','5151274563','1997-12-24',13,290000,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (117,'Sigal','Tobias','sigaltobias@sqltutorialorg','5151274564','1997-07-24',13,280000,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (118,'Guy','Himuro','guyhimuro@sqltutorialorg','5151274565','1998-11-15',13,260000,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (119,'Karen','Colmenares','karencolmenares@sqltutorialorg','5151274566','1999-08-10',13,250000,114,3);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (120,'Matthew','Weiss','matthewweiss@sqltutorialorg','6501231234','1996-07-18',19,800000,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (121,'Adam','Fripp','adamfripp@sqltutorialorg','6501232234','1997-04-10',19,820000,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (122,'Payam','Kaufling','payamkaufling@sqltutorialorg','6501233234','1995-05-01',19,790000,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (123,'Shanta','Vollman','shantavollman@sqltutorialorg','6501234234','1997-10-10',19,650000,100,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (126,'Irene','Mikkilineni','irenemikkilineni@sqltutorialorg','6501241224','1998-09-28',18,270000,120,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (145,'John','Russell','johnrussell@sqltutorialorg',NULL,'1996-10-01',15,1400000,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (146,'Karen','Partners','karenpartners@sqltutorialorg',NULL,'1997-01-05',15,1350000,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (176,'Jonathon','Taylor','jonathontaylor@sqltutorialorg',NULL,'1998-03-24',16,860000,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (177,'Jack','Livingston','jacklivingston@sqltutorialorg',NULL,'1998-04-23',16,840000,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (178,'Kimberely','Grant','kimberelygrant@sqltutorialorg',NULL,'1999-05-24',16,700000,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (179,'Charles','Johnson','charlesjohnson@sqltutorialorg',NULL,'2000-01-04',16,620000,100,8);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (192,'Sarah','Bell','sarahbell@sqltutorialorg','6505011876','1996-02-04',17,400000,123,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (193,'Britney','Everett','britneyeverett@sqltutorialorg','6505012876','1997-03-03',17,390000,123,5);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (200,'Jennifer','Whalen','jenniferwhalen@sqltutorialorg','5151234444','1987-09-17',3,440000,101,1);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (201,'Michael','Hartstein','michaelhartstein@sqltutorialorg','5151235555','1996-02-17',10,1300000,100,2);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (202,'Pat','Fay','patfay@sqltutorialorg','6031236666','1997-08-17',11,600000,201,2);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (203,'Susan','Mavris','susanmavris@sqltutorialorg','5151237777','1994-06-07',8,650000,101,4);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (204,'Hermann','Baer','hermannbaer@sqltutorialorg','5151238888','1994-06-07',12,1000000,101,7);
INSERT INTO
employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (205,'Shelley','Higgins','shelleyhiggins@sqltutorialorg','5151238080','1994-06-07',2,1200000,101,11);

/*Data for the table dependents */

INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
VALUES (30,'Sandra','Taylor','Child',176);
--A Get data from all rows and columns in employees table:--

SELECT * FROM employees;

--B Select employee_id, first_name, last_name, and hire_date:--

SELECT employee_id, first_name, last_name, hire_date 
FROM employees;


--C Get first name, last name, salary, and new salary:--

SELECT first_name, last_name, salary 
FROM employees;

--D Increase salary two times and name as New_SALARY:--

SELECT first_name, last_name, salary, salary * 2 AS New_SALARY 
FROM employees;

-- 2) ORDER BY Statements

--A Return employee_id, first_name, last_name, hire_date, and salary:--

SELECT employee_id, first_name, last_name, hire_date, salary 
FROM employees 
ORDER BY employee_id;

--B Sort employees by first names in alphabetical order:--

SELECT * FROM employees 
ORDER BY first_name ASC;


----C Sort by first name ascending and last name descending:--

SELECT * FROM employees 
ORDER BY first_name ASC, last_name DESC;


--D Sort employees by salary from high to low:--

SELECT * FROM employees 
ORDER BY salary DESC;


--E Sort employees by hire_date column:--

SELECT * FROM employees 
ORDER BY hire_date;


--F Sort employees by hire dates in descending order:--

SELECT * FROM employees 
ORDER BY hire_date DESC;


-- 3) DISTINCT Statements

--A Select salary data sorted from high to low:--

SELECT DISTINCT salary FROM employees 
ORDER BY salary DESC;


--B Select unique values from salary column:--

SELECT DISTINCT salary FROM employees;


--C Select job_id and salary from employees table:--

SELECT job_id, salary FROM employees;


--D Remove duplicate values in job_id and salary:--

SELECT DISTINCT job_id, salary FROM employees;


--E Return distinct phone numbers of employees:--

SELECT DISTINCT phone_number FROM employees;


-- 4) TOP N Statements

--A Return all rows sorted by first_name:--

SELECT * FROM employees 
ORDER BY first_name;


--B Return first 5 rows in result set:--

SELECT TOP 5 * FROM employees 
ORDER BY first_name;


--C Return five rows starting from 4th row:--

SELECT * FROM employees 
ORDER BY first_name 
OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY;


--D Get top five employees with highest salaries:--

SELECT TOP 5 * FROM employees 
ORDER BY salary DESC;


--E Get employees with 2nd highest salary:--

SELECT * FROM employees 
WHERE salary = (
    SELECT DISTINCT salary FROM employees 
    ORDER BY salary DESC 
    OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY
);


-- 5) WHERE Clause and Comparison Operators

--A Find employees with salaries greater than 14,000:--

SELECT * FROM employees 
WHERE salary > 14000 
ORDER BY salary DESC;


--B Find employees in department id 5:--

SELECT * FROM employees 
WHERE department_id = 5;


--C Find employee with last name Chen:--

SELECT * FROM employees 
WHERE last_name = 'Chen';


--D Get employees who joined after January 1st, 1999:--

SELECT * FROM employees 
WHERE hire_date > '1999-01-01';


--E Find employees who joined in 1999:--

SELECT * FROM employees 
WHERE YEAR(hire_date) = 1999;


--F Find employee with last name Himuro:--

SELECT * FROM employees 
WHERE last_name = 'Himuro';


--G Search for string 'Himuro' in last_name:--

SELECT * FROM employees 
WHERE last_name LIKE '%Himuro%';


--H Find employees without phone numbers:--

SELECT * FROM employees 
WHERE phone_number IS NULL;


--I Return employees whose department id is not 8:--

SELECT * FROM employees 
WHERE department_id <> 8;


--J Find employees whose department id is not 8 and 10:--

SELECT * FROM employees 
WHERE department_id NOT IN (8, 10);


--K Find employees with salary greater than 10,000:--

SELECT * FROM employees 
WHERE salary > 10000;


--L Find employees in department 8 with salary greater than 10,000:--

SELECT * FROM employees 
WHERE department_id = 8 AND salary > 10000;


--M Return employees with salaries less than 10,000:--

SELECT * FROM employees 
WHERE salary < 10000;


--N Find employees with salaries greater than or equal to 9,000:--

SELECT * FROM employees 
WHERE salary >= 9000;


--O Find employees with salaries less than or equal to 9,000:--

SELECT * FROM employees 
WHERE salary <= 9000;


-- 6) ALTER TABLE Statements

--A Add credit_hours column to courses table:--
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) NOT NULL,
    department VARCHAR(50),
    instructor VARCHAR(100)
);

ALTER TABLE courses
ADD credit_hours INT;


--B Add fee and max_limit columns after course_name:--

ALTER TABLE courses 
ADD fee DECIMAL(8,2), max_limit INT;


--C Change fee column to NOT NULL:--

ALTER TABLE courses 
ALTER COLUMN fee DECIMAL(8,2) NOT NULL;


--D Remove fee column:--

ALTER TABLE courses 
DROP COLUMN fee;


--E Remove max_limit and credit_hours columns:--

ALTER TABLE courses 
DROP COLUMN max_limit, credit_hours;


-- 7) Foreign Key Constraints

--A Add foreign key constraint to project_milestones:--

CREATE TABLE project_milestones (
    milestone_id INT PRIMARY KEY,
    project_id INT,
    milestone_name VARCHAR(100) NOT NULL,
    milestone_description TEXT,
    due_date DATE,
    status VARCHAR(20) DEFAULT 'pending',
);

ALTER TABLE project_milestones 
ADD CONSTRAINT fk_project_milestone 
FOREIGN KEY (project_id) REFERENCES projects(project_id);


--B Add foreign key to existing table:--

ALTER TABLE project_milestones 
ADD CONSTRAINT fk_project_milestone 
FOREIGN KEY (project_id) REFERENCES projects(project_id);


---

--## TASK 2: Logical and Special Operators

-- Part 1: Basic Logical Operators

--A Find employees with salaries between 5,000 and 7,000:--

SELECT * FROM employees 
WHERE salary > 5000 AND salary < 7000;


--B Find employees with salary 7,000 or 8,000:--

SELECT * FROM employees 
WHERE salary = 7000 OR salary = 8000;


--C Find employees without phone numbers:--

SELECT * FROM employees 
WHERE phone_number IS NULL;


--D Find employees with salaries between 9,000 and 12,000:--

SELECT * FROM employees 
WHERE salary BETWEEN 9000 AND 12000;


--E Find employees in department 8 or 9:--

SELECT * FROM employees 
WHERE department_id IN (8, 9);


--F Find employees whose first name starts with 'jo':--

SELECT * FROM employees 
WHERE first_name LIKE 'jo%';


--G Find employees whose second character is 'h':--

SELECT * FROM employees 
WHERE first_name LIKE '_h%';


--H Find employees with salaries greater than all in department 8:--

SELECT * FROM employees 
WHERE salary > ALL (
    SELECT salary FROM employees 
    WHERE department_id = 8
);


-- Part 2: Advanced Operators

--A Find employees with salaries greater than average of every department:--
SELECT e.employee_id, e.first_name, e.last_name, e.salary, e.department_id
FROM employees e
JOIN (
    SELECT department_id, AVG(salary) AS avg_dept_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_dept_salary;





--B Find employees who have dependents:--

SELECT DISTINCT e.*
FROM employees e
JOIN dependents d ON e.employee_id = d.employee_id;



--C Find employees with salaries between 2,500 and 2,900:--

SELECT * FROM employees 
WHERE salary BETWEEN 2500 AND 2900;


--D Find employees with salaries NOT between 2,500 and 2,900:--

SELECT * FROM employees 
WHERE salary NOT BETWEEN 2500 AND 2900;


--E Find employees who joined between Jan 1, 1999 and Dec 31, 2000:--

SELECT * FROM employees 
WHERE hire_date BETWEEN '1999-01-01' AND '2000-12-31';


--F Find employees NOT hired between Jan 1, 1989 and Dec 31, 1999:--

SELECT * FROM employees 
WHERE hire_date NOT BETWEEN '1989-01-01' AND '1999-12-31';


--G Find employees who joined between 1990 and 1993:--

SELECT * FROM employees 
WHERE YEAR(hire_date) BETWEEN 1990 AND 1993;


-- Part 3: LIKE Patterns

--A Find employees whose first names start with 'Da':--

SELECT * FROM employees 
WHERE first_name LIKE 'Da%';


--B Find employees whose first names end with 'er':--

SELECT * FROM employees 
WHERE first_name LIKE '%er';


--C Find employees whose last names contain 'an':--

SELECT * FROM employees 
WHERE last_name LIKE '%an%';


--D Find employees whose first names start with 'Jo' and have at most 2 more characters:--

SELECT * FROM employees 
WHERE first_name LIKE 'Jo%' AND LEN(first_name) <= 4;


--E Find employees whose first names have any characters followed by at most one:--

SELECT * FROM employees 
WHERE first_name LIKE '%_';


--F Find employees whose first names start with 'S' but not 'Sh':--

SELECT * FROM employees 
WHERE first_name LIKE 'S%' AND first_name NOT LIKE 'Sh%';


-- Part 4: IN and NOT IN

--A Retrieve employees in department 5:--

SELECT * FROM employees 
WHERE department_id IN (5);


--B Get employees in department 5 with salary not greater than 5000:--

SELECT * FROM employees 
WHERE department_id IN (5) AND salary <= 5000;


--C Get employees not in departments 1, 2, or 3:--

SELECT * FROM employees 
WHERE department_id NOT IN (1, 2, 3);


--D Retrieve employees whose first names don't start with 'D

SELECT * FROM employees 
WHERE first_name NOT LIKE 'D%';


--E Get employees whose salaries are not between 5,000 and 10,000:--

SELECT * FROM employees 
WHERE salary NOT BETWEEN 5000 AND 10000;


-- Part 5: EXISTS and NOT EXISTS

--A Get employees who do not have dependents:--

SELECT e.*
FROM employees e
LEFT JOIN dependents d ON e.employee_id = d.employee_id
WHERE d.dependent_id IS NULL;

SELECT *
FROM employees e
WHERE NOT EXISTS (SELECT 1 FROM dependents d WHERE d.employee_id = e.employee_id);




--B Find employees who do not have phone numbers:--

SELECT * FROM employees 
WHERE phone_number IS NULL;


--C Find employees who have phone numbers:--

SELECT * FROM employees 
WHERE phone_number IS NOT NULL;


---

--## TASK 3: JOINS

-- Inner Join

--A Get information of departments 1, 2, and 3:--

SELECT * FROM departments 
WHERE department_id IN (1, 2, 3);


--B Get employees who work in departments 1, 2, and 3:--

SELECT *
FROM employees
WHERE department_id IN (1, 2, 3);


--C Write a Query to get the first name, last name, job title, and department name of employees who workin department id 1, 2, and 3.

SELECT
    e.first_name,
    e.last_name,
    j.job_title,
    d.department_name
FROM
    employees AS e
JOIN
    jobs AS j ON e.job_id = j.job_id
JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.department_id IN (1, 2, 3);


-- Left Join

--A Query country names of US, UK, and China:--

SELECT * FROM countries 
WHERE country_id IN ('US', 'UK', 'CN');


--B Retrieve locations in US, UK, and China:--

SELECT l.*
FROM locations l
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name IN ('United States of America', 'United Kingdom', 'China');


--C Join countries table with locations table:--

SELECT *
FROM countries co
JOIN locations lo ON co.country_id = lo.country_id;


--D To find the country that does not have any locations in the locations table:

SELECT c.country_name
FROM countries c
LEFT JOIN locations l ON c.country_id = l.country_id
WHERE l.location_id IS NULL;

--E Join 3 tables: regions, countries, and locations:--

SELECT
    r.region_id,
    r.region_name,
    c.country_id,
    c.country_name,
    l.location_id,
    l.street_address,
    l.postal_code,
    l.city,
    l.state_province
FROM
    regions AS r
JOIN
    countries AS c ON r.region_id = c.region_id
JOIN
    locations AS l ON c.country_id = l.country_id;


-- Self Join

--A Query information of who reports to whom:--

SELECT
    E.first_name AS EmployeeFirstName,
    E.last_name AS EmployeeLastName,
    M.first_name AS ManagerFirstName,
    M.last_name AS ManagerLastName
FROM
    employees AS E
JOIN
    employees AS M ON E.manager_id = M.employee_id;

--B Include president in result set:--

SELECT
    E.first_name AS EmployeeFirstName,
    E.last_name AS EmployeeLastName,
    M.first_name AS ManagerFirstName,
    M.last_name AS ManagerLastName
FROM
    employees AS E
LEFT JOIN
    employees AS M ON E.manager_id = M.employee_id;


-- Full Outer Join



--A Return fruits in baskets and baskets with fruits, plus unmatched:--

CREATE TABLE fruits (
fruit_id INT PRIMARY KEY,
fruit_name VARCHAR (255) NOT NULL,
basket_id INTEGER
);
CREATE TABLE baskets (
basket_id INT PRIMARY KEY,
basket_name VARCHAR (255) NOT NULL
);
INSERT INTO baskets (basket_id, basket_name)
VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');
INSERT INTO fruits (
fruit_id,
fruit_name,
basket_id
)
VALUES
(1, 'Apple', 1),
(2, 'Orange', 1),
(3, 'Banana', 2),
(4, 'Strawberry', NULL);

SELECT
    b.basket_id,
    b.basket_name,
    f.fruit_id,
    f.fruit_name
FROM
    baskets AS b
FULL OUTER JOIN
    fruits AS f ON b.basket_id = f.basket_id;


--B Find empty baskets:--

SELECT
    b.basket_id,
    b.basket_name
FROM
    baskets AS b
LEFT JOIN
    fruits AS f ON b.basket_id = f.basket_id
WHERE
    f.fruit_id IS NULL;

--C Find fruits not in any basket:--

SELECT
    f.fruit_id,
    f.fruit_name
FROM
    fruits AS f
WHERE
    f.basket_id IS NULL;


-- Cross Join

--A Find all possible sales channels for each organization:--

CREATE TABLE sales_organization (
sales_org_id INT PRIMARY KEY,
sales_org VARCHAR (255)
);
CREATE TABLE sales_channel (
channel_id INT PRIMARY KEY,
channel VARCHAR (255)
);

INSERT INTO sales_organization (sales_org_id, sales_org)
VALUES
(1, 'Domestic'),
(2, 'Export');
INSERT INTO sales_channel (channel_id, channel)
VALUES
(1, 'Wholesale'),
(2, 'Retail'),
(3, 'eCommerce'),
(4, 'TV Shopping');


SELECT sales_org, channel
FROM sales_organization
CROSS JOIN sales_channel;


---

## TASK 4: GROUP BY and HAVING

-- Group By Queries

--A Group values in department_id column:--

SELECT department_id 
FROM employees 
GROUP BY department_id;


--B Count employees by department:--

SELECT department_id, COUNT(*) as employee_count
FROM employees 
GROUP BY department_id;


--C Return number of employees by department:--

SELECT department_id, COUNT(employee_id) AS number_of_employees
FROM employees
GROUP BY department_id;


--D Sort departments by headcount:--

SELECT department_id, COUNT(*) as headcount
FROM employees 
GROUP BY department_id
ORDER BY headcount DESC;


--E Find departments with headcount greater than 5:--

SELECT department_id, COUNT(*) as headcount
FROM employees 
GROUP BY department_id
HAVING COUNT(*) > 5;


--F Return min, max, and average salary by department:--

SELECT department_id, 
       MIN(salary) as min_salary,
       MAX(salary) as max_salary,
       AVG(salary) as avg_salary
FROM employees 
GROUP BY department_id;


--G Get total salary per department:--

SELECT department_id, SUM(salary) as total_salary
FROM employees 
GROUP BY department_id;


--H Group by department_id and job_id:--

SELECT department_id, job_id, COUNT(*) as employee_count
FROM employees 
GROUP BY department_id, job_id;


-- Having Clause

--A Group employees by managers and count direct reports:--

SELECT manager_id, COUNT(*) as direct_reports
FROM employees 
WHERE manager_id IS NOT NULL
GROUP BY manager_id;


--B Find managers with at least 5 direct reports:--

SELECT manager_id, COUNT(*) as direct_reports
FROM employees 
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING COUNT(*) >= 5;


--C Find departments with salary sum between 20,000 and 30,000:--

SELECT department_id, SUM(salary) as total_salary
FROM employees 
GROUP BY department_id
HAVING SUM(salary) BETWEEN 20000 AND 30000;


--D Find department with employees having lowest salary greater than 10,000:--

SELECT department_id, MIN(salary) as min_salary
FROM employees 
GROUP BY department_id
HAVING MIN(salary) > 10000;


--E Find departments with average salary between 5,000 and 7,000:--

SELECT department_id, AVG(salary) as avg_salary
FROM employees 
GROUP BY department_id
HAVING AVG(salary) BETWEEN 5000 AND 7000;


---

--## TASK 5: Other Queries

-- 1) UNION Operator

--A Combine first and last names of employees and dependents:--

SELECT first_name, last_name FROM employees
UNION
SELECT first_name, last_name FROM dependents;


-- 2) INTERSECT Operator

--A Apply INTERSECT to tables A and B:--


SELECT id FROM A
INTERSECT
SELECT id FROM B
ORDER BY id DESC;


-- 3) EXISTS Operator

--A Find employees with at least one dependent:--

SELECT DISTINCT e.*
FROM employees AS e
JOIN dependents AS d ON e.employee_id = d.employee_id;


--B Find employees without dependents:--

SELECT e.*
FROM employees AS e
LEFT JOIN dependents AS d ON e.employee_id = d.employee_id
WHERE d.dependent_id IS NULL;

-- 4) CASE Expression

--A Get work anniversaries (assuming current year is 2000):--

SELECT first_name, last_name,
CASE 
    WHEN YEAR(hire_date) = 2000 THEN 'New Employee'
    WHEN YEAR(hire_date) = 1999 THEN '1 Year'
    WHEN YEAR(hire_date) = 1998 THEN '2 Years'
    ELSE CAST(2000 - YEAR(hire_date) AS VARCHAR) + ' Years'
END as Work_Anniversary
FROM employees;


--B Categorize salaries as Low, Average, or High:--

SELECT first_name, last_name, salary,
CASE 
    WHEN salary < 3000 THEN 'Low'
    WHEN salary BETWEEN 3000 AND 5000 THEN 'Average'
    WHEN salary > 5000 THEN 'High'
END as Salary_Category
FROM employees;


-- 5) UPDATE Statement

--A Update Sarah Bell's last name to Lopez

UPDATE employees
SET last_name = 'Lopez'
WHERE first_name = 'Sarah' AND last_name = 'Bell';


--B Update children's last names to match parents:--

-- Example for SQL Server (syntax might vary for other databases)
CREATE TRIGGER trg_UpdateDependentLastName
ON employees
AFTER UPDATE
AS
BEGIN
    IF UPDATE(last_name)
    BEGIN
        UPDATE d
        SET d.last_name = i.last_name
        FROM dependents d
        INNER JOIN inserted i ON d.employee_id = i.employee_id;
    END
END;




---

## FINAL TASK: Advanced Queries (Subqueries)

--A Find employees in location 1700 using subquery:--

SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id IN (
    SELECT department_id 
    FROM departments 
    WHERE location_id = 1700
);


--B Find employees NOT in location 1700:--

SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id NOT IN (
    SELECT department_id 
    FROM departments 
    WHERE location_id = 1700
);


--C Find employees with highest salary:--

SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);


--D Find employees with salary greater than average:--

SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


--E Find departments with at least one employee earning more than 10,000:--

SELECT department_name
FROM departments d
WHERE EXISTS (SELECT 1 FROM employees e WHERE e.department_id = d.department_id AND e.salary > 10000);


--F Find departments with no employee earning more than 10,000:--

SELECT department_name
FROM departments d
WHERE NOT EXISTS (SELECT 1 FROM employees e WHERE e.department_id = d.department_id AND e.salary > 10000);

--G Find lowest salary by department:--

SELECT department_id, MIN(salary) as lowest_salary
FROM employees
GROUP BY department_id;


--H Find employees with salary greater than lowest salary of every department:--

SELECT * FROM employees
WHERE salary > ALL (
    SELECT MIN(salary) 
    FROM employees 
    GROUP BY department_id
);


--I Find employees with salary greater than or equal to highest salary of every department:--

SELECT * FROM employees
WHERE salary >= ALL (
    SELECT MAX(salary) 
    FROM employees 
    GROUP BY department_id
);


--J Return average salary of every department:--

SELECT department_id, AVG(salary) as avg_salary
FROM employees
GROUP BY department_id;


--K Calculate average of average salaries:--

SELECT AVG(dept_avg_salary) as overall_avg
FROM (
    SELECT AVG(salary) as dept_avg_salary
    FROM employees
    GROUP BY department_id
) as dept_averages;


--L Find salary, average salary, and difference:--

SELECT first_name, last_name, salary,
       (SELECT AVG(salary) FROM employees) as avg_salary,
       salary - (SELECT AVG(salary) FROM employees) as difference
FROM employees;
