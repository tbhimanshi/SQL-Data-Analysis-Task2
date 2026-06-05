-- SQL Data Analysis Internship – Task 2
-- Student Management Database
-- Name - Himanshi Mahavar
-- batch - 24th May 2026
-- mail - mahavarhimanshi@gmail.com
-- Date   : 06-06-2026

--TASK 2 :
  
USE StudentManagement;

/*Schema for new tables */
CREATE TABLE Courses(
CourseID INT auto_increment PRIMARY KEY,
CourseName VARCHAR(50)
);
CREATE TABLE Enrollments(
EnrollmentID INT auto_increment PRIMARY KEY,
StudentID INT,
CourseID INT,
Grade INT,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
Show tables;
INSERT INTO Courses (CourseName) VALUES
('Mathematics'),
('Science'),
('English');
INSERT INTO Courses (CourseName) VALUES
('Mathematics'),
('Science'),
('English');
INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1,1,85),(1,2,78),(1,3,90),
(2,1,84),(2,2,81),(2,3,90),
(3,1,72),(3,2,88),(3,3,80),
(4,1,95),(4,2,91),(4,3,89),
(5,1,78),(5,2,81),(5,3,79),
(6,1,67),(6,2,70),(6,3,75),
(7,1,60),(7,2,72),(7,3,68),
(8,1,74),(8,2,69),(8,3,77),
(9,1,88),(9,2,90),(9,3,86),
(10,1,80),(10,2,85),(10,3,82),
(11,1,92),(11,2,89),(11,3,94),
(12,1,80),(12,2,85),(12,3,82),
(13,1,76),(13,2,69),(13,3,77),
(14,1,61),(14,2,67),(14,3,56);

-- Query 1: List all students enrolled in each course
SELECT
s.StudentID,
s.Name,
c.CourseName,
e.Grade
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID
ORDER BY c.CourseName, s.Name;

-- Query 2: Find average grade per course
SELECT
c.CourseName,
ROUND(AVG(e.Grade),2) AS AverageGrade
FROM Courses c
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY c.CourseName;

-- Query 3: Find top 3 students overall
SELECT
StudentID,
Name,
ROUND((MathScore + ScienceScore + EnglishScore)/3,2) AS AverageScore
FROM Students
ORDER BY AverageScore DESC
LIMIT 3;

-- Query 4: Count students who failed (grade < 40)
SELECT COUNT(*) AS FailedStudents
FROM Enrollments
WHERE Grade < 40;
