/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which account has spent the most with us?
*/



SELECT a.id id, a.name company, SUM(o.total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_usd DESC
LIMIT 1;

/*
Answer:
id	  company	        total_usd
4211	EOG Resources	  382873.30
*/
