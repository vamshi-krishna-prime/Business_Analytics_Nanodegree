/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

For each account, determine the average amount spent per order on each paper
type. Your result should have four columns - one for the account name and one
for the average amount spent on each paper type.
*/



SELECT a.name account_name, AVG(o.standard_amt_usd) standard_avg_usd, AVG(o.gloss_amt_usd) gloss_avg_usd, AVG(o.poster_amt_usd) poster_avg_usd
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name;
