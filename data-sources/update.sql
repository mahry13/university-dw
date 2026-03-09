USE University;

-- update academic titles of 5 university teachers
UPDATE TOP (5) UniversityTeacher
SET 
    Title = 'Habilitated Doctor',
    MonthlySalary = 8000
WHERE Title = 'Doctor';

--update date of birth of a student
UPDATE Student
SET DateOfBirth = DATEADD(YEAR, 10, DateOfBirth)
WHERE StudentID = 10;