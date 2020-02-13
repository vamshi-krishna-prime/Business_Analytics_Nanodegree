/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 2 : SQL Joins

If we wanted to only pull individual elements from either the orders or
accounts table, we can do this by using the exact same information in the
FROM and ON statements. However, in your SELECT statement, you will need to
know how to specify tables and columns in the SELECT statement:

The table name is always before the period.
The column you want from that table is always after the period.

For example, if we want to pull only the account name and the dates in which
that account placed an order, but none of the other columns, we can do this
with the following query:
*/


SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;


/*
Notice:
1. tables in FROM and JOIN can be interchanged and result will be the same
i.e            FROM orders JOIN accounts
is same as     FROM accounts JOIN orders

2. The JOIN in ON statement always follow PK-FK joint and the values on either
sides of '=' sign is interchangeable and the result will not be affected.
i.e            ON orders.account_id = accounts.id
is same as     ON accounts.id = orders.account_id
*/
