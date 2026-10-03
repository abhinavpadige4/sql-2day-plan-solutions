-- =============================================================================
-- solutions/day1/02_employees_above_dept_avg.sql
-- Problem 2: Employees earning more than their department's average salary.
--
-- Goal: Return employees whose salary exceeds the average salary of the
--       department they belong to.
--
-- Approach: Compute the per-department average in a CTE, then join it back
--           to employees and filter.
--
-- Complexity: O(n) — one pass to aggregate, one pass to filter.
-- =============================================================================

WITH dept_avg AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
)
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.salary,
    ROUND(da.avg_salary, 2) AS department_avg_salary
FROM employees e
JOIN departments d
  ON d.department_id = e.department_id
JOIN dept_avg da
  ON da.department_id = e.department_id
WHERE e.salary > da.avg_salary
ORDER BY d.department_name, e.salary DESC;
