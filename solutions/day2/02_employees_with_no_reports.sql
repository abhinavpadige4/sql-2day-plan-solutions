-- =============================================================================
-- solutions/day2/02_employees_with_no_reports.sql
-- Problem 2: Employees who have no direct reports (no one reports to them).
--
-- Goal: Return employees that do not appear as a manager for any other
--       employee.
--
-- Approach: LEFT JOIN employees to itself on manager_id = employee_id,
--           then keep rows where the right side is NULL.
--
-- Complexity: O(n) with an index on manager_id.
-- =============================================================================

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
LEFT JOIN employees r
  ON r.manager_id = e.employee_id
LEFT JOIN departments d
  ON d.department_id = e.department_id
WHERE r.employee_id IS NULL
ORDER BY e.employee_id;
