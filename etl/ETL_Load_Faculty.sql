USE UniversityDW
GO

If (object_id('ETL_Faculty_Data') is not null) Drop View ETL_Faculty_Data;
go
CREATE VIEW ETL_Faculty_Data
AS
SELECT DISTINCT
    [FacultyName]
FROM university.dbo.Faculty
GO

MERGE INTO Faculty as TT
	USING ETL_Faculty_Data as ST
		ON TT.FacultyName = ST.FacultyName
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.FacultyName
					);

Drop View ETL_Faculty_Data;