# financial_transcation-sql
# SQL Learning

This repository documents my journey of learning and improving my SQL skills through practical exercises and financial data analysis.

## About

I am building my SQL skills with a focus on data analysis and data engineering. This repository contains SQL queries, exercises, and practical projects that I complete as I progress.

## Current Topics

* SELECT
* SUM
* AVG
* MIN
* MAX
* GROUP BY
* ORDER BY
* DESC / ASC
* Basic data aggregation

## Dataset

The current practice dataset is a fictional financial transactions dataset containing 100 transactions.

The dataset includes information such as:

* Transaction date
* Customer
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
SELECT transaction_type, SUM(amount)
FROM financial_transactions
GROUP BY transaction_type;
```

### Calculate average transaction amount by branch

```sql
SELECT branch, AVG(amount)
FROM financial_transactions
GROUP BY branch;
```

### Calculate total amount by category

```sql
SELECT category, SUM(amount)
FROM financial_transactions
GROUP BY category
ORDER BY SUM(amount) DESC;
```

## Goal

My goal is to progress from basic SQL to more advanced SQL concepts, PostgreSQL, database design, data analysis, and eventually data engineering.

I will continue updating this repository as I learn new concepts and complete more practical exercises.

## Progress

* [x] SQL basics
* [x] Aggregate functions
* [x] GROUP BY
* [x] ORDER BY
* [x] LIMIT
* [x] HAVING
* [x] CASE statements
* [ ] JOINs
* [ ] Subqueries
* [ ] CTEs
* [ ] Window functions
* [ ] PostgreSQL
* [ ] SQL projects
* [ ] Data engineering projects
