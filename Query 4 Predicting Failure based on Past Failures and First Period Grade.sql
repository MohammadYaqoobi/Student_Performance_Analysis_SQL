-- Query 4: Predicting Failure based on Past Failures and First Period Grade
SELECT 
    failures AS Past_Failures,
    CASE 
        WHEN G1 < 10 THEN 'Failed Period 1'
        WHEN G1 BETWEEN 10 AND 14 THEN 'Average Period 1'
        ELSE 'High Achiever Period 1'
    END AS G1_Performance,
    COUNT(*) AS Total_Students,
    SUM(CASE WHEN G3 < 10 THEN 1 ELSE 0 END) AS Final_Fail_Count,
    CAST((SUM(CASE WHEN G3 < 10 THEN 1.0 ELSE 0.0 END) / COUNT(*)) * 100 AS DECIMAL(10,2)) AS Failure_Rate_Percentage
FROM student_mat
GROUP BY failures, 
    CASE 
        WHEN G1 < 10 THEN 'Failed Period 1'
        WHEN G1 BETWEEN 10 AND 14 THEN 'Average Period 1'
        ELSE 'High Achiever Period 1'
    END
ORDER BY failures, Failure_Rate_Percentage DESC;