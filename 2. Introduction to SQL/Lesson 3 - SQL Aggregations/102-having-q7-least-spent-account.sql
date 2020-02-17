/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which account has spent the least with us?
*/



SELECT a.id id, a.name company, SUM(o.total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_usd
LIMIT 1;

/*
Answer:
id	   company	  total_usd
1901 	 Nike	      390.25
*/
