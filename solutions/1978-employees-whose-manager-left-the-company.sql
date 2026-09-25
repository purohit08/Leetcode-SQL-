-- Problem : 1978. Employees Whose Manager Left the Company
-- Link    : https://leetcode.com/problems/employees-whose-manager-left-the-company/
-- Level   : Easy
-- Topics  : Subquery, NOT IN, NULL handling
-- Dialect : MS SQL Server
-- Solved  : 2026-09-25
--
-- Notes:
-- * The problem asks for the result ordered by employee_id, so ORDER BY is required.
-- * NOT IN is safe here: employee_id is the primary key, so the subquery never returns NULL.
-- * Rows with manager_id NULL are dropped automatically (NULL NOT IN (...) is UNKNOWN).

-- My solution (original logic, ORDER BY added)
SELECT DISTINCT employee_id
FROM Employees
WHERE manager_id IN (
        SELECT DISTINCT manager_id
        FROM Employees
        WHERE manager_id NOT IN (SELECT DISTINCT employee_id FROM Employees)
      )
  AND salary < 30000
ORDER BY employee_id;

-- Simplified: the middle subquery and the DISTINCTs are not needed
SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;
