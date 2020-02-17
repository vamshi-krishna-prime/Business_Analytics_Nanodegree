/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Display the over all quntity of standard paper on a time basis.
*/



SELECT o.occurred_at time_stamp, SUM(o.standard_qty) standard_qty_sum
FROM orders o
GROUP BY o.occurred_at
ORDER BY o.occurred_at;

/*
Not very useful query as 6912 rows are downed to 6908 as almost all the dates
are unique.
*/
