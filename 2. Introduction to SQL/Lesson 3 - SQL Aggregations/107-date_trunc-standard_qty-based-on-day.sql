/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Display the over all quntity of standard paper on a day basis.
*/



SELECT DATE_TRUNC('day', o.occurred_at) day, SUM(o.standard_qty) standard_qty_sum
FROM orders o
GROUP BY DATE_TRUNC('day', o.occurred_at)
ORDER BY DATE_TRUNC('day', o.occurred_at);

/*
all the date-time stamps related to the same day are grouped together. now the
results are down to 1060 rows
*/
