/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Imagine yourself as a Sales Manager at 'Parch and Posey' company. Write a query
to know which channel send the most traffic per day on an average
*/

SELECT channel, AVG(event_count) AS avg_event_count
FROM ( SELECT DATE_TRUNC('day', w.occurred_at) AS Day, w.channel AS channel, COUNT(*) AS event_count
FROM web_events w
GROUP BY 1, 2
ORDER BY 1, 2 ) Sub
GROUP BY 1
ORDER BY 2 DESC;

/*
1. The original query goes in the FROM statement.
2. An * is used in the SELECT statement to pull all of the data from the
original query (if needed to pull all the data inside the sub-query).
3. You MUST use an alias for the table you nest within the outer query.

After formatting the query looks like this:
*/

SELECT
  channel,
  AVG(event_count) AS avg_event_count
FROM (SELECT
        DATE_TRUNC('day', w.occurred_at) AS Day,
        w.channel AS channel,
        COUNT(*) AS event_count
      FROM web_events w
      GROUP BY 1, 2
      ORDER BY 1, 2) Sub
GROUP BY 1
ORDER BY 2 DESC;
