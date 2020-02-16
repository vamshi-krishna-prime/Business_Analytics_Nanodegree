/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

When did the most recent (latest) web_event occur?

Try to perform the result of the previous query without using an
aggregation function.
*/


SELECT w.occurred_at most_recent_web_event
FROM web_events w
ORDER BY w.occurred_at DESC
LIMIT 1;
