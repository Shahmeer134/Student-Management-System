create database Database_Project_DBS;
use Database_Project_DBS;

-- Student Login
CREATE TABLE StudentLogin (
    StudentID INT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255)
);
select * from StudentLogin;
-- Teacher Login
CREATE TABLE TeacherLogin (
    TeacherID INT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255)
);
select * from TeacherLogin;
-- Semester
CREATE TABLE Semester (
    SemesterID INT PRIMARY KEY,
    SemesterName VARCHAR(50)
);
select * from Semester;
-- Student Details
CREATE TABLE StudentDetails (
    StudentID INT PRIMARY KEY FOREIGN KEY REFERENCES StudentLogin(StudentID),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
	CNIC INT,
	Gender VARCHAR(50),
    SemesterID INT FOREIGN KEY REFERENCES Semester(SemesterID),
    -- Add more details as needed...
);
select * from StudentDetails;
-- Teacher Details
CREATE TABLE TeacherDetails (
    TeacherID INT PRIMARY KEY FOREIGN KEY REFERENCES TeacherLogin(TeacherID),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
	CNIC INT,
	Gender VARCHAR(50),
    -- Add more details as needed...
);
select * from TeacherDetails;
-- Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
SemesterID INT FOREIGN KEY REFERENCES Semester(SemesterID)
);
select * from Courses;
-- Exams Schedule
CREATE TABLE ExamsSchedule (
    ExamID INT PRIMARY KEY,
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    ExamDateTime DATETIME
);
select * from ExamsSchedule;
-- Student Enroll Courses
CREATE TABLE StudentEnrollCourses (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES StudentDetails(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID)
);

select * from StudentEnrollCourses;

