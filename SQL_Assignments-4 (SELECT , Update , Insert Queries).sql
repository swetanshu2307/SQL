-- ========================================
-- SQL ASSIGNMENT SOLUTIONS
-- ========================================

-- CREATE TABLES
-- ========================================

-- 1. Create Students Table
CREATE TABLE students (
    studentId INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    birthdate DATE,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    class VARCHAR(10),
    point INT
);

-- 2. Create Authors Table
CREATE TABLE authors (
    authorId INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50)
);

-- 3. Create Types Table
CREATE TABLE types (
    typeId INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 4. Create Books Table
CREATE TABLE books (
    bookId INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    pagecount INT,
    point INT,
    authorId INT,
    typeId INT,
    FOREIGN KEY (authorId) REFERENCES authors(authorId),
    FOREIGN KEY (typeId) REFERENCES types(typeId)
);

-- 5. Create Borrows Table
CREATE TABLE borrows (
    borrowId INT PRIMARY KEY,
    studentId INT,
    bookId INT,
    takenDate DATE,
    broughtDate DATE,
    FOREIGN KEY (studentId) REFERENCES students(studentId),
    FOREIGN KEY (bookId) REFERENCES books(bookId)
);

-- INSERT SAMPLE DATA
-- ========================================

-- Insert Authors
INSERT INTO authors (authorId, name, surname) VALUES
(1, 'F. Scott', 'Fitzgerald'),
(2, 'Harper', 'Lee'),
(3, 'George', 'Orwell'),
(4, 'Jane', 'Austen'),
(5, 'J.D.', 'Salinger'),
(6, 'J.R.R.', 'Tolkien'),
(7, 'Herman', 'Melville'),
(8, 'Leo', 'Tolstoy'),
(9, 'James', 'Joyce'),
(10, 'Homer', '');

-- Insert Types
INSERT INTO types (typeId, name) VALUES
(1, 'Fiction'),
(2, 'Classic'),
(3, 'Dystopian'),
(4, 'Literature'),
(5, 'Fantasy'),
(6, 'Adventure'),
(7, 'Historical Fiction'),
(8, 'Science Fiction'),
(9, 'Mythology'),
(10, 'Philosophy');

-- Insert Books
INSERT INTO books (bookId, name, pagecount, point, authorId, typeId) VALUES
(1, 'The Great Gatsby', 180, 95, 1, 1),
(2, 'To Kill a Mockingbird', 281, 90, 2, 2),
(3, '1984', 328, 88, 3, 3),
(4, 'Pride and Prejudice', 279, 93, 4, 4),
(5, 'The Catcher in the Rye', 214, 85, 5, 1),
(6, 'The Hobbit', 310, 91, 6, 2),
(7, 'Moby-Dick', 635, 80, 7, 3),
(8, 'War and Peace', 1225, 92, 8, 4),
(9, 'Ulysses', 730, 89, 9, 1),
(10, 'The Odyssey', 541, 87, 10, 2);

-- Insert Students
INSERT INTO students (studentId, name, surname, birthdate, gender, class, point) VALUES
(1, 'John', 'Doe', '2005-01-15', 'M', '10A', 85),
(2, 'Jane', 'Smith', '2006-03-22', 'F', '10B', 90),
(3, 'Alice', 'Johnson', '2005-07-12', 'F', '10A', 88),
(4, 'Bob', 'Brown', '2006-11-30', 'M', '10C', 76),
(5, 'Charlie', 'Davis', '2005-05-05', 'M', '10B', 92),
(6, 'Diana', 'Miller', '2006-06-25', 'F', '10C', 81),
(7, 'Eve', 'Wilson', '2005-09-18', 'F', '10A', 87),
(8, 'Frank', 'Moore', '2006-12-02', 'M', '10B', 80),
(9, 'Grace', 'Taylor', '2005-04-17', 'F', '10C', 83),
(10, 'Hank', 'Anderson', '2006-10-20', 'M', '10A', 78);


-- Insert Borrows
INSERT INTO borrows (borrowId, studentId, bookId, takenDate, broughtDate) VALUES
(1, 1, 3, '2024-01-10', '2024-01-20'),
(2, 2, 5, '2024-01-12', '2024-01-22'),
(3, 3, 7, '2024-01-15', '2024-01-25'),
(4, 4, 2, '2024-01-18', '2024-01-28'),
(5, 5, 1, '2024-01-20', '2024-01-30'),
(6, 6, 4, '2024-01-22', '2024-02-01'),
(7, 7, 6, '2024-01-24', '2024-02-03'),
(8, 8, 8, '2024-01-26', '2024-02-05'),
(9, 9, 10, '2024-01-28', '2024-02-07'),
(10, 10, 9, '2024-01-30', '2024-02-09');

-- ========================================
-- ASSIGNMENT SOLUTIONS
-- ========================================

-- Example 1: List all the records in the student table
SELECT * FROM students;

-- Example 2: List the name surname and class of the student in the student table
SELECT name, surname, class FROM students;

-- Example 3: List the gender Female (F) records in the student table
SELECT * FROM students WHERE gender = 'F';

-- Example 4: List the names of each class in the way of being seen once in the student table
SELECT DISTINCT class FROM students;

-- Example 5: List the students with Female gender and the class 10Math in the student table
SELECT * FROM students WHERE gender = 'F' AND class = '10Math';

-- Example 6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table
SELECT name, surname, class FROM students WHERE class = '10Math' OR class = '10Sci';

-- Example 7: List the students name surname and school number in the student table
SELECT name, surname, studentId FROM students;

-- Example 8: List the students name and surname by combining them as name surname in the student table
SELECT CONCAT(name, ' ', surname) AS fullname FROM students;

-- Example 9: List the students with the names starting with "A" letter in the student table
SELECT * FROM students WHERE name LIKE 'A%';

-- Example 10: List the book names and pages count with number of pages between 50 and 200 in the book table
SELECT name, pagecount FROM books WHERE pagecount BETWEEN 50 AND 200;

-- Example 11: List the students with names Emma Sophia and Robert in the student table
SELECT * FROM students WHERE name IN ('Emma', 'Sophia', 'Robert');

-- Example 12: List the students with names starting with A D and K in the student table
SELECT * FROM students WHERE name LIKE 'A%' OR name LIKE 'D%' OR name LIKE 'K%';

-- Example 13: List the names surnames classes and genders of males in 9Math or females in 9His in the student table
SELECT name, surname, class, gender FROM students 
WHERE (gender = 'M' AND class = '9Math') OR (gender = 'F' AND class = '9His');

-- Example 14: List the males whose classes are 10Math or 10Bio
SELECT * FROM students WHERE gender = 'M' AND (class = '10Math' OR class = '10Bio');

-- Example 15: List the students with birth year 1989 in the student table
SELECT * FROM students WHERE YEAR(birthdate) = 1989;

-- Example 16: List the female students with student numbers between 30 and 50
SELECT * FROM students WHERE gender = 'F' AND studentId BETWEEN 30 AND 50;

-- Example 17: List the students according to their names
SELECT * FROM students ORDER BY name;

-- Example 18: List the students by names for those with same names. List them by their surnames
SELECT * FROM students ORDER BY name, surname;

-- Example 19: List the students in 10Math by decreasing school numbers
SELECT * FROM students WHERE class = '10Math' ORDER BY studentId DESC;

-- Example 20: List the first 10 records in the student chart
SELECT TOP 10 * FROM students;

-- Example 21: List the first 10 records name surname and date of birth information in the student table
SELECT TOP 10 name, surname, birthdate FROM students;

-- Example 22: List the book with the most page number
SELECT * FROM books WHERE pagecount = (SELECT MAX(pagecount) FROM books);

-- Example 23: List the youngest student in the student table
SELECT * FROM students WHERE birthdate = (SELECT MAX(birthdate) FROM students);

-- Example 24: List the oldest student in the 10Math class
SELECT * FROM students WHERE class = '10Math' AND birthdate = (SELECT MIN(birthdate) FROM students WHERE class = '10Math');

-- Example 25: List the books with the second letter N
SELECT * FROM books WHERE name LIKE '_N%';

-- Example 26: List the students by grouping according to their classes
SELECT class, COUNT(*) as student_count FROM students GROUP BY class;

-- Example 27: List the students to be different in each questioning randomly
SELECT * FROM students ORDER BY RAND();

-- Example 28: Pick a random student from student table
SELECT TOP 1 * FROM students ORDER BY NEWID();

-- Example 29: Bring some random student's name, surname and number from class 10Math
SELECT TOP 1 name, surname, studentId 
FROM students 
WHERE class = '10Math' 
ORDER BY NEWID();


-- Example 30: Add the writer named Smith Allen to the authors table
INSERT INTO authors (authorId, name, surname) VALUES (11, 'Smith', 'Allen');

-- Example 31: Add the genre of biography to the genre table
INSERT INTO types (typeId, name) VALUES (11, 'Biography');

-- Example 32: Add 10Math Class male named Thomas Nelson, 9Bio class female named Sally Allen and 11His Class female named Linda Sandra in one question
INSERT INTO students (studentId, name, surname, gender, class) VALUES
(101, 'Thomas', 'Nelson', 'M', '10Math'),
(102, 'Sally', 'Allen', 'F', '9Bio'),
(103, 'Linda', 'Sandra', 'F', '11His');

-- Example 33: Add a random student in the students chart to the writers chart as an authors
INSERT INTO authors (authorId, name, surname) 
SELECT TOP 1 studentId + 100, name, surname 
FROM students 
ORDER BY NEWID();

-- Example 34: Add students with student numbers between 10 and 30 as authors
INSERT INTO authors (authorId, name, surname) 
SELECT studentId + 200, name, surname FROM students WHERE studentId BETWEEN 10 AND 30;

-- Example 35: Add the writer named Cindy Brown and make him write his writer number
INSERT INTO authors (authorId, name, surname) 
VALUES ((SELECT ISNULL(MAX(authorId), 0) + 1 FROM authors), 'Cindy', 'Brown');
SELECT MAX(authorId) as new_author_id FROM authors;
-- Example 36: Change the class of the student whose school number is 3 from 10Bio to 10His
UPDATE students SET class = '10His' WHERE studentId = 3;

-- Example 37: Transfer all the students in 9Math Class to 10Math Class
UPDATE students SET class = '10Math' WHERE class = '9Math';

-- Example 38: Increase all of the students' score by 5 points
UPDATE students SET point = point + 5;

-- Example 39: Delete the author #25
DELETE FROM authors WHERE authorId = 25;

-- Example 40: List the students whose birth dates are null
SELECT * FROM students WHERE birthdate IS NULL;

-- Example 41: List the name, surname and the dates of received books of the student
SELECT s.name, s.surname, b.takenDate 
FROM students s 
JOIN borrows b ON s.studentId = b.studentId;

-- ========================================
-- ADDITIONAL USEFUL QUERIES
-- ========================================

-- Show all students with their borrowed books
SELECT s.name, s.surname, bk.name as book_name, b.takenDate, b.broughtDate
FROM students s
JOIN borrows b ON s.studentId = b.studentId
JOIN books bk ON b.bookId = bk.bookId;

-- Show books with their authors
SELECT b.name as book_name, CONCAT(a.name, ' ', a.surname) as author_name
FROM books b
JOIN authors a ON b.authorId = a.authorId;

-- Show average points by class
SELECT class, AVG(point) as average_points
FROM students
GROUP BY class;

-- Show most popular books (most borrowed)
SELECT bk.name, COUNT(b.borrowId) as borrow_count
FROM books bk
JOIN borrows b ON bk.bookId = b.bookId
GROUP BY bk.bookId, bk.name
ORDER BY borrow_count DESC;