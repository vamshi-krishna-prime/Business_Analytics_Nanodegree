/* INCOMPLETE / DOUBT
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

We would like to understand 3 different levels of customers based on the amount
associated with their purchases. The top level includes anyone with a Lifetime
Value (total sales of all orders) greater than 200,000 usd. The second level is
between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd.
Provide a table that includes the level associated with each account. You
should provide the account name, the total sales of all orders for the
customer, and the level. Order with the top spending customers listed first.


We would now like to perform a similar calculation to the first, but we want
to obtain the total amount spent by customers only in 2016 and 2017. Keep the
same levels as in the previous question. Order with the top spending customers
listed first.
*/


SELECT a.name company,
       SUM(o.total_amt_usd) total_spent,
       DATE_PART('year', o.occurred_at) AS year,
       CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'Top Level'
            WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o.total_amt_usd) <= 200000 THEN 'Middle Level'
            ELSE 'Low Level' END AS customer_level
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE o.occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
GROUP BY 1, 3
ORDER BY 2 DESC;


/*
Results: 317 rows

Given Solution :
*/

SELECT a.name, SUM(total_amt_usd) total_spent,
     CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
     WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
     ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id
WHERE occurred_at > '2015-12-31'
GROUP BY 1
ORDER BY 2 DESC;


/*
Results: 322 rows since date included is in other format
*/

SELECT a.name company,
       SUM(o.total_amt_usd) total_spent,
       DATE_PART('year', o.occurred_at) AS year,
       CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'Top Level'
            WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o.total_amt_usd) <= 200000 THEN 'Middle Level'
            ELSE 'Low Level' END AS customer_level
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE occurred_at > '2015-12-31'
GROUP BY 1, 3
ORDER BY 2 DESC;

/*
Results: 338
*/
