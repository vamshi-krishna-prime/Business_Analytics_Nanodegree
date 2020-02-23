/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:


Section 21: Percentiles with Partitions

You can use partitions with percentiles to determine the percentile of a
specific subset of all rows. Imagine you're an analyst at Parch & Posey and
you want to determine the largest orders (in terms of quantity) a specific
customer has made to encourage them to order more similarly sized large orders.
You only want to consider the NTILE for that customer's account_id.

Quiz: Question 2:

Use the NTILE functionality to divide the accounts into two levels in terms of
the amount of gloss_qty for their orders. Your resulting table should have the
account_id, the occurred_at time for each order, the total amount of gloss_qty
paper purchased, and one of two levels in a gloss_half column.
*/

SELECT account_id,
       occurred_at,
       gloss_qty,
       NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty) AS gloss_half
FROM orders
ORDER BY 1, 3 DESC;


/*
Output6912 results
account_id	occurred_at	gloss_qty	gloss_half
1001	2016-01-02T00:59:09.000Z	645	2
1001	2016-04-01T11:15:27.000Z	618	2
1001	2016-09-26T23:22:47.000Z	614	2
1001	2015-11-05T03:25:21.000Z	612	2
1001	2016-03-02T15:40:29.000Z	605	2
1001	2016-05-31T21:09:48.000Z	603	2
1001	2015-12-04T04:01:09.000Z	597	2
1001	2016-02-01T19:07:32.000Z	595	2
1001	2016-08-28T06:50:58.000Z	572	2
1001	2016-05-01T15:40:04.000Z	570	2
1001	2016-11-25T23:19:37.000Z	543	2
1001	2016-07-30T03:21:57.000Z	532	2
1001	2016-10-26T20:31:30.000Z	143	2
1001	2016-12-24T05:53:13.000Z	127	2
1001	2015-12-04T04:21:55.000Z	47	1
1001	2016-05-01T15:55:51.000Z	47	1
1001	2016-06-30T12:32:05.000Z	46	1
1001	2015-11-05T03:34:33.000Z	41	1
1001	2016-11-25T23:21:32.000Z	39	1
1001	2016-07-30T03:26:30.000Z	36	1
1001	2016-08-28T07:13:39.000Z	33	1
1001	2016-04-01T11:20:18.000Z	33	1
1001	2016-01-02T01:18:24.000Z	32	1
1001	2016-02-01T19:27:27.000Z	29	1
1001	2016-03-02T15:29:32.000Z	24	1
1001	2015-10-06T17:31:14.000Z	22	1
1001	2016-05-31T21:22:48.000Z	16	1
1001	2016-09-26T23:28:25.000Z	10	1
1011	2016-12-21T10:59:34.000Z	14	1 ----> Important Insight
1021	2015-10-12T02:31:30.000Z	270	2
1021	2015-11-11T07:37:01.000Z	61	2
*/

/*
Remember that in the previous queries related to percentiles, we have discussed
that if the number of rows is less than partitions, then the partition stops at
the available number of the row. It can be observed in the above query result
marked (Important Insight). The account with id 1011 has only 1 order which is
less than the partitions, so it will only stop at 1. But in order to recognize
the biggest order, the gloss_half value must be number 2.

Hence a better approach must be used to avoid this.
Also the solution provided does not address this issue.
*/


/*----------Given Solution------------*/

SELECT
       account_id,
       occurred_at,
       gloss_qty,
       NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty) AS gloss_half
  FROM orders
 ORDER BY account_id DESC



/*---------Solution that address the issue--------*/

 SELECT account_id,
        occurred_at,
        gloss_qty,
        CASE WHEN account_count > 2
             THEN NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty)
             ELSE 2
             END AS gloss_half
   FROM (
         SELECT account_id,
                occurred_at,
                gloss_qty,
                COUNT(account_id) OVER (PARTITION BY account_id ORDER BY occurred_at) AS account_count
         FROM orders
       ) sub
  ORDER BY account_id, gloss_qty DESC;