-- Teacher Courses
CREATE TABLE TeacherCourses (
    AssignmentID INT PRIMARY KEY,
    TeacherID INT FOREIGN KEY REFERENCES TeacherDetails(TeacherID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID)
);
select * from TeacherCourses;
-- Marks
CREATE TABLE Marks (
    MarksID INT PRIMARY KEY IDENTITY(1,1),  -- Use IDENTITY for automatic value generation
    StudentID INT FOREIGN KEY REFERENCES StudentDetails(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    ExamID INT FOREIGN KEY REFERENCES ExamsSchedule(ExamID),
    Marks INT
);

select * from Marks;

INSERT INTO StudentLogin (StudentID, Username, Password)
VALUES
(1722, 'Saqlain', 'saq1722'),
(2281, 'Ibtihaj', 'ibt2281'),
(2122, 'Abdullah', 'abd2122'),
(2123, 'Hamza', 'ham2123'),
(2124, 'Taha', 'taha2124'),
(2278, 'Shahmeer', 'shah2278'),
(2125, 'Shoaib', 'sh2125'),
(2126, 'Noreen', 'nor2126'),
(2127, 'Zoya', 'zoya2127'),
(2128, 'Ayesha', 'ay2128'),
(2129, 'Mahnoor', 'mah2129'),
(2130, 'Bisma', 'bis2130'),
(2131, 'Yousma', '2131'),
(2132, 'Maham', 'maha2132'),
(2133, 'Minahl', 'min2133'),
(2134, 'Khizer', 'kh2134'),
(2135, 'Muaz', 'muaz2135'),
(2136, 'Aqsa', 'aqsa2136'),
(2137, 'Subhana', 'sub2137'),
(2138, 'Umair', 'um2138');


INSERT INTO TeacherLogin (TeacherID, Username, Password)
VALUES
(2001, 'Azal Hussain', 'afzal2001'),
(2002, 'Iqbal uddin', 'iqbal2002'),
(2003, 'Asim Hussain', 'asim2003'),
(2004, 'Faheem Ahmed', 'faheem2004'),
(2005, 'Waqas Pasha', 'waqas2005');


INSERT INTO Semester (SemesterID, SemesterName)
VALUES
    (01, 'Semester 1'),
    (02, 'Semester 2'),
    (03, 'Semester 3'),
    (04, 'Semester 4'),
    (05, 'Semester 5');

INSERT INTO StudentDetails (StudentID, FirstName, LastName, BirthDate, SemesterID, Gender)
VALUES
(1722, 'Saqlain', 'Shahid', '2000-03-12', 1, 'Male'),
(2281, 'Ibtihaj', 'Saleem', '2004-01-04', 2, 'Male'),
(2122, 'Abdullah', 'Khan', '2003-05-02', 3, 'Male'),
(2123, 'Hamza', 'Shaikh', '2002-11-13', 4, 'Male'),
(2124, 'Taha', 'Saeed', '2003-02-22', 5, 'Male'),
(2278, 'Shahmeer', 'Abid', '2004-01-14', 1, 'Male'),
(2125, 'Shoaib', 'Azam', '2001-04-30', 2, 'Male'),
(2126, 'Noreen', 'Zehra', '2002-09-10', 3, 'Female'),
(2127, 'Zoya', 'Sayeed', '2003-06-25', 4, 'Female'),
(2128, 'Ayesha', 'Ikram', '2002-03-14', 5, 'Female'),
(2129, 'Mahnoor', 'Bhagat', '2003-01-03', 2, 'Female'),
(2130, 'Bisma', 'Imran', '2004-08-20', 3, 'Female'),
(2131, 'Yousma', 'Ali', '2003-12-01', 4, 'Female'),
(2132, 'Maham', 'Mirza', '2002-05-19', 5, 'Female'),
(2133, 'Minahl', 'Khan', '2002-02-16', 1, 'Female'),
(2134, 'Khizer', 'Mallick', '2002-07-07', 2, 'Male'),
(2135, 'Muaz', 'Ahmed', '2002-04-12', 3, 'Male'),
(2136, 'Aqsa', 'Shaikh', '2002-11-28', 4, 'Female'),
(2137, 'Subhana', 'Riaz', '2002-06-07', 5, 'Female'),
(2138, 'Umair', 'Khan', '2001-10-08', 1, 'Male');

select * from StudentDetails;

INSERT INTO TeacherDetails (TeacherID, FirstName, LastName, BirthDate, Gender)
VALUES
(2001, 'Afzal', 'Hussain', '1980-02-14', 'Male'),
(2002, 'Iqbal uddin', 'Khan', '1975-07-21', 'Male'),
(2003, 'Asim', 'Hussain', '1970-04-05', 'Male'),
(2004, 'Faheem', 'Ahmed', '1990-11-18', 'Male'),
(2005, 'Waqas', 'Pasha', '1990-06-26', 'male');

INSERT INTO Courses (CourseID, CourseName, SemesterID) VALUES
(001, 'Introduction to Programming', 1),
(002, 'Computer Architecture', 1),
(003, 'Mathematics for Computer Science', 1),
(004, 'Data Structures and Algorithms', 4),
(005, 'Digital Logic Design', 3),
(006, 'Operating Systems', 5),
(007, 'Database Management Systems', 5),
(008, 'Computer Networks', 3),
(009, 'Software Engineering', 4),
(010, 'Artificial Intelligence', 4),
(011, 'Web Development', 5),
(012, 'Computer Graphics', 2),
(013, 'Programimng fundamentals', 2),
(014, 'Cybersecurity', 3),
(015, 'Cloud Computing', 2);

select * from Courses;

INSERT INTO StudentEnrollCourses (EnrollmentID, StudentID, CourseID) VALUES
(1, 1722, 001),
(2, 2281, 012),
(3, 2122, 005),
(4, 2123, 004),
(5, 2124, 007),
(6, 2278, 002),
(7, 2125, 015),
(8, 2126, 008),
(9, 2127, 009),
(10, 2128, 006),
(11, 2129, 11),
(12, 2130, 008),
(13, 2131, 010),
(14, 2132, 011),
(15, 2133, 001),
(16, 2134, 012),
(17, 2135, 014),
(18, 2136, 011),
(19, 2137, 004),
(20, 2138, 003);

-- Exam Schedule with 2 exams for each semester

-- Exam for Semester 1
INSERT INTO ExamsSchedule (ExamID, CourseID, ExamDateTime) VALUES
(1, 001, '2024-01-10 09:00:00'),
(2, 002, '2024-01-15 14:00:00');

-- Exam for Semester 2
INSERT INTO ExamsSchedule (ExamID, CourseID, ExamDateTime) VALUES
(3, 012, '2023-02-05 10:30:00'),
(4, 013, '2023-02-12 13:30:00');

-- Exam for Semester 3
INSERT INTO ExamsSchedule (ExamID, CourseID, ExamDateTime) VALUES
(5, 014, '2023-03-20 11:00:00'),
(6, 008, '2023-03-25 15:45:00');

-- Exam for Semester 4
INSERT INTO ExamsSchedule (ExamID, CourseID, ExamDateTime) VALUES
(7, 009, '2023-04-08 08:30:00'),
(8, 010, '2023-04-15 12:00:00');

-- Exam for Semester 5
INSERT INTO ExamsSchedule (ExamID, CourseID, ExamDateTime) VALUES
(9, 007, '2023-05-02 14:15:00'),
(10, 011, '2023-05-10 09:45:00');

-- Exam for Semester 1
INSERT INTO ExamsSchedule (ExamID, CourseID, ExamDateTime) VALUES
(11, 003, '2024-01-18 12:30:00');

-- Exam for Semester 2
INSERT INTO ExamsSchedule (ExamID, CourseID, ExamDateTime) VALUES
(13, 015, '2023-02-15 10:00:00');

-- Exam for Semester 3
INSERT INTO ExamsSchedule (ExamID, CourseID, ExamDateTime) VALUES
(15, 005, '2023-03-30 09:30:00');

-- Exam for Semester 4
INSERT INTO ExamsSchedule (ExamID, CourseID, ExamDateTime) VALUES
(17, 004, '2023-04-20 11:45:00');

-- Exam for Semester 5
INSERT INTO ExamsSchedule (ExamID, CourseID, ExamDateTime) VALUES
(19, 006, '2023-05-15 08:00:00');

-- Attendance Table

-- Attendance
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES StudentDetails(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
	TeacherID INT FOREIGN KEY REFERENCES TeacherDetails(TeacherID),
    Date DATE,
    Status VARCHAR(10) -- Assuming Present/Absent
);

select * from Attendance; 
-- Inserting sample attendance records

-- Student 1 attending courses in Semester 1
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(1, 1722, 001, 2002, '2023-01-10', 'Present'),
(2, 1722, 002, 2003, '2023-01-15', 'Present');

-- Student 2 attending courses in Semester 1
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(3, 2133, 003, 2005, '2023-01-18', 'Absent'),
(4, 2133, 001, 2002, '2023-01-24', 'Present');

-- Student 3 attending courses in Semester 1
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(5, 2278, 003, 2005, '2023-03-20', 'Present'),
(6, 2278, 002, 2003, '2023-03-25', 'Present');

-- Student 4 attending courses in Semester 1
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(7, 2138, 001, 2002, '2023-03-02', 'Present'),
(8, 2138, 003, 2005, '2023-03-03', 'Present');

-- Student 5 attending courses in Semester 2
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(9, 2281, 013, 2004, '2023-02-21', 'Present'),
(10, 2281, 015, 2001, '2023-02-09', 'Absent');

-- Student 6 attending courses in Semester 2
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(11, 2125, 013, 2004, '2023-02-01', 'Present'),
(12, 2125, 012, 2004, '2023-02-04', 'Absent');

-- Student 7 attending courses in Semester 2
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(13, 2134, 012, 2004, '2023-02-13', 'Present'),
(14, 2134, 015, 2001, '2023-02-12', 'Absent');

-- Student 8 attending courses in Semester 2
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(15, 2129, 015, 2001, '2023-02-11', 'Present'),
(16, 2129, 012, 2004, '2023-04-02', 'Absent'); -- Corrected date

-- Student 9 attending courses in Semester 3
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(17, 2135, 014, 2005, '2023-02-16', 'Present'),
(18, 2135, 010, 2001, '2023-02-13', 'Absent');

-- Student 10 attending courses in Semester 3
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(19, 2130, 008, 2003, '2023-02-21', 'Present'),
(20, 2130, 014, 2005, '2023-02-22', 'Absent');

-- Student 11 attending courses in Semester 3
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(21, 2126, 010, 2001, '2023-02-24', 'Present'),
(22, 2126, 008, 2003, '2023-02-23', 'Absent');

-- Student 12 attending courses in Semester 3
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(23, 2122, 008, 2003, '2023-02-05', 'Present'),
(24, 2122, 014, 2005, '2023-02-12', 'Absent');

-- Student 13 attending courses in Semester 4
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(25, 2123, 009, 2005, '2023-02-27', 'Present'),
(26, 2123, 010, 2001, '2023-02-28', 'Absent');

-- Student 14 attending courses in Semester 4
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(27, 2131, 004, 2002, '2023-02-26', 'Present'), -- Corrected date
(28, 2131, 010, 2001, '2023-02-09', 'Present');

-- Student 15 attending courses in Semester 4
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(29, 2136, 004, 2002, '2023-04-04', 'Present'),
(30, 2136, 009, 2005, '2023-04-28', 'Present');

-- Student 16 attending courses in Semester 4
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(31, 2127, 004, 2002, '2023-04-02', 'Present'), -- Corrected date
(32, 2127, 010, 2001, '2023-04-29', 'Present'); -- Corrected date

-- Student 17 attending courses in Semester 5
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(33, 2137, 007, 2001, '2023-04-08', 'Absent'),
(34, 2137, 011, 2004, '2023-04-16', 'Present');

-- Student 18 attending courses in Semester 5
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(35, 2132, 006, 2003, '2023-05-02', 'Present'),
(36, 2132, 007, 2001, '2023-05-10', 'Absent');

-- Student 19 attending courses in Semester 5
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(37, 2128, 006, 2003, '2023-05-05', 'Absent'), -- Corrected date
(38, 2128, 011, 2004, '2023-05-25', 'Present'); -- Corrected date

-- Student 20 attending courses in Semester 5
INSERT INTO Attendance (AttendanceID, StudentID, CourseID, TeacherID, Date, Status) VALUES
(39, 2124, 006, 2003, '2023-05-15', 'Absent'), -- Corrected date
(40, 2124, 011, 2004, '2023-05-22', 'Present'); -- Corrected date


-- Teacher 1 teaching courses
INSERT INTO TeacherCourses (AssignmentID, TeacherID, CourseID) VALUES
(01, 2001, 007),
(02, 2001, 010),
(03, 2001, 015);

-- Teacher 2 teaching courses
INSERT INTO TeacherCourses (AssignmentID, TeacherID, CourseID) VALUES
(04, 2002, 001),
(05, 2002, 004),
(06, 2002, 005);

-- Teacher 3 teaching courses
INSERT INTO TeacherCourses (AssignmentID, TeacherID, CourseID) VALUES
(07, 2003, 002),
(08, 2003, 006),
(09, 2003, 008);

-- Teacher 4 teaching courses
INSERT INTO TeacherCourses (AssignmentID, TeacherID, CourseID) VALUES
(10, 2004, 011),
(11, 2004, 012),
(12, 2004, 013);

-- Teacher 5 teaching courses
INSERT INTO TeacherCourses (AssignmentID, TeacherID, CourseID) VALUES
(13, 2005, 003),
(14, 2005, 009),
(15, 2005, 014);

-- Marks Table

-- Inserting sample marks records

-- Student 1 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
( 1722, 1, 1, 85),
( 1722, 2, 2, 78);

-- Student 2 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
( 2133, 1, 1, 92),
( 2133, 3, 11, 88);

-- Student 3 marks
INSERT INTO Marks ( StudentID, CourseID, ExamID, Marks) VALUES
(2278, 3, 11, 76),
(2278, 2, 2, 81);

-- Student 4 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2138, 1, 1, 95),
(2138, 3, 11, 90);

