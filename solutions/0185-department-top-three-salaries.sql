-- Problem : 185. Department Top Three Salaries
-- Link    : https://leetcode.com/problems/department-top-three-salaries/
-- Level   : Hard
-- Topics  : Window functions (DENSE_RANK), CTE, JOIN
-- Dialect : MS SQL Server
-- Solved  : 2026-09-25
--
-- Why DENSE_RANK: tied salaries share a rank and no rank is skipped,
-- so "top three unique salaries" = ranked <= 3 (ties all included).
--
-- Mistakes in my first attempt (for review):
-- * OVER syntax: wrote `over partition by (...)`; correct is `OVER (PARTITION BY ... ORDER BY ...)`.
-- * JOIN used full table names after aliasing (Employee.departmentid) -> must use E./D.
-- * Selected `id` without alias -> ambiguous (both tables have id).
-- * CTE had two columns named `name` -> give each an alias.
-- * Outer query referenced E./D. aliases, which don't exist outside the CTE.
-- * Filtered on `rank` but the column was named `ranked`.
-- * Output columns must be named Department, Employee, Salary.

WITH CTE AS (
    SELECT D.name   AS Department,
           E.name   AS Employee,
           E.salary AS Salary,
           DENSE_RANK() OVER (PARTITION BY E.departmentId
                              ORDER BY E.salary DESC) AS ranked
    FROM Employee E
    JOIN Department D
      ON E.departmentId = D.id
)
SELECT Department, Employee, Salary
FROM CTE
WHERE ranked <= 3;
