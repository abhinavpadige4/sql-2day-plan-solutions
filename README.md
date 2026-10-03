# 2-Day SQL Interview Study Plan + Solved Practice Problems

A focused, high-yield 2-day plan to prepare for SQL-heavy technical interviews
(backend, data, analytics, product engineering). Every practice problem below
ships with a **complete, well-commented, standard SQL solution** (ANSI SQL:2003+
compatible with PostgreSQL, MySQL 8+, SQLite 3.25+, SQL Server, and BigQuery).

## How to use this repo

1. Read the plan in this README top-to-bottom.
2. For each practice problem, **try it yourself first** on the schema in
   `schema/schema.sql`.
3. Then open the corresponding file under `solutions/` and compare.
4. Re-run every solution against the sample data to confirm the expected output.

## Schema

All solutions run against the schema in [`schema/schema.sql`](schema/schema.sql):

```
employees(employee_id, first_name, last_name, hire_date, salary, department_id, manager_id)
departments(department_id, department_name, location)
projects(project_id, project_name, start_date, end_date, budget)
project_assignments(employee_id, project_id, role, assigned_date)
```

Load it into any SQL engine:

```bash
psql -f schema/schema.sql          # PostgreSQL
mysql < schema/schema.sql          # MySQL
sqlite3 db.sqlite < schema/schema.sql
```

## Day 1 — Foundations (SELECT, WHERE, ORDER BY, GROUP BY, HAVING)

**Goal:** be fluent with filtering, aggregation, and grouping. These are the
building blocks of every interview question.

### Topics to review (60 min)
- `SELECT` / `FROM` / `WHERE` / `ORDER BY` / `LIMIT`
- `GROUP BY` and aggregate functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `HAVING` vs `WHERE` (row filter vs group filter)
- `DISTINCT`, `COALESCE`, `CASE WHEN`
- `NULL` semantics (`IS NULL`, `IS NOT NULL`)

### Practice problems (Day 1)

| # | Problem | Solution |
|---|---------|----------|
| 1 | List all employees in the Engineering department, ordered by salary descending. | [`solutions/01_employees_in_engineering.sql`](solutions/01_employees_in_engineering.sql) |
| 2 | Find employees hired in the year 2023. | [`solutions/02_employees_hired_in_2023.sql`](solutions/02_employees_hired_in_2023.sql) |
| 3 | Count employees per department and show only departments with more than 3 employees. | [`solutions/03_employees_per_department.sql`](solutions/03_employees_per_department.sql) |
| 4 | Compute average salary per department, rounded to 2 decimals. | [`solutions/04_avg_salary_per_department.sql`](solutions/04_avg_salary_per_department.sql) |
| 5 | Find the top 3 highest-paid employees overall. | [`solutions/05_top_3_highest_paid.sql`](solutions/05_top_3_highest_paid.sql) |
| 6 | List employees whose salary is above the company-wide average. | [`solutions/06_above_company_avg.sql`](solutions/06_above_company_avg.sql) |

### Day 1 wrap-up (30 min)
- Re-derive each solution from scratch without looking.
- Write out the difference between `WHERE` and `HAVING` in your own words.

---

## Day 2 — Joins, Subqueries, Window Functions, CTEs

**Goal:** handle multi-table questions, ranking, and running totals — the
topics that separate "pass" from "strong hire".

### Topics to review (60 min)
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN`
- Self-joins (e.g. employee → manager)
- Correlated vs non-correlated subqueries
- Window functions: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LAG()`, `LEAD()`, `SUM() OVER (...)`
- Common Table Expressions (`WITH ... AS`)
- `EXISTS` / `IN` / `NOT IN`

### Practice problems (Day 2)

| # | Problem | Solution |
|---|---------|----------|
| 7 | List every employee with their department name (include employees with no department). | [`solutions/07_employee_with_department.sql`](solutions/07_employee_with_department.sql) |
| 8 | List employees with their manager's full name (self-join). | [`solutions/08_employee_with_manager.sql`](solutions/08_employee_with_manager.sql) |
| 9 | Find employees who have never been assigned to any project. | [`solutions/09_employees_without_projects.sql`](solutions/09_employees_without_projects.sql) |
| 10 | Rank employees within each department by salary (dense rank). | [`solutions/10_rank_within_department.sql`](solutions/10_rank_within_department.sql) |
| 11 | Compute each employee's salary difference vs. their department average. | [`solutions/11_salary_vs_dept_avg.sql`](solutions/11_salary_vs_dept_avg.sql) |
| 12 | Find the second-highest salary per department using a CTE. | [`solutions/12_second_highest_per_dept.sql`](solutions/12_second_highest_per_dept.sql) |
| 13 | Count active projects per department (projects with at least one assignment). | [`solutions/13_projects_per_department.sql`](solutions/13_projects_per_department.sql) |
| 14 | Find employees whose salary is higher than their manager's. | [`solutions/14_salary_higher_than_manager.sql`](solutions/14_salary_higher_than_manager.sql) |
| 15 | Compute month-over-month change in total salary per department using `LAG`. | [`solutions/15_month_over_month_change.sql`](solutions/15_month_over_month_change.sql) |

### Day 2 wrap-up (30 min)
- Explain the difference between `RANK`, `DENSE_RANK`, and `ROW_NUMBER`.
- Rewrite problem 12 without a CTE (using a subquery) and vice-versa.
- Sketch the execution plan for problem 15 out loud.

---

## Concepts covered

- Filtering: `WHERE`, `HAVING`, `IN`, `EXISTS`, `BETWEEN`, `LIKE`
- Aggregation: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`
- Joins: `INNER`, `LEFT`, `RIGHT`, `FULL OUTER`, self-joins
- Subqueries: scalar, correlated, `IN`/`EXISTS`
- Window functions: `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `SUM() OVER`
- CTEs (`WITH ... AS`)
- NULL handling: `COALESCE`, `IS NULL`
- Date functions: `EXTRACT`, `DATE_TRUNC`, `YEAR`, `MONTH`

## Conventions used in the solutions

- ANSI-standard SQL only — no vendor-specific syntax unless noted in a comment.
- Every query has a header comment with: problem statement, expected output
  shape, and complexity notes.
- Inline comments explain non-obvious clauses.
- Solutions are written to be readable in an interview setting (no clever one-liners).
