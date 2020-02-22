/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Section 7: ROW_NUMBER()


Question:
create a ROW_NUMBER() for id, account_id and occurred_at rows and ordered by id.
*/

SELECT id,
       account_id,
       occurred_at,
       ROW_NUMBER() OVER(ORDER BY id) AS row_number
FROM orders;

/*
Output 6912 results
id	account_id	occurred_at	row_number
1	1001	2015-10-06T17:31:14.000Z	1
2	1001	2015-11-05T03:34:33.000Z	2
3	1001	2015-12-04T04:21:55.000Z	3
4	1001	2016-01-02T01:18:24.000Z	4
5	1001	2016-02-01T19:27:27.000Z	5
6	1001	2016-03-02T15:29:32.000Z	6
7	1001	2016-04-01T11:20:18.000Z	7
8	1001	2016-05-01T15:55:51.000Z	8
9	1001	2016-05-31T21:22:48.000Z	9
10	1001	2016-06-30T12:32:05.000Z	10
*/
