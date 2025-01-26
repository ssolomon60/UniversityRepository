CREATE DATABASE University;
USE University;

-- Create the Students table
-- This table holds information about students, like their name, email, and date of birth.
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each student
    FirstName VARCHAR(100) NOT NULL,           -- First name of the student
    LastName VARCHAR(100) NOT NULL,            -- Last name of the student
    DateOfBirth DATE,                          -- Date of birth of the student
    Email VARCHAR(100) UNIQUE                  -- Unique email address for the student
);

-- Create the Courses table
-- This table holds information about the courses available at the university.
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,   -- Unique ID for each course
    CourseName VARCHAR(100) NOT NULL,           -- Name of the course (e.g., Database Systems)
    Credits INT NOT NULL                       -- Number of credits the course offers
);

-- Create the Instructors table
-- This table holds information about the instructors who teach the courses.
CREATE TABLE Instructors (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each instructor
    FirstName VARCHAR(100) NOT NULL,             -- First name of the instructor
    LastName VARCHAR(100) NOT NULL,              -- Last name of the instructor
    Email VARCHAR(100) UNIQUE                    -- Unique email address for the instructor
);

-- Create the Enrollments table
-- This table links students with courses and stores the grade and enrollment date.
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each enrollment
    StudentID INT,                               -- Foreign key linking to the student
    CourseID INT,                                -- Foreign key linking to the course
    EnrollmentDate DATE,                         -- Date the student enrolled in the course
    Grade CHAR(2),                               -- Grade the student received (e.g., 'A', 'B')
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),  -- Link to the Students table
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)     -- Link to the Courses table
);

-- Create the CourseInstructors table
-- This table links instructors to courses, showing who teaches each course.
CREATE TABLE CourseInstructors (
    CourseInstructorID INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each course-instructor relationship
    CourseID INT,                                        -- Foreign key linking to the course
    InstructorID INT,                                    -- Foreign key linking to the instructor
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID), -- Link to the Courses table
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID) -- Link to the Instructors table
);

-- Sample Data for Students
-- Inserting some example students into the Students table.
INSERT INTO Students (FirstName, LastName, DateOfBirth, Email, )
VALUES 
('Sydney', 'Solomon', '1997-12-01', 'ssolomon60@byui.edu'),
('Emily', 'Macias', '1997-10-17', 'emacias78@byui.edu');

-- Sample Data for Courses
-- Inserting some example courses into the Courses table.
INSERT INTO Courses (CourseName, Credits)
VALUES 
('Database Systems', 3),
('Operating Systems', 4);

-- Sample Data for Instructors
-- Inserting some example instructors into the Instructors table.
INSERT INTO Instructors (FirstName, LastName, Email)
VALUES 
('Dr. Alice', 'Smith', 'alice.smith@byui.edu'),
('Prof. Hank', 'Brown', 'hank.brown@bbyui.edu');

-- Enroll a student in courses
-- Enroll Emily and Sydney in courses and give them grades.
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Grade)
VALUES 
(012345, 1, '2025-01-15', 'A'),
(02468, 2, '2025-01-20', 'B');

INSERT INTO CourseInstructors (CourseID, InstructorID)
VALUES 
(1, 1),
(2, 2);

-- Query 1: View all students and their enrolled courses with grades
-- This query shows the names of students, the courses they are enrolled in, and their grades.
SELECT 
SELECT 
    s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName,
    c.CourseName,
    e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

-- Query 2: View all instructors and the courses they teach
-- This query shows the names of instructors and the courses they are teaching.
SELECT 
    i.FirstName AS InstructorFirstName,
    i.LastName AS InstructorLastName,
    c.CourseName
FROM CourseInstructors ci
JOIN Instructors i ON ci.InstructorID = i.InstructorID
JOIN Courses c ON ci.CourseID = c.CourseID;

