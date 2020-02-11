/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Write a query to return the highest to lowest total_amt_usd with respect to
account_id s sorted lowest to highest.
Include the account_id, and total_amt_usd.

In short the query should return the account_id s sorted from lowest to highest
and internally showing the order with highest total_amt_usd first inside the id.
*/

SELECT account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;
/*
This is not same as:
ORDER BY total_amt_usd DESC, account_id
*/
