-- Query 3: Correlation between Family Stability and Academic Performance
SELECT 
    Pstatus AS Parents_Cohabitation_Status, -- (T: Together, A: Apart)
    famrel AS Family_Relationship_Quality, -- (1: Bad to 5: Good)
    AVG(studytime) AS Avg_Study_Time,
    CAST(AVG(G3) AS DECIMAL(10,2)) AS Average_Final_Grade
FROM student_mat
GROUP BY Pstatus, famrel
HAVING COUNT(*) > 5
ORDER BY Pstatus, Family_Relationship_Quality DESC;