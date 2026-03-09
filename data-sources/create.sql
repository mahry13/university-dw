USE University;

-- Faculty Table
CREATE TABLE Faculty (
    FacultyName VARCHAR(60) PRIMARY KEY,
    Website VARCHAR(70),
    Email VARCHAR(50)
);

-- Department Table
CREATE TABLE Department (
    DepartmentName VARCHAR(100) PRIMARY KEY,
    FacultyName VARCHAR(60),
    FOREIGN KEY (FacultyName) REFERENCES Faculty(FacultyName)
);

-- University Teacher Table
CREATE TABLE UniversityTeacher (
    LecturerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(20) COLLATE Latin1_General_BIN,
    LastName NVARCHAR(30) COLLATE Latin1_General_BIN,
    DateOfBirth DATE,
    DateOfEmployment DATE,
    Title VARCHAR(20) CHECK (Title IN ('Master', 'Doctor', 'Habilitated Doctor', 'University Professor', 'Professor')),
    Email VARCHAR(70) UNIQUE,
    MonthlySalary NUMERIC,
    DepartmentName VARCHAR(100),
    FOREIGN KEY (DepartmentName) REFERENCES Department(DepartmentName)
);

-- Major Table
CREATE TABLE Major (
    MajorID INT IDENTITY(1,1) PRIMARY KEY,
    MajorName VARCHAR(30),
    MaximumNumberOfStudents SMALLINT,
    [Language] VARCHAR(15),
    Duration SMALLINT,
    TypeOfGraduation VARCHAR(20) CHECK (TypeOfGraduation IN('Masters degree', 'Bachelors degree', 'Engineering degree')),
    [Description] VARCHAR(150),
    FacultyName VARCHAR(60),
    FOREIGN KEY (FacultyName) REFERENCES Faculty(FacultyName)
);

-- Subject Table
CREATE TABLE [Subject] (
    SubjectID INT IDENTITY(1,1) PRIMARY KEY,
    SubjectName VARCHAR(50),
    ECTS SMALLINT CHECK (ECTS > 0), 
    NumberOfHours SMALLINT CHECK (NumberOfHours > 0),
    ExaminationType VARCHAR(20) CHECK (ExaminationType IN ('project', 'laboratories', 'exam', 'pass'))
);

-- SubjectInCertainSemester Table
CREATE TABLE SubjectInCertainSemester (
    ClassesID INT IDENTITY(1,1) PRIMARY KEY,
    YearOfConduction SMALLINT CHECK (YearOfConduction > 0), 
    SubjectID INT,
    MajorID INT,
    Semester SMALLINT CHECK (Semester IN (1, 2)),  -- Assuming 1 for Spring, 2 for Fall
    TeacherID INT,
    MethodOfConducting VARCHAR(10) CHECK (MethodOfConducting IN ('stationary', 'online', 'hybrid')),
    FOREIGN KEY (SubjectID) REFERENCES [Subject](SubjectID),
    FOREIGN KEY (MajorID) REFERENCES Major(MajorID),
    FOREIGN KEY (TeacherID) REFERENCES UniversityTeacher(LecturerID)
);

-- Student Table
CREATE TABLE Student (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(20) COLLATE Latin1_General_BIN,
    LastName NVARCHAR(30) COLLATE Latin1_General_BIN,
    Email VARCHAR(70) UNIQUE,
	DateOfBirth DATE,
	StartYear DATE,
	MajorID INT,
	FOREIGN KEY (MajorID) REFERENCES Major(MajorID)
);

-- Grades Table
CREATE TABLE Grades (
    StudentID INT,
    ClassesID INT,
    Grade FLOAT CHECK (Grade IN (2, 3, 3.5, 4, 4.5, 5)),
    Pass BIT NOT NULL,
    Retaking BIT NOT NULL,
    PRIMARY KEY (StudentID, ClassesID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClassesID) REFERENCES SubjectInCertainSemester(ClassesID)
);
