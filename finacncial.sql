CREATE TABLE financial_transactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    customer_id INT,
    customer_name VARCHAR(50),
    account_type VARCHAR(20),
    transaction_type VARCHAR(20),
    category VARCHAR(30),
    amount DECIMAL(12,2),
    payment_method VARCHAR(20),
    branch VARCHAR(30),
    status VARCHAR(20)
);

INSERT INTO financial_transactions
(transaction_id, transaction_date, customer_id, customer_name, account_type,
 transaction_type, category, amount, payment_method, branch, status)
VALUES
(1,'2026-01-03',1001,'Thabo Mokoena','Savings','Deposit','Salary',18500.00,'EFT','Vereeniging','Completed'),
(2,'2026-01-03',1002,'Lerato Molefe','Current','Withdrawal','Groceries',1250.50,'Card','Soweto','Completed'),
(3,'2026-01-04',1003,'Sipho Dlamini','Savings','Deposit','Salary',22000.00,'EFT','Soweto','Completed'),
(4,'2026-01-04',1004,'Naledi Khumalo','Current','Payment','Rent',8500.00,'EFT','Johannesburg','Completed'),
(5,'2026-01-05',1005,'Kabelo Ndlovu','Savings','Withdrawal','Transport',850.00,'Card','Vereeniging','Completed'),
(6,'2026-01-05',1006,'Ayanda Zulu','Current','Deposit','Salary',24500.00,'EFT','Pretoria','Completed'),
(7,'2026-01-06',1007,'Mpho Molefe','Savings','Payment','Utilities',1450.75,'EFT','Soweto','Completed'),
(8,'2026-01-06',1008,'Zanele Maseko','Current','Withdrawal','Entertainment',750.00,'Card','Johannesburg','Completed'),
(9,'2026-01-07',1009,'Sibusiso Nkosi','Savings','Deposit','Salary',19800.00,'EFT','Vereeniging','Completed'),
(10,'2026-01-07',1010,'Precious Dube','Current','Payment','Insurance',2100.00,'Debit Order','Pretoria','Completed'),
(11,'2026-01-08',1001,'Thabo Mokoena','Savings','Payment','Groceries',980.25,'Card','Vereeniging','Completed'),
(12,'2026-01-08',1002,'Lerato Molefe','Current','Deposit','Salary',21500.00,'EFT','Soweto','Completed'),
(13,'2026-01-09',1003,'Sipho Dlamini','Savings','Withdrawal','Transport',620.00,'Card','Soweto','Completed'),
(14,'2026-01-09',1004,'Naledi Khumalo','Current','Payment','Utilities',1750.00,'EFT','Johannesburg','Completed'),
(15,'2026-01-10',1005,'Kabelo Ndlovu','Savings','Deposit','Salary',19000.00,'EFT','Vereeniging','Completed'),
(16,'2026-01-10',1006,'Ayanda Zulu','Current','Withdrawal','Groceries',1450.80,'Card','Pretoria','Completed'),
(17,'2026-01-11',1007,'Mpho Molefe','Savings','Payment','Rent',7200.00,'EFT','Soweto','Completed'),
(18,'2026-01-11',1008,'Zanele Maseko','Current','Deposit','Salary',20500.00,'EFT','Johannesburg','Completed'),
(19,'2026-01-12',1009,'Sibusiso Nkosi','Savings','Payment','Insurance',1850.00,'Debit Order','Vereeniging','Completed'),
(20,'2026-01-12',1010,'Precious Dube','Current','Withdrawal','Entertainment',1100.00,'Card','Pretoria','Completed'),
(21,'2026-01-13',1001,'Thabo Mokoena','Savings','Deposit','Salary',18500.00,'EFT','Vereeniging','Completed'),
(22,'2026-01-13',1002,'Lerato Molefe','Current','Payment','Rent',8000.00,'EFT','Soweto','Completed'),
(23,'2026-01-14',1003,'Sipho Dlamini','Savings','Payment','Groceries',1320.40,'Card','Soweto','Completed'),
(24,'2026-01-14',1004,'Naledi Khumalo','Current','Deposit','Salary',27000.00,'EFT','Johannesburg','Completed'),
(25,'2026-01-15',1005,'Kabelo Ndlovu','Savings','Payment','Utilities',980.00,'EFT','Vereeniging','Completed'),
(26,'2026-01-15',1006,'Ayanda Zulu','Current','Payment','Rent',9500.00,'EFT','Pretoria','Completed'),
(27,'2026-01-16',1007,'Mpho Molefe','Savings','Deposit','Salary',17500.00,'EFT','Soweto','Completed'),
(28,'2026-01-16',1008,'Zanele Maseko','Current','Payment','Groceries',1640.90,'Card','Johannesburg','Completed'),
(29,'2026-01-17',1009,'Sibusiso Nkosi','Savings','Withdrawal','Transport',720.00,'Card','Vereeniging','Completed'),
(30,'2026-01-17',1010,'Precious Dube','Current','Payment','Utilities',1325.50,'EFT','Pretoria','Completed'),
(31,'2026-01-18',1001,'Thabo Mokoena','Savings','Payment','Insurance',1950.00,'Debit Order','Vereeniging','Completed'),
(32,'2026-01-18',1002,'Lerato Molefe','Current','Withdrawal','Entertainment',900.00,'Card','Soweto','Completed'),
(33,'2026-01-19',1003,'Sipho Dlamini','Savings','Deposit','Salary',23000.00,'EFT','Soweto','Completed'),
(34,'2026-01-19',1004,'Naledi Khumalo','Current','Payment','Groceries',2100.00,'Card','Johannesburg','Completed'),
(35,'2026-01-20',1005,'Kabelo Ndlovu','Savings','Withdrawal','Transport',550.00,'Card','Vereeniging','Completed'),
(36,'2026-01-20',1006,'Ayanda Zulu','Current','Deposit','Salary',25000.00,'EFT','Pretoria','Completed'),
(37,'2026-01-21',1007,'Mpho Molefe','Savings','Payment','Insurance',1650.00,'Debit Order','Soweto','Completed'),
(38,'2026-01-21',1008,'Zanele Maseko','Current','Withdrawal','Groceries',1200.45,'Card','Johannesburg','Completed'),
(39,'2026-01-22',1009,'Sibusiso Nkosi','Savings','Payment','Rent',6800.00,'EFT','Vereeniging','Completed'),
(40,'2026-01-22',1010,'Precious Dube','Current','Deposit','Salary',22500.00,'EFT','Pretoria','Completed'),
(41,'2026-01-23',1001,'Thabo Mokoena','Savings','Withdrawal','Groceries',1750.00,'Card','Vereeniging','Completed'),
(42,'2026-01-23',1002,'Lerato Molefe','Current','Payment','Utilities',1100.00,'EFT','Soweto','Completed'),
(43,'2026-01-24',1003,'Sipho Dlamini','Savings','Payment','Rent',7500.00,'EFT','Soweto','Completed'),
(44,'2026-01-24',1004,'Naledi Khumalo','Current','Withdrawal','Transport',950.00,'Card','Johannesburg','Completed'),
(45,'2026-01-25',1005,'Kabelo Ndlovu','Savings','Deposit','Salary',19500.00,'EFT','Vereeniging','Completed'),
(46,'2026-01-25',1006,'Ayanda Zulu','Current','Payment','Insurance',2200.00,'Debit Order','Pretoria','Completed'),
(47,'2026-01-26',1007,'Mpho Molefe','Savings','Withdrawal','Entertainment',650.00,'Card','Soweto','Completed'),
(48,'2026-01-26',1008,'Zanele Maseko','Current','Deposit','Salary',21500.00,'EFT','Johannesburg','Completed'),
(49,'2026-01-27',1009,'Sibusiso Nkosi','Savings','Payment','Utilities',1250.00,'EFT','Vereeniging','Completed'),
(50,'2026-01-27',1010,'Precious Dube','Current','Withdrawal','Groceries',1850.00,'Card','Pretoria','Completed'),
(51,'2026-02-01',1001,'Thabo Mokoena','Savings','Deposit','Salary',18500.00,'EFT','Vereeniging','Completed'),
(52,'2026-02-01',1002,'Lerato Molefe','Current','Payment','Rent',8200.00,'EFT','Soweto','Completed'),
(53,'2026-02-02',1003,'Sipho Dlamini','Savings','Withdrawal','Groceries',1420.00,'Card','Soweto','Completed'),
(54,'2026-02-02',1004,'Naledi Khumalo','Current','Deposit','Salary',27000.00,'EFT','Johannesburg','Completed'),
(55,'2026-02-03',1005,'Kabelo Ndlovu','Savings','Payment','Insurance',1900.00,'Debit Order','Vereeniging','Completed'),
(56,'2026-02-03',1006,'Ayanda Zulu','Current','Withdrawal','Transport',800.00,'Card','Pretoria','Completed'),
(57,'2026-02-04',1007,'Mpho Molefe','Savings','Deposit','Salary',17800.00,'EFT','Soweto','Completed'),
(58,'2026-02-04',1008,'Zanele Maseko','Current','Payment','Utilities',1550.00,'EFT','Johannesburg','Completed'),
(59,'2026-02-05',1009,'Sibusiso Nkosi','Savings','Payment','Rent',7000.00,'EFT','Vereeniging','Completed'),
(60,'2026-02-05',1010,'Precious Dube','Current','Deposit','Salary',22800.00,'EFT','Pretoria','Completed'),
(61,'2026-02-06',1001,'Thabo Mokoena','Savings','Payment','Groceries',1120.30,'Card','Vereeniging','Completed'),
(62,'2026-02-06',1002,'Lerato Molefe','Current','Withdrawal','Entertainment',850.00,'Card','Soweto','Completed'),
(63,'2026-02-07',1003,'Sipho Dlamini','Savings','Payment','Insurance',1750.00,'Debit Order','Soweto','Completed'),
(64,'2026-02-07',1004,'Naledi Khumalo','Current','Payment','Groceries',2350.60,'Card','Johannesburg','Completed'),
(65,'2026-02-08',1005,'Kabelo Ndlovu','Savings','Deposit','Salary',19800.00,'EFT','Vereeniging','Completed'),
(66,'2026-02-08',1006,'Ayanda Zulu','Current','Payment','Rent',9300.00,'EFT','Pretoria','Completed'),
(67,'2026-02-09',1007,'Mpho Molefe','Savings','Withdrawal','Transport',670.00,'Card','Soweto','Completed'),
(68,'2026-02-09',1008,'Zanele Maseko','Current','Deposit','Salary',21800.00,'EFT','Johannesburg','Completed'),
(69,'2026-02-10',1009,'Sibusiso Nkosi','Savings','Payment','Groceries',1280.00,'Card','Vereeniging','Completed'),
(70,'2026-02-10',1010,'Precious Dube','Current','Payment','Insurance',2050.00,'Debit Order','Pretoria','Completed'),
(71,'2026-02-11',1001,'Thabo Mokoena','Savings','Deposit','Salary',18500.00,'EFT','Vereeniging','Completed'),
(72,'2026-02-11',1002,'Lerato Molefe','Current','Payment','Groceries',1450.25,'Card','Soweto','Completed'),
(73,'2026-02-12',1003,'Sipho Dlamini','Savings','Withdrawal','Entertainment',780.00,'Card','Soweto','Completed'),
(74,'2026-02-12',1004,'Naledi Khumalo','Current','Payment','Utilities',1680.00,'EFT','Johannesburg','Completed'),
(75,'2026-02-13',1005,'Kabelo Ndlovu','Savings','Deposit','Salary',20000.00,'EFT','Vereeniging','Completed'),
(76,'2026-02-13',1006,'Ayanda Zulu','Current','Withdrawal','Groceries',1550.70,'Card','Pretoria','Completed'),
(77,'2026-02-14',1007,'Mpho Molefe','Savings','Payment','Rent',7100.00,'EFT','Soweto','Completed'),
(78,'2026-02-14',1008,'Zanele Maseko','Current','Payment','Insurance',1980.00,'Debit Order','Johannesburg','Completed'),
(79,'2026-02-15',1009,'Sibusiso Nkosi','Savings','Deposit','Salary',20500.00,'EFT','Vereeniging','Completed'),
(80,'2026-02-15',1010,'Precious Dube','Current','Withdrawal','Transport',720.00,'Card','Pretoria','Completed'),
(81,'2026-02-16',1001,'Thabo Mokoena','Savings','Payment','Utilities',1400.00,'EFT','Vereeniging','Completed'),
(82,'2026-02-16',1002,'Lerato Molefe','Current','Deposit','Salary',21800.00,'EFT','Soweto','Completed'),
(83,'2026-02-17',1003,'Sipho Dlamini','Savings','Payment','Rent',7600.00,'EFT','Soweto','Completed'),
(84,'2026-02-17',1004,'Naledi Khumalo','Current','Withdrawal','Entertainment',1250.00,'Card','Johannesburg','Completed'),
(85,'2026-02-18',1005,'Kabelo Ndlovu','Savings','Payment','Groceries',1350.00,'Card','Vereeniging','Completed'),
(86,'2026-02-18',1006,'Ayanda Zulu','Current','Deposit','Salary',25200.00,'EFT','Pretoria','Completed'),
(87,'2026-02-19',1007,'Mpho Molefe','Savings','Payment','Utilities',1200.00,'EFT','Soweto','Completed'),
(88,'2026-02-19',1008,'Zanele Maseko','Current','Withdrawal','Transport',890.00,'Card','Johannesburg','Completed'),
(89,'2026-02-20',1009,'Sibusiso Nkosi','Savings','Payment','Insurance',1800.00,'Debit Order','Vereeniging','Completed'),
(90,'2026-02-20',1010,'Precious Dube','Current','Deposit','Salary',23000.00,'EFT','Pretoria','Completed'),
(91,'2026-02-21',1001,'Thabo Mokoena','Savings','Payment','Groceries',1600.00,'Card','Vereeniging','Completed'),
(92,'2026-02-21',1002,'Lerato Molefe','Current','Withdrawal','Transport',620.00,'Card','Soweto','Completed'),
(93,'2026-02-22',1003,'Sipho Dlamini','Savings','Deposit','Salary',23500.00,'EFT','Soweto','Completed'),
(94,'2026-02-22',1004,'Naledi Khumalo','Current','Payment','Rent',9000.00,'EFT','Johannesburg','Completed'),
(95,'2026-02-23',1005,'Kabelo Ndlovu','Savings','Withdrawal','Entertainment',700.00,'Card','Vereeniging','Completed'),
(96,'2026-02-23',1006,'Ayanda Zulu','Current','Payment','Groceries',1750.50,'Card','Pretoria','Completed'),
(97,'2026-02-24',1007,'Mpho Molefe','Savings','Deposit','Salary',18000.00,'EFT','Soweto','Completed'),
(98,'2026-02-24',1008,'Zanele Maseko','Current','Payment','Rent',7800.00,'EFT','Johannesburg','Completed'),
(99,'2026-02-25',1009,'Sibusiso Nkosi','Savings','Withdrawal','Transport',760.00,'Card','Vereeniging','Completed'),
(100,'2026-02-25',1010,'Precious Dube','Current','Payment','Utilities',1480.00,'EFT','Pretoria','Completed');

