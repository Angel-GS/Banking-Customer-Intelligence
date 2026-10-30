/*
	Preguntas de negocio a responder: 

1. ¿Cuál es la tasa de aceptación de préstamos personales?
2. ¿Qué diferencia de ingresos existe entre quienes aceptaron y rechazaron el préstamo?
3. ¿Qué relación existe entre la banca en línea y la aceptación de préstamos?
4. ¿Qué niveles educativos presentan mayor aceptación?
5. ¿Qué segmentos tienen mayor potencial comercial?

*/


-- 03_business_analysis.sql

-- 1. Personal Loan Acceptance Rate

SELECT
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Personal_Loan = 1 THEN 1 ELSE 0 END) AS AcceptedLoans,
    SUM(CASE WHEN Personal_Loan = 0 THEN 1 ELSE 0 END) AS RejectedLoans,
    CAST(
        SUM(CASE WHEN Personal_Loan = 1 THEN 1.0 ELSE 0 END)
        * 100 / COUNT(*) AS DECIMAL(5,2)
    ) AS AcceptanceRate
FROM dbo.BankLoan_Clean;


-- 2. Average Income by Personal Loan Acceptance

SELECT
    Personal_Loan,
    COUNT(*) AS TotalCustomers,
    AVG(CAST(Income AS DECIMAL(10,2))) AS AverageIncome
FROM dbo.BankLoan_Clean
GROUP BY Personal_Loan
ORDER BY Personal_Loan;

-- 3. Online Banking Adoption by Personal Loan Acceptance

SELECT
    Personal_Loan,
    Online,
    COUNT(*) AS TotalCustomers
FROM dbo.BankLoan_Clean
GROUP BY
    Personal_Loan,
    Online
ORDER BY
    Personal_Loan,
    Online;

-- 4. Personal Loan Acceptance by Education

SELECT
    Education,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Personal_Loan = 1 THEN 1 ELSE 0 END) AS AcceptedLoans,
    CAST(
        SUM(CASE WHEN Personal_Loan = 1 THEN 1.0 ELSE 0 END)
        * 100 / COUNT(*) AS DECIMAL(5,2)
    ) AS AcceptanceRate
FROM dbo.BankLoan_Clean
GROUP BY Education
ORDER BY Education;



-- 5. Personal Loan Acceptance by Income Segment

SELECT
    CASE
        WHEN Income <= 50 THEN 'Low Income'
        WHEN Income <= 100 THEN 'Medium Income'
        ELSE 'High Income'
    END AS IncomeSegment,

    COUNT(*) AS TotalCustomers,

    SUM(CASE
        WHEN Personal_Loan = 1 THEN 1
        ELSE 0
    END) AS AcceptedLoans,

    CAST(
        SUM(CASE
            WHEN Personal_Loan = 1 THEN 1.0
            ELSE 0
        END) * 100 / COUNT(*) AS DECIMAL(5,2)
    ) AS AcceptanceRate

FROM dbo.BankLoan_Clean

GROUP BY
    CASE
        WHEN Income <= 50 THEN 'Low Income'
        WHEN Income <= 100 THEN 'Medium Income'
        ELSE 'High Income'
    END

ORDER BY AcceptanceRate DESC;
