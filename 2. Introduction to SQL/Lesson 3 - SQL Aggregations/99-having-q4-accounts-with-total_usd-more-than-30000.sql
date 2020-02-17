/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which accounts spent more than 30,000 usd total across all orders?
*/



SELECT a.id id, a.name company_name, SUM(o.total_amt_usd) total_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_usd DESC, id;

/*
Answer:
204
*/
