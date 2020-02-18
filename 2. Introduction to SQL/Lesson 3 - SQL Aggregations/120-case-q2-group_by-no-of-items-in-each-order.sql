/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Write a query to display the number of orders in each of three categories,
based on the total number of items in each order. The three categories are:
'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.
*/


SELECT CASE WHEN total >= 2000 THEN 'At least 2000'
            WHEN total >= 1000 AND total < 2000 THEN 'Between 1000 and 2000'
            ELSE 'Less than 1000' END AS order_category,
       COUNT(*) AS order_count
FROM orders
GROUP BY 1;

/*
Result:
order_category	               order_count
Between 1000 and 2000	            511
Atleast 2000	                     70
Less than 1000	                 6331
*/
