-- Problem : 1757. Recyclable and Low Fat Products
-- Link    : https://leetcode.com/problems/recyclable-and-low-fat-products/
-- Level   : Easy
-- Topics  : Filtering (WHERE)
-- Dialect : MS SQL Server
-- Solved  : 2026-09-25

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
