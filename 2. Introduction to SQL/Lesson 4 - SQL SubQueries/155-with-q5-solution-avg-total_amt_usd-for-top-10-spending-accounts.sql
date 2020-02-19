/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

WITH Statements:

Question 5:
What is the lifetime average amount spent in terms of total_amt_usd for the
top 10 total spending accounts?
*/

/* Same question as 139,140 ; but Query using WITH statement */

/*STEP1: */

WITH t1 AS (
   SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
   FROM orders o
   JOIN accounts a
   ON a.id = o.account_id
   GROUP BY a.id, a.name
   ORDER BY 3 DESC
   LIMIT 10)
SELECT AVG(tot_spent)
FROM t1;