-- Student 5 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2281, 13, 4, 87),
(2281, 15, 13, 83);

-- Student 6 marks
INSERT INTO Marks ( StudentID, CourseID, ExamID, Marks) VALUES
(2125, 13, 4, 79),
(2125, 12, 3, 94);

-- Student 7 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
( 2134, 12, 3, 91),
( 2134, 15, 11, 85);

-- Student 8 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2129, 15, 11, 89),
(2129, 12, 3, 82);

-- Student 9 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2135, 14, 5, 77),
(2135, 10, 8, 80);

-- Student 10 marks
INSERT INTO Marks ( StudentID, CourseID, ExamID, Marks) VALUES
(2130, 8, 6, 93),
(2130, 14, 5, 86);

-- Student 11 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2126, 10, 8, 93),
(2126, 8, 6, 86);

-- Student 12 marks
INSERT INTO Marks ( StudentID, CourseID, ExamID, Marks) VALUES
(2122, 8, 6, 93),
(2122, 14, 5, 86);

-- Student 13 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2123, 9, 7, 93),
(2123, 10, 8, 86);

-- Student 14 marks
INSERT INTO Marks ( StudentID, CourseID, ExamID, Marks) VALUES
(2131, 4, 17, 93),
(2131, 10, 8, 86);

-- Student 15 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2136, 4, 17, 93),
(2136, 9, 7, 86);

