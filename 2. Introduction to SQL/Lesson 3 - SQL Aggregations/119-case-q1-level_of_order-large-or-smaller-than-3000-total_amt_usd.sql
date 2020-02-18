/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Write a query to display for each order, the account ID, total amount of the
order, and the level of the order - ‘Large’ or ’Small’ - depending on if the
order is $3000 or more, or smaller than $3000.
*/

SELECT o.account_id account_id,
       o.total_amt_usd total_order_usd,
       CASE WHEN o.total_amt_usd >= 3000 THEN 'Large'
            ELSE o.total_amt_usd 'Small' END AS level_of_order
FROM orders o;       
