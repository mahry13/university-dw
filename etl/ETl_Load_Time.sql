USE UniversityDW;
GO

MERGE INTO [dbo].[Time] AS target
USING 
    (SELECT 
        y.Year, 
        s.Semester
     FROM 
        (VALUES (2020), (2021), (2022),(2023),(2024),(2025),(2026),(2027),(2028),(2029),(2030)) AS y(Year)
     CROSS JOIN 
        (VALUES ('winter'), ('summer')) AS s(Semester)
    ) AS source
ON 
    target.Semester = source.Semester 
    AND target.Year = source.Year
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Year, Semester)
    VALUES (source.Year, source.Semester)
WHEN MATCHED THEN
    -- Optionally, update logic can go here if you need to update existing records.
    -- In this case, it's probably unnecessary to update since we're only inserting
    UPDATE SET target.Year = source.Year,
               target.Semester  = source.Semester ;
