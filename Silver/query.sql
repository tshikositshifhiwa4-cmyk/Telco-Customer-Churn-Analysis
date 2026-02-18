CREATE TABLE Telco_customer_churn AS SELECT * FROM read_csv_auto ('Bronze/Telco_Cusomer_Churn.csv');
--Verify
SELECT * 
FROM Telco_customer_churn;

--Data Cleaning
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

FROM Telco_customer_churn;

--Verify
SELECT *
FROM silver_telco_churn_clean;

--Check column description
DESCRIBE silver_telco_churn_clean;

