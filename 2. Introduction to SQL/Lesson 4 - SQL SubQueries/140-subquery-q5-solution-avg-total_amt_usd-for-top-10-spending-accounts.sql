/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 5:
What is the lifetime average amount spent in terms of total_amt_usd for the
top 10 total spending accounts?
*/

/*Do check out the solution involving WITH statements in 154, 155 query*/

/* First, we just want to find the top 10 accounts in terms of
highest total_amt_usd. */

SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY 3 DESC
LIMIT 10;

/* Now, we just want the average of these 10 amounts. */
/*-------------------SOLUTION--------------------*/

SELECT AVG(tot_spent)
FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
      FROM orders o
      JOIN accounts a
      ON a.id = o.account_id
      GROUP BY a.id, a.name
      ORDER BY 3 DESC
      LIMIT 10) temp;


/*
Result:
avg
304846.969000000000
*/
