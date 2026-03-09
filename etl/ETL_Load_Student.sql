USE UniversityDW
GO

IF (object_id('ETL_Student_Data') is not null) DROP VIEW ETL_Student_Data;
GO
CREATE VIEW ETL_Student_Data
AS
SELECT DISTINCT
    [NameAndSurname] = Cast(t1.[FirstName] + ' ' + t1.[LastName] as nvarchar(128)),
	CASE 
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) < 18 THEN 'less than 18 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) BETWEEN 18 AND 23 THEN 'from 18 to 23 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) BETWEEN 24 AND 29 THEN 'from 24 to 29 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) BETWEEN 30 AND 39 THEN 'from 30 to 39 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) BETWEEN 40 AND 49 THEN 'from 40 to 49 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) BETWEEN 50 AND 59 THEN 'from 50 to 59 years old'
		WHEN DATEDIFF(YEAR, DateOfBirth, GETDATE()) >= 60 THEN 'more than 60 years old'
		ELSE NULL
	END AS [AgeCategory]

FROM university.dbo.Student as t1
GO

MERGE INTO Student as TT
	USING ETL_Student_Data as ST
		ON TT.NameAndSurname = ST.NameAndSurname
		AND TT.AgeCategory=ST.AgeCategory
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.NameAndSurname,
					ST.AgeCategory,
					1
					)

WHEN NOT MATCHED BY SOURCE
     AND TT.NameAndSurname != 'UNKNOWN' THEN
    UPDATE SET
        TT.IsCurrent = 0;
			;
GO

DROP VIEW ETL_Student_Data;