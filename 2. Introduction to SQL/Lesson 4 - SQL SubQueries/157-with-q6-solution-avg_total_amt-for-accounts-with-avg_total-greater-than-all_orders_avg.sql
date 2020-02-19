/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

WITH Statements:

Question 6:
What is the lifetime average amount spent in terms of total_amt_usd, including
only the companies that spent more per order, on average, than the average of
all orders.
*/

/* Same question as 142,143 ; but Query using WITH statement */

/*STEP1: */

WITH t1 AS (
   SELECT AVG(o.total_amt_usd) avg_all
   FROM orders o
   JOIN accounts a
   ON a.id = o.account_id),
t2 AS (
   SELECT o.account_id, AVG(o.total_amt_usd) avg_amt
   FROM orders o
   GROUP BY 1
   HAVING AVG(o.total_amt_usd) > (SELECT * FROM t1))
SELECT AVG(avg_amt)
FROM t2;
