Total Spending

SELECT
	SUM(transaction_amount) AS total_spending
FROM transactions

Highest Spending Customer

SELECT
	customer_id,
    SUM(transaction_amount) AS total_spent
FROM transactions
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;




Average Transaction Amount

SELECT
	AVG(transaction_amount) AS avg_amount
FROM transactions

Total Spending by State

SELECT
	state,
	SUM(transaction_amount) AS total_amount
FROM transactions
GROUP BY state
ORDER BY total_amount DESC

Top Merchant Categories

SELECT
	CASE
		WHEN credit_score >= 750 THEN '750+ (Very Low Risk)'
        WHEN credit_score BETWEEN 700 AND 749 THEN '700-749 (Low Risk)'
        WHEN credit_score BETWEEN 650 AND 699 THEN '650-699 (Medium Risk)'
        ELSE 'Below 650 (High Risk)'
	END AS credit_score_range,
    SUM(transaction_amount) AS total_spending
FROM transactions
GROUP BY credit_score_range
ORDER BY total_spending DESC;


Credit Score Buckets / Risk

SELECT
	merchant_category,
    SUM(transaction_amount) AS total_spend
FROM transactions
GROUP BY merchant_category
ORDER BY total_spend DESC

Monthly Spending Trend

SELECT
	DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    SUM(transaction_amount) AS total_spend
FROM transactions
GROUP BY month
ORDER BY month



High-Value Customers

SELECT customer_id,
       AVG(transaction_amount) AS avg_transaction
FROM transactions
GROUP BY customer_id
HAVING AVG(transaction_amount) > 200
ORDER BY avg_transaction DESC;



Transaction Count per Customer

SELECT
	customer_id,
    COUNT(transaction_id) AS transaction_count
FROM transactions
GROUP BY customer_id
ORDER BY transaction_count DESC;


Spending vs. Credit Score Correlation

SELECT
	CASE
		WHEN credit_score >= 750 THEN '750+ (Very Low Risk)'
        WHEN credit_score BETWEEN 700 AND 749 THEN '700-749 (Low Risk)'
        WHEN credit_score BETWEEN 650 AND 699 THEN '650-699 (Medium Risk)'
        ELSE 'Below 650 (High Risk)'
	END AS credit_score_range,
    AVG(transaction_amount) AS avg_spend
FROM transactions
GROUP BY credit_score_range
ORDER BY avg_spend DESC;



