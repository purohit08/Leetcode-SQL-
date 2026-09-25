-- Problem : 595. Big Countries
-- Link    : https://leetcode.com/problems/big-countries/
-- Level   : Easy
-- Topics  : Filtering (WHERE), OR conditions
-- Dialect : MS SQL Server
-- Solved  : 2026-09-25
-- Runtime : 536 ms (beats 82.61%)

SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
