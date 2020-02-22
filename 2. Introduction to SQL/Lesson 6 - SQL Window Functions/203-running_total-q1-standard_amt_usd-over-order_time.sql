/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Section 3:
Quiz: Running_total

Question 1:
create a running total of standard_amt_usd (in the orders table) over
order time with no date truncation. Your final table should have two columns:
one with the amount being added for each new row, and a second with the
running total.


*/

SELECT standard_amt_usd,
       SUM(standard_amt_usd) OVER (ORDER BY occurred_at) AS running_total
FROM orders;

/*
Output 6912 results

standard_amt_usd	running_total
   0.00	             0.00
2445.10	          2445.10
2634.72	          5079.82
   0.00	          5079.82
2455.08	          7534.90
2504.98	         10039.88
 264.47	         10304.35
1536.92	         11841.27
.
.
and remaining rows
*/
