/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

How many accounts have more than 20 orders?
*/



SELECT o.account_id id, COUNT(o.account_id) num_orders
FROM orders o
GROUP BY o.account_id
HAVING COUNT(o.account_id) > 20
ORDER BY num_orders DESC, id;

/*
Answer:
120

Given Solution:
*/

SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;
