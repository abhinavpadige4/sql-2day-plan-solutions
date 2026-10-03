-- =============================================================================
-- solutions/day2/01_department_headcount_and_avg_salary.sql
-- Problem 1: Headcount and average salary per department.
--
-- Goal: For each department, return the department name, the number of
--       employees, and the average salary (rounded to 2 decimals).
--
-- Approach: JOIN employees to departments, GROUP BY department, and use
--           COUNT(*) and AVG(salary). ROUND keeps the output tidy.
--
-- Complexity: O(n) — single aggregation pass.
-- =============================================================================

SELECT
    d.department_name,
    COUNT(e.employee_id)              AS headcount,
    ROUND(AVG(e.salary), 2)           AS avg_salary
FROM departments d
LEFT JOIN employees e
  ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY headcount DESC, d.department_name;
