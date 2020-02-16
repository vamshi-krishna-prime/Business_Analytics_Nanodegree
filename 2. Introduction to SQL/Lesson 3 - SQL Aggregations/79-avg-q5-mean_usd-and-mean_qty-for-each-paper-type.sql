/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the mean (AVERAGE) amount spent per order on each paper type, as well as
the mean amount of each paper type purchased per order. Your final answer
should have 6 values - one for each paper type for the average number of sales,
as well as the average amount.
*/


SELECT AVG(o.standard_amt_usd) standard_avg_usd, AVG(o.gloss_amt_usd) gloss_avg_usd, AVG(o.poster_amt_usd) poster_avg_usd, AVG(o.standard_qty) standard_avg_qty, AVG(o.gloss_qty) gloss_avg_qty, AVG(o.poster_qty) gloss_avg_qty
FROM orders o;
