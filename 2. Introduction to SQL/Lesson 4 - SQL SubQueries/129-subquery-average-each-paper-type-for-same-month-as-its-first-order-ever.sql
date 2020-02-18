/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Imagine yourself as a Sales Manager at 'Parch and Posey' company. Write a query
to pull month level information on first order ever placed in the orders table
and use the result of the previous query to find only the orders that took
place in the same month and year as the first order, and then pull the average
for each type of paper quantity in this month.
*/


SELECT AVG(o.standard_qty) AS avg_standard_qty, AVG(o.gloss_qty) AS avg_gloss_qty, AVG(o.poster_qty) AS avg.poster_qty, SUM(o.total_amt_usd) AS total_usd_spent
FROM orders o
WHERE DATE_TRUNC('month', o.occurred_at) =
(SELECT DATE_TRUNC('month', MIN(o.occurred_at))
FROM orders o);


/*
Result:
avg_standard_qty	       avg_gloss_qty	           avg_poster_qty	            total_usd_spent
268.2222222222222222	   208.9494949494949495	     111.8181818181818182	      377331.00
*/
