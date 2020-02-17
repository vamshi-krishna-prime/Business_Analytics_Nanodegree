/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which account has the most orders?
*/



SELECT a.id id, a.name company_name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY num_orders DESC
LIMIT 1;

/*
Answer:
id	     company_name	         num_orders
3411	   Leucadia National	      71
*/
