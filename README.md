# SQL Employee Analysis

A SQL project analyzing an employee dataset using aggregate functions, subqueries, joins, and window functions to uncover insights about salaries, departments, experience, and demographics.

## Overview

This project answers a series of business questions about a company's workforce using SQL — starting from basic aggregations and building up to advanced subqueries, joins, and window functions like `RANK()`, `DENSE_RANK()`, and `ROW_NUMBER()`.

## Dataset

- **Table:** `employees`
- **Total employees:** 15
- **Departments:** IT, HR, Finance
- **Key columns:** name, department, salary, age, experience, city, joining_date

## Topics Covered

| Category | Examples |
|---|---|
| Aggregate Functions | Total employees, average/max/min/sum of salary |
| Filtering | Employees by city, age, experience, salary range |
| Grouping | Department-wise counts, averages, totals |
| HAVING Clause | Departments/cities meeting specific thresholds |
| Subqueries | Employees earning above company/department average |
| Joins | Comparing individual salaries to department-level stats |
| Window Functions | RANK(), DENSE_RANK(), ROW_NUMBER() for salary rankings, top-N per department |

## Sample Insights

- The company has 15 employees across 3 departments, with an average salary of ~76,133.
- HR has the highest number of employees (6) and the highest average salary (~80,833).
- Tejal has the highest salary in the company (99,000) and holds the top rank in the IT department.
- 9 employees earn more than the company-wide average salary.
- The second-highest salary in the company is 90,000.

## How to Use

1. Download `employee_analytics.sql` from this repository.
2. Run it in your preferred SQL environment (MySQL Workbench, MySQL CLI, or similar).
3. Each query is followed by its result and a one-line insight in a comment for quick reference.

## Tools Used

- **MySQL 8.0** (window functions need version 8.0 or later)
- **MySQL Workbench 8.0 CE** to write and run the queries

## Author

Pragati Gaddewar
