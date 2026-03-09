USE UniversityDW;

INSERT INTO [dbo].[Junk] (MethodOfConduction, ExaminationType)
SELECT 
    m.MethodOfConduction,
    e.ExaminationType
FROM 
    (VALUES 
        ('hybrid'), 
        ('online'), 
        ('stationary')
    ) AS m(MethodOfConduction)
CROSS JOIN 
    (VALUES 
        ('project'),
        ('exam'),
        ('pass'),
        ('laboratories')
    ) AS e(ExaminationType);