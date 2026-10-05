--LEFT JOIN

--Exercise 1 — Basic LEFT JOIN
--A bank wants a list of all customers, together with their account numbers.
--Using:customers, customer_accounts
--Write a query that returns:
--customer_name, account_number
FROM customers c 
LEFT JOIN customer_accounts ca

SELECT 
      c.customer_name,
	  ca.account_number
FROM customers c
LEFT JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id;

--A bank wants to see all customers who have an active account.
--Return:
--customer_name, account_number, account_status
--Use:customers, customer_accounts
--The condition should be that the account is 'Active'.
FROM customers c
LEFT JOIN customer_accounts ca

SELECT 
      c.customer_name,
	  ca.account_number,
	  ca.account_status
FROM customers c
LEFT JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id
 WHERE ca.account_status = 'Active';

 --RIGHT JOIN 
 --Exercise 5 — RIGHT JOIN
--A bank wants to see every account, together with the customer name if the customer exists.
--Return:account_number, account_status, customer_name
FROM customers c
RIGHT JOIN customer_accounts ca

SELECT 
      c.customer_name,
	  ca.account_number,
	  ca.account_status
FROM customers c 
RIGHT JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id;

--FULL OUTER JOIN.
--The bank wants a report showing every customer and every account, 
--including records where there isn't a match.
--Return:customer_name, account_number, account_status
FROM customers c
FULL OUTER JOIN customer_accounts ca

SELECT 
      c.customer_name,
	  ca.account_number,
	  ca.account_status
FROM customers c
FULL OUTER JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id;

--Multiple-table JOINs
--The bank wants a report showing:
--Customer name
--Account number
--Transaction amount
FROM customers c
INNER JOIN customer_accounts ca
INNER JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  ca.account_number,
	  ft.amount
FROM customers c
INNER JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id
INNER JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id;

--The bank wants:
--Customers who made transactions greater than R5,000, together with their account number.
FROM customers c
INNER JOIN customer_accounts ca
INNER JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  ca.account_number,
	  ft.amount
FROM customers c
INNER JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id
INNER JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
WHERE ft.amount > 5000;

--A bank wants to identify customers who have an active account and have made at least one withdrawal. 
--The report should also show the account and withdrawal details.
FROM customers c
INNER JOIN customer_accounts ca
INNER JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  ca.account_number,
	  ft.transaction_type
FROM customers c
INNER JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id
INNER JOIN financial_transactions ft 
 ON c.customer_id = ft.customer_id
WHERE ca.account_status = 'Active'
 AND ft.transaction_type = 'Withdrawal';

--A bank wants a report of every customer and their account information, while also showing any
--transactions they have made. Customers must still appear even if they have no transactions.
FROM customers c 
LEFT JOIN customer_accounts ca
LEFT JOIN finanial_transactions

SELECT 
      c.customer_name,
	  ca.account_number,
	  ft.transaction_type
FROM customers c 
LEFT JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id
LEFT JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id;

--A bank wants to see every customer, their account number, and their transactions.
--However, if they have transactions, only completed withdrawals should be shown
--Customers with no completed withdrawals must still remain in the report.
FROM customers c 
LEFT JOIN customer_accounts ca
LEFT JOIN finanial_transactions ft

SELECT 
      c.customer_name,
	  ca.account_number,
	  ft.transaction_type
FROM customers c 
LEFT JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id
LEFT JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
 AND transaction_type = 'Withdrawal'
 AND status = 'Completed';

--Real-world banking report
--The bank wants to identify customers who have an account, 
--but some customers may not have made any transactions.
--For customers who have transactions, the bank only wants to consider completed transactions. 
--The report should show each customer's total completed transaction amount. 
--Customers with no completed transactions must still appear in the report.
FROM customers c 
LEFT JOIN customer_accounts ca
LEFT JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  ca.account_number,
	  SUM(ft.amount) AS total_amount
FROM customers c
LEFT JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id
LEFT JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
 AND status = 'Completed'
GROUP BY 
        c.customer_name,
		ca.account_number;

--Find every customer with an account, including customers who have no completed transactions.
--Calculate their total completed transaction amount, but only include customers whose total is greater
--than R10,000.
FROM customers c 
LEFT JOIN customer_accounts ca
LEFT JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  ca.account_number,
	  SUM(ft.amount) AS total_amount
FROM customers c
LEFT JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id
LEFT JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
 AND ft.status = 'Completed'
GROUP BY 
        c.customer_name,
		ca.account_number
HAVING SUM(ft.amount) > 10000;

