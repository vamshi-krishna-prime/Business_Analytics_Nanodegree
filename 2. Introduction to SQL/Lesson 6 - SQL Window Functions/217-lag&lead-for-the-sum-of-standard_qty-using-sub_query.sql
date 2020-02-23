/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Section 14: Comparing a row to a previous row


LAG & LEAD functions

Display the sum of standard_qty for each account along with its
LAG and LEAD columns
*/

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead
FROM (
      SELECT account_id,
             SUM(standard_qty) AS standard_sum
      FROM orders
      GROUP BY 1
     ) sub

/*
Output 350 results

account_id	standard_sum	  lag	    lead
1901	        0		                    79
3371	       79	             0	     102
1961	      102	            79	     116
3401	      116	           102	     117
3741	      117	           116	     123
4321	      123	           117	     148
3941	      148	           123	     149
1671	      149	           148	     183
*/

/*
LAG function - Purpose
It returns the value from a previous row to the current row in the table.

LEAD function - Purpose
It returns the value from the next row to the current row in the table.
*/

/*
Same query can also be written as: (more sleek version than solution)
*/

WITH sub AS (
             SELECT account_id,
                    SUM(standard_qty) AS standard_sum
             FROM orders
             GROUP BY 1)

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER ordered_window AS lag,
       LEAD(standard_sum) OVER ordered_window AS lead
FROM sub
WINDOW ordered_window AS (ORDER BY standard_sum);

/*
Output 350 results

account_id	standard_sum	 lag	  lead
1901	         0		                79
3371	        79	           0	   102
1961	       102	          79	   116
3401	       116	         102	   117
3741	       117	         116	   123
4321	       123	         117	   148
3941	       148	         123	   149
1671	       149	         148	   183
*/
