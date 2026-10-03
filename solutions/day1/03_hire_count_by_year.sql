-- =============================================================================
-- solutions/day1/03_hire_count_by_year.sql
-- Problem 3: Number of employees hired per calendar year.
--
-- Goal: Return each year and the count of employees hired that year,
--       ordered chronologically.
--
-- Approach: Extract the year from hire_date with EXTRACT(YEAR FROM ...),
--           then GROUP BY that expression.
--
-- Complexity: O(n) — single aggregation pass.
-- =============================================================================

SELECT
    EXTRACT(YEAR FROM hire_date) AS hire_year,
    COUNT(*)                     AS hires
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;
