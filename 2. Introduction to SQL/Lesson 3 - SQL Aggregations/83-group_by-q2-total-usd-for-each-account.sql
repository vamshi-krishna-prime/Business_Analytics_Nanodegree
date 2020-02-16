/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the total sales in usd for each account. You should include two columns -
the total sales for each company's orders in usd and the company name.
*/



SELECT a.name company_name, o.standard_amt_usd + o.gloss_amt_usd + o.poster_amt_usd total_usd
FROM orders o
JOIN accounts a
ON a.id = o.account_id
ORDER BY a.name;


/*
The abouve query return repeated account names and not a feasible solution.
The more correct version of query is:
*/

SELECT a.name company_name, SUM(o.total_amt_usd) total_usd
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name
ORDER BY a.name;
