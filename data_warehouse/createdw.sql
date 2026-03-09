USE UniversityDW;
CREATE TABLE Faculty (
   FacultyID INT IDENTITY(1,1) PRIMARY KEY,
   FacultyName VARCHAR(60) NOT NULL
);

CREATE TABLE Department (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    FacultyID INT NOT NULL,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE Major (
    MajorID INT IDENTITY(1,1) PRIMARY KEY,
    MajorName VARCHAR(30) NOT NULL,
    Duration VARCHAR(12) CHECK (Duration IN ('6 semesters', '7 semesters', '9 semesters'))
);

CREATE TABLE Subject (
    SubjectID INT IDENTITY(1,1) PRIMARY KEY,
    SubjectName VARCHAR(50) NOT NULL,
    ECTS VARCHAR(30) CHECK (ECTS IN ('4 ECTS', '5 ECTS', '6 ECTS', '7 ECTS', '8 ECTS', '9 ECTS', '10 ECTS')),
    NumberOfHours VARCHAR(8) CHECK (NumberOfHours IN ('15 hours', '30 hours', '45 hours', '60 hours'))
);

CREATE TABLE Time (
    TimeID INT IDENTITY(1,1) PRIMARY KEY,
    Year INT CHECK (Year >= 1000 AND Year <= 9999),
    Semester VARCHAR(6) CHECK (Semester IN ('winter', 'summer'))
);

CREATE TABLE Student (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    NameAndSurname VARCHAR(50) COLLATE Latin1_General_BIN NOT NULL,
    AgeCategory VARCHAR(30) CHECK (AgeCategory IN (
        'less than 18 years old', 
        'from 18 to 23 years old', 
        'from 24 to 29 years old', 
        'from 30 to 39 years old', 
        'from 40 to 49 years old', 
        'from 50 to 59 years old', 
        'more than 60 years old'
    )),
    IsCurrent BIT NOT NULL
);

CREATE TABLE Lecturer (
    LecturerID INT IDENTITY(1,1) PRIMARY KEY,
    NameAndSurname VARCHAR(50) COLLATE Latin1_General_BIN NOT NULL,
    SalaryRange VARCHAR(30) CHECK (SalaryRange IN (
        'less than 3300 PLN', 
        'from 3300 to 4100 PLN', 
        'from 4100 to 5400 PLN', 
        'from 5400 to 6800 PLN', 
        'from 6800 to 8400 PLN', 
        'from 8400 to 9700 PLN', 
        'more than 9700 PLN'
    )),
    Title VARCHAR(25) CHECK (Title IN ('University Professor', 'Professor', 'Habilitated Doctor', 'Doctor', 'Master')),
    AgeCategory VARCHAR(30) CHECK (AgeCategory IN (
        'from 18 to 23 years old', 
        'from 24 to 29 years old', 
        'from 30 to 39 years old', 
        'from 40 to 49 years old', 
        'from 50 to 59 years old', 
        'more than 60 years old'
    )),
    DepartmentID INT NOT NULL,
    IsCurrent BIT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Junk (
    JunkID INT IDENTITY(1,1) PRIMARY KEY,
    MethodOfConduction VARCHAR(10) CHECK (MethodOfConduction IN ('Hybrid', 'Online', 'Stationary')),
    ExaminationType VARCHAR(15) CHECK (ExaminationType IN ('project', 'exam', 'pass', 'laboratories'))
);

CREATE TABLE Performance (
    Grade DECIMAL(2,1) CHECK (Grade >= 2 AND Grade <= 5),
    Satisfaction TINYINT CHECK (Satisfaction BETWEEN 1 AND 10),
    Usefulness TINYINT CHECK (Usefulness BETWEEN 1 AND 10),
    Clarity TINYINT CHECK (Clarity BETWEEN 1 AND 10),
    Recommendation BIT,
    Fairness TINYINT CHECK (Fairness BETWEEN 1 AND 10),
    UseOfResources TINYINT CHECK (UseOfResources BETWEEN 1 AND 10),
    Difficulty TINYINT CHECK (Difficulty BETWEEN 1 AND 3),
    TimeID INT,
    StudentID INT,
    LecturerID INT,
    SubjectID INT,
    JunkID INT,
    MajorID INT,
    FOREIGN KEY (TimeID) REFERENCES Time(TimeID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (LecturerID) REFERENCES Lecturer(LecturerID),
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID),
    FOREIGN KEY (JunkID) REFERENCES Junk(JunkID),
    FOREIGN KEY (MajorID) REFERENCES Major(MajorID),
	PRIMARY KEY(TimeID, StudentID, LecturerID, SubjectID, MajorID, JunkID)
);

CREATE TABLE Excel_Data (
	SurveyID INT,
    StudentID INT,
    LecturerID INT,
	ClassesID INT,
    SubjectID INT,
	Semester INT,
    Year INT,
    Overall_Satisfaction TINYINT CHECK (Overall_Satisfaction BETWEEN 1 AND 10),
    Usefulness TINYINT CHECK (Usefulness BETWEEN 1 AND 10),
    Recommend_Course NVARCHAR(3) CHECK (Recommend_Course IN ('Yes', 'No')),
    Clarity TINYINT CHECK (Clarity BETWEEN 1 AND 10),
    Fairness TINYINT CHECK (Fairness BETWEEN 1 AND 10),
    Use_Of_Resources TINYINT CHECK (Use_Of_Resources BETWEEN 1 AND 10),
	Most_Useful_Component NVARCHAR(15) CHECK (Most_Useful_Component IN ('Lectures', 'Labs', 'Readings', 'Assignments')),
	Workload_Perception NVARCHAR(10) CHECK (Workload_Perception IN ('Light', 'Moderate', 'Heavy'))
);
