USE UniversityDW;
GO

IF (OBJECT_ID('ETL_Subject_Data') IS NOT NULL) DROP VIEW ETL_Subject_Data;
GO

CREATE VIEW ETL_Subject_Data AS
SELECT DISTINCT
	[SubjectID],
    [SubjectName], 
    [ECTS] = Cast(t1.[ECTS] AS nvarchar(128)) + ' ECTS',         
    [NumberOfHours] = Cast(t1.[NumberOfHours] AS nvarchar(128)) + ' hours'
FROM University.dbo.[Subject] AS t1;
GO

MERGE INTO Subject AS TT
    USING ETL_Subject_Data AS ST
    ON TT.SubjectID = ST.SubjectID  
    WHEN NOT MATCHED THEN
        INSERT (SubjectName, ECTS, NumberOfHours)
        VALUES (ST.SubjectName, ST.ECTS, ST.NumberOfHours);
GO

DROP VIEW ETL_Subject_Data;