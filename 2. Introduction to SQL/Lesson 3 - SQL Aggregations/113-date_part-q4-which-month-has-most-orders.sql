/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which month did Parch & Posey have the greatest sales in terms of total number
of orders? Are all months evenly represented by the dataset?
*/



SELECT DATE_PART('month', o.occurred_at) AS month, COUNT(*) AS total_orders
FROM orders o
WHERE o.occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 1;


/*
Result:
month	total_orders
12	     783
11	     713
10	     675
8	       603
9	       602
7	       571
6	       527
5	       518
3	       482
4	       472
1	       433
2	       409
*/


/*
December still has the most sales, but interestingly, November has the second
most sales (but not the most dollar sales - refer 111). To make a fair comparison from one
month to another 2017 and 2013 data were removed.
*/
