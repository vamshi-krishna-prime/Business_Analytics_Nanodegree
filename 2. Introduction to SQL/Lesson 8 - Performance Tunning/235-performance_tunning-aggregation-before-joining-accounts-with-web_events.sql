/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Performance Tuning

Advanced JOINs:

Section 16: Performance Tunning
*/

SELECT a.name,
       COUNT(*) AS web_events
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC;

/*
Result has 351 rows

If you look deeper, there are 9073 rows in the web_events. That means 9073 rows
need to be evaluated for the matches in the other table.

But if the web_events table was pre-aggregrated, you could reduce the number of
rows that need to be evaluated during the JOIN.
*/

WITH web_events_count AS (
  SELECT account_id,
         COUNT(*) AS web_events
  FROM web_events w
  GROUP BY 1
)

SELECT a.id,
       w.web_events
FROM accounts a
JOIN web_events_count w
ON a.id = w.account_id
ORDER BY 2 DESC;

/*
Output 351 results
id	  web_events
3051	101
3911	96
2351	94
2731	93
2871	91
1411	90
4211	89
*/

/* Output has same 351 results, but faster result compared to previous query.
You can dive deep on time cost in the next query */
