-- =============================================================================
-- solutions/day1/05_employees_with_manager.sql
-- Problem 5: Each employee along with their manager's name.
--
-- Goal: Return every employee and, if they have one, their manager's
--       first and last name. Employees without a manager show NULL.
--
-- Approach: Self-join employees to itself on manager_id = employee_id.
--           Use LEFT JOIN so top-level employees (NULL manager_id) are kept.
--
-- Complexity: O(n) with an index on manager_id; O(n log n) without.
-- =============================================================================

SELECT
    e.employee_id,
    e.first_name  AS employee_first_name,
    e.last_name   AS employee_last_name,
    m.first_name  AS manager_first_name,
    m.last_name   AS manager_last_name
FROM employees e
LEFT JOIN employees m
  ON m.employee_id = e.manager_id
ORDER BY e.employee_id;
