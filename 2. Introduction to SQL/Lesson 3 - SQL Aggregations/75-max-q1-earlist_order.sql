/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

When was the earliest order (oldest) ever placed? You only need to return
the date.
*/


SELECT MIN(o.occurred_at) earliest_order
FROM orders o;
