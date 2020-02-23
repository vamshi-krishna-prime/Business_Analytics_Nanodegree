/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:
Section 20: Percentiles with Partitions

NTILE function

Calculate the quartile, quintile and percentile for standard_qty in orders
and list by standard_qty decending order.
*/

SELECT id,
       account_id,
       occurred_at,
       standard_qty,
       NTILE(4) OVER (ORDER BY standard_qty) AS quartile,
       NTILE(5) OVER (ORDER BY standard_qty) AS quintile,
       NTILE(100) OVER (ORDER BY standard_qty) AS percentile
FROM orders
ORDER BY standard_qty DESC;


/*
Output 6912 results
id	  account_id	occurred_at	              standard_qty	quartile	quintile	percentile
3892	4161	      2016-06-24T13:32:55.000Z	22591	        4	        5	        100
4562	1341	      2016-10-26T00:19:31.000Z	15649	        4	        5	        100
5479	2441	      2016-10-21T21:08:01.000Z	7365	        4	        5	        100
5167	2041	      2014-10-05T15:37:22.000Z	7083	        4 	      5       	100
*/

/*
1. The number inside the NTILE(num) will decide, on how many equal parts the
'list of standard_qty' should be divided into.
2. The ORDER BY clause will decide the column on which to work with.
3. The resulting value in each row shows which category/part the value in
standard_qty will fall into.

Note:
when you use a NTILE function but the number of rows in the partition is less
than the NTILE(number of groups), then NTILE will divide the rows into as many
groups as there are members (rows) in the set but then stop short of the
requested number of groups. If you’re working with very small windows, keep
this in mind and consider using quartiles or similarly small bands.

For example, If you only had two records and you were measuring percentiles,
you’d expect one record to define the 1st percentile, and the other record to
define the 100th percentile. Using the NTILE function, what you’d actually see
is one record in the 1st percentile, and one in the 2nd percentile.
*/
