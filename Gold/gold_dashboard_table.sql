CREATE TABLE gold_churn_dashboard AS
SELECT
    customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure,

    -- Tenure Group
    CASE
        WHEN tenure < 12 THEN '0-11 Months'
        WHEN tenure BETWEEN 12 AND 24 THEN '12-24 Months'
        WHEN tenure BETWEEN 25 AND 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,

    Contract,
    PaperlessBilling,
    PaymentMethod,
    InternetService,
    TechSupport,
    StreamingTV,
    StreamingMovies,

    MonthlyCharges,
    TotalCharges,

    -- Revenue Segment
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low Value'
        WHEN MonthlyCharges BETWEEN 35 AND 75 THEN 'Mid Value'
        ELSE 'High Value'
    END AS revenue_segment,

    -- Early Churn Risk Flag
    CASE
        WHEN tenure < 6 AND Churn = 'Yes' THEN 'Early Churn'
        ELSE 'No'
    END AS early_churn_flag,

    -- High Risk Profile Flag
    CASE
        WHEN Contract = 'Month-to-month'
         AND tenure < 12
         AND MonthlyCharges > 70
        THEN 'High Risk'
        ELSE 'Normal'
    END AS risk_profile,

    Churn,

    -- Churn Indicator 
    CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END AS churn_flag

FROM silver_telco_churn_clean;

SELECT *
FROM gold_churn_dashboard;