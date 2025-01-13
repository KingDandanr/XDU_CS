CREATE DATABASE UniversityManagement;
USE UniversityManagement;

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender ENUM('男', '女') NOT NULL
);

CREATE TABLE Major (
    MajorID INT PRIMARY KEY,
    MajorName VARCHAR(50) NOT NULL
);

CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50) NOT NULL,
    MajorID INT,
    FOREIGN KEY (MajorID) REFERENCES Major(MajorID)
);
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    ClassID INT,
    MajorID INT,
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (MajorID) REFERENCES Major(MajorID)
);
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender ENUM('男', '女') NOT NULL,
    Date_Birth DATE NOT NULL,
    ClassID INT,
    MajorID INT,
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (MajorID) REFERENCES Major(MajorID)
);
CREATE TABLE Grades (
    GradesID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Grades DECIMAL(4,2),
    ResitGrades DECIMAL(4,2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
CREATE TABLE Plan (
    PlanID INT PRIMARY KEY,
    ClassID INT,
    MajorID INT,
    Grade INT,
    ClassType ENUM('必修', '选修'),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (MajorID) REFERENCES Major(MajorID)
);
CREATE TABLE Course_Teacher (
    CourseID INT,
    TeacherID INT,
    PRIMARY KEY (CourseID, TeacherID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID)
);
CREATE TABLE Class_Course_Teacher (
    ClassID INT,
    CourseID INT,
    TeacherID INT,
    PRIMARY KEY (ClassID, CourseID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID)
);
INSERT INTO Teacher (TeacherID, Name, Gender) VALUES
(1, '张老师', '男'),
(2, '李老师', '女');

INSERT INTO Major (MajorID, MajorName) VALUES
(1, '计算机科学'),
(2, '数学');

INSERT INTO Class (ClassID, ClassName, MajorID) VALUES
(1, '计算机1班', 1),
(2, '数学1班', 2);

INSERT INTO Course (CourseID, CourseName, Credits, ClassID, MajorID) VALUES
(1, '数据库', 3, 1, 1),
(2, '高等数学', 4, 2, 2);

INSERT INTO Student (StudentID, Name, Gender, Date_Birth, ClassID, MajorID) VALUES
(1, '张三', '男', '2000-01-01', 1, 1),
(2, '李四', '女', '2000-02-02', 2, 2);

INSERT INTO Grades (StudentID, CourseID, Grades, ResitGrades) VALUES
(1, 1, 85.5, NULL),
(2, 2, 90.0, NULL);

INSERT INTO Plan (PlanID, ClassID, MajorID, Grade, ClassType) VALUES
(1, 1, 1, 3, '必修'),
(2, 2, 2, 3, '选修');

INSERT INTO Course_Teacher (CourseID, TeacherID) VALUES
(1, 1),
(2, 2);

INSERT INTO Class_Course_Teacher (ClassID, CourseID, TeacherID) VALUES
(1, 1, 1),
(2, 2, 2);

SELECT * FROM Student WHERE StudentID = 1;
SELECT * FROM Student WHERE Name = '张三';
SELECT * FROM Student WHERE MajorID = 2;
INSERT INTO Grades (StudentID, CourseID, Grades, ResitGrades) VALUES
(1, 2, 88.0, NULL);
SELECT * FROM Grades;
SELECT 
    Course.CourseName, 
    Plan.ClassType, 
    Plan.Grade, 
    Course.Credits, 
    Grades.Grades
FROM 
    Grades
JOIN Course ON Grades.CourseID = Course.CourseID
JOIN Plan ON Course.CourseID = Plan.PlanID
WHERE 
    Grades.StudentID = 1;
    
    SELECT 
    AVG(CASE WHEN Plan.ClassType = '必修' THEN Grades.Grades ELSE NULL END) AS AvgRequired,
    AVG(Grades.Grades) AS AvgAll
FROM 
    Grades
JOIN Course ON Grades.CourseID = Course.CourseID
JOIN Plan ON Course.CourseID = Plan.PlanID
WHERE 
    Grades.StudentID = 1;
    
    SELECT DISTINCT 
    Teacher.Name
FROM 
    Grades
JOIN Course ON Grades.CourseID = Course.CourseID
JOIN Course_Teacher ON Course.CourseID = Course_Teacher.CourseID
JOIN Teacher ON Course_Teacher.TeacherID = Teacher.TeacherID
WHERE 
    Grades.StudentID = 1;
    
    SELECT 
    Student.StudentID, 
    Student.Name, 
    SUM(CASE WHEN Grades.Grades < 60 AND Plan.ClassType = '必修' THEN Course.Credits ELSE 0 END) AS FailedRequiredCredits,
    SUM(CASE WHEN Grades.Grades < 60 AND Plan.ClassType = '选修' THEN Course.Credits ELSE 0 END) AS FailedElectiveCredits
FROM 
    Grades
JOIN Student ON Grades.StudentID = Student.StudentID
JOIN Course ON Grades.CourseID = Course.CourseID
JOIN Plan ON Course.CourseID = Plan.PlanID
GROUP BY 
    Student.StudentID
HAVING 
    FailedRequiredCredits >= 7 OR FailedElectiveCredits >= 12;
    
    CREATE INDEX idx_student_name ON Student(Name);
CREATE INDEX idx_course_name ON Course(CourseName);

CREATE VIEW StudentGrades AS
SELECT 
    Student.StudentID, 
    Student.Name AS StudentName, 
    Course.CourseName, 
    Grades.Grades
FROM 
    Grades
JOIN Student ON Grades.StudentID = Student.StudentID
JOIN Course ON Grades.CourseID = Course.CourseID;