/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Advanced JOINs

Advanced JOINs:

Section 5: JOINs with Comparison Operators

*/

SELECT o.account_id,
  	   o.occurred_at AS orders_date,
       w.occurred_at AS web_event_date,
       w.channel,
       a.name,
       a.website
FROM orders o
LEFT JOIN accounts a
ON o.account_id = a.id
LEFT JOIN web_events w
ON a.id = w.account_id
WHERE DATE_TRUNC('month', o.occurred_at) = (SELECT DATE_TRUNC('month', MIN(o.occurred_at))
                                            FROM orders o) AND o.account_id = 1181
ORDER BY o.account_id, o.occurred_at
LIMIT 1000;
/* 82 results*/

/*---------------------------------------*/

SELECT o.account_id,
	     o.occurred_at AS orders_date,
       w.occurred_at AS web_event_date,
       w.channel,
       a.name,
       a.website
FROM orders o
LEFT JOIN accounts a
ON o.account_id = a.id
LEFT JOIN web_events w
ON a.id = w.account_id AND w.occurred_at < o.occurred_at
WHERE DATE_TRUNC('month', o.occurred_at) = (SELECT DATE_TRUNC('month', MIN(o.occurred_at))
                                            FROM orders o)
ORDER BY o.account_id, o.occurred_at
LIMIT 1000;
/* 80 results*/

/*---------------------------------------*/

SELECT o.account_id,
	     o.occurred_at AS orders_date,
       w.occurred_at AS web_event_date,
       w.channel,
       a.name,
       a.website
FROM orders o
LEFT JOIN accounts a
ON o.account_id = a.id
LEFT JOIN web_events w
ON a.id = w.account_id AND w.occurred_at > o.occurred_at
WHERE DATE_TRUNC('month', o.occurred_at) = (SELECT DATE_TRUNC('month', MIN(o.occurred_at))
                                            FROM orders o) AND o.account_id = 1181
ORDER BY o.account_id, o.occurred_at
LIMIT 1000;
/* 2 results*/

/*---------------------------------------*/
/*---------------------------------------*/

SELECT o.account_id,
  	   o.occurred_at AS orders_date,
       w.occurred_at AS web_event_date,
       w.channel,
       a.name,
       a.website
FROM orders o
LEFT JOIN accounts a
ON o.account_id = a.id
LEFT JOIN web_events w
ON a.id = w.account_id AND w.occurred_at = o.occurred_at
WHERE DATE_TRUNC('month', o.occurred_at) = (SELECT DATE_TRUNC('month', MIN(o.occurred_at))
                                            FROM orders o) AND o.account_id = 1181
ORDER BY o.account_id, o.occurred_at
LIMIT 1000;
/* 1 result with NULLs */

/*---------------------------------------*/
/*---------------------------------------*/



SELECT o.account_id,
	     o.occurred_at AS orders_date,
       w.occurred_at AS web_event_date,
       w.channel,
       a.name,
       a.website
FROM orders o
LEFT JOIN accounts a
ON o.account_id = a.id
LEFT JOIN web_events w
ON a.id = w.account_id AND w.occurred_at < o.occurred_at
ORDER BY o.account_id, o.occurred_at
LIMIT 1000;

/*---------------------------------------*/

SELECT o.account_id,
	     o.occurred_at AS orders_date,
       w.occurred_at AS web_event_date,
       w.channel,
       a.name,
       a.website
FROM orders o
LEFT JOIN accounts a
ON o.account_id = a.id
LEFT JOIN web_events w
ON a.id = w.account_id
WHERE w.occurred_at < o.occurred_at
ORDER BY o.account_id, o.occurred_at
LIMIT 1000;

/* WHat is the difference between above two queries? */
/*
Expert Tip
If you recall from earlier lessons on joins, the join clause is evaluated
before the where clause -- filtering in the join clause will eliminate rows
before they are joined, while filtering in the WHERE clause will leave those
rows in and produce some nulls.
*/

/* Need explanation on how NULLs are formed along with example*/
