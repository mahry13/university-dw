USE UniversityDW;
GO

IF (OBJECT_ID('ETL_Performance_Data') IS NOT NULL) DROP VIEW ETL_Performance_Data;
GO

CREATE VIEW ETL_Performance_Data AS
SELECT DISTINCT
	t1.[Grade],
    t2.[Overall_Satisfaction] as Satisfaction, 
	t2.[Usefulness],
	t2.[Clarity],
	t2.[Fairness],
	t2.[Use_of_Resources],
	 CASE t2.[Workload_Perception]
        WHEN 'Light' THEN 1
        WHEN 'Moderate' THEN 2
        WHEN 'Heavy' THEN 3
    END AS Difficulty,
    CASE t2.[Recommend_course]
        WHEN 'Yes' THEN 1
        WHEN 'No' THEN 0
    END AS Recommendation,
	ws.SubjectID,
	  (SELECT  TimeID
     FROM UniversityDW.dbo.Time AS t
     WHERE t.Year = t2.Year
       AND t.Semester = 
           CASE 
               WHEN t2.Semester = 1 THEN 'winter'
               WHEN t2.Semester = 2 THEN 'summer'
           END) AS TimeID,
		     (SELECT   StudentID
     FROM UniversityDW.dbo.Student AS st
     WHERE st.NameAndSurname = Cast(wst.[FirstName] + ' ' + wst.[LastName] as nvarchar(128))
       AND st.IsCurrent=1) AS StudentID,
	   wm.MajorID,
	    (SELECT LecturerID
     FROM UniversityDW.dbo.Lecturer AS wl
     WHERE wl.NameAndSurname = Cast(ul.[FirstName] + ' ' + ul.[LastName] as nvarchar(128))
       AND wl.IsCurrent=1) AS LecturerID,
	    (SELECT   JunkID
     FROM UniversityDW.dbo.Junk AS wj
     WHERE ucs.MethodOfConducting=wj.MethodOfConduction
       AND us.ExaminationType=wj.ExaminationType) AS JunkID

FROM UniversityDW.dbo.[Excel_Data] as t2
JOIN University.dbo.[Grades] AS t1  ON  t1.StudentID=t2.StudentID and t1.ClassesID=t2.ClassesID
JOIN University.dbo.[Subject] AS us ON t2.SubjectID = us.SubjectID
JOIN UniversityDW.dbo.Subject AS ws ON us.SubjectName = ws.Subjectname
JOIN University.dbo.[SubjectInCertainSemester] AS ucs ON t1.ClassesID = ucs.ClassesID
JOIN University.dbo.Student AS wst ON wst.StudentID = t2.StudentID
JOIN University.dbo.[Major] AS um ON ucs.MajorID = um.MajorID
JOIN UniversityDW.dbo.Major AS wm ON um.MajorName = wm.Majorname
JOIN University.dbo.UniversityTeacher AS ul ON ul.LecturerID = t2.LecturerID

GO


MERGE INTO Performance AS TT
USING ETL_Performance_Data AS ST
ON 
    TT.StudentID = ST.StudentID
    AND TT.SubjectID = ST.SubjectID
    AND TT.TimeID = ST.TimeID
    AND TT.MajorID = ST.MajorID
    AND TT.LecturerID = ST.LecturerID
    AND TT.JunkID = ST.JunkID
WHEN NOT MATCHED THEN
    INSERT (
        Grade,
        Satisfaction,
        Usefulness,
        Clarity,
        Fairness,
        UseofResources,
        Difficulty,
        Recommendation,
        StudentID,
        SubjectID,
        TimeID,
        MajorID,
        LecturerID,
        JunkID
    )
    VALUES (
        ST.Grade,
        ST.Satisfaction,
        ST.Usefulness,
        ST.Clarity,
        ST.Fairness,
        ST.Use_of_Resources,
        ST.Difficulty,
        ST.Recommendation,
        ST.StudentID,
        ST.SubjectID,
        ST.TimeID,
        ST.MajorID,
        ST.LecturerID,
        ST.JunkID
    );
GO
DROP VIEW ETL_Performance_Data;