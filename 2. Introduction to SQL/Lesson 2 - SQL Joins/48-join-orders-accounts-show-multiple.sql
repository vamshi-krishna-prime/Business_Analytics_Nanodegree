/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 2 : SQL Joins

Try pulling 'standard_qty', 'gloss_qty', and 'poster_qty' from the 'orders'
table, and the 'website' and the 'primary_poc' from the 'accounts' table.
*/


SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
