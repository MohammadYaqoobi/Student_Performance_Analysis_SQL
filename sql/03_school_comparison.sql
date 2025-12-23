/*
=============================================================================
  SCHOOL PERFORMANCE COMPARISON
  Management Question: Which school performs better and why?
  Note: Controlling for parental education ensures fair comparison
  Author: Mohammad Yaqoobi
=============================================================================
*/

SELECT 
    school,
    CASE 
        WHEN Medu >= 3 THEN 'Higher Educated Mother'
        ELSE 'Non-Higher Educated Mother'
    END AS mother_education,
    COUNT(*) AS student_count,
    CAST(AVG(G3) AS DECIMAL(10,2)) AS avg_final_grade
FROM student_mat
GROUP BY school, 
    CASE 
        WHEN Medu >= 3 THEN 'Higher Educated Mother'
        ELSE 'Non-Higher Educated Mother'
    END
HAVING COUNT(*) >= 10
ORDER BY school, mother_education;