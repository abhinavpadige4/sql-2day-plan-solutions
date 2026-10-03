-- =============================================================================
-- solutions/day1/01_highest_paid_per_department.sql
-- Problem 1: Highest-paid employee in each department.
--
-- Goal: For every department, return the department name and the employee
--       with the highest salary. If two employees tie, return both.
--
-- Approach: Use a window function (RANK) to rank employees within each
--           department by salary descending, then keep only rank = 1.
--           RANK (not ROW_NUMBER) is used so ties are preserved.
--
-- Complexity: O(n log n) due to the sort inside the window function.
-- =============================================================================

WITH ranked AS (
    SELECT
        d.department_name,
        e.employee_id,
        e.first_name,
        e.last_name,
        e.salary,
        RANK() OVER (
            PARTITION BY d.department_id
            ORDER BY e.salary DESC
        ) AS salary_rank
    FROM employees e
    JOIN departments d
      ON d.department_id = e.department_id
)
SELECT
    department_name,
    employee_id,
    first_name,
    last_name,
    salary
FROM ranked
WHERE salary_rank = 1
ORDER BY department_name, employee_id;
