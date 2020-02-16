/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the number of sales reps in each region. Your final table should have two
columns - the region and the number of sales_reps. Order from fewest reps to
most reps.
*/



SELECT r.name region, COUNT(s.name) sales_reps_count
FROM sales_reps s
JOIN region r
on r.id = s.region_id
GROUP BY r.name
ORDER BY sales_reps_count;
