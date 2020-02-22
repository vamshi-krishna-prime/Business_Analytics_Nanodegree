/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Order count of standard_qty, 'PARTITION BY' account_id and
'ORDER BY' monthly occurred_at
*/

SELECT account_id,
       DATE_TRUNC('month', occurred_at),
       standard_qty,
       COUNT(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS order_count
FROM orders;

/*
Output 6912 results
account_id	date_trunc	standard_qty	order_count
1001	2015-10-01T00:00:00.000Z	123	1
1001	2015-11-01T00:00:00.000Z	506	3
1001	2015-11-01T00:00:00.000Z	190	3
1001	2015-12-01T00:00:00.000Z	85	5
1001	2015-12-01T00:00:00.000Z	526	5
1001	2016-01-01T00:00:00.000Z	566	7
1001	2016-01-01T00:00:00.000Z	144	7
1001	2016-02-01T00:00:00.000Z	473	9
1001	2016-02-01T00:00:00.000Z	108	9
1001	2016-03-01T00:00:00.000Z	103	11
1001	2016-03-01T00:00:00.000Z	498	11
1001	2016-04-01T00:00:00.000Z	497	13
1001	2016-04-01T00:00:00.000Z	101	13
1001	2016-05-01T00:00:00.000Z	483	17
1001	2016-05-01T00:00:00.000Z	95	17
1001	2016-05-01T00:00:00.000Z	91	17
1001	2016-05-01T00:00:00.000Z	531	17
1001	2016-06-01T00:00:00.000Z	94	18
1001	2016-07-01T00:00:00.000Z	101	20
1001	2016-07-01T00:00:00.000Z	457	20
1001	2016-08-01T00:00:00.000Z	557	22
1001	2016-08-01T00:00:00.000Z	124	22
1001	2016-09-01T00:00:00.000Z	104	24
1001	2016-09-01T00:00:00.000Z	507	24
1001	2016-10-01T00:00:00.000Z	97	25
1001	2016-11-01T00:00:00.000Z	485	27
1001	2016-11-01T00:00:00.000Z	127	27
1001	2016-12-01T00:00:00.000Z	123	28
1011	2016-12-01T00:00:00.000Z	527	1
1021	2015-10-01T00:00:00.000Z	0	2
1021	2015-10-01T00:00:00.000Z	516	2
1021	2015-11-01T00:00:00.000Z	0	4
1021	2015-11-01T00:00:00.000Z	497	4
1021	2015-12-01T00:00:00.000Z	483	5
1021	2016-01-01T00:00:00.000Z	0	7
1021	2016-01-01T00:00:00.000Z	535	7
*/

/*
1. As rows are partitioned by account_id, order_count resets for every
account_id

2. As rows are ordered by monthly occurred_at, order_count increments for every
every month related to the same account_id.
*/


/*
In order to differentiate the 'GROUP BY' function from 'window function'
run the folllowing query and compare the results from above query
*/

SELECT account_id,
       DATE_TRUNC('month', occurred_at),
       COUNT(*) AS order_count
FROM orders
GROUP BY 1, 2
ORDER BY 1, 2;

/*
Output 4207 results
account_id	date_trunc	order_count
1001	2015-10-01T00:00:00.000Z	1
1001	2015-11-01T00:00:00.000Z	2
1001	2015-12-01T00:00:00.000Z	2
1001	2016-01-01T00:00:00.000Z	2
1001	2016-02-01T00:00:00.000Z	2
1001	2016-03-01T00:00:00.000Z	2
1001	2016-04-01T00:00:00.000Z	2
1001	2016-05-01T00:00:00.000Z	4
1001	2016-06-01T00:00:00.000Z	1
1001	2016-07-01T00:00:00.000Z	2
1001	2016-08-01T00:00:00.000Z	2
1001	2016-09-01T00:00:00.000Z	2
1001	2016-10-01T00:00:00.000Z	1
1001	2016-11-01T00:00:00.000Z	2
1001	2016-12-01T00:00:00.000Z	1
1011	2016-12-01T00:00:00.000Z	1
1021	2015-10-01T00:00:00.000Z	2
1021	2015-11-01T00:00:00.000Z	2
1021	2015-12-01T00:00:00.000Z	1
1021	2016-01-01T00:00:00.000Z	2
*/


/*
1. The most important difference is the number of rows returned by the query.
Since the rows are grouped together by month, some rows are combined together
to form the cummulative monthly count. In first query, the rows are not
aggregated and all of them are returned.

2. The second insight is, the count is aggregated to each month only and
is not incremented monthly for a given avvount_id.
*/

/*
For for furthur understanding run the following query:
*/

SELECT account_id,
       COUNT(*) AS order_count
FROM orders
GROUP by 1
ORDER BY 1;

/*
Output350 results
account_id	order_count
1001	28
1011	1
1021	10
1031	1
1041	5
1051	9
1061	6
*/

/*
In the above query, we can count the number of orders made by each account_id,
but by using the first query (window functions) we can observe the order count
patterns and how they are incremented over time for every given account_id.
*/
