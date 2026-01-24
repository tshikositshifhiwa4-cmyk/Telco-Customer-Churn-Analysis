## Telco-Customer-Churn-Analysis

#📌 Project Overview

Customer churn is a major challenge for subscription-based businesses, especially in the telecommunications industry.
This project analyzes customer churn data to identify key drivers of churn, high-risk customer segments, and revenue impact, using SQL in Snowflake.
The project follows a modern data analytics architecture (Bronze–Silver–Gold) to demonstrate real-world data engineering and analytics best practices.
🎯 Objectives
Understand who is churning and why
Identify customer characteristics associated with churn
Analyze the revenue impact of churn
Build a clean, analytics-ready dataset
Demonstrate strong SQL, data modeling, and analytical thinking
🏗️ Project Architecture
This project is structured using a Bronze → Silver → Gold data architecture:
TELCO_CHURN_DB
 ├── BRONZE   (Raw data ingestion)
 ├── SILVER   (Cleaned & standardized data)
 └── GOLD     (Analytics & insights)
Architecture Rationale
Bronze: Preserves raw data exactly as received
Silver: Handles data quality issues and standardization
Gold: Enables business-focused analysis and insights
📂 Dataset
Source: Telco Customer Churn dataset
Rows: 7,043 customers
Granularity: One row per customer
Target Variable: Churn (Yes / No)
Key Data Domains
Customer demographics
Account tenure and contracts
Services subscribed
Billing and payment information
⚙️ Tools & Technologies
Snowflake (Data warehouse)
SQL (Data cleaning & analysis)
Snowflake Stages (Data ingestion)
GitHub (Version control & documentation)
(Optional extension: Power BI / Tableau)
🧪 Data Ingestion (Bronze Layer)
CSV file uploaded to a Snowflake internal stage
Raw data loaded using COPY INTO
No transformations applied at this stage
Row count and schema validated
Output Table:
BRONZE.telco_churn_raw
🧹 Data Cleaning & Preparation (Silver Layer)
Key data quality issues addressed:
Converted TotalCharges from STRING to NUMERIC
Handled empty strings as NULL values
Standardized SeniorCitizen from 0/1 to Yes/No
Preserved all original records
Ensured consistency across categorical fields
Output Table:
SILVER.telco_churn_clean
🧠 Feature Engineering (Gold Layer)
Derived features to support analysis:
Tenure groups (0–12, 13–24, 25–48, 49+ months)
High-value customer indicators
Early churn flag (tenure < 6 months)
Service-based segmentation
Output View/Table:
GOLD.churn_features
📈 Key Analyses Performed
Overall churn rate
Churn by contract type
Churn by payment method
Churn vs tenure length
Churn vs monthly charges
Services most associated with churn
Revenue lost due to churn
Identification of high-value churned customers
💡 Key Insights (Example)
Month-to-month contracts show significantly higher churn rates
Customers with shorter tenure are more likely to churn
Higher monthly charges correlate with increased churn
Certain service combinations are associated with higher churn risk
A small group of high-value customers contributes disproportionately to revenue loss
(Exact insights can be updated after final analysis)
📌 Business Recommendations
Encourage longer-term contracts through incentives
Focus retention efforts on early-tenure customers
Bundle services strategically to reduce churn
Prioritize retention of high-value customers
📁 Repository Structure
├── sql/
│   ├── bronze_ingestion.sql
│   ├── silver_cleaning.sql
│   ├── gold_analysis.sql
├── docs/
│   └── project_plan.png
├── README.md
🚀 Future Improvements
Add predictive churn modeling
Automate pipeline with Snowflake Tasks
Build an interactive BI dashboard
Migrate pipeline to Databricks for comparison
🧑‍💻 Author
Your Name
Aspiring Data Analyst / Analytics Engineer
Skills: SQL • Snowflake • Data Cleaning • Analytics
