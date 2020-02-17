/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the sales in terms of total dollars for all orders in each year, ordered
from greatest to least. Do you notice any trends in the yearly sales totals?
*/



SELECT DATE_PART('year', o.occurred_at) year, SUM(o.total_amt_usd) total_spent
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;

/*
Result:

year	total_sales_usd
2016	12864917.92
2015	5752004.94
2014	4069106.54
2013	377331.00
2017	78151.43
*/


/*
When we look at the yearly totals, you might notice that 2013 and 2017 have
much smaller totals than all other years. If we look further at the monthly
data, we see that for 2013 and 2017 there is only one month of sales for each
of these years (12 for 2013 and 1 for 2017). Therefore, neither of these are
evenly represented. Sales have been increasing year over year, with 2016 being
the largest sales to date. At this rate, we might expect 2017 to have the
largest sales.

individual usd spent in each month in a desired year can be listed using the
below query:
*/


SELECT DATE_PART('year', o.occurrred_at) AS year, DATE_PART('month', o.occurred_at) AS month, SUM(o.total_amt_usd) AS total_usd_spent
FROM orders o
GROUP BY 1,2
HAVING DATE_PART('year', o.occurred_at) = '2017'
ORDER BY 2;

/*
must type DATE_PART('year', o.occurred_at) completely while using inside
'HAVING' clause
change year value in HAVING DATE_PART('year', o.occurred_at) = '2017', for
usd spent month wise in desired year
*/
