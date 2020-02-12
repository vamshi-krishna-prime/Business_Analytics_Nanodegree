/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Combile accounts and orders tables and Pull all the data from the
'orders' table.
*/


SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
