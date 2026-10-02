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

### JOINs

I started learning how to combine data from multiple related tables using JOINs.

Topics currently covered:

* INNER JOIN
* Joining tables using a common key
* Table aliases
* Joining customer information with transaction information
* Joining customer information with account information
* Combining JOINs with WHERE
* Combining JOINs with GROUP BY
* Combining JOINs with aggregate functions
* Combining JOINs with HAVING
* Understanding when a JOIN is actually necessary

### INNER JOIN

An `INNER JOIN` returns rows where a matching value exists in both tables.

For example:

```sql
SELECT
    c.customer_name,
    c.phone_number,
    ft.amount,
    ft.transaction_type
FROM customers c
INNER JOIN financial_transactions ft
    ON c.customer_id = ft.customer_id;
```

I learned that table aliases can make queries easier to read:

* `c` → `customers`
* `ft` → `financial_transactions`
* `ca` → `customer_accounts`

I also learned that a JOIN should not be used unnecessarily. If all the required information already exists in one table, there is no need to JOIN another table.

### JOIN with Aggregation

I practiced combining JOINs with aggregate functions.

For example, calculating the total deposit amount for each customer:

```sql
SELECT
    c.customer_name,
    SUM(ft.amount) AS total_deposits
FROM customers c
INNER JOIN financial_transactions ft
    ON c.customer_id = ft.customer_id
WHERE ft.transaction_type = 'Deposit'
GROUP BY c.customer_name;
```

I also practiced using `HAVING` to filter aggregated results:

```sql
SELECT
    c.customer_name,
    SUM(ft.amount) AS total_amount
FROM customers c
INNER JOIN financial_transactions ft
    ON c.customer_id = ft.customer_id
WHERE ft.transaction_type = 'Deposit'
GROUP BY c.customer_name
HAVING SUM(ft.amount) > 20000;
```

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

Additional tables were created to practice JOINs.

### Customers

The `customers` table contains:

* Customer ID
* Customer name
* Phone number
* Address
* Tag number

### Customer Accounts

The `customer_accounts` table contains:

* Account ID
* Customer ID
* Account number
* Account type
* Account status
* Date opened

The tables are related using `customer_id`.

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

### Find deposits greater than R5,000

```sql
SELECT
    customer_name,
    transaction_type,
    amount
FROM financial_transactions
WHERE transaction_type = 'Deposit'
  AND amount > 5000;
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

## Real-World SQL Requirements

I also started practicing how to translate business requirements into SQL queries.

For example:

> The finance team wants to identify branches that processed completed deposits. For each branch, calculate the number of deposits, total deposit value, and average deposit amount. Only include branches with total deposits greater than R50,000.

The resulting query was:

```sql
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
```

This exercise helped me practice combining:

* WHERE
* GROUP BY
* COUNT
* SUM
* AVG
* HAVING

I also learned how `COUNT(*)` works with filtering.

For example:

```sql
WHERE transaction_type = 'Deposit'
```

followed by:

```sql
COUNT(*)
```

counts the number of rows that remain after the filter.

This means that `WHERE` determines which rows are available for `COUNT(*)`, `SUM()`, and `AVG()`.

## Understanding GROUP BY with Aggregate Functions

I learned that `GROUP BY` determines the groups over which aggregate functions operate.

For example:

```sql
SELECT
    branch,
    AVG(amount) AS average_amount
FROM financial_transactions
GROUP BY branch;
```

Here, `AVG(amount)` calculates a separate average for each branch because the data is grouped by `branch`.

Without `GROUP BY`, the average would be calculated across the entire filtered dataset.

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

## Key Lessons

Through these exercises, I have learned that:

* `WHERE` filters individual rows before aggregation.
* `GROUP BY` determines the groups used by aggregate functions.
* `SUM()` calculates totals within each group.
* `AVG()` calculates averages within each group.
* `COUNT(*)` counts rows remaining after filtering.
* `HAVING` filters groups after aggregation.
* `JOIN` combines related data from different tables.
* Table aliases make queries easier to read.
* A JOIN should only be used when information from another table is actually required.
* Business requirements can be translated into SQL logic.
* Aggregate functions can be combined with filtering and grouping to answer business questions.

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

  * [x] INNER JOIN
  * [ ] LEFT JOIN
  * [ ] RIGHT JOIN
  * [ ] FULL OUTER JOIN
  * [x] JOIN + WHERE
  * [x] JOIN + GROUP BY
  * [x] JOIN + HAVING
  * [ ] Multiple-table JOINs
* [ ] Subqueries
* [ ] Window functions
* [ ] PostgreSQL
* [ ] SQL projects
* [ ] Data engineering projects

## Goal

My goal is to progress from basic SQL to advanced SQL concepts, PostgreSQL, database design, data analysis, and eventually data engineering.

I will continue updating this repository as I learn new concepts and complete more practical exercises.
