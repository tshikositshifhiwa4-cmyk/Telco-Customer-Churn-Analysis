CREATE TABLE silver_telco_churn_clean AS
SELECT
    customerID,
    gender,

    CASE 
        WHEN SeniorCitizen = 1 THEN 'Yes'
        ELSE 'No'
    END AS SeniorCitizen,

    Partner,
    Dependents,
    tenure,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies,
    Contract,
    PaperlessBilling,
    PaymentMethod,

    CAST(MonthlyCharges AS DOUBLE) AS MonthlyCharges,

    CAST(NULLIF(TRIM(TotalCharges), '') AS DOUBLE) AS TotalCharges,

    Churn

 FROM read_csv_auto ('Bronze/Telco_Cusomer_Churn.csv');

--Overall Churn Rate
SELECT
    Churn,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*) * 100.0 
        / SUM(COUNT(*)) OVER (), 
        2
    ) AS percentage
FROM silver_telco_churn_clean
GROUP BY Churn;

--Churn by Contract Type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM silver_telco_churn_clean
GROUP BY Contract
ORDER BY churn_rate DESC;

--Create Tenure Buckets
SELECT
    CASE
        WHEN tenure < 12 THEN '0-11 Months'
        WHEN tenure BETWEEN 12 AND 24 THEN '12-24 Months'
        WHEN tenure BETWEEN 25 AND 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM silver_telco_churn_clean
GROUP BY tenure_group
ORDER BY churn_rate DESC;

--Revenue Lost Due to Churn
SELECT
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_lost
FROM silver_telco_churn_clean
WHERE Churn = 'Yes';

--total_revenue_generated_by_churned_customers
SELECT
    ROUND(SUM(TotalCharges), 2) AS total_revenue_generated_by_churned_customers
FROM silver_telco_churn_clean
WHERE Churn = 'Yes';

--High-Value Customers Who Churned
SELECT *
FROM silver_telco_churn_clean
WHERE Churn = 'Yes'
ORDER BY MonthlyCharges DESC
LIMIT 10;

--Revenue Risk Segments
SELECT
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low Value'
        WHEN MonthlyCharges BETWEEN 35 AND 75 THEN 'Mid Value'
        ELSE 'High Value'
    END AS revenue_segment,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate

FROM silver_telco_churn_clean
GROUP BY revenue_segment
ORDER BY churn_rate DESC;

--High-Risk Customer Profile
SELECT *
FROM silver_telco_churn_clean
WHERE Contract = 'Month-to-month'
  AND tenure < 12
  AND MonthlyCharges > 70
  AND Churn = 'Yes';
