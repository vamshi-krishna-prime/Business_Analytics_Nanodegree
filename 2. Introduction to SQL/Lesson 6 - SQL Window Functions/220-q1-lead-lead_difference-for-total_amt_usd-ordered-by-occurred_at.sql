/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:
Section 17: Comparing a row to a previous row

LAG & LEAD functions

Imagine you're an analyst at Parch & Posey and you want to determine how the
current order's total revenue ("total" meaning from sales of all types of paper)
 compares to the next order's total revenue.

Modify Derek's query from the previous video in the SQL Explorer below to
perform this analysis. You'll need to use occurred_at and total_amt_usd in the
orders table along with LEAD to do so. In your query results, there should be
four columns: occurred_at, total_amt_usd, lead, and lead_difference.
*/

/* Almost correct but has a mistake. Read the solution provided for more
understanding regarding the mistake */

SELECT occurred_at,
       total_amt_usd,
       LEAD(total_amt_usd) OVER timed_window AS lead,
       LEAD(total_amt_usd) OVER timed_window - total_amt_usd AS lead_difference
FROM orders
WINDOW timed_window AS (ORDER BY occurred_at);

/*
Output 6912 results
occurred_at	              total_amt_usd	  lead	      lead_difference
2013-12-04T04:22:44.000Z	627.48	        2646.77	     2019.29
2013-12-04T04:45:54.000Z	2646.77	        2709.62	       62.85
2013-12-04T04:53:25.000Z	2709.62	         277.13	    -2432.49
2013-12-05T20:29:16.000Z	277.13	        3001.85	     2724.72
2013-12-05T20:33:56.000Z	3001.85	        2802.90	     -198.95
2013-12-06T02:13:20.000Z	2802.90	        7009.18	     4206.28
2013-12-06T12:55:22.000Z	7009.18	        1992.13	    -5017.05
2013-12-06T12:57:41.000Z	1992.13	        6680.06	     4687.93
*/

/*---------Given Solution--------*/

SELECT occurred_at,
       total_amt_usd,
       LEAD(total_amt_usd) OVER (ORDER BY occurred_at) AS lead,
       LEAD(total_amt_usd) OVER (ORDER BY occurred_at) - total_amt_usd AS lead_difference
FROM (
SELECT occurred_at,
       SUM(total_amt_usd) AS total_amt_usd
  FROM orders
 GROUP BY 1
) sub

/* The main difference between the first query and the solution is that
there may be more than one orders existed for the same value of occurred_at */


/*----------Doubt----------

1. If we want to determine how the current order's total revenue compares to the
next order's total revenue, why are we ordering the rows based on occurred_at?

2. If we combine (sum) all total_amt_usd belonging to same timeframe (occurred_at)
then it is not possible to compare the combined orders total_revenue with
each other. For example:

if 4 different orders are placed at the same time (whether they may be from
same account_id or different account_id's or a combination), then we have to
compare the total revenue of each order. But if we combine all total revenue
(SUM(total_amt_usd) grouped by occurred_at) then there will be one single
column. How can we compare these 4 orders wit each other?
*/
