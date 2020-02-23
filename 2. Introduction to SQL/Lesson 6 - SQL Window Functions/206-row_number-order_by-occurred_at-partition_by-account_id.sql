/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Section 7: ROW_NUMBER()


Question:
create a ROW_NUMBER() ordered by occurred_at and partitioned by account_id.
*/

SELECT account_id,
       occurred_at,
       ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY occurred_at) AS row_number
FROM orders;

/*
Output 6912 results

account_id	occurred_at	row_number
1001	2015-10-06T17:31:14.000Z	1
1001	2015-11-05T03:25:21.000Z	2
1001	2015-11-05T03:34:33.000Z	3
1001	2015-12-04T04:01:09.000Z	4
1001	2015-12-04T04:21:55.000Z	5
1001	2016-01-02T00:59:09.000Z	6
1001	2016-01-02T01:18:24.000Z	7
1001	2016-02-01T19:07:32.000Z	8
1001	2016-02-01T19:27:27.000Z	9
1001	2016-03-02T15:29:32.000Z	10
1001	2016-03-02T15:40:29.000Z	11
1001	2016-04-01T11:15:27.000Z	12
1001	2016-04-01T11:20:18.000Z	13
1001	2016-05-01T15:40:04.000Z	14
1001	2016-05-01T15:55:51.000Z	15
1001	2016-05-31T21:09:48.000Z	16
1001	2016-05-31T21:22:48.000Z	17
1001	2016-06-30T12:32:05.000Z	18
1001	2016-07-30T03:21:57.000Z	19
1001	2016-07-30T03:26:30.000Z	20
1001	2016-08-28T06:50:58.000Z	21
1001	2016-08-28T07:13:39.000Z	22
1001	2016-09-26T23:22:47.000Z	23
1001	2016-09-26T23:28:25.000Z	24
1001	2016-10-26T20:31:30.000Z	25
1001	2016-11-25T23:19:37.000Z	26
1001	2016-11-25T23:21:32.000Z	27
1001	2016-12-24T05:53:13.000Z	28
1011	2016-12-21T10:59:34.000Z	1
1021	2015-10-12T02:21:56.000Z	1
1021	2015-10-12T02:31:30.000Z	2
1021	2015-11-11T07:24:19.000Z	3
1021	2015-11-11T07:37:01.000Z	4
1021	2015-12-11T16:53:18.000Z	5
1021	2016-01-10T09:12:52.000Z	6
1021	2016-01-10T09:29:45.000Z	7
1021	2016-02-09T00:50:46.000Z	8
1021	2016-02-09T00:57:54.000Z	9
1021	2016-03-10T00:38:52.000Z	10
1031	2016-12-25T03:54:27.000Z	1
1041	2016-10-14T23:48:46.000Z	1
1041	2016-10-14T23:54:21.000Z	2
*/


/*
The row number is designated by order by clause and will only reset with the
partition clause. The row number is unique to every row and hence cannot be
grouped or made to repeat same row number for two different rows.

For example see the below query and observe its behaviour.
*/

SELECT account_id,
	   DATE_PART('year', occurred_at) AS year,
       ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at)) AS row_number
FROM orders;

/*
account_id	year	row_number
1001	2015	1
1001	2015	2
1001	2015	3
1001	2015	4
1001	2015	5
1001	2016	6
1001	2016	7
1001	2016	8
1001	2016	9
1001	2016	10
*/

/*
Even though row number has been ordered by the date that has been truncated
to yearly values, each row has a unique number.

For deeper understanding compare it with COUNT(account_id) clause in stead of
ROW_NUMBER. The respective query is written below:
*/

SELECT account_id,
	   DATE_PART('year', occurred_at) AS year,
       COUNT(account_id) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at)) AS row_number
FROM orders;

/*
Output 6912 results
account_id	year	row_number
1001	2015	5
1001	2015	5
1001	2015	5
1001	2015	5
1001	2015	5
1001	2016	28
1001	2016	28
1001	2016	28
*/
