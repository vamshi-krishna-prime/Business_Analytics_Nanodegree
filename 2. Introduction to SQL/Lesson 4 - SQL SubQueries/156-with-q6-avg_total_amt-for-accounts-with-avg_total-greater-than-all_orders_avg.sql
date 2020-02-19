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

WITH avg_total AS (SELECT AVG(o.total_amt_usd) AS avg_total_usd
                   FROM orders o),

accounts_table AS (SELECT a.name AS name,
                          AVG(o.total_amt_usd) AS avg_total_per_order
                   FROM orders o
                   JOIN accounts a
                   ON o.account_id = a.id
                   GROUP BY 1
                   HAVING AVG(o.total_amt_usd) > (SELECT avg_total_usd
                                                  FROM avg_total)
                   ORDER BY 2)

SELECT AVG(avg_total_per_order) AS avg_lifetime_amt
FROM accounts_table;


/*
Result:
avg_lifetime_amt
4721.13974399717
*/
