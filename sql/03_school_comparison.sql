/*
=============================================================================
SCHOOL PERFORMANCE COMPARISON
Management Question: Which school performs better, controlling for background?
Note: Medu >= 3 means "secondary OR higher" (3 = secondary, 4 = higher).
Author: Mohammad Yaqoobi
=============================================================================
*/
SELECT
    school,
    CASE
        WHEN Medu >= 3 THEN 'Secondary+ Educated Mother'
        ELSE 'Lower Educated Mother'
    END AS mother_education,
    COUNT(*) AS student_count,
    CAST(AVG(G3) AS DECIMAL(10,2)) AS avg_final_grade
FROM student_mat
GROUP BY school,
    CASE
        WHEN Medu >= 3 THEN 'Secondary+ Educated Mother'
        ELSE 'Lower Educated Mother'
    END
HAVING COUNT(*) >= 10
ORDER BY school, mother_education;
