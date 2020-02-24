/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Performance Tuning

Advanced JOINs:

Section 18: JOINing Sub-Queries
*/

/*-----------This is a very important query and a deep one at it--------------*/

SELECT DATE_TRUNC('day', o.occurred_at) AS date,
       COUNT(DISTINCT a.sales_rep_id) AS active_sales_reps,
       COUNT(DISTINCT o.id) AS orders,
       COUNT(DISTINCT w.id) AS web_visits
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN web_events w
ON DATE_TRUNC('day', o.occurred_at) = DATE_TRUNC('day', w.occurred_at)
GROUP BY 1
ORDER BY 1 DESC;

/*
Output 1059 results
date	               active_sales_reps	orders	web_visits
2017-01-01T00:00:00.000Z	   13	         24	        31
2016-12-31T00:00:00.000Z	   15	         26	        27
2016-12-30T00:00:00.000Z	    7	         11	        18
2016-12-29T00:00:00.000Z	    7	         11	        19
2016-12-28T00:00:00.000Z	   12	         22	        31
2016-12-27T00:00:00.000Z	    7	         10	        15
2016-12-26T00:00:00.000Z	   12	         22	        20

QUERY PLAN - FINAL STEP:
GroupAggregate (cost=1440.03..11786.29 rows=6908 width=32)
*/


/* Lets look at the data explosion caused ny this query before aggregation: */
SELECT o.occurred_at AS date,
       a.sales_rep_id,
       o.id AS order_id,
       w.id AS web_event_id
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN web_events w
ON DATE_TRUNC('day', o.occurred_at) = DATE_TRUNC('day', w.occurred_at)
ORDER BY 1 DESC;
/* OUTPUT has 79083 rows */
/* This is what happens behind the scenes before performing the aggregations.
This cause a lot of delay */


/*-------------Using Subqueries for performance Tuning---------------*/

SELECT COALESCE(orders.date, web_events.date) AS date,
       orders.active_sales_reps,
       orders.orders,
       web_events.web_visits

FROM (
  SELECT DATE_TRUNC('day', o.occurred_at) AS date,
         COUNT(a.sales_rep_id) AS active_sales_reps,
         COUNT(o.id) AS orders
  FROM orders o
  JOIN accounts a
  ON a.id =o.account_id
  GROUP BY 1) orders

FULL OUTER JOIN (
  SELECT DATE_TRUNC('day', w.occurred_at) AS date,
         COUNT(w.id) AS web_visits
  FROM web_events w
  GROUP BY 1
) web_events

ON orders.date = web_events.date
ORDER BY 1 DESC;

/*
Output 1120 results

date	                     active_sales_reps	orders	web_visits
2017-01-02T00:00:00.000Z	       1	            1
2017-01-01T00:00:00.000Z	      24	           24	        31
2016-12-31T00:00:00.000Z	      26	           26	        27
2016-12-30T00:00:00.000Z	      11	           11	        18
*/
/*
There are extra rows compared to first main query because, this query managed
to obtain rows with NULL values in any one of the aggregation columns (counts).
See the first row for detailed understanding. Hence this query is not only
tuned for performance but also more accurate than previous query.

We used COALESCE in the above query because if there are dates in web_events
that are not present in orders.date, then the NULL values will be filled With
web_evnts.date values.
*/
/*
QUERY PLAN
Sort (cost=42803.07..43586.53 rows=313381 width=32)
*/


/*------------------------DOUBT---------------------*/

/* In the first query sales_reps were counted using DISTINCT values but in
performance tuned query, sales_reps were not calculated based on DISTINCT
values. This is reflected in their respective results - counts of
active_sales_rep.

The query should contain DISTINCT clause in first sub_query.
*/


WITH orders AS (
  SELECT DATE_TRUNC('day', o.occurred_at) AS date,
         COUNT(DISTINCT a.sales_rep_id) AS active_sales_reps,
         COUNT(o.id) AS orders
  FROM orders o
  JOIN accounts a
  ON a.id =o.account_id
  GROUP BY 1),

web_events AS (
  SELECT DATE_TRUNC('day', w.occurred_at) AS date,
        COUNT(w.id) AS web_visits
  FROM web_events w
  GROUP BY 1)


SELECT COALESCE(orders.date, web_events.date) AS date,
       orders.active_sales_reps,
       orders.orders,
       web_events.web_visits
FROM orders
FULL OUTER JOIN web_events
ON orders.date = web_events.date
ORDER BY 1 DESC;

/*
Output 1120 results
date	                     active_sales_reps	orders	web_visits
2017-01-02T00:00:00.000Z	       1	            1
2017-01-01T00:00:00.000Z	      13	           24	        31
2016-12-31T00:00:00.000Z	      15	           26	        27
2016-12-30T00:00:00.000Z	       7	           11	        18
*/
