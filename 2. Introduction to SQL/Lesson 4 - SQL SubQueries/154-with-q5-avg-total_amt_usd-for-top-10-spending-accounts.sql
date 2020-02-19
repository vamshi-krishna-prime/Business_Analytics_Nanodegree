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

WITH accounts_list AS (SELECT o.account_id AS id,
                              SUM(o.total_amt_usd) AS total_spent
                       FROM orders o
                       GROUP BY 1
                       ORDER BY 2 DESC
                       LIMIT 10)

SELECT AVG(total_spent) AS avg_lifetime_amt
FROM accounts_list;

/*
Result:
avg_lifetime_amt
304846.969
*/
