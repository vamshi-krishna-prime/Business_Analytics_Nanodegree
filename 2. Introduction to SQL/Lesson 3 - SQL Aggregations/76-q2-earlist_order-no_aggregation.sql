/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

When was the earliest order (oldest) ever placed? You only need to return
the date.

Try performing the same query as in question 1 without using an
aggregation function.
*/


SELECT o.occurred_at earliest_order
FROM orders o
ORDER BY o.occurred_at
LIMIT 1;
