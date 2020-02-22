/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Running total of standard_qty by occurred_at
*/

SELECT account_id,
       occurred_at,
       standard_qty,
       SUM(standard_qty) OVER (ORDER BY occurred_at) AS running_total
FROM orders;

/*
Output6912 results

account_id	occurred_at	             standard_qty	 running_total
2861	     2013-12-04T04:22:44.000Z	       0	            0
2861	     2013-12-04T04:45:54.000Z	     490	          490
4311	     2013-12-04T04:53:25.000Z	     528	         1018
1281	     2013-12-05T20:29:16.000Z	       0	         1018
1281	     2013-12-05T20:33:56.000Z	     492	         1510
2481	     2013-12-06T02:13:20.000Z	     502	         2012
3431	     2013-12-06T12:55:22.000Z	      53	         2065

and remaining rows
*/
