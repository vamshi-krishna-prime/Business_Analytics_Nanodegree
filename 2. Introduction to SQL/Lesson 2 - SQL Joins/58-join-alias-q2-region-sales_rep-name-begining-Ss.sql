/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 2 : SQL Joins

Provide a table that provides the region for each sales_rep along with their
associated accounts. This time only for accounts where the sales rep has a
first name starting with S and in the Midwest region. Your final table should
include three columns: the region name, the sales rep name, and the
account name. Sort the accounts alphabetically (A-Z) according to account name.
*/



SELECT r.name region, s.name sales_rep, a.name account
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
WHERE r.name = 'Midwest' AND a.name LIKE 'S%'
ORDER BY a.name;
