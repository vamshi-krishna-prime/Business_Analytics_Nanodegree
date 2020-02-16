/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

For each account, determine the average amount of each type of paper they
purchased across their orders. Your result should have four columns - one for
the account name and one for the average quantity purchased for each of the
paper types for each account.
*/



SELECT a.name account_name, AVG(o.standard_qty) standard_avg, AVG(o.gloss_qty) gloss_avg, AVG(o.poster_qty) poster_avg
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY account_name;
