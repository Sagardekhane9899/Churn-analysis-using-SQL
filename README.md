# Churn-analysis-using-SQL
📊 Customer Churn & Retention Analysis
📌 Project Purpose
The primary objective of this project is to identify why customers are leaving (churning) and provide data-driven strategies to improve retention. By analyzing service usage, contract types, and billing demographics, the project pinpoints high-risk customer segments and evaluates the financial impact of churn on the business.

🛠️ Tools & Methodology
1. SQL (Data Extraction & Processing)
Used for heavy-duty data manipulation and calculating complex churn metrics directly from the database.

Aggregations: Calculated churn rates by contract, gender, and payment method.

Service Analysis: Used UNION ALL logic to compare churn across different service types (Fiber Optic, Streaming, Tech Support).

Bucketing: Categorized MonthlyCharges into ranges (e.g., 0–30, 30–50) to see price sensitivity.
📈 Key Insights (% Wise Summary)
Based on the SQL queries and Python analysis, here is the percentage breakdown of churn factors:
📈 Key Insights (% Wise Summary)
Based on the SQL queries and Python analysis, here is the percentage breakdown of churn factors:

Contract & Service Impact
Month-to-Month Contracts: Show the highest churn risk (approx. 42.7%), compared to One-Year (11%) or Two-Year (2.8%) contracts.

Fiber Optic Users: This segment has a significantly higher churn rate (~41.9%) compared to DSL users, indicating potential service or pricing issues.

Tech Support: Customers with No Tech Support are 3x more likely to churn than those who utilize support services.
Financial & Demographic Insights
Price Sensitivity: High churn is observed in the $70–$90 monthly charge bucket, suggesting a "sweet spot" where customers begin looking for cheaper alternatives.

Tenure: New customers (0–6 months) represent 55% of total churn, highlighting the need for better onboarding experiences.

Seniors: Senior citizens show a 25% higher churn rate than younger demographics.


