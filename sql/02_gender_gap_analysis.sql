/*
=============================================================================
  GENDER GAP IN ACADEMIC PERFORMANCE
  Policy Question: Do we have gender equity in educational outcomes?
  Author: Mohammad Yaqoobi
=============================================================================
*/

-- Overall gender comparison with support system interaction
SELECT 
    sex AS gender,
    schoolsup AS school_support,
    COUNT(*) AS student_count,
    CAST(AVG(G3) AS DECIMAL(10,2)) AS avg_final_grade,
    CAST(AVG(G3) - AVG(G1) AS DECIMAL(10,2)) AS grade_improvement
FROM student_mat
GROUP BY sex, schoolsup
ORDER BY sex, school_support;