USE UniversityDW
GO

If (object_id('ETL_Major_Data') is not null) Drop View ETL_Major_Dat;
go
CREATE VIEW ETL_Major_Data
AS
SELECT DISTINCT
	[MajorID],
    [MajorName],
    CAST([Duration] AS VARCHAR(2)) + ' semesters' AS [Duration]
FROM University.dbo.Major
GO


MERGE INTO Major as TT
	USING ETL_Major_Data as ST
		ON TT.MajorName = ST.MajorName
		AND TT.Duration = ST.Duration
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.MajorName,
					ST.Duration
					);

Drop View ETL_Major_Data;