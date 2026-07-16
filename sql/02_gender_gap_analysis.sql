/*
=============================================================================
GENDER GAP IN ACADEMIC PERFORMANCE
Policy Question: Do we see gender equity in educational outcomes?
Note: Support is usually assigned to weaker students (selection bias),
      so we report GROWTH (G3 - G1), not just grade level.
Author: Mohammad Yaqoobi
=============================================================================
*/
SELECT
    sex       AS gender,
    schoolsup AS school_support,
    COUNT(*)  AS student_count,
    CAST(AVG(G1)        AS DECIMAL(10,2)) AS avg_start_grade,
    CAST(AVG(G3)        AS DECIMAL(10,2)) AS avg_final_grade,
    CAST(AVG(G3) - AVG(G1) AS DECIMAL(10,2)) AS grade_improvement
FROM student_mat
GROUP BY sex, schoolsup
ORDER BY sex, school_support;
