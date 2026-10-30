
-- 02_data_cleaning.sql

-- Create a clean table without modifying the raw data

SELECT
    ID,
    Age,
    CASE
        WHEN Experience < 0 THEN NULL
        ELSE Experience
    END AS Experience,
    Income,
    ZIP_Code,
    Family,
    CCAvg,
    Education,
    Mortgage,
    Personal_Loan,
    Securities_Account,
    CD_Account,
    Online,
    CreditCard
INTO dbo.BankLoan_Clean
FROM dbo.BankLoan_Raw;


-- Check total records

SELECT
    COUNT(*) AS TotalCustomers
FROM dbo.BankLoan_Clean;


-- Check invalid experience values

SELECT
    COUNT(*) AS InvalidExperience
FROM dbo.BankLoan_Clean
WHERE Experience < 0;

-- Check invalid values in other columns
SELECT
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Experience IS NULL THEN 1 ELSE 0 END) AS NullExperience,
    SUM(CASE WHEN Age <= 0 THEN 1 ELSE 0 END) AS InvalidAge,
    SUM(CASE WHEN Income <= 0 THEN 1 ELSE 0 END) AS InvalidIncome,
    SUM(CASE WHEN CCAvg < 0 THEN 1 ELSE 0 END) AS InvalidCCAvg,
    SUM(CASE WHEN Mortgage < 0 THEN 1 ELSE 0 END) AS InvalidMortgage
FROM dbo.BankLoan_Clean;