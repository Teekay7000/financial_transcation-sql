--SELF JOIN
--A company wants to see which employees report to which managers.
--Display each employee's name together with their manager's name.
--Employees who do not have a manager do not need to be included.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees
(employee_id, employee_name, manager_id)
VALUES
(1, 'Thabo Mokoena', NULL),
(2, 'Lerato Molefe', 1),
(3, 'Sipho Dlamini', 1),
(4, 'Naledi Khumalo', 2),
(5, 'Kabelo Ndlovu', 2),
(6, 'Ayanda Zulu', 3);

FROM employees e
JOIN employees m

SELECT
    e.employee_name,
    m.employee_name AS manager_name
FROM employees e
JOIN employees m
 ON e.manager_id = m.employee_id;

--The company wants a list of all employees who report directly to Thabo Mokoena.
--Show the employee's name and their manager's name.
FROM employees e
JOIN employees m

SELECT 
      e.employee_name,
	  m.employee_name AS manager_name
FROM employees e
JOIN employees m
 ON e.manager_id = m.employee_id
WHERE m.employee_name = 'Thabo Mokoena';

--MULTIPLE CONDITION JOIN 
--A bank wants to identify transactions where the customer and 
--account information match correctly, considering both the customer and the account type.
--Show the customer name, account number, account type, transaction type,
--and transaction amount for transactions that belong to the customer's matching account type.
FROM customers c
JOIN customer_accounts ca
JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  ca.account_number,
	  ca.account_type,
	  ft.transaction_type,
	  ft.amount
FROM customers c
JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id
JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
 AND ca.account_type = ft.account_type;

--A bank wants a report showing customers who have an 
--active account and have made completed withdrawals greater than R2,000.
--The report should provide enough information for the bank
--employee to identify the customer, their account, and the withdrawal.
FROM customers c
INNER JOIN customer_accounts ca
INNER JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  ca.account_number,
	  ft.amount,
	  ft.transaction_type
FROM customers c
INNER JOIN customer_accounts ca
 ON c.customer_id = ca.customer_id
INNER JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
WHERE ft.transaction_type = 'Withdrawal'
 AND ft.amount > 500
 AND ft.status = 'Completed';


	  
      

