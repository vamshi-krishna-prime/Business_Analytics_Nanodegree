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

/*----------------------*/

SELECT DATE_TRUNC('day', occurred_at) AS date,
	   COUNT(*) AS web_visits
FROM web_events
GROUP BY 1
ORDER BY 1 DESC;
/*
Output 1119 results
date	                       web_visits
2017-01-01T00:00:00.000Z	      31
2016-12-31T00:00:00.000Z	      27
2016-12-30T00:00:00.000Z	      18
*/

/* There are 1119 results in above query but only 1059 results in the main
query, why because, even though there are 1119 diatinct dates in web_events,
there are only 1059 dates with orders in them:

ON DATE_TRUNC('day', o.occurred_at) = DATE_TRUNC('day', w.occurred_at)
 */
/*----------------------*/


/*-------Step by Step analysis-------*/

SELECT DATE_TRUNC('day', o.occurred_at) AS date,
	     COUNT(w.id) AS web_visits,
       COUNT(o.id) AS orders
FROM web_events w
JOIN orders o
ON DATE_TRUNC('day', o.occurred_at) = DATE_TRUNC('day', w.occurred_at)
GROUP BY 1
ORDER BY 1 DESC;
/*
Output 1059 results
date	                     web_visits	 orders
2017-01-01T00:00:00.000Z	   744	     744
2016-12-31T00:00:00.000Z	   702	     702
2016-12-30T00:00:00.000Z	   198	     198
*/
/* This has repetitive sales_reps and order-id's */

/*----------------------*/

SELECT DATE_TRUNC('day', o.occurred_at) AS date,
	   COUNT(DISTINCT w.id) AS web_visits,
       COUNT(DISTINCT o.id) AS orders
FROM web_events w
JOIN orders o
ON DATE_TRUNC('day', o.occurred_at) = DATE_TRUNC('day', w.occurred_at)
GROUP BY 1
ORDER BY 1 DESC;
/*
Output 1059 results
date	                     web_visits	 orders
2017-01-01T00:00:00.000Z	     31	      24
2016-12-31T00:00:00.000Z	     27	      26
*/


/*--------------------------------------------------------------*/

SELECT DATE_TRUNC('day', o.occurred_at) AS date,
	   w.id AS web_id,
       w.account_id AS w_account_id,
       o.account_id AS o_account_id,
       o.id AS order_id,
       w.channel
FROM web_events w
JOIN orders o
ON DATE_TRUNC('day', o.occurred_at) = DATE_TRUNC('day', w.occurred_at)
WHERE DATE_TRUNC('day', o.occurred_at) = '2017-01-01'
ORDER BY 1 DESC, 2, 3;
/*
Output 744 results
date	                   web_id	 w_account_id	 o_account_id	 order_id	 channel
2017-01-01T00:00:00.000Z	398	       1311	         1311	       389	   direct
2017-01-01T00:00:00.000Z	398	       1311	         1321	       403	   direct
2017-01-01T00:00:00.000Z	398	       1311	         1471	       643	   direct
2017-01-01T00:00:00.000Z	398	       1311	         1761	       1092	   direct
2017-01-01T00:00:00.000Z	398	       1311	         1961	       1364	   direct
2017-01-01T00:00:00.000Z	398	       1311	         3031	       2680	   direct
*/


SELECT a.id AS account_id,
		o.id AS order_id
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE a.id = '1311'
/*
Output 13 results
account_id	order_id
1311	       383
1311	       384
1311	       385
1311	       386
*/


SELECT w.id AS web_id,
		a.id AS account_id
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE w.id = '398'
/*
Output 1 results
web_id	account_id
398	      1311
*/


SELECT w.id AS web_id,
       w.account_id,
		   w.occurred_at
FROM web_events w
WHERE DATE_TRUNC('day', w.occurred_at) = '2017-01-01'
/*
Output 31 results
web_id	account_id	 occurred_at
398	      1311	     2017-01-01T05:19:38.000Z
412	      1321	     2017-01-01T09:26:38.000Z
655	      1471	     2017-01-01T06:03:58.000Z
1121	    1761	     2017-01-01T17:12:20.000Z
1399	    1961	     2017-01-01T16:24:35.000Z
2738	    3031	     2017-01-01T08:29:39.000Z
*/


SELECT DATE_TRUNC('day', o.occurred_at) AS date,
       o.account_id AS o_account_id,
       o.id AS order_id
FROM orders o
WHERE DATE_TRUNC('day', o.occurred_at) = '2017-01-01'
ORDER BY 2, 3;
/*
Output 24 results
date	                 o_account_id	order_id
2017-01-01T00:00:00.000Z	1311	      389
2017-01-01T00:00:00.000Z	1311	     4551
2017-01-01T00:00:00.000Z	1321	      403
2017-01-01T00:00:00.000Z	1321	     4558
*/


SELECT DATE_TRUNC('day', o.occurred_at) AS date,
	   w.id AS web_id,
       w.account_id AS w_account_id,
       o.account_id AS o_account_id,
       o.id AS order_id,
       w.channel
FROM web_events w
JOIN orders o
ON DATE_TRUNC('day', o.occurred_at) = DATE_TRUNC('day', w.occurred_at)
WHERE DATE_TRUNC('day', o.occurred_at) = '2017-01-01' AND w.id = '398' AND w.account_id = '1311'
ORDER BY 1 DESC, 2, 3;
/*
Output 24 results
date	                   web_id	 w_account_id	o_account_id	order_id	channel
2017-01-01T00:00:00.000Z	398	     1311	         1311	         389	  direct
2017-01-01T00:00:00.000Z	398	     1311	         1321	         403	  direct
2017-01-01T00:00:00.000Z	398	     1311	         1471	         643	  direct
2017-01-01T00:00:00.000Z	398	     1311	         1761	        1092	  direct
*/


SELECT DATE_TRUNC('day', o.occurred_at) AS date,
       o.account_id AS o_account_id,
       o.id AS order_id,
       a.sales_rep_id AS sales_rep
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE DATE_TRUNC('day', o.occurred_at) = '2017-01-01'
ORDER BY 2, 3;
/*
Output 24 results
date              	 o_account_id	 order_id	 sales_rep
2017-01-01T00:00:00.000Z	1311	     389	   321600
2017-01-01T00:00:00.000Z	1311	    4551	   321600
2017-01-01T00:00:00.000Z	1321	     403	   321610
2017-01-01T00:00:00.000Z	1321 	    4558	   321610

With 13  distinct sales_rep_id 's.
*/
