/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Who was the primary contact associated with the earliest web_event?
*/



SELECT a.primary_poc primary_poc, w.occurred_at occurred_at
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
ORDER BY w.occurred_at
LIMIT 1;
