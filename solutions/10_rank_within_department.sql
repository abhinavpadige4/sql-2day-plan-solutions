-- ============================================================================
-- Problem 10: Rank employees within each department by salary (dense rank).
--
-- Difficulty: Medium
-- Concepts: DENSE_RANK(), PARTITION BY, ORDER BY
--
-- Approach:
--   Use DENSE_RANK() so ties share the same rank and the next rank is not
--   skipped (unlike RANK()). Partition by department so each department
--   has its own ranking sequence.
-- ============================================================================

SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    d.department_name,
    e.salary,
    DENSE_RANK() OVER (
        PARTITION BY e.department_id
        ORDER BY e.salary DESC
    ) AS salary_rank
FROM employees e
JOIN departments d
     ON e.department_id = d.department_id
ORDER BY d.department_name, salary_rank, e.employee_id;
