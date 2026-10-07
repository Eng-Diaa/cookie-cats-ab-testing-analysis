# 📊 Cookie Cats A/B Testing Analysis: Player Retention Optimization

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![SciPy](https://img.shields.io/badge/SciPy-8CAAE6?style=for-the-badge&logo=scipy&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

## 📑 1. Executive Summary
This repository contains the statistical and behavioral analysis of an A/B test conducted on the popular mobile puzzle game, **Cookie Cats**. The core objective of the experiment was to evaluate the business and user engagement impact of moving the first in-app purchase and forced break gate from **Level 30 (Control)** to **Level 40 (Variant)**.

Our comprehensive analysis conclusively proves that delaying the gate to Level 40 has a **statistically significant negative impact on long-term (Day 7) player retention**. Therefore, to maximize player lifetime value and sustained engagement, we strongly recommend retaining the gate at Level 30.

---

## 🎯 2. Project Scope & Methodology
The analysis followed a rigorous, full-lifecycle data science methodology:
- **Data Extraction & Cleaning:** Used Python (Pandas) to clean the dataset and validate sample distribution.
- **Inferential Statistics:** Utilized **Chi-Square tests** to establish statistical significance for categorical variables (Retention True/False).
- **Simulation Validation:** Applied **Bootstrapping** techniques (500 resamples) to measure the stability and consistency of the retention gap.
- **Visual Data Storytelling:** Engineered a dynamic, high-fidelity **Power BI executive dashboard** for clear stakeholder communication.

---

## 🧹 3. Data Integrity & Outlier Treatment
Before computing any statistical metrics, a structural validation of the dataset was performed. Exploratory Data Analysis (EDA) revealed a severe anomaly: a single user had logged an impossible *49,854 rounds*. 

Including this outlier would have drastically skewed the average engagement metrics. By applying targeted data cleaning protocols, this user was excluded, ensuring the analysis reflects the actual behavior of the average player base rather than extreme edge cases.

---

## 🧮 4. Statistical Rigor: Chi-Square & Bootstrapping
To determine if the observed drop in Day 7 retention was a genuine product of the updated game mechanics rather than random noise, a statistical hypothesis test was formulated:

- **Null Hypothesis ($H_0$):** Moving the gate to Level 40 has *no impact* on Day 7 retention.
- **Alternative Hypothesis ($H_1$):** Moving the gate to Level 40 *significantly decreases* Day 7 retention.

> **💡 Statistical Verdict:**
> The Python-driven Chi-Square analysis yielded a **P-value of 0.0016**. Because this value is far below the standard business alpha threshold of 0.05, we **reject the null hypothesis**. We are 99.84% confident that the retention decline is a direct consequence of the Level 40 gate update.

A subsequent **Bootstrapping simulation** (500 iterations) consistently showed a positive percentage difference in favor of the Control group (Gate 30), ranging between 3.9% and 6.3% variance across iterations, solidifying the initial findings.

---

## 🧠 5. Behavioral Insights: The Burnout Hypothesis
Interestingly, the dataset revealed that the **average game rounds played were nearly identical** for both groups (~51.3 rounds). This indicates that the *effort* put in by players did not drop.

**Why did Day 7 retention drop then?**
The core issue lies in the pacing of the game. At Level 30, players hit a natural, forced break earlier in their initial lifecycle. This brief pause preserves their enthusiasm, prompting them to return days later. By pushing the gate to Level 40, players engaged in an uninterrupted, prolonged session. They either achieved a sense of completion early on or exhausted themselves, resulting in higher churn (burnout) by Day 7.

---

## 📈 6. Executive Dashboard
Below is the Power BI dashboard built to present these findings to C-level executives.

> ⚠️ **Note to recruiters:** The dashboard focuses on a high "Data-to-Ink Ratio" and clear data storytelling, avoiding unnecessary chart clutter to highlight the actionable insights directly.

![Executive Dashboard](path/to/your/dashboard_screenshot.png) 
*(Please upload your final Power BI screenshot to the repository and update this image path)*

---

## 🚀 7. Strategic Recommendations & Next Steps
Based on the robust statistical evidence and behavioral metrics, we present the following strategic directives:

1. **Rollback the Update:** Immediately abandon the Level 40 gate initiative. The definitive drop in Day 7 retention translates to a measurable loss in long-term Daily Active Users (DAU) and revenue.
2. **Strictly Retain Gate at Level 30:** The Level 30 gate currently acts as an optimal psychological pacing mechanism. It forces a healthy break before player fatigue sets in.
3. **Future Testing Considerations:** Future A/B tests should focus on introducing softer monetization mechanics without altering the core friction point of the Level 30 progression gate.