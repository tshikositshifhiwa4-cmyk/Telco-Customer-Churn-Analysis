# Telco Customer Churn Analysis

> End-to-end churn analysis pipeline identifying key drivers, high-risk segments, and revenue impact, built on a modern Bronze→Silver→Gold data architecture.

<br>

<!-- Badges -->
![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![VS Code](https://img.shields.io/badge/VS%20Code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Status](https://img.shields.io/badge/Status-In%20Progress-orange?style=for-the-badge)

---

## Project Roadmap

<p>
  <img src="https://img.shields.io/badge/Data%20cleaning%20%26%20preparation-Completed-2ecc71?style=for-the-badge">
  <img src="https://img.shields.io/badge/SQL%20exploratory%20analysis-Completed-2ecc71?style=for-the-badge">
</p>

<p>
  <img src="https://img.shields.io/badge/Churn%20segmentation%20analysis-Completed-2ecc71?style=for-the-badge">
</p>


---

## Project Overview

Customer churn is a major challenge for subscription-based businesses, especially in the telecommunications industry. This project analyses customer churn data to identify key drivers of churn, high risk customer segments, and revenue impact using SQL in Snowflake.

The project follows a modern **Bronze → Silver → Gold** data architecture to demonstrate real-world data engineering and analytics best practices.

---

## Objectives

<table>
<tr>
<td>• Understand who is churning and why</td>
<td>• Identify characteristics associated with churn</td>
</tr>

<tr>
<td>• Quantify the revenue impact of churn</td>
<td>• Build a clean, analytics-ready dataset</td>
</tr>

<tr>
<td>• Demonstrate SQL, data modelling & analytical thinking</td>
<td></td>
</tr>
</table>

---

## Tech Stack

| Category | Tool | Purpose |
|----------|------|---------|
| Data Warehouse | Snowflake | Storage, compute & query execution |
| Query Language | SQL | Cleaning, transformation & analysis |
| IDE | VS Code | Development environment |
| Visualisation | Power BI | Dashboard & KPI reporting (upcoming) |
| Version Control | GitHub | Documentation & source control |

---

## Project Architecture

<table>
<tr>

<td width="33%">
<b> BRONZE</b><br><br>
Raw data preserved exactly as received<br><br>
<code>bronze.telco_churn_raw</code>
</td>

<td width="33%">
<b> SILVER</b><br><br>
Data quality & standardisation applied<br><br>
<code>silver.telco_churn_clean</code>
</td>

<td width="33%">
<b> GOLD</b><br><br>
Business-focused features & insights<br><br>
<code>gold.churn_features</code>
</td>

</tr>
</table>


---

## Dataset

| Field | Detail |
|-------|--------|
| Source | Telco Customer Churn dataset |
| Rows | 7,043 customers |
| Granularity | One row per customer |
| Target Variable | Churn (Yes / No) |

**Key data domains:** Customer demographics · Account tenure & contracts · Services subscribed · Billing & payment information

---

## Data Ingestion - Bronze Layer

- CSV file uploaded to a Snowflake internal stage
- Raw data loaded using `COPY INTO`
- No transformations applied at this stage
- Row count and schema validated

**Output table:** `BRONZE.telco_churn_raw`

---

## Data Cleaning & Preparation - Silver Layer

Key data quality issues addressed:

- Converted `TotalCharges` from `STRING` to `NUMERIC`
- Handled empty strings as `NULL` values
- Standardised `SeniorCitizen` from `0/1` to `Yes/No`
- Preserved all original records
- Ensured consistency across categorical fields

**Output table:** `SILVER.telco_churn_clean`

---

## Feature Engineering - Gold Layer

Derived features created to support downstream analysis:

- Tenure groups (0-12, 13-24, 25-48, 49+ months)
- High-value customer indicators
- Early churn flag (tenure < 6 months)
- Service-based segmentation

**Output table:** `GOLD.churn_features`

---

## Key Analyses Performed

```
Churn Overview     →  Overall churn rate
Contract Analysis  →  Churn by contract type
Payment Analysis   →  Churn by payment method
Tenure Analysis    →  Churn vs tenure length
Charge Analysis    →  Churn vs monthly charges
Service Analysis   →  Services most linked to churn
Revenue Impact     →  Revenue lost due to churn
High-Value Segment →  Identification of high-value churned customers
```

---

## Business Recommendations

| # | Recommendation |
|---|----------------|
| 1 | Encourage longer-term contracts through targeted incentives |
| 2 | Focus retention efforts on early-tenure customers (under 6 months) |
| 3 | Bundle services strategically to reduce churn propensity |
| 4 | Prioritise retention outreach for high-value customers |

---

## Author

**Tshifhiwa Tshikosi**  
Data Analyst / Analytics Engineer

