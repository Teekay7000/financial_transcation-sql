--JOINS
--A JOIN allows us to combine information from two or more tables using a related column.

--INNER JOIN
--It returns rows where there is a matching value in both tables.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    phone_number VARCHAR(20),
    address VARCHAR(100),
    tag_number VARCHAR(20)
);

INSERT INTO customers
(customer_id, customer_name, phone_number, address, tag_number)
VALUES
(1001, 'Thabo Mokoena', '0712345678', 'Vereeniging', 'TAG1001'),
(1002, 'Lerato Molefe', '0723456789', 'Soweto', 'TAG1002'),
(1003, 'Sipho Dlamini', '0734567890', 'Soweto', 'TAG1003'),
(1004, 'Naledi Khumalo', '0745678901', 'Johannesburg', 'TAG1004'),
(1005, 'Kabelo Ndlovu', '0756789012', 'Vereeniging', 'TAG1005'),
(1006, 'Ayanda Zulu', '0767890123', 'Pretoria', 'TAG1006'),
(1007, 'Mpho Molefe', '0778901234', 'Soweto', 'TAG1007'),
(1008, 'Zanele Maseko', '0789012345', 'Johannesburg', 'TAG1008'),
(1009, 'Sibusiso Nkosi', '0790123456', 'Vereeniging', 'TAG1009'),
(1010, 'Precious Dube', '0701234567', 'Pretoria', 'TAG1010');


CREATE TABLE customer_accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_number VARCHAR(20),
    account_type VARCHAR(20),
    account_status VARCHAR(20),
    date_opened DATE
);

INSERT INTO customer_accounts
(account_id, customer_id, account_number, account_type, account_status, date_opened)
VALUES
(1, 1001, 'ACC1001001', 'Savings', 'Active', '2022-03-15'),
(2, 1002, 'ACC1001002', 'Current', 'Active', '2021-07-20'),
(3, 1003, 'ACC1001003', 'Savings', 'Active', '2023-01-10'),
(4, 1004, 'ACC1001004', 'Current', 'Active', '2020-11-05'),
(5, 1005, 'ACC1001005', 'Savings', 'Active', '2022-08-18'),
(6, 1006, 'ACC1001006', 'Current', 'Active', '2021-04-12'),
(7, 1007, 'ACC1001007', 'Savings', 'Active', '2023-06-25'),
(8, 1008, 'ACC1001008', 'Current', 'Active', '2022-01-30'),
(9, 1009, 'ACC1001009', 'Savings', 'Active', '2020-09-14'),
(10, 1010, 'ACC1001010', 'Current', 'Active', '2021-12-01');

SELECT
    customers.customer_name,
    financial_transactions.amount
FROM customers
INNER JOIN financial_transactions
    ON customers.customer_id = financial_transactions.customer_id;

--Write a query that displays:
--Customer name, Phone number, Transaction amount, Transaction type
FROM customers c
INNER JOIN financial_transactions ft

SELECT
      c.customer_name,
	  c.phone_number,
	  ft.amount,
	  ft.transaction_type
FROM customers c
INNER JOIN financial_transactions ft
  ON c.customer_id = ft.customer_id;

--Using the customers and customer_accounts tables:
--Display the customer name, phone number, account number, 
--account type, and account status for every customer.
FROM customers c
INNER JOIN customer_accounts ca

SELECT 
      c.customer_name,
	  c.phone_number,
	  ca.account_number,
	  ca.account_type,
	  ca.account_status
FROM customers c
INNER JOIN customer_accounts ca
  ON c.customer_id = ca.customer_id;
	  
--Using the customers and financial_transactions tables:
--Display the customer name, branch, transaction type, amount,
--and payment method for all transactions where the transaction amount is greater than R5,000.
FROM customers c
INNER JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  ft.branch,
	  ft.transaction_type,
	  ft.amount,
	  ft.payment_method
FROM customers c
INNER JOIN financial_transactions ft
  ON c.customer_id = ft.customer_id
WHERE ft.amount > 5000;

--Using customers and financial_transactions, 
--display each customer's name, transaction type,
--and amount, but only show Withdrawals greater than R2,000.
FROM customers c
INNER JOIN financial_transactions ft

SELECT
      c.customer_name,
	  ft.transaction_type,
	  ft.amount
FROM customers c
INNER JOIN financial_transactions ft
  ON c.customer_id = ft.customer_id
WHERE ft.transaction_type = 'Withdrawal' 
  AND ft.amount > 2000;

--Using customers and financial_transactions:
--Find the total transaction amount for each customer.
--Display the customer's name and their total transaction amount.
FROM customers c
INNER JOIN financial_transactions ft

SELECT
      c.customer_name,
	  SUM(ft.amount) AS total_amount
FROM customers c
INNER JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
GROUP BY c.customer_name;

--Using customers and financial_transactions:
--Find the total amount of all Deposit transactions for each customers.
--Display the customer's name and their total deposit amount.
FROM customers c
INNER JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  SUM(ft.amount) AS total_deposit
FROM customers c 
INNER JOIN financial_transactions ft 
  ON c.customer_id = ft.customer_id
WHERE ft.transaction_type = 'Deposit'
GROUP BY c.customer_name;

--Find customers whose total Deposit amount is greater than R20,000.
--Display the customer's name and total deposit amount.
FROM customers c
INNER JOIN financial_transactions ft

SELECT
      c.customer_name,
	  SUM(ft.amount) AS total_amount
FROM customers c 
INNER JOIN financial_transactions ft 
 ON c.customer_id = ft.customer_id
WHERE ft.transaction_type = 'Deposit'
GROUP BY c.customer_name 
HAVING SUM(amount) > 20000;

--Scenario-- Real-World Requirement
--Imagine your manager sends you this requirement:
--Task: Customer Deposit Analysis
--The finance team wants a list of customers who made completed deposits during the reporting period.
--For each customer, show:
--Customer name
--Number of deposits
--Total amount deposited
--Only include customers whose total deposits exceed R20,000.
--Tables available: customers and financial_transactions.
--Write the SQL query that satisfies the requirement.
FROM customers c
INNER JOIN financial_transactions ft

SELECT 
      c.customer_name,
	  COUNT(*) AS number_of_deposit,
	  SUM(ft.amount) AS total_amount
FROM customers c
INNER JOIN financial_transactions ft
 ON c.customer_id = ft.customer_id
WHERE ft.transaction_type = 'Deposit' 
 AND ft.status = 'Completed'
GROUP BY c.customer_name
HAVING SUM(ft.amount) > 20000;
	  
	  
--Final Scenario — Real-World SQL Task
--Your manager sends you this requirement:
--Task: Branch Deposit Performance
--The finance team wants to identify branches that processed a significant amount of deposits.
--For each branch, display:
--Branch name
--Number of completed deposits
--Total value of completed deposits
--Average deposit amount
--Only include branches where the total value of completed deposits is greater than R50,000.
--Tables available: customers and financial_transactions.
SELECT
      branch,
	  SUM(amount) AS total_amount,
	  COUNT(*) AS total_deposited,
	  AVG(amount) AS total_avg
FROM financial_transactions
WHERE transaction_type = 'Deposit'
 AND status = 'Completed'
GROUP BY branch
HAVING SUM(amount) > 50000;

