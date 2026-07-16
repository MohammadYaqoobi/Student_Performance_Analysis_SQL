/*
=============================================================================
EARLY WARNING SYSTEM FOR AT-RISK STUDENTS
Intervention Question: How do we spot struggling students early?
Technique: custom risk score + window ranking within each school.
Note: Dalc/Walc are context columns only, NOT part of the score.
Author: Mohammad Yaqoobi
=============================================================================
*/
SELECT
    school,
    sex,
    failures,
    G1,
    G3,
    (failures * 5 + (20 - G1)) AS risk_score,
    CASE
        WHEN (failures * 5 + (20 - G1)) >= 29 THEN 'Critical'
        WHEN (failures * 5 + (20 - G1)) >= 28 THEN 'High Risk'
        WHEN (failures * 5 + (20 - G1)) >= 27 THEN 'At Risk'
        ELSE 'Monitor'
    END AS risk_category,
    RANK() OVER (
        PARTITION BY school
        ORDER BY (failures * 5 + (20 - G1)) DESC
    ) AS risk_rank,
    CAST(AVG(G3) OVER (PARTITION BY school) AS DECIMAL(10,2)) AS school_avg_grade
FROM student_mat
ORDER BY school, risk_rank
LIMIT 20;
