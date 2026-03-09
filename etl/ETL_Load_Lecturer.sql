USE UniversityDW
GO

If (object_id('ETL_Lecturer_Data') is not null) Drop View ETL_Lecturer_Data;
go
CREATE VIEW ETL_Lecturer_Data
AS
SELECT DISTINCT
    [NameAndSurname] = Cast(t1.[FirstName] + ' ' + t1.[LastName] as nvarchar(128)),
    CASE 
		WHEN MonthlySalary < 3300 THEN 'less than 3300 PLN'
		WHEN MonthlySalary >= 3300 AND MonthlySalary < 4100 THEN 'from 3300 to 4100 PLN'
		WHEN MonthlySalary >= 4100 AND MonthlySalary < 5400 THEN 'from 4100 to 5400 PLN'
		WHEN MonthlySalary >= 5400 AND MonthlySalary < 6800 THEN 'from 5400 to 6800 PLN'
		WHEN MonthlySalary >= 6800 AND MonthlySalary < 8400 THEN 'from 6800 to 8400 PLN'
		WHEN MonthlySalary >= 8400 AND MonthlySalary < 9700 THEN 'from 8400 to 9700 PLN'
		WHEN MonthlySalary >= 9700 THEN 'more than 9700 PLN'
		ELSE NULL
	END AS [SalaryRange],
	[Title],
	CASE 
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) BETWEEN 18 AND 23 THEN 'from 18 to 23 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) BETWEEN 24 AND 29 THEN 'from 24 to 29 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) BETWEEN 30 AND 39 THEN 'from 30 to 39 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) BETWEEN 40 AND 49 THEN 'from 40 to 49 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) BETWEEN 50 AND 59 THEN 'from 50 to 59 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) >= 60 THEN 'more than 60 years old'
		ELSE NULL
	END AS [AgeCategory],
	t3.DepartmentID

FROM university.dbo.UniversityTeacher as t1
JOIN university.dbo.Department as t2 ON t2.DepartmentName=t1.DepartmentName
JOIN UniversityDW.dbo.Department as t3 ON t2.DepartmentName=t3.DepartmentName
GO


MERGE INTO Lecturer as TT
	USING ETL_Lecturer_Data as ST
		ON TT.NameAndSurname = ST.NameAndSurname COLLATE DATABASE_DEFAULT
		AND TT.SalaryRange= ST.SalaryRange
		AND TT.Title=ST.Title
		AND TT.AgeCategory=ST.AgeCategory
		AND TT.DepartmentID=ST.DepartmentID
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.NameAndSurname,
					ST.SalaryRange,
					ST.Title,
					ST.AgeCategory,
					ST.DepartmentID,
					1
					)
WHEN NOT MATCHED BY SOURCE
     AND TT.NameAndSurname != 'UNKNOWN' THEN
    UPDATE SET
        TT.IsCurrent = 0;
			;
GO

Drop View ETL_Lecturer_Data;

SELECT NameAndSurname, COUNT(*)
FROM Lecturer
GROUP BY NameAndSurname
HAVING COUNT(*) > 1;

SELECT NameAndSurname, IsCurrent
FROM Lecturer
WHERE IsCurrent = 0;