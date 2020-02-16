/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which account (by name) placed the earliest order? Your solution should have
the account name and the date of the order.
*/



SELECT a.name name, a.occurred_at occurred_earliest
FROM accounts a
JOIN orders o
ON o.account_id = a.id
ORDER BY a.occurred_at
LIMIT 1;
