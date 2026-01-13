CREATE DATABASE IF NOT EXISTS churn;
USE churn; 
SELECT * from customer_churn limit 10;
#####churn rate BY contract type
SELECT
Contract,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS churn_rate_percent
FROM customer_churn 
GROUP BY Contract
ORDER BY churn_rate_percent DESC;
#####comare average monthly charges
select Churn,
COUNT(*) AS customer_count,
ROUND(AVg(tenure),2) AS avg_tenure_months
from  customer_churn 
group by Churn
order by churn;
####top 5 services with highest churn##
SELECT
service_name,
total_customers,
churned,
ROUND(100.0 * churned / total_customers, 1) AS churn_rate_pct
FROM (
-- Fiber optic
SELECT 'Fiber optic Internet' AS service_name,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customer_churn  WHERE InternetService = 'Fiber optic'

UNION ALL

-- StreamingTV Yes
SELECT 'StreamingTV (Yes)',
COUNT(*),
SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
FROM customer_churn  WHERE StreamingTV = 'Yes'

UNION ALL

-- StreamingMovies Yes
SELECT 'StreamingMovies (Yes)',
COUNT(*),
SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
FROM customer_churn WHERE StreamingMovies = 'Yes'

UNION ALL

-- No OnlineSecurity (internet users only)
SELECT 'No OnlineSecurity',
COUNT(*),
SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
FROM customer_churn 
WHERE InternetService IN ('DSL', 'Fiber optic') AND OnlineSecurity = 'No'

UNION ALL

-- No TechSupport (internet users only)
SELECT 'No TechSupport',
COUNT(*),
SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
FROM customer_churn 
WHERE InternetService IN ('DSL', 'Fiber optic') AND TechSupport = 'No'
) t
ORDER BY churn_rate_pct DESC
LIMIT 5;


####### monthaly charges buckets and there churn %
SELECT
CASE
WHEN MonthlyCharges <= 30 THEN '0–30'
WHEN MonthlyCharges <= 50 THEN '30–50'
WHEN MonthlyCharges <= 70 THEN '50–70'
WHEN MonthlyCharges <= 90 THEN '70–90'
WHEN MonthlyCharges <= 110 THEN '90–110'
ELSE '110+'
END AS monthly_charge_bucket,

COUNT(*) AS total_customers,
SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,

ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS churn_rate_pct

FROM customer_churn
WHERE MonthlyCharges IS NOT NULL
GROUP BY monthly_charge_bucket
ORDER BY
CASE monthly_charge_bucket
WHEN '0–30' THEN 1
WHEN '30–50' THEN 2
WHEN '50–70' THEN 3
WHEN '70–90' THEN 4
WHEN '90–110' THEN 5
ELSE 6
END;




