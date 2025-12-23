/*
=============================================================================
  EARLY WARNING SYSTEM FOR AT-RISK STUDENTS
  Intervention Question: How can we identify struggling students early?
  Technique: Window Function for ranking students by risk within each school
  Author: Mohammad Yaqoobi
=============================================================================
*/

SELECT 
    school,
    sex,
    failures,
    G1,
    G3,
    RANK() OVER (
        PARTITION BY school 
        ORDER BY (failures * 5 + (20 - G1)) DESC
    ) AS risk_rank,
    CAST(
        AVG(G3) OVER (PARTITION BY school) 
    AS DECIMAL(10,2)) AS school_avg_grade
FROM student_mat
ORDER BY school, risk_rank
LIMIT 20;