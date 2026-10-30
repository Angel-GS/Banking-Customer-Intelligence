/*
=========================================================
PROJECT: Banking Customer Intelligence
FILE: 01_data_exploration.sql

OBJECTIVE:
Explore the raw banking dataset to understand:
- Dataset structure and size
- Data completeness
- Duplicate records
- Numerical variables
- Categorical variables
- Potential data quality issues

=========================================================
*/


/* =======================================================
   1. GENERAL DATA EXPLORATION
   ======================================================= */
SELECT COUNT(*) as Total_Clientes 
from BankLoan_Raw

-- 1.2 Display the first 10 records
SELECT TOP 10 * 
FROM BankLoan_Raw

-- 1.3 Review the available columns
SELECT 
	COLUMN_NAME, 
	DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'BankLoan_Raw'

/* =======================================================
   2. DATA COMPLETENESS
   ======================================================= */

-- 2.1 Count NULL values in each column
SELECT 
	SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) AS NULL_ID,
	SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS NULL_Age,
	SUM(CASE WHEN Experience IS NULL THEN 1 ELSE 0 END) AS NULL_Experience,
	SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS NULL_Income,
	SUM(CASE WHEN ZIP_Code IS NULL THEN 1 ELSE 0 END) AS NULL_ZipCode,
	SUM(CASE WHEN Family IS NULL THEN 1 ELSE 0 END) AS NULL_Family,
	SUM(CASE WHEN CCAvg IS NULL THEN 1 ELSE 0 END) AS NULL_CCAvg,
	SUM(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) AS NULL_Education,
	SUM(CASE WHEN Mortgage IS NULL THEN 1 ELSE 0 END) AS NULL_Mortgage,
	SUM(CASE WHEN Personal_Loan IS NULL THEN 1 ELSE 0 END) AS NULL_PersonalLoan,
	SUM(CASE WHEN Securities_Account IS NULL THEN 1 ELSE 0 END) AS NULL_Securities,
	SUM(CASE WHEN CD_Account IS NULL THEN 1 ELSE 0 END) AS NULL_Account,
	SUM(CASE WHEN dbo.BankLoan_Raw.Online  IS NULL THEN 1 ELSE 0 END) AS NULL_Online,
	SUM(CASE WHEN CreditCard IS NULL THEN 1 ELSE 0 END) AS NULL_CreditCard
FROM DBO.BankLoan_Raw


/* =======================================================
   3. DUPLICATE RECORDS in ID
   ======================================================= */
SELECT 
	ID, 
	COUNT(*) AS Occurrences 
FROM 
	dbo.BankLoan_Raw
Group by ID
Having COUNT(*) > 1 


/* =======================================================
   4. NUMERICAL DATA ANALYSIS
   ======================================================= */

-- 4.1 Customer age

SELECT 
	MIN(Age) AS min_age,
	MAX(Age) as max_age,
	AVG(CAST(Age as DECIMAL(10,2))) as average_age
FROM 
	DBO.BankLoan_Raw

SELECT
    MIN(Age) AS MinimumAge,
    MAX(Age) AS MaximumAge,
    AVG(CAST(Age AS DECIMAL(10,2))) AS AverageAge
FROM dbo.BankLoan_Raw;


-- 4.2 Customer work experience

SELECT
    MIN(Experience) AS MinimumExperience,
    MAX(Experience) AS MaximumExperience,
    AVG(CAST(Experience AS DECIMAL(10,2))) AS AverageExperience
FROM dbo.BankLoan_Raw;


-- 4.3 Customer income

SELECT
    MIN(Income) AS MinimumIncome,
    MAX(Income) AS MaximumIncome,
    AVG(CAST(Income AS DECIMAL(10,2))) AS AverageIncome
FROM dbo.BankLoan_Raw;


-- 4.4 Average credit card spending

SELECT
    MIN(CCAvg) AS MinimumCCAvg,
    MAX(CCAvg) AS MaximumCCAvg,
    AVG(CCAvg) AS AverageCCAvg
FROM dbo.BankLoan_Raw;


-- 4.5 Mortgage amounts

SELECT
    MIN(Mortgage) AS MinimumMortgage,
    MAX(Mortgage) AS MaximumMortgage,
    AVG(CAST(Mortgage AS DECIMAL(10,2))) AS AverageMortgage
FROM dbo.BankLoan_Raw;


/* =======================================================
   5. CATEGORICAL DATA ANALYSIS
   ======================================================= */

