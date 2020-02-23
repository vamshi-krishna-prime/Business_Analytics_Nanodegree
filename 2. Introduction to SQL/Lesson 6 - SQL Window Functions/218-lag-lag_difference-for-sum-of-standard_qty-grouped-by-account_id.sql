/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:
Section 14: Comparing a row to a previous row

LAG & LEAD functions

Display the sum of standard_qty for each account along with its
LAG column and find the LAG difference for each account.

Useful Tip:

lag_difference : which subtracts the lag value from the value in standard_sum
for each row in the table
*/

WITH sub AS (
  SELECT account_id,
         SUM(standard_qty) AS standard_sum
  FROM orders
  GROUP BY 1)

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER ordered_window AS lag,
       standard_sum - LAG(standard_sum) OVER ordered_window AS lag_difference
FROM sub
WINDOW ordered_window AS (ORDER BY standard_sum);

/*
Output 350 results
account_id	standard_sum	lag	  lag_difference
1901          	0
3371	         79	         0	      79
1961	        102	        79	      23
3401	        116	       102	      14
3741	        117	       116	       1
4321	        123	       117	       6
3941	        148	       123	      25
1671	        149	       148	       1
*/


/*-------Given Soltion------(using innerqeury)*/

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag,
       standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_difference
FROM (
       SELECT account_id,
       SUM(standard_qty) AS standard_sum
       FROM orders
       GROUP BY 1
      ) sub