-- Student 16 marks
INSERT INTO Marks ( StudentID, CourseID, ExamID, Marks) VALUES
(2127, 4, 17, 93),
(2127, 10, 8, 86);

-- Student 17 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2137, 7, 9, 93),
(2137, 11, 10, 86);

-- Student 18 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2132, 6, 19, 93),
(2132, 7, 9, 86);

-- Student 19 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2128, 6, 19, 93),
(2128, 11, 10, 86);

-- Student 20 marks
INSERT INTO Marks (StudentID, CourseID, ExamID, Marks) VALUES
(2124, 6, 19, 93),
(2124, 11, 10, 86);



CREATE VIEW StudentLoginView AS
SELECT
    SL.StudentID,
    SL.Username,  -- Consider if this should be included
    SL.Password,  -- Consider if this should be included
    SD.FirstName,
    SD.LastName,
    SD.BirthDate,
    S.SemesterName
FROM
    StudentLogin AS SL
JOIN StudentDetails AS SD ON SL.StudentID = SD.StudentID
JOIN Semester AS S ON SD.SemesterID = S.SemesterID;

CREATE VIEW StudentAttendanceView AS
SELECT
    A.AttendanceID,
    A.StudentID,
    CONCAT(T.FirstName, ' ', T.LastName) AS TeacherName,  -- Use CONCAT for SQL Server
    C.CourseName,
    A.Date AS AttendanceDate,
    A.Status AS AttendanceStatus
