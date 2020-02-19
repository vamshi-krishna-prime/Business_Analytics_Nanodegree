/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

WITH Statements:

Question 3:
How many accounts had more total purchases than the account name which has
bought the most standard_qty paper throughout their lifetime as a customer?
*/

/* Same question as 134,135 ; but Query using WITH statement */

/*STEP1: */

WITH filtered_account AS (SELECT o.account_id AS id,
                                 SUM(o.standard_qty) AS total_standard_qty,
                                 SUM(o.total) AS total_qty
                          FROM orders o
                          GROUP BY 1
                          ORDER BY 2 DESC
                          LIMIT 1),

filtered_table AS (SELECT o.account_id AS id,
                          SUM(o.total) AS total_qty
                   FROM orders o
                   GROUP BY 1
                   HAVING SUM(o.total) > (SELECT total_qty
                                          FROM filtered_account)
                   ORDER BY 2 DESC)

SELECT COUNT(*) AS num_accounts
FROM filtered_table;

/*
Result:
num_accounts
3
*/
