-- Problem : 584. Find Customer Referee
-- Link    : https://leetcode.com/problems/find-customer-referee/
-- Level   : Easy
-- Topics  : Filtering (WHERE), NULL handling
-- Dialect : MS SQL Server
-- Solved  : 2026-09-25
--
-- Note: `referee_id <> 2` is UNKNOWN (not TRUE) when referee_id is NULL,
-- so un-referred customers must be included explicitly with IS NULL.

SELECT name
FROM Customer
WHERE referee_id <> 2
   OR referee_id IS NULL;
