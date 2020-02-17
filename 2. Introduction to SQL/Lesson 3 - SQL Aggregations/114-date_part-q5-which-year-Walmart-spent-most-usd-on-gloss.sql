/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

In which month of which year did Walmart spend the most on gloss paper in
terms of dollars?
*/



SELECT DATE_PART('year', o.occurred_at) AS year, DATE_PART('month', o.occurred_at) AS month, a.name company, SUM(o.gloss_amt_usd) AS total_gloss_usd
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1, 2, 3
ORDER BY 4
LIMIT 5;


/*
Result:
year	 month	  company	  total_gloss_usd
2016	   5	    Walmart	  9257.64
2016	   1	    Walmart	  5070.73
2015	   11	    Walmart	  4890.97
2016	   4	    Walmart	  4875.99
2015	   12	    Walmart	  4823.56

So, Walmart spent most on gloss paper in usd during May 2016, an amount of
9257.64 usd.

'LIMIT 5' is used, to check whether most spent usd is same for 2 or more months.
*/
