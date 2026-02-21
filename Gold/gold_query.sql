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

--