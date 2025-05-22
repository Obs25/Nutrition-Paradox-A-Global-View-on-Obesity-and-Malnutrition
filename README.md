# ⚖️ Nutrition Paradox: A Global View on Obesity and Malnutrition

## 🌍 Overview

This project explores the **dual burden of obesity and malnutrition** using real-world WHO datasets. By integrating **data engineering**, **exploratory analysis**, **SQL querying**, and **Power BI dashboards**, we uncover striking insights that can help shape global health policies.

---

## 🧠 Skills Gained

- 📦 ETL & Data Preprocessing
- 🐍 Python (Pandas, Seaborn, Matplotlib, Plotly)
- 🧹 Data Cleaning & Feature Engineering
- 🧮 SQL (Table creation, Join queries, Aggregations)
- 📊 Power BI (Dashboards & Reports)
- 🌐 API Handling & pycountry for ISO conversion

---

## 📌 Problem Statement

As a data analyst for a global health body, your mission is to analyze the paradox of rising obesity and persistent malnutrition across countries, age groups, and genders using WHO data. You are expected to extract insights that support health initiatives and interventions worldwide.

---

## 🔍 Project Workflow

### 📥 1. Data Collection

Used 4 public WHO APIs:

- **Adults – Obesity (BMI ≥ 30)**: `NCD_BMI_30C`
- **Children – Obesity/Overweight**: `NCD_BMI_PLUS2C`
- **Adults – Underweight (BMI < 18.5)**: `NCD_BMI_18C`
- **Children – Thinness**: `NCD_BMI_MINUS2C`

### 🧹 2. Data Cleaning & Feature Engineering

- Combined datasets into `df_obesity` and `df_malnutrition`
- Standardized columns: `Country`, `Region`, `Gender`, `Age_Group`, `Mean_Estimate`, `CI_Width`
- Created categories: `Obesity_Level` and `Malnutrition_Level`
- Converted country codes using `pycountry`

### 📊 3. Exploratory Data Analysis (EDA)

- Trends over time by gender, region, and age group
- CI reliability patterns using `CI_Width`
- Comparisons between obesity and malnutrition distributions

### 💾 4. SQL Integration

- Created `obesity` and `malnutrition` tables
- Inserted cleaned data via Python (SQLite)
- Wrote **25+ queries** for insights like:
  - Highest/lowest obesity or malnutrition countries
  - Yearly trends by demographic
  - Regions needing urgent intervention
  - CI_Width-based reliability checks

### 📈 5. Power BI Dashboard

Connected SQL database to Power BI and created an interactive dashboard with **20+ visualizations**.

---

## 📊 Power BI Highlights

- 📉 **Trend Line**: Global obesity and malnutrition over time
- 🌍 **Map View**: Country-wise obesity/malnutrition distribution
- 👨‍👩‍👧‍👦 **Gender Disparity**: Stacked charts for male vs female obesity
- 🧪 **CI Width vs Estimate**: Scatter plots for data reliability
- 🧭 **Dual Line**: India’s obesity vs malnutrition trend
- 🧱 **Level Distribution**: Country counts by obesity/malnutrition levels

---

## 💡 Key Insights

| Insight | Description |
|--------|-------------|
| 📈 **Dual Trends** | Obesity is rising even in countries like India & Nigeria with persistent malnutrition. |
| 🌍 **Global Average** | 2022 Obesity Avg: **14.32%** with **CI Width: 4.75**, indicating moderate reliability. |
| 👩‍🦰 **Female Disparity** | Females in many countries show **higher obesity rates** than males. |
| 🌍 **Regional Divide** | **Africa & Southeast Asia** are highly malnourished; **Americas & Europe** lead in obesity. |
| 🔍 **Data Quality** | Some countries have **wide CI Widths**, flagging low data reliability. |

---

## 📌 Recommendations

- 🆘 Focus urgent interventions on **Africa & SE Asia**
- 🚻 Launch **gender-specific** obesity awareness programs
- 📉 Standardize data collection to **narrow CI Widths**
- 🧠 Use insights to design **data-driven health policies**

---

## 🛠 Tech Stack

| Tool/Library | Use |
|--------------|-----|
| Python | Data cleaning, EDA, API handling |
| Pandas | Data wrangling |
| pycountry | ISO3 to country name conversion |
| SQLite | Database creation |
| SQL | Analytical queries |
| Power BI | Dashboards and reports |