-- 5.1 Customer distribution by education level

SELECT
    Education,
    COUNT(*) AS TotalCustomers
FROM dbo.BankLoan_Raw
GROUP BY Education
ORDER BY Education;


-- 5.2 Personal loan acceptance distribution

SELECT
    [Personal_Loan],
    COUNT(*) AS TotalCustomers
FROM dbo.BankLoan_Raw
GROUP BY [Personal_Loan]
ORDER BY [Personal_Loan];


-- 5.3 Online banking adoption

SELECT
    Online,
    COUNT(*) AS TotalCustomers
FROM dbo.BankLoan_Raw
GROUP BY Online
ORDER BY Online;


-- 5.4 Credit card ownership

SELECT
    CreditCard,
    COUNT(*) AS TotalCustomers
FROM dbo.BankLoan_Raw
GROUP BY CreditCard
ORDER BY CreditCard;


-- 5.5 Customers with a CD account

SELECT
    CD_Account,
    COUNT(*) AS TotalCustomers
FROM dbo.BankLoan_Raw
GROUP BY CD_Account
ORDER BY CD_Account;


-- 5.6 Customers with a securities account

SELECT
    Securities_Account,
    COUNT(*) AS TotalCustomers
FROM dbo.BankLoan_Raw
GROUP BY Securities_Account
ORDER BY [Securities_Account];


/* =======================================================
   6. DATA QUALITY AND POTENTIAL ANOMALIES
   ======================================================= */

-- 6.1 Identify customers with negative work experience

SELECT *
FROM dbo.BankLoan_Raw
WHERE Experience < 0
ORDER BY Experience;


-- 6.2 Count customers with negative work experience

SELECT
    COUNT(*) AS NegativeExperienceRecords
FROM dbo.BankLoan_Raw
WHERE Experience < 0;


-- 6.3 Identify negative values in income

SELECT *
FROM dbo.BankLoan_Raw
WHERE Income < 0;


-- 6.4 Identify negative values in credit card spending

SELECT *
FROM dbo.BankLoan_Raw
WHERE CCAvg < 0;


-- 6.5 Identify negative mortgage values

SELECT *
FROM dbo.BankLoan_Raw
WHERE Mortgage < 0;


-- 6.6 Review ZIP Code lengths

SELECT
    LEN(ZIP_Code) AS ZIPCodeLength,
    COUNT(*) AS TotalRecords
FROM dbo.BankLoan_Raw
GROUP BY LEN(ZIP_Code)
ORDER BY ZIPCodeLength;


-- 6.7 Review the possible values in binary columns

SELECT DISTINCT Personal_Loan
FROM dbo.BankLoan_Raw
ORDER BY Personal_Loan;

SELECT DISTINCT Online
FROM dbo.BankLoan_Raw
ORDER BY Online;

SELECT DISTINCT CreditCard
FROM dbo.BankLoan_Raw
ORDER BY CreditCard;


/* =======================================================
   7. CUSTOMER DISTRIBUTION AND INITIAL BUSINESS INSIGHTS
   ======================================================= */

-- 7.1 Customers by family size

SELECT
    Family,
    COUNT(*) AS TotalCustomers
FROM dbo.BankLoan_Raw
GROUP BY Family
ORDER BY Family;


-- 7.2 Average income by education level

SELECT
    Education,
    AVG(CAST(Income AS DECIMAL(10,2))) AS AverageIncome
FROM dbo.BankLoan_Raw
GROUP BY Education
ORDER BY Education;


-- 7.3 Average income by personal loan acceptance

SELECT
    Personal_Loan,
    AVG(CAST(Income AS DECIMAL(10,2))) AS AverageIncome
FROM dbo.BankLoan_Raw
GROUP BY Personal_Loan
ORDER BY Personal_Loan;


-- 7.4 Online banking adoption by personal loan acceptance

SELECT
    Personal_Loan,
    Online,
    COUNT(*) AS TotalCustomers
FROM dbo.BankLoan_Raw
GROUP BY
    Personal_Loan,
    Online
ORDER BY
    Personal_Loan,
    Online;


-- 7.5 Top 10 customers by income

SELECT TOP 10
    ID,
    Age,
    Income,
    Education,
    Personal_Loan
FROM dbo.BankLoan_Raw
ORDER BY Income DESC;


/* =======================================================
   END OF DATA EXPLORATION
   ======================================================= */