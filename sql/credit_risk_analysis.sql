
-- Credit Risk Analysis
-- Dataset: UCI Default of Credit Card Clients
-- Records analyzed: 30,000


-- 1. Portfolio-level KPIs
SELECT
    COUNT(*) AS total_customers,
    SUM(default_flag) AS total_defaults,
    ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct,
    ROUND(AVG(LIMIT_BAL), 2) AS avg_credit_limit,
    ROUND(AVG(PAY_AMT1), 2) AS avg_recent_payment
FROM credit_customers;


-- 2. Default rate by credit limit band
SELECT
    credit_limit_band,
    COUNT(*) AS customers,
    SUM(default_flag) AS defaults,
    ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct
FROM credit_customers
GROUP BY credit_limit_band
ORDER BY default_rate_pct DESC;


-- 3. Default risk by repayment delay
SELECT
    PAY_0 AS repayment_delay_months,
    COUNT(*) AS customers,
    SUM(default_flag) AS defaults,
    ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct
FROM credit_customers
GROUP BY PAY_0
ORDER BY PAY_0;


-- 4. Financial behaviour by default status
SELECT
    default_flag,
    COUNT(*) AS customers,
    ROUND(AVG(LIMIT_BAL), 2) AS avg_credit_limit,
    ROUND(AVG(BILL_AMT1), 2) AS avg_recent_bill,
    ROUND(AVG(PAY_AMT1), 2) AS avg_recent_payment
FROM credit_customers
GROUP BY default_flag;