FROM
    Attendance AS A
JOIN StudentDetails AS SD ON A.StudentID = SD.StudentID
JOIN TeacherDetails AS T ON A.TeacherID = T.TeacherID
JOIN Courses AS C ON A.CourseID = C.CourseID;


CREATE VIEW StudentExamsView AS
SELECT
    SD.StudentID,
    SD.FirstName AS StudentFirstName,
    SD.LastName AS StudentLastName,
    C.CourseID,
    C.CourseName,
    T.FirstName AS TeacherFirstName,
    T.LastName AS TeacherLastName,
    ES.ExamDateTime
FROM
    StudentDetails AS SD
JOIN StudentEnrollCourses AS SEC ON SD.StudentID = SEC.StudentID
JOIN Courses AS C ON SEC.CourseID = C.CourseID
JOIN ExamsSchedule AS ES ON C.CourseID = ES.CourseID
JOIN TeacherCourses AS TC ON C.CourseID = TC.CourseID
JOIN TeacherDetails AS T ON TC.TeacherID = T.TeacherID;

CREATE VIEW StudentMarksView AS
SELECT
    SD.StudentID,
    SD.FirstName,
    SD.LastName,
    C.CourseID,
    C.CourseName,
    M.ExamID,
    M.Marks
FROM
    StudentDetails AS SD
JOIN StudentEnrollCourses AS SEC ON SD.StudentID = SEC.StudentID
JOIN Courses AS C ON SEC.CourseID = C.CourseID
LEFT JOIN Marks AS M ON SD.StudentID = M.StudentID AND C.CourseID = M.CourseID;

-- Trigger for StudentLogin table
CREATE TRIGGER AfterStudentLoginInsert
ON StudentLogin
AFTER INSERT
AS
BEGIN
    INSERT INTO StudentEnrollCourses (StudentID, CourseID)
    SELECT i.StudentID, c.CourseID
    FROM inserted i
    CROSS JOIN Courses c;
END;

-- Trigger for StudentDetails table
CREATE TRIGGER AfterStudentDetailsInsert
ON StudentDetails
AFTER INSERT
AS
BEGIN
    INSERT INTO StudentEnrollCourses (StudentID, CourseID)
    SELECT i.StudentID, c.CourseID
    FROM inserted i
    CROSS JOIN Courses c;
END;