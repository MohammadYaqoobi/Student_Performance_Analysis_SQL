/*
=============================================================================
  CULTURAL CAPITAL & ACADEMIC ACHIEVEMENT
  Theory: Bourdieu's Cultural Capital - Higher parental education 
          transmits academic advantages to children
  Author: Mohammad Yaqoobi
=============================================================================
*/

SELECT 
    CASE 
        WHEN Medu >= 3 AND Fedu >= 3 THEN 'Both Higher Education'
        WHEN Medu >= 3 OR Fedu >= 3 THEN 'One Parent Higher Education'
        WHEN Medu >= 1 AND Fedu >= 1 THEN 'Basic Education'
        ELSE 'Minimal Education'
    END AS parental_education_level,
    COUNT(*) AS student_count,
    CAST(AVG(studytime) AS DECIMAL(10,2)) AS avg_study_hours,
    CAST(AVG(G3) AS DECIMAL(10,2)) AS avg_final_grade,
    SUM(CASE WHEN higher = 'yes' THEN 1 ELSE 0 END) AS wants_higher_edu,
    CAST(
        SUM(CASE WHEN higher = 'yes' THEN 1.0 ELSE 0 END) / COUNT(*) * 100 
    AS DECIMAL(10,2)) AS higher_edu_aspiration_pct
FROM student_mat
GROUP BY 
    CASE 
        WHEN Medu >= 3 AND Fedu >= 3 THEN 'Both Higher Education'
        WHEN Medu >= 3 OR Fedu >= 3 THEN 'One Parent Higher Education'
        WHEN Medu >= 1 AND Fedu >= 1 THEN 'Basic Education'
        ELSE 'Minimal Education'
    END
ORDER BY avg_final_grade DESC;