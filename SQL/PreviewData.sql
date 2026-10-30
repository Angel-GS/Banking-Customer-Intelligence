-- Select project database
USE BankingCustomerIntelligence;
GO

--Review total of records
SELECT COUNT(*) AS Total_Records 
from dbo.BankLoan_Raw

-- Preview
SELECT top 10 *
from dbo.BankLoan_Raw


-- 3. Check table columns and data types
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'BankLoan_Raw'
ORDER BY ORDINAL_POSITION;