--Subqueries
--A bank wants to find all financial transactions where the transaction
--amount is greater than the average transaction amount across all transactions.

SELECT * 
FROM financial_transactions
WHERE amount > (
          SELECT AVG(amount)
		  FROM financial_transactions
);

--A bank wants to identify customers whose individual transaction amount
--is greater than the average transaction amount for all transactions.
FROM customers c
INNER JOIN financial_transactions ft

SELECT
      c.customer_name,
	  ft.amount
FROM customers c 
INNER JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
WHERE ft.amount > (
         SELECT AVG(amount)
		 FROM financial_transactions
);

--A bank wants to find all customers whose total transaction amount
--is greater than the average total transaction amount per customer.
FROM customers c
INNER JOIN financial_transactions ft

SELECT
    c.customer_name,
    SUM(ft.amount) AS total_amount
FROM customers c
INNER JOIN financial_transactions ft
    ON c.customer_id = ft.customer_id
GROUP BY c.customer_name
HAVING SUM(ft.amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(amount) AS customer_total
        FROM financial_transactions
        GROUP BY customer_id
    ) AS customer_totals
);

--A bank wants to identify customers whose total completed transaction amount is greater than the
--average total completed transaction amount across all customers.
FROM customers c
INNER JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  SUM(ft.amount) AS total_amount
FROM customers c
INNER JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
WHERE ft.status = 'Completed'
GROUP BY c.customer_name
HAVING SUM(ft.amount) >(
     SELECT AVG(customer_total)
	 FROM (
       SELECT SUM(amount) AS customer_total
	   FROM financial_transactions
	   WHERE status = 'Completed'
	   GROUP BY customer_id
	 ) AS customer_totals
);

--A bank wants to identify customers whose largest completed transaction
--is greater than the average of all customers' largest completed transactions.
FROM customers c
INNER JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  MAX(ft.amount) AS max_totals
FROM customers c
INNER JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
WHERE ft.status = 'Completed'
GROUP BY c.customer_name
HAVING MAX(ft.amount) > (
   SELECT AVG(customer_max)
   FROM (
      SELECT MAX(amount) AS customer_max
	  FROM financial_transactions
	  WHERE status = 'Completed'
	  GROUP BY customer_id
   ) AS customer_maxes
);
	  