/*
Output 6912 results
account_id	occurred_at	  gloss_qty gloss_half
1001	2016-01-02T00:59:09.000Z	645	2
1001	2016-04-01T11:15:27.000Z	618	2
1001	2016-09-26T23:22:47.000Z	614	2
1001	2015-11-05T03:25:21.000Z	612	2
1001	2016-03-02T15:40:29.000Z	605	2
1001	2016-05-31T21:09:48.000Z	603	2
1001	2015-12-04T04:01:09.000Z	597	2
1001	2016-02-01T19:07:32.000Z	595	2
1001	2016-08-28T06:50:58.000Z	572	2
1001	2016-05-01T15:40:04.000Z	570	2
1001	2016-11-25T23:19:37.000Z	543	2
1001	2016-07-30T03:21:57.000Z	532	2
1001	2016-10-26T20:31:30.000Z	143	2
1001	2016-12-24T05:53:13.000Z	127	2
1001	2016-05-01T15:55:51.000Z	47	1
1001	2015-12-04T04:21:55.000Z	47	1
1001	2016-06-30T12:32:05.000Z	46	1
1001	2015-11-05T03:34:33.000Z	41	1
1001	2016-11-25T23:21:32.000Z	39	1
1001	2016-07-30T03:26:30.000Z	36	1
1001	2016-08-28T07:13:39.000Z	33	1
1001	2016-04-01T11:20:18.000Z	33	1
1001	2016-01-02T01:18:24.000Z	32	1
1001	2016-02-01T19:27:27.000Z	29	1
1001	2016-03-02T15:29:32.000Z	24	1
1001	2015-10-06T17:31:14.000Z	22	2 ----> new issue
1001	2016-05-31T21:22:48.000Z	16	1
1001	2016-09-26T23:28:25.000Z	10	1
1011	2016-12-21T10:59:34.000Z	14	2 ----> issue resolved
1021	2015-10-12T02:31:30.000Z	270	2
1021	2015-11-11T07:37:01.000Z	61	2
1021	2016-02-09T00:57:54.000Z	38	2
*/

/* New issue is given rised because when you run the inner query, the gloss_qty
are partitioned by the account_id but also ordered by occurred_at. See the below
 for the inner query result:

Inner Query Result:

Output 6912 results
account_id	 occurred_at	              gloss_qty	  account_count
1001	       2015-10-06T17:31:14.000Z	      22	          1
1001	       2015-11-05T03:25:21.000Z	     612	          2
1001	       2015-11-05T03:34:33.000Z	      41	          3
1001	       2015-12-04T04:01:09.000Z	     597	          4
*/

/*
Hence when main query is run then in CASE clause, the account_id with
gloss_qty: 22, has account_count: 1 and hence will be skipped to ELSE clause
and gloss_half value of 2 is returned.

In order to aviod this, remove the ORDER BY clause in the window function
related to account_count inside inner query.
*/

/*----------------------Solution that addresses all issues--------------------*/

SELECT account_id,
       occurred_at,
       gloss_qty,
       CASE WHEN account_count > 2
            THEN NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty)
            ELSE 2
            END AS gloss_half
  FROM (
        SELECT account_id,
               occurred_at,
               gloss_qty,
               COUNT(account_id) OVER (PARTITION BY account_id) AS account_count
        FROM orders
      ) sub
 ORDER BY account_id, gloss_qty DESC;

/*
Output6912 results
account_id	occurred_at	gloss_qty	gloss_half
1001	2016-01-02T00:59:09.000Z	645	2
1001	2016-04-01T11:15:27.000Z	618	2
1001	2016-09-26T23:22:47.000Z	614	2
1001	2015-11-05T03:25:21.000Z	612	2
1001	2016-03-02T15:40:29.000Z	605	2
1001	2016-05-31T21:09:48.000Z	603	2
1001	2015-12-04T04:01:09.000Z	597	2
1001	2016-02-01T19:07:32.000Z	595	2
1001	2016-08-28T06:50:58.000Z	572	2
1001	2016-05-01T15:40:04.000Z	570	2
1001	2016-11-25T23:19:37.000Z	543	2
1001	2016-07-30T03:21:57.000Z	532	2
1001	2016-10-26T20:31:30.000Z	143	2
1001	2016-12-24T05:53:13.000Z	127	2
1001	2015-12-04T04:21:55.000Z	47	1
1001	2016-05-01T15:55:51.000Z	47	1
1001	2016-06-30T12:32:05.000Z	46	1
1001	2015-11-05T03:34:33.000Z	41	1
1001	2016-11-25T23:21:32.000Z	39	1
1001	2016-07-30T03:26:30.000Z	36	1
1001	2016-08-28T07:13:39.000Z	33	1
1001	2016-04-01T11:20:18.000Z	33	1
1001	2016-01-02T01:18:24.000Z	32	1
1001	2016-02-01T19:27:27.000Z	29	1
1001	2016-03-02T15:29:32.000Z	24	1
1001	2015-10-06T17:31:14.000Z	22	1 ----> new issue resolved
1001	2016-05-31T21:22:48.000Z	16	1
1001	2016-09-26T23:28:25.000Z	10	1
1011	2016-12-21T10:59:34.000Z	14	2 ----> issue resolved
1021	2015-10-12T02:31:30.000Z	270	2
1021	2015-11-11T07:37:01.000Z	61	2
1021	2016-02-09T00:57:54.000Z	38	2
*/
