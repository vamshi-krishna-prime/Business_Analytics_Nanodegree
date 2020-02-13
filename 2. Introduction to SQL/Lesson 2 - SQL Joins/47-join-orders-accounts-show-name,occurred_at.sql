/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 2 : SQL Joins

Try pulling 'name' from the 'accounts' table, and 'occurred_at' from
the 'orders' table.
*/


SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
