/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which accounts spent less than 1,000 usd total across all orders?
*/



SELECT a.id id, a.name company, SUM(o.total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_usd, id;


/*
Answer:
3 results

id	  company	                    total_usd
1901	Nike	                      390.25
1671	Delta Air Lines	            859.64
4321	Level 3 Communications    	881.73
*/
