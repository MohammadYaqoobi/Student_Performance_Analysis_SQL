# Student Performance Strategy: From Data to Policy

## 📋 Project Overview

This project bridges the gap between **Educational Management theory** and **Data Analytics**. Using a dataset of student performance, I built an end-to-end analysis pipeline (SQL + Power BI) to answer a critical question: **Where should a school invest its limited budget to improve student outcomes?**

Unlike standard data projects that focus only on "what happened," this analysis focuses on **"why it matters"** and **"what to do next."**

### 👤 Author's Background
*   **Domain Expertise:** B.A. in Educational Management (Applied Bourdieu’s Cultural Capital theory & Equity frameworks).
*   **Technical Skills:** SQL (for data extraction & logic), Power BI (for visualization & storytelling).

---

## 📊 The Interactive Dashboard

I translated the raw SQL insights into a 4-page interactive report to help school administrators make data-driven decisions.

*(Note: The actual .pbix file is included in this repository).*

### 1. Executive Overview
A high-level view of the school's health, showing performance distribution across gender and schools (GP vs. MS).
![Overview Dashboard]([images/Overview.png])

### 2. Equity Analysis (Cultural Capital)
Here, I tested Bourdieu's theory. The data confirms a sharp divide: Students with higher-educated parents score **+2.0 points** higher on average.
*(Note: Groups with statistically insignificant sample sizes, like 'Minimal Education', were excluded to ensure accuracy).*
![Equity Dashboard]([images/Equity Analysis.png])

### 3. ROI Analysis (The Most Critical Finding)
This page answers the budget question. The data reveals that **paid tutoring alone is ineffective (-0.23 growth)** for struggling students, whereas **free school support** yields the highest return (+0.65 growth).
![ROI Dashboard]([images/RIO.png])

### 4. Early Warning System
An operational tool for counselors to identify at-risk students before they fail, based on a custom risk formula calculated in SQL.
![Warning System Dashboard]([images/Early Warning System.png])

---

## 🛠️ Technical Implementation

### Data Source
*   **Dataset:** Student Performance Data (Math Course).
*   **Volume:** 395 Records, 33 Attributes.
*   **Tools:** PostgreSQL, Power BI Desktop.

### SQL Logic & Key Findings
I wrote 5 specific queries to extract these insights. You can find the raw `.sql` files in the `sql/` folder.

| Analysis | Key Insight | Recommendation |
|:---|:---|:---|
| **1. Cultural Capital** | Parental education is the strongest predictor of grades. There is a **2-point gap** between students with educated parents vs. those without. | Launch mentorship programs specifically for first-generation students. |
| **2. Gender Gap** | While boys score slightly higher on average, **girls respond significantly better (+0.50)** to school support programs. | Expand support program slots for female students to maximize impact. |
| **3. School Equity** | **GP School** maintains consistent performance, while **MS School** shows extreme inequality between advantaged and disadvantaged students. | MS School needs to adopt GP's equity-focused policies. |
| **4. ROI (Budget)** | **School Support (+0.65)** outperforms **Paid Tutoring (-0.23)**. Spending money on tutors without school support is a wasted investment. | **Stop** pushing paid tutoring as a standalone solution. Shift budget to internal school support. |
| **5. Risk Algorithm** | Students with `3 failures` + `G1 Grade < 7` have a near-100% failure rate in the final exam. | Implement the SQL-based "Risk Score" to flag these students in Week 2 of the semester. |

---

## 🧠 Analyst Note: Why This Matters?

The most surprising finding in this project was the **negative impact of paid tutoring** when isolated.
Common sense suggests that "more tutoring = better grades." However, the data proves that for struggling students, paid classes might create a false sense of security. The real value comes from structured **School Educational Support**.

This insight alone could save the school administration significant budget and redirect it to where it actually works.

---

## 📬 Connect

If you found this analysis interesting or have questions about the SQL logic used, feel free to reach out.

**Mohammad Yaqoobi**
Data Analyst | Educational Management Background
[LinkedIn Profile](https://www.linkedin.com/in/mohammad-yaqoobi/)
