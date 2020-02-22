/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS INTRODUCTION
*/

SELECT standard_qty, occurred_at, SUM(standard_qty) OVER (ORDER BY occurred_at) AS running_total
FROM orders;

/*
Output 6912 results

occurred_at	                 standard_qty	   running_total
2013-12-04T04:22:44.000Z	     0	              0
2013-12-04T04:45:54.000Z	   490	            490
2013-12-04T04:53:25.000Z	   528	           1018
2013-12-05T20:29:16.000Z	     0	           1018
2013-12-05T20:33:56.000Z	   492	           1510
2013-12-06T02:13:20.000Z	   502	           2012

and remaining rows
*/


/*
For better understanding run the following queries and observe the results
*/

SELECT account_id,
       occurred_at,
       standard_qty,
       SUM(standard_qty) OVER (ORDER BY occurred_at) AS running_total
FROM orders;

/*
Output6912 results
account_id	 occurred_at	              standard_qty	running_total
2861	       2013-12-04T04:22:44.000Z	     0	           0
2861	       2013-12-04T04:45:54.000Z	   490	         490
4311	       2013-12-04T04:53:25.000Z	   528	        1018
1281	       2013-12-05T20:29:16.000Z	     0	        1018
1281	       2013-12-05T20:33:56.000Z	   492	        1510
*/


/*
NOTES:

1. A window function performs a calculation across a set of table rows that
are somehow related to the current row. This is comparable to the type of
calculation that can be done with an aggregate function.

2. But unlike regular aggregate functions, use of a window function does not
cause rows to become grouped into a single output row — the rows retain their
separate identities.

3. Behind the scenes, the window function is able to access more than just the
current row of the query result.

4. OVER and PARTITION BY, these are key to window functions. Not every window
function uses PARTITION BY; we can also use ORDER BY or no statement at all
depending on the query we want to run.
*/
