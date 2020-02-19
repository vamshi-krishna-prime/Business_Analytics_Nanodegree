/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 6:
What is the lifetime average amount spent in terms of total_amt_usd, including
only the companies that spent more per order, on average, than the average of
all orders.
*/

/*Do check out the solution involving WITH statements in 156, 157 query*/

/*First, we want to pull the average of all accounts in terms of
total_amt_usd:*/

SELECT AVG(o.total_amt_usd) avg_all
FROM orders o

/*Then, we want to only pull the accounts with more than this average amount. */

SELECT o.account_id, AVG(o.total_amt_usd)
FROM orders o
GROUP BY 1
HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
                               FROM orders o);


/*Finally, we just want the average of these values. */
/*------------------SOLUTION---------------------*/

SELECT AVG(avg_amt)
FROM (SELECT o.account_id, AVG(o.total_amt_usd) avg_amt
    FROM orders o
    GROUP BY 1
    HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
                                   FROM orders o)
     ) temp_table;

/*
Result:
avg
4721.1397439971747168
*/
