/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Advanced JOINs

Advanced JOINs:

Section 8: Self JOIN

Find out which accounts made multiple orders within 30 days.
*/

SELECT o1.id AS o1_id,
       o1.account_id AS o1_account_id,
       o1.occurred_at AS o1_occurred_at,
       o2.id AS o2_id,
       o2.account_id AS o2_account_id,
       o2.occurred_at AS o2_occurred_at
FROM orders o1
LEFT JOIN orders o2
ON o1.account_id = o2.account_id
AND o1.occurred_at < o2.occurred_at
AND o2.occurred_at <= o1.occurred_at + INTERVAL '28 days'
ORDER BY o1.account_id, o1.occurred_at;

/*
Output 6912 results
o1_id	o1_account_id	o1_occurred_at	         o2_id	o2_account_id	   o2_occurred_at
1	    1001	       2015-10-06T17:31:14.000Z
4307	1001	       2015-11-05T03:25:21.000Z	  2	    1001	           2015-11-05T03:34:33.000Z
2	    1001	       2015-11-05T03:34:33.000Z
4308	1001	       2015-12-04T04:01:09.000Z	  3	    1001	           2015-12-04T04:21:55.000Z
3	    1001	       2015-12-04T04:21:55.000Z
4309	1001	       2016-01-02T00:59:09.000Z	  4	    1001	           2016-01-02T01:18:24.000Z
4	    1001	       2016-01-02T01:18:24.000Z
4310	1001	       2016-02-01T19:07:32.000Z	  5	    1001	           2016-02-01T19:27:27.000Z
5	    1001	       2016-02-01T19:27:27.000Z
6	    1001	       2016-03-02T15:29:32.000Z	  4311	1001	           2016-03-02T15:40:29.000Z
*/

/*
In the above query 28 days were used while we need to calculate the orders
within 30 days.

Explanation:
As within 30 days it we should use 29 days. But in SQL timestamps adding
directly 29 days to the timestamp will include the next day after 29 days.
See this behaviour in queries related to time and date. Hemce 28 days are used.
*/
