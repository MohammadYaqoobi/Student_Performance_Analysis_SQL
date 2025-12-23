-- Query 2: Effectiveness of Educational Support Systems
SELECT 
    schoolsup AS School_Support,
    famsup AS Family_Support,
    paid AS Extra_Paid_Classes,
    COUNT(*) AS Student_Count,
    CAST(AVG(G1) AS DECIMAL(10,2)) AS Avg_First_Period_Grade,
    CAST(AVG(G3) AS DECIMAL(10,2)) AS Avg_Final_Grade,
    -- محاسبه پیشرفت نمره از ترم اول تا آخر
    CAST(AVG(G3) - AVG(G1) AS DECIMAL(10,2)) AS Grade_Improvement
FROM student_mat
GROUP BY schoolsup, famsup, paid
ORDER BY Avg_Final_Grade DESC;