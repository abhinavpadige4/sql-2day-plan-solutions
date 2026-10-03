-- ============================================================================
-- Problem 12: Find the second-highest salary per department using a CTE.
--
-- Difficulty: Hard
-- Concepts: CTE (WITH), DENSE_RANK(), filtering on rank
--
-- Approach:
--   1. CTE ranks distinct salaries within each department using DENSE_RANK.
--   2. Outer query filters to rank = 2 (the second-highest distinct salary).
--   3. LEFT JOIN back to departments for a readable name.
-- ============================================================================

WITH ranked_salaries AS (
    SELECT
        department_id,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT
    d.department_id,
    d.department_name,
    rs.salary AS second_highest_salary
FROM ranked_salaries rs
JOIN departments d
     ON rs.department_id = d.department_id
WHERE rs.salary_rank = 2
ORDER BY d.department_name;
