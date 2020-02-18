/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Count the rows with total paper quantities with more than 500 and less than 500
*/

SELECT CASE WHEN total > 500 THEN 'over 500'
            ELSE '500 or under' END AS total_group,
       COUNT(*) AS order_count
FROM orders
GROUP BY 1;

/*
Result:
total_group     order_count
over 500          3196
500 or under      3716
*/
