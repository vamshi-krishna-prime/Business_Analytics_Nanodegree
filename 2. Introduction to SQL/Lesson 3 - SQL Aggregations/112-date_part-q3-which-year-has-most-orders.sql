/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which year did Parch & Posey have the greatest sales in terms of total number
of orders? Are all years evenly represented by the dataset?
*/



SELECT DATE_PART('year', o.occurred_at) AS year, COUNT(*) total_orders
FROM orders 0
WHERE o.occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;


/*
Result:
year	total_orders
2016	3757
2015	1725
2014	1306

So, 2016 has most orders of 3757

Note: It is upto to you to include 2013 and 2017 in the query since they are
not evenly distributed
*/

/*
Reason why 'LIMIT 1' is not used in the above query is because, sometimes
more than one year has same number of orders, which cannot be observed if LIMIT
function is used to display only one result.
*/
