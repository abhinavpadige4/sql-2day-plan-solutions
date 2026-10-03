-- ============================================================================
-- Problem 8: List employees with their manager's full name (self-join).
--
-- Difficulty: Medium
-- Concepts: self-join, LEFT JOIN, COALESCE
--
-- Approach:
--   Join employees to themselves on manager_id = employee_id.
--   Use LEFT JOIN so employees without a manager (manager_id IS NULL)
--   still appear in the result.
-- ============================================================================

SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    m.employee_id                       AS manager_id,
    COALESCE(m.first_name || ' ' || m.last_name, '(no manager)') AS manager_name
FROM employees e
LEFT JOIN employees m
       ON e.manager_id = m.employee_id
ORDER BY e.employee_id;
