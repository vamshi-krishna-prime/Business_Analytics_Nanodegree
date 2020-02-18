/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

On which day-channel pair did the most events occur.
*/

SELECT DATE_TRUNC('day', w.occurred_at) AS Day, w.channel AS Channel, COUNT(*) AS event_count
FROM web_events w
GROUP BY 1, 2
ORDER BY 3 DESC, 1, 2;

/*
Solution has a date equivalent to:
December 21, 2016; direct
January 1, 2017; direct
*/
