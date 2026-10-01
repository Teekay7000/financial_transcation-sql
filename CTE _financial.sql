--CTE 
WITH high_value_transaction AS (
     SELECT 
	       customer_name,
		   amount 
		   FROM financial_transactions
		   WHERE amount > 5000 
)
SELECT 
      customer_name,
	  SUM(amount) AS total_amount
FROM high_value_transaction
GROUP BY customer_name;


--A bank wants to analyze successful transactions only.
--Create a CTE that contains transactions where:
--status is 'Completed'
--amount is greater than R2,000
--Then, using the CTE, calculate the total completed transaction amount for each branch.
--Return:branch, total_amount
WITH status_results AS (
     SELECT 
	       branch,
		   status, 
		   amount
		   FROM financial_transactions
		   WHERE status = 'Completed'
		     AND amount > 2000
)
SELECT
	  branch,
	  SUM(amount) AS total_amount
FROM status_results
GROUP BY branch;

--A bank wants to identify high-value customers.
--First, create a CTE that calculates the total transaction amount for each customer.
--Then, in the outer query, return only customers whose total transaction amount is greater than R15,000.
--Return:customer_name, total_amount
WITH high_value_customers AS (
     SELECT 
	       customer_name,
		   SUM(amount) AS total_amount
	 FROM financial_transactions
	 GROUP BY customer_name
)
SELECT
	  customer_name,
	  total_amount 
      FROM high_value_customers
	  WHERE total_amount > 15000;

--A bank wants to analyze customer spending by branch.
--Create a CTE that:
--Includes only transactions with status = 'Completed'
--Calculates the total amount per branch and customer
--Then, in the outer query, return only customers whose completed transactions total more than R10,000.
--Return:branch, customer_name, total_amount
WITH customer_spending AS (
     SELECT
	       customer_name,
		   branch,
		   SUM(amount) AS total_amount
		   FROM financial_transactions
		   WHERE status = 'Completed'
		   GROUP BY branch, customer_name
)
SELECT    
	  branch,
	  customer_name,
	  total_amount
FROM customer_spending
WHERE total_amount > 10000;

--MULTIPLE CTE
WITH completed_transactions AS (
     SELECT
	       customer_name,
		   amount
	 FROM financial_transactions
	 WHERE status = 'Completed'
),
customer_totals AS (
     SELECT
	       customer_name,
		   SUM(amount) AS total_amount
	 FROM completed_transactions
	 GROUP BY customer_name
)
SELECT 
      customer_name,
	  total_amount
FROM customer_totals
WHERE total_amount > 20000;


--CTE Scenario — Customer Performance
--A bank wants to identify customers who are both active and high-value.
WITH completed_transactions AS (
     SELECT
	       amount,
		   customer_name
	 FROM financial_transactions
	 WHERE status = 'Completed'
),
customer_totals AS (
       SELECT
	         customer_name,
			 SUM(amount) AS total_amount,
			 COUNT(*) AS total_TRANSACTIONS
	   FROM completed_transactions
	   GROUP BY customer_name
)
SELECT
      customer_name,
	  total_amount,
	  total_TRANSACTIONS
FROM customer_totals
WHERE total_amount > 20000 
   AND total_TRANSACTIONS >= 3;

--A bank wants to identify high-value branches.
WITH completed_transactions AS (
     SELECT
	       amount,
		   branch
	 FROM financial_transactions
	 WHERE status = 'Completed'
),
total_transactions AS (
     SELECT
	       branch,
		   SUM(amount) AS total_amount,
		   COUNT(*) AS total_transactions,
		   AVG(amount) AS total_avg
	 FROM completed_transactions
	 GROUP BY branch
)
SELECT 
      branch,
	  total_amount,
	  total_transactions,
	  total_avg
FROM total_transactions
WHERE total_amount > 50000
  AND total_avg > 3000;
	  
		 