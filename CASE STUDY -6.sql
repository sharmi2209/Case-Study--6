CREATE DATABASE LearningDB;
USE LearningDB;

CREATE TABLE  Courses (id INT PRIMARY KEY AUTO_INCREMENT ,title VARCHAR(100) NOT NULL ,description TEXT);

INSERT INTO Courses (title,description) VALUES
('Automation', 'Software tools to automate manual processes for reviewing and validating software products'),
('MySQL','To create and manage databases'),
('JAVA','A programming language that can be used to create software applications and programs'),
('Data Analyst','collect, analyze, and interpret data to help businesses make informed decisions');

SELECT * FROM Courses ;

CREATE TABLE  Instructors (id INT  PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50) NOT NULL,expertise VARCHAR(50) NOT NULL);

INSERT INTO  Instructors (name,expertise ) VALUES
('Diya','MYSQL'),
('Naveen','JAVA'),
('Dinesh','ANALYST'),
('Gayu','TESTING');

SELECT * FROM  Instructors;

CREATE TABLE Students(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL, email VARCHAR(50)NOT NULL UNIQUE);

INSERT INTO students (name,email) VALUES
('Gomathi','goms@123'),
('Pavithra','pavi@123'),
('Divya','dd@123'),
('Sharmi','ammu@123'),
('Diya','diya@123');

SELECT * FROM  students;

CREATE TABLE Enrollments (student_id INT ,FOREIGN KEY (student_id) REFERENCES Students(id), course_id INT,
 FOREIGN KEY (course_id ) REFERENCES Courses(id),enrollment_date DATE NOT NULL, PRIMARY KEY(student_id, course_id));

INSERT INTO  Enrollments (student_id, course_id, enrollment_date)  VALUES
(1, 1, '2023-06-15'),
(2, 2, '2023-06-27'),
(3, 3, '2023-07-10'),
(4, 4, '2023-07-25'),
(5, 3, '2023-08-08');

SELECT * FROM   Enrollments;

-- List all courses --

SELECT * FROM Courses ;

-- List all instructors --

SELECT * FROM  Instructors;

-- Show enrollments with student names and course titles --

SELECT Students.name AS student_name,Courses.title AS course_title,Enrollments.enrollment_date  FROM Enrollments JOIN Students ON Enrollments.student_id = Students.id JOIN Courses ON Enrollments.course_id = Courses.id;

-- Count the number of students enrolled in each course --

SELECT Courses.title AS course_title,COUNT(Enrollments.student_id) AS student_count FROM Courses LEFT JOIN Enrollments 
ON Courses.id = Enrollments.course_id GROUP BY Courses.id;

