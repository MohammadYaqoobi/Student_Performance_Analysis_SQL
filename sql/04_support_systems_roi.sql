/*
=============================================================================
  SUPPORT SYSTEMS RETURN ON INVESTMENT
  Budget Question: Are support programs worth the investment?
  Note: Filtered for struggling students (G1 < 10) to measure true impact
  Author: Mohammad Yaqoobi
=============================================================================
*/

SELECT 
    schoolsup AS school_support,
    paid AS paid_tutoring,
    COUNT(*) AS student_count,
    CAST(AVG(G1) AS DECIMAL(10,2)) AS avg_start_grade,
    CAST(AVG(G3) AS DECIMAL(10,2)) AS avg_final_grade,
    CAST(AVG(G3) - AVG(G1) AS DECIMAL(10,2)) AS improvement
FROM student_mat
WHERE G1 < 10
GROUP BY schoolsup, paid
HAVING COUNT(*) >= 5
ORDER BY improvement DESC;