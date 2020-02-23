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

Quiz: Question 3:

Use the NTILE functionality to divide the orders for each account into
100 levels in terms of the amount of total_amt_usd for their orders. Your
resulting table should have the account_id, the occurred_at time for
each order, the total amount of total_amt_usd paper purchased, and one of
100 levels in a total_percentile column.
*/

SELECT account_id,
       occurred_at,
       total_amt_usd,
       NTILE(100) OVER (ORDER BY total_amt_usd) AS total_percentile
FROM orders
ORDER BY account_id, total_amt_usd DESC;

/*
Output 6912 results
account_id	occurred_at	total_amt_usd	total_percentile
1001	2015-12-04T04:01:09.000Z	9426.71	28
1001	2016-01-02T00:59:09.000Z	9230.67	27
1001	2016-08-28T06:50:58.000Z	9134.31	26
1001	2016-09-26T23:22:47.000Z	8963.91	25
1001	2016-05-31T21:09:48.000Z	8863.24	24
1001	2015-11-05T03:25:21.000Z	8757.18	23
1001	2016-03-02T15:40:29.000Z	8672.95	22
1001	2016-02-01T19:07:32.000Z	8538.26	21
1001	2016-04-01T11:15:27.000Z	8343.09	20
1001	2016-05-01T15:40:04.000Z	8311.59	19
1001	2016-07-30T03:21:57.000Z	8286.99	18
1001	2016-11-25T23:19:37.000Z	7924.46	17
1001	2016-05-01T15:55:51.000Z	2052.20	16
1001	2016-10-26T20:31:30.000Z	1993.58	15
1001	2016-12-24T05:53:13.000Z	1719.28	14
1001	2015-11-05T03:34:33.000Z	1718.03	13
1001	2016-04-01T11:20:18.000Z	1498.20	12
1001	2016-11-25T23:21:32.000Z	1283.12	11
1001	2016-08-28T07:13:39.000Z	1182.61	10
1001	2016-03-02T15:29:32.000Z	1067.25	9
1001	2016-02-01T19:27:27.000Z	983.49	8
1001	2015-10-06T17:31:14.000Z	973.43	7
1001	2016-01-02T01:18:24.000Z	958.24	6
1001	2016-09-26T23:28:25.000Z	951.14	5
1001	2016-06-30T12:32:05.000Z	878.56	4
1001	2015-12-04T04:21:55.000Z	776.18	3
1001	2016-07-30T03:26:30.000Z	773.63	2
1001	2016-05-31T21:22:48.000Z	752.57	1
1011	2016-12-21T10:59:34.000Z	2734.59	1
1021	2016-01-10T09:29:45.000Z	2945.73	10
1021	2016-03-10T00:38:52.000Z	2944.24	9
1021	2015-11-11T07:37:01.000Z	2936.92	8
*/

/*
Note:
Here the count of each individual account_id's is less than 100. Hence the
maximum percentile value for each account is limited to its respective
account_id count.

If the number of items to be partitioned are less than the partition number
then is it a correct approach?
*/

/*-----------------Given Solution-----------------*/

SELECT
       account_id,
       occurred_at,
       total_amt_usd,
       NTILE(100) OVER (PARTITION BY account_id ORDER BY total_amt_usd) AS total_percentile
  FROM orders
 ORDER BY account_id DESC

/* The solution also does not explain the addressed issue or doubt */
