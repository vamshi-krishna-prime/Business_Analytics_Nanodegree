/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

We would like to understand 3 different levels of customers based on the amount
associated with their purchases. The top level includes anyone with a Lifetime
Value (total sales of all orders) greater than 200,000 usd. The second level is
between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd.
Provide a table that includes the level associated with each account. You
should provide the account name, the total sales of all orders for the
customer, and the level. Order with the top spending customers listed first.
*/


SELECT a.name company,
      SUM(o.total_amt_usd) total_usd_spent,
      CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'Top Level'
           WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o,total_amt_usd) <= 200000 THEN 'Second Level'
           ELSE 'Lowest Level' END AS Level
FROM orders o
JOIN accounts a
ON a.id = o.accout_id
GROUP BY a.name
ORDER BY 2 DESC;
