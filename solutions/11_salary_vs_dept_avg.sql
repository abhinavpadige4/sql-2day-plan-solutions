-- ============================================================================
-- Problem 11: Compute each employee's salary difference vs. their department
--             average.
--
-- Difficulty: Medium
-- Concepts: window aggregate AVG() OVER (PARTITION BY ...)
--
-- Approach:
--   Use AVG(salary) OVER (PARTITION BY department_id) to compute the
--   department average without collapsing rows. Subtract from each
--   employee's salary to get the delta.
-- ============================================================================

SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    d.department_name,
    e.salary,
    ROUND(AVG(e.salary) OVER (PARTITION BY e.department_id), 2) AS dept_avg_salary,
    ROUND(e.salary - AVG(e.salary) OVER (PARTITION BY e.department_id), 2) AS salary_diff
FROM employees e
JOIN departments d
     ON e.department_id = d.department_id
ORDER BY d.department_name, salary_diff DESC;
