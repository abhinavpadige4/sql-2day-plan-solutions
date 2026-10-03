-- ============================================================================
-- Problem 9: Find employees who have never been assigned to any project.
--
-- Difficulty: Easy
-- Concepts: LEFT JOIN + IS NULL, NOT EXISTS, NOT IN
--
-- Approach:
--   Three equivalent ways shown. LEFT JOIN + IS NULL is the most common
--   interview answer; NOT EXISTS is often the most efficient on large tables.
-- ============================================================================

-- Approach A: LEFT JOIN + IS NULL
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
LEFT JOIN project_assignments pa
       ON e.employee_id = pa.employee_id
WHERE pa.project_id IS NULL;

-- Approach B: NOT EXISTS (correlated subquery)
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM project_assignments pa
    WHERE pa.employee_id = e.employee_id
);

-- Approach C: NOT IN (use with care if employee_id can be NULL)
SELECT employee_id, first_name, last_name
FROM employees
WHERE employee_id NOT IN (
    SELECT DISTINCT employee_id
    FROM project_assignments
    WHERE employee_id IS NOT NULL
);
