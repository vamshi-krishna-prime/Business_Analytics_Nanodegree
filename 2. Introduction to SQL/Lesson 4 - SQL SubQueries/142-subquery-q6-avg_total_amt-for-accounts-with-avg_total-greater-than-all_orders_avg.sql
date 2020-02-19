/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 6:
What is the lifetime average amount spent in terms of total_amt_usd, including
only the companies that spent more per order, on average, than the average of
all orders.
*/

/*Do check the alternate solution/approach in the next query 143 and 156, 157 */

/*STEP1: average on all orders */

SELECT AVG(o.total_amt_usd) AS avg_total
FROM orders o;

/*Result:
avg_total
3348.0196513310185185
*/

/*STEP2: Extract the values of the accounts that spent more per order,
on average, than the average of all orders */

SELECT a.name AS name,
       AVG(o.total_amt_usd) AS avg_total_per_order
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
HAVING AVG(o.total_amt_usd) > ( SELECT AVG(o.total_amt_usd) AS avg_total
                                FROM orders o
                              )
ORDER BY 2 DESC;

/*
169 results
*/

/*STEP3: */
/*-----------------SOLUTION------------------*/

SELECT AVG(avg_total_per_order)
FROM( SELECT a.name,
             AVG(o.total_amt_usd) AS avg_total_per_order
      FROM accounts a
      JOIN orders o
      ON o.account_id = a.id
      GROUP BY a.name
      HAVING AVG(o.total_amt_usd) > ( SELECT AVG(o.total_amt_usd) AS avg_total
                                      FROM orders o
                                    )
      ORDER BY 2 DESC
    ) temp;

/*
Result:
avg
4721.1397439971747168
*/
