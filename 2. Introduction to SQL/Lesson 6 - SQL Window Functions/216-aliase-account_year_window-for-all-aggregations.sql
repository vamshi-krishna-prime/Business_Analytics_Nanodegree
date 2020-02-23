/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Section 14: Aliases for Multiple Windows


ALL AGGREGATIONS with WINDOW function - ALIASES
*/

/* The below query is part of the question */
SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS count_total_amt_usd,
       AVG(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS min_total_amt_usd,
       MAX(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS max_total_amt_usd
FROM orders

/*
Now, create and use an alias to shorten the following query (which is different
than the one in Derek's previous video) that has multiple window functions.
Name the alias account_year_window, which is more descriptive than main_window
in the example above.
*/

/* ----------solution----------*/

SELECT id,
       account_id,
       DATE_TRUNC('year', occurred_at) AS year,
       DENSE_RANK() OVER account_year_window AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER account_year_window AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER account_year_window AS count_total_amt_usd,
       AVG(total_amt_usd) OVER account_year_window AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER account_year_window AS min_total_amt_usd,
       MAX(total_amt_usd) OVER account_year_window AS max_total_amt_uad
FROM orders
WINDOW account_year_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at));


/*
Output 6912 results

id	 account_id	year	          dense_rank	total_amt_usd	sum_total_amt_usd	count_total_amt_usd	avg_total_amt_usd	    min_total_amt_usd	max_total_amt_uad
4307	1001	2015-01-01T00:00:00.000Z	1	    8757.18	       21651.53	         5	                4330.3060000000000000	776.18	          9426.71
3	    1001	2015-01-01T00:00:00.000Z	1	    776.18	       21651.53	         5	                4330.3060000000000000	776.18	          9426.71
2	    1001	2015-01-01T00:00:00.000Z	1	    1718.03	       21651.53	         5	                4330.3060000000000000	776.18	          9426.71
1	    1001	2015-01-01T00:00:00.000Z	1	    973.43	       21651.53	         5	                4330.3060000000000000	776.18	          9426.71
4308	1001	2015-01-01T00:00:00.000Z	1	    9426.71	       21651.53	         5	                4330.3060000000000000	776.18	          9426.71
6	    1001	2016-01-01T00:00:00.000Z	2	    1067.25	      124014.87	        28	                4429.1025000000000000	752.57	          9426.71
5	    1001	2016-01-01T00:00:00.000Z	2	    983.49	      124014.87	        28	                4429.1025000000000000	752.57	          9426.71
4	    1001	2016-01-01T00:00:00.000Z	2	    958.24	      124014.87	        28	                4429.1025000000000000	752.57	          9426.71
4318	1001	2016-01-01T00:00:00.000Z	2	    7924.46	      124014.87	        28	                4429.1025000000000000	752.57	          9426.71
4309	1001	2016-01-01T00:00:00.000Z	2	    9230.67	      124014.87	        28	                4429.1025000000000000	752.57	          9426.71
12	  1001	2016-01-01T00:00:00.000Z	2	    1182.61	      124014.87	        28	                4429.1025000000000000	752.57	          9426.71
*/
