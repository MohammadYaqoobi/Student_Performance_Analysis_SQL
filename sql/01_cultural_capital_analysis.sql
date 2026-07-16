/*
=============================================================================
CULTURAL CAPITAL & ACADEMIC ACHIEVEMENT
Theory: Bourdieu's Cultural Capital
Note: Medu/Fedu >= 3 means "secondary or higher" (3=secondary, 4=higher).
Author: Mohammad Yaqoobi
=============================================================================
*/
WITH classified AS (
    SELECT
        studytime, G3, higher,
        CASE
            WHEN Medu >= 3 AND Fedu >= 3 THEN 'Both Secondary+ Education'
            WHEN Medu >= 3 OR  Fedu >= 3 THEN 'One Parent Secondary+ Education'
            WHEN Medu >= 1 AND Fedu >= 1 THEN 'Basic Education'
            ELSE 'Minimal Education'
        END AS parental_education_level
    FROM student_mat
)
SELECT
    parental_education_level,
    COUNT(*) AS student_count,
    CAST(AVG(studytime) AS DECIMAL(10,2)) AS avg_study_hours,
    CAST(AVG(G3)        AS DECIMAL(10,2)) AS avg_final_grade,
    SUM(higher = 'yes')                    AS wants_higher_edu,
    CAST(SUM(higher = 'yes') / COUNT(*) * 100 AS DECIMAL(10,2)) AS higher_edu_aspiration_pct
FROM classified
GROUP BY parental_education_level
HAVING COUNT(*) >= 10
ORDER BY avg_final_grade DESC;
