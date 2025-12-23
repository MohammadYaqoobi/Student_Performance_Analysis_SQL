# 📊 Educational Data Analytics: Student Performance Analysis

## 🎯 About This Project

This project demonstrates how **Educational Management** combined with **Data Analytics skills** can inform school policy decisions.

Unlike generic SQL exercises, each query answers a specific question that school administrators and policymakers actually face.

| My Background | Applied In This Project |
|---------------|------------------------|
| Educational Management (B.A.) | Framing the right questions |
| Data Analysis (SQL) | Extracting insights from data |

---

## 📈 Dataset

| Attribute | Details |
|-----------|---------|
| **Source** | [UCI ML Repository - Student Performance](https://archive.ics.uci.edu/ml/datasets/student+performance) |
| **Records** | 395 students |
| **Features** | 33 attributes |
| **Context** | Portuguese secondary school (Math course) |
| **Variables** | Demographics, family background, study habits, grades |

---

## 🔬 Research Questions & Findings

### 1. Cultural Capital Analysis
📁 `sql/01_cultural_capital_analysis.sql`

> **Theory:** Bourdieu's Cultural Capital - parental education transmits academic advantages to children.

| Parental Education | Students | Avg Grade | Higher Ed Aspiration |
|--------------------|----------|-----------|---------------------|
| Both Higher Education | 166 | 11.08 | 99.4% |
| One Parent Higher Ed | 94 | 11.04 | 92.6% |
| Basic Education | 131 | 9.02 | 91.6% |

**📌 Finding:** Students with higher-educated parents score **2 points higher** (11.08 vs 9.02) and show significantly stronger aspirations for higher education (99.4% vs 91.6%). This confirms Bourdieu's theory: cultural capital is transmitted across generations.

**🎯 Recommendation:** Schools should provide additional academic counseling and mentorship programs for first-generation students whose parents lack higher education.

---

### 2. Gender Gap Analysis
📁 `sql/02_gender_gap_analysis.sql`

> **Policy Question:** Do we have gender equity in educational outcomes?

| Gender | Support | Students | Avg Grade | Improvement |
|--------|---------|----------|-----------|-------------|
| Male | No | 172 | 11.06 | -0.34 |
| Male | Yes | 15 | 9.27 | 0.00 |
| Female | No | 172 | 10.06 | -0.90 |
| Female | Yes | 36 | 9.50 | +0.50 |

**📌 Finding:** Males outperform females by **1 full grade point** on average (11.06 vs 10.06). However, females respond better to school support programs, showing **+0.50 improvement** compared to 0.00 for males. This suggests support programs are more effective for female students.

**🎯 Recommendation:** Investigate root causes of the gender gap. Consider expanding support programs as females show higher responsiveness to intervention.

---

### 3. School Performance Comparison
📁 `sql/03_school_comparison.sql`

> **Management Question:** Which school performs better and why?

| School | Mother Education | Students | Avg Grade |
|--------|------------------|----------|-----------|
| MS | Higher Educated | 22 | 11.64 |
| GP | Higher Educated | 208 | 11.08 |
| GP | Non-Higher Educated | 141 | 9.62 |
| MS | Non-Higher Educated | 24 | 8.21 |

**📌 Finding:** When controlling for parental education, **MS school shows higher peaks but also deeper valleys**. The gap between advantaged and disadvantaged students is 3.43 points at MS versus only 1.46 points at GP. This suggests GP is more equitable, while MS amplifies existing inequalities.

**🎯 Recommendation:** MS school should investigate why disadvantaged students underperform so significantly and adopt equity-focused practices from GP.

---

### 4. Support Systems ROI
📁 `sql/04_support_systems_roi.sql`

> **Budget Question:** Are support programs worth the investment for struggling students?

| School Support | Paid Tutoring | Students | Start Grade | Final Grade | Improvement |
|----------------|---------------|----------|-------------|-------------|-------------|
| ✅ Yes | ❌ No | 17 | 7.29 | 7.94 | **+0.65** |
| ✅ Yes | ✅ Yes | 11 | 7.36 | 8.00 | **+0.64** |
| ❌ No | ✅ Yes | 48 | 7.79 | 7.56 | -0.23 |
| ❌ No | ❌ No | 66 | 7.17 | 5.17 | **-2.00** |

**📌 Finding:** This is the most critical insight. **School support alone improves grades (+0.65)**, but **paid tutoring without school support actually hurts performance (-0.23)**. Students with no support at all experience a dramatic **2-point decline**. Adding paid tutoring to school support provides no additional benefit (+0.64 ≈ +0.65).

**🎯 Recommendation:** Prioritize expanding free school support programs over encouraging paid tutoring. The data shows school support is effective and paid tutoring alone may create a false sense of security without addressing underlying issues.

---

### 5. Early Warning System
📁 `sql/05_early_warning_system.sql`

> **Intervention Question:** How can we identify at-risk students early?

| Risk Rank | Failures | Period 1 Grade | Final Grade | Pattern |
|-----------|----------|----------------|-------------|---------|
| 1-3 | 3 | 5 | 0, 0, 7 | Critical |
| 4-7 | 3 | 6-7 | 0, 5, 8, 9 | High Risk |
| 8-14 | 3 | 7-9 | 0, 7, 10 | At Risk |
| 15-20 | 2 | 4-7 | 0, 4, 7, 8 | Monitor |

**📌 Finding:** Students with **3 past failures combined with Period 1 grades below 7** have extremely high probability of final failure (many scoring 0). The risk formula `(failures × 5) + (20 - G1)` effectively identifies students needing immediate intervention. School average is 10.49, but top-risk students average well below 5.

**🎯 Recommendation:** Implement automated flagging system in the first 2 weeks of semester. Students with 2+ past failures AND Period 1 grade below 8 should receive mandatory academic support.

---

## 🛠️ SQL Techniques Demonstrated

| Technique | Where Used |
|-----------|------------|
| `CASE WHEN` | All queries - categorization |
| `GROUP BY` + `HAVING` | Filtering meaningful groups |
| `Aggregate Functions` | AVG, SUM, COUNT |
| `Window Functions` | Query 5 - RANK(), PARTITION BY |
| `CAST` | Decimal formatting |
| `Subqueries/Filtering` | Query 4 - struggling students only |

---

## 💡 Key Insights Summary

| # | Insight | Impact |
|---|---------|--------|
| 1 | Parental education strongly predicts student success | Target first-generation students |
| 2 | Females respond better to support programs | Expand support access |
| 3 | GP school is more equitable than MS | Share best practices |
| 4 | School support works; paid tutoring alone doesn't | Reallocate resources |
| 5 | Past failures + low G1 = reliable risk predictor | Enable early intervention |

---

## 🎓 Why This Analysis Matters

As an Educational Management graduate, I bring **domain expertise** that transforms raw data into **actionable policy recommendations**:

- Understanding **Bourdieu's Cultural Capital** theory to interpret achievement gaps
- Recognizing that **equity metrics** matter as much as averages
- Knowing that **ROI analysis** should focus on struggling students, not overall population
- Designing **early warning systems** that administrators can actually implement

---

## 📬 Contact

**Mohammad Yaqoobi**
Data Analytics Student | Background in Educational Management

[LinkedIn](https://www.linkedin.com/in/mohammad-yaqoobi/) • [Email](mailto:mohammad.yaqoobi143@gmail.com)

---

*⭐ If you found this project valuable, please consider giving it a star!*
