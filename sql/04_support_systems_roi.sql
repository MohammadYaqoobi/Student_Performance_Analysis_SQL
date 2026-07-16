/*
=============================================================================
SUPPORT SYSTEMS RETURN ON INVESTMENT
Budget Question: For struggling students (G1 < 10), which support pays off?
Metric: growth (G3 - G1), because these students start below passing.
Author: Mohammad Yaqoobi
=============================================================================
*/
SELECT
    CASE
        WHEN schoolsup = 'yes' AND paid = 'yes' THEN 'Both'
        WHEN schoolsup = 'yes' AND paid = 'no'  THEN 'School Support Only'
        WHEN schoolsup = 'no'  AND paid = 'yes' THEN 'Paid Only'
        ELSE 'None'
    END AS support_type,
    COUNT(*) AS student_count,
    CAST(AVG(G1) AS DECIMAL(10,2)) AS avg_start_grade,
    CAST(AVG(G3) AS DECIMAL(10,2)) AS avg_final_grade,
    CAST(AVG(G3) - AVG(G1) AS DECIMAL(10,2)) AS improvement
FROM student_mat
WHERE G1 < 10
GROUP BY support_type
HAVING COUNT(*) >= 5
ORDER BY improvement DESC;
