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

Quiz: Question 1:

Use the NTILE functionality to divide the accounts into 4 levels in terms of
the amount of standard_qty for their orders. Your resulting table should have
the account_id, the occurred_at time for each order, the total amount of
standard_qty paper purchased, and one of four levels in a standard_quartile
column.
*/

/* ------------Wrong solution----------*/
WITH sub AS (
             SELECT account_id,
                    occurred_at,
                    SUM(standard_qty) AS standard_sum
             FROM orders
             GROUP BY 1, 2)

SELECT account_id,
       occurred_at,
       standard_sum,
       NTILE(4) OVER (ORDER BY standard_sum) AS quardile
FROM sub
ORDER BY 4 DESC;

/*-------------Note-----------*/
NTILE(4) OVER (ORDER BY standard_sum) AS quardile
/* is different from */
NTILE(4) OVER (ORDER BY standard_sum DESC) AS quardile
/* above lists into 4 categories but biggest being 1 and smallest being 4 */

/*-------------------Given Solution---------------*/

SELECT
       account_id,
       occurred_at,
       standard_qty,
       NTILE(4) OVER (PARTITION BY account_id ORDER BY standard_qty) AS standard_quartile
  FROM orders
 ORDER BY account_id DESC

 /*---------------Improvised Solution--------------*/

 SELECT
       account_id,
       occurred_at,
       standard_qty,
       NTILE(4) OVER (PARTITION BY account_id ORDER BY standard_qty) AS standard_quartile
  FROM orders
 ORDER BY account_id DESC, standard_qty DESC;

 /*
 Output 6912 results
 account_id	occurred_at	         standard_qty	  standard_quartile
 4501	      2016-08-27T00:48:17.000Z	180	       4
 4501	      2016-10-24T08:50:37.000Z	159	       4
 4501	      2016-09-25T01:44:03.000Z	158	       4
 4501	      2016-12-21T13:43:26.000Z	126	       3
 4501	      2016-07-29T20:06:39.000Z	111	       3
 */
