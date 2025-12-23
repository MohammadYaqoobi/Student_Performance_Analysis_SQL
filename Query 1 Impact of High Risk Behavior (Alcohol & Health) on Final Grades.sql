-- Query 1: Impact of High Risk Behavior (Alcohol & Health) on Final Grades
SELECT 
    CASE 
        WHEN (Dalc + Walc) >= 6 THEN 'High Alcohol Consumption'
        WHEN (Dalc + Walc) BETWEEN 3 AND 5 THEN 'Moderate Consumption'
        ELSE 'Low Consumption'
    END AS Risk_Category,
    AVG(health) AS Avg_Health_Score,
    AVG(absences) AS Avg_Absences,
    CAST(AVG(G3) AS DECIMAL(10,2)) AS Average_Final_Grade
FROM student_mat
GROUP BY 
    CASE 
        WHEN (Dalc + Walc) >= 6 THEN 'High Alcohol Consumption'
        WHEN (Dalc + Walc) BETWEEN 3 AND 5 THEN 'Moderate Consumption'
        ELSE 'Low Consumption'
    END

ORDER BY Average_Final_Grade DESC;
