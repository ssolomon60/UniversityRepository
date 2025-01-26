CREATE DATABASE University;
USE University;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    Credits INT
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE CourseInstructors (
    CourseInstructorID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    InstructorID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

INSERT INTO Students (FirstName, LastName, DateOfBirth, Email)
VALUES 
('John', 'Doe', '1995-04-15', 'john.doe@example.com'),
('Jane', 'Smith', '1997-08-22', 'jane.smith@example.com');

INSERT INTO Courses (CourseName, Credits)
VALUES 
('Database Systems', 3),
('Operating Systems', 4);

INSERT INTO Instructors (FirstName, LastName, Email)
VALUES 
('Dr. Alice', 'Johnson', 'alice.johnson@university.com'),
('Prof. Bob', 'Brown', 'bob.brown@university.com');

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Grade)
VALUES 
(1, 1, '2025-01-15', 'A'),
(2, 2, '2025-01-20', 'B');

INSERT INTO CourseInstructors (CourseID, InstructorID)
VALUES 
(1, 1),
(2, 2);

SELECT 
    s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName,
    c.CourseName,
    e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

SELECT 
    i.FirstName AS InstructorFirstName,
    i.LastName AS InstructorLastName,
    c.CourseName
FROM CourseInstructors ci
JOIN Instructors i ON ci.InstructorID = i.InstructorID
JOIN Courses c ON ci.CourseID = c.CourseID;
