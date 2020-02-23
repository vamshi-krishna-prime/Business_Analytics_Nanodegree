/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:
Section 14: Comparing a row to a previous row

LAG & LEAD functions

Display the sum of standard_qty for each account along with its
LEAD column and find the LEAD difference for each account.

Useful Tip:

lead_difference : which subtracts the standard_sum value from the value in lag
column for each row in the table
*/

WITH sub AS (
             SELECT account_id,
                    SUM(standard_qty) AS standard_sum
             FROM orders
             GROUP BY 1)

SELECT account_id,
       standard_sum,
       LEAD(standard_sum) OVER ordered_window AS lead,
       LEAD(standard_sum) OVER ordered_window - standard_sum AS lead_difference
FROM sub
WINDOW ordered_window AS (ORDER BY standard_sum);

/*
Output 350 results
account_id	standard_sum	lead	lead_difference
1901	         0	          79	   79
3371	        79	         102	   23
1961	       102	         116	   14
3401	       116	         117	    1
3741	       117	         123	    6
4321	       123	         148	   25
3941	       148	         149	    1
1671	       149	         183	   34
*/

/*-------Given Soltion------(using innerqeury)*/

SELECT account_id,
       standard_sum,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lead_difference
FROM (
SELECT account_id,
       SUM(standard_qty) AS standard_sum
       FROM orders
       GROUP BY 1
     ) sub


/*
Each value in lead_difference is comparing the row values between the 2 columns
(standard_sum and lead). E.g., for account_id 1901, the value in lead_difference
will compare the value 0 (standard_sum for account_id 1901) with 79 (lead for
account_id 1901) resulting in 79. This goes on for each row in the table.
*/
