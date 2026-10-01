# financial_transaction-sql

# SQL Learning

This repository documents my journey of learning and improving my SQL skills through practical exercises and financial data analysis.

## About

I am building my SQL skills with a focus on data analysis and data engineering. This repository contains SQL queries, exercises, and practical projects that I complete as I progress.

## Current Topics

### SQL Basics

* SELECT
* WHERE
* DISTINCT
* AND / OR / NOT
* IN
* BETWEEN
* LIKE
* ORDER BY
* DESC / ASC
* LIMIT

### Aggregate Functions

* SUM
* AVG
* MIN
* MAX
* COUNT
* GROUP BY
* HAVING

### Conditional Logic

* CASE statements

### Common Table Expressions

* CTEs
* Multiple CTEs
* Filtering CTE results
* Aggregating data using CTEs
* Using one CTE as the input for another CTE

## Dataset

The current practice dataset is a fictional financial transactions dataset containing approximately 100 transactions.

The dataset includes information such as:

* Transaction ID
* Transaction date
* Customer ID
* Customer name
* Account type
* Transaction type
* Category
* Amount
* Payment method
* Branch
* Transaction status

## Example Queries

### Calculate total transaction amount

```sql
SELECT SUM(amount)
FROM financial_transactions;
```

### Calculate average transaction amount

```sql
SELECT AVG(amount)
FROM financial_transactions;
```

### Find the largest transaction

```sql
SELECT MAX(amount)
FROM financial_transactions;
```

### Calculate total amount by transaction type

```sql
SELECT
    transaction_type,
    SUM(amount) AS total_amount
FROM financial_transactions
GROUP BY transaction_type;
```

### Calculate average transaction amount by branch

```sql
SELECT
    branch,
    AVG(amount) AS average_amount
FROM financial_transactions
GROUP BY branch;
```

### Calculate total amount by category

```sql
SELECT
    category,
    SUM(amount) AS total_amount
FROM financial_transactions
GROUP BY category
ORDER BY total_amount DESC;
```

## Filtering Examples

### Find transactions between R2,000 and R5,000

```sql
SELECT
    customer_name,
    amount,
    transaction_type
FROM financial_transactions
WHERE amount BETWEEN 2000 AND 5000;
```

### Find customers whose names start with T

```sql
SELECT
    customer_name,
    amount,
    transaction_type
FROM financial_transactions
WHERE customer_name LIKE 'T%';
```

### Find deposits or withdrawals

```sql
SELECT
    customer_name,
    transaction_type,
    amount
FROM financial_transactions
WHERE transaction_type IN ('Deposit', 'Withdrawal');
```

## CASE Statements

I also learned how to use CASE statements to create classifications from existing data.

For example, classifying transactions based on their amount:

```sql
SELECT
    customer_name,
    amount,
    transaction_type,
    CASE
        WHEN amount < 1000 THEN 'Low value'
        WHEN amount <= 5000 THEN 'Normal'
        WHEN amount <= 10000 THEN 'High value'
        ELSE 'Very high value'
    END AS classification
FROM financial_transactions;
```

## Common Table Expressions (CTEs)

I learned how to use Common Table Expressions (CTEs) to break complicated SQL queries into smaller and more understandable steps.

A basic CTE follows this structure:

```sql
WITH cte_name AS (
    SELECT ...
    FROM ...
)
SELECT ...
FROM cte_name;
```

### Example: High-value transactions

First, I created a CTE containing transactions above R5,000. I then used the CTE to calculate the total amount for each customer.

```sql
WITH high_value_transactions AS (
    SELECT
        customer_name,
        amount
    FROM financial_transactions
    WHERE amount > 5000
)
SELECT
    customer_name,
    SUM(amount) AS total_amount
FROM high_value_transactions
GROUP BY customer_name;
```

### Example: Multiple CTEs

I also learned how multiple CTEs can be chained together, where one CTE provides data to the next CTE.

```sql
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
        COUNT(*) AS transaction_count,
        AVG(amount) AS average_amount
    FROM completed_transactions
    GROUP BY branch
)
SELECT
    branch,
    total_amount,
    transaction_count,
    average_amount
FROM total_transactions
WHERE total_amount > 50000
  AND average_amount > 3000;
```

This exercise helped me understand how to:

* Filter data in one step
* Pass the filtered data into another CTE
* Group data
* Calculate SUM, COUNT and AVG
* Filter aggregated results in the final query

## SQL Query Execution Order

I also learned the basic logical order in which SQL processes a query:

```text
FROM
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
SELECT
  ↓
ORDER BY
  ↓
LIMIT
```

Understanding this order helps me understand why different SQL clauses are used for different types of filtering and aggregation.

## Progress

* [x] SQL basics
* [x] Aggregate functions
* [x] GROUP BY
* [x] ORDER BY
* [x] LIMIT
* [x] HAVING
* [x] CASE statements
* [x] Filtering with WHERE
* [x] DISTINCT
* [x] IN
* [x] BETWEEN
* [x] LIKE
* [x] AND / OR / NOT
* [x] CTEs
* [x] Multiple CTEs
* [ ] JOINs
* [ ] Subqueries
* [ ] Window functions
* [ ] PostgreSQL
* [ ] SQL projects
* [ ] Data engineering projects

## Goal

My goal is to progress from basic SQL to advanced SQL concepts, PostgreSQL, database design, data analysis, and eventually data engineering.

I will continue updating this repository as I learn new concepts and complete more practical exercises.