SELECT * FROM financial_transactions;

--sum
SELECT SUM(amount) 
FROM financial_transactions;
--average
SELECT AVG(amount) 
FROM financial_transactions;
--max
SELECT MAX(amount) 
FROM financial_transactions;
--min
SELECT MIN(amount) 
FROM financial_transactions;
--groupby
--SELECT column, AGGREGATE_FUNCTION(column)
--FROM table
--GROUP BY column;
SELECT category, SUM(amount) 
FROM financial_transactions 
GROUP BY category;

--Find the total amount for each transaction_type.
SELECT transaction_type, SUM(amount)
FROM financial_transactions
GROUP BY transaction_type;

--Find the average transaction amount for each branch.
SELECT branch, AVG(amount) 
FROM financial_transactions
GROUP BY branch;

--Find the total amount for each customer.
SELECT customer_name, SUM(amount)
FROM financial_transactions
GROUP BY customer_name;

--Show the categories ordered from the highest total amount to the lowest.
SELECT category, SUM(amount)
FROM financial_transactions
GROUP BY category
ORDER BY SUM(amount) DESC;

--Find the top 3 customers who have the highest total transaction amount.
SELECT customer_name, SUM(amount)
FROM financial_transactions
GROUP BY customer_name
ORDER BY SUM(amount) DESC
LIMIT 3;

--Shows each category and its total transaction amount,
--but only shows categories where the total is greater than R20,000.
SELECT category, SUM(amount) AS total_amount
FROM financial_transactions
GROUP BY category
HAVING SUM(amount) > 20000;

--Find the total amount spent in each category for transactions greater than R1,000, 
--and only show categories whose resulting total is greater than R15,000.
SELECT category, SUM(amount)
FROM financial_transactions 
WHERE amount > 1000
GROUP BY category 
HAVING SUM(amount) > 15000;

--Imagine a bank wants to classify transactions based on their amount.
--Create a new column called risk_level using these rules:
SELECT amount,
CASE
     WHEN amount < 2000 THEN 'Low'
	 WHEN amount <= 10000 THEN 'Medium'
	 ELSE 'Large'
END AS risk_level
FROM financial_transactions;

--A bank wants to classify customers based on their transaction amount:
SELECT customer_name,
amount,
CASE
     WHEN amount < 1000 THEN 'Low value'
	 WHEN amount <= 5000 THEN 'Normal'
	 WHEN amount <= 10000 THEN 'High value'
	 ELSE 'Very high value'
END AS classification
FROM financial_transactions;

