-- =============================================================================
-- solutions/day1/04_employees_without_manager.sql
-- Problem 4: Employees who have no manager (top-level leaders).
--
-- Goal: Return employees whose manager_id is NULL.
--
-- Approach: Simple WHERE filter. NULL must be tested with IS NULL, not = NULL.
--
-- Complexity: O(n) — single scan.
-- =============================================================================

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
  ON d.department_id = e.department_id
WHERE e.manager_id IS NULL
ORDER BY e.employee_id;
