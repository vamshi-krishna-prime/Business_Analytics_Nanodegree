/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning

COALESCE Quizzes

You learned about how to use COALESCE to work with NULL values. Unfortunately,
our dataset does not have the NULL values that were fabricated in this dataset,
so you will work through a different example in the next concept to get used to
the COALESCE function.

-----------Note: Database for these queries are not available locally-----------

Question 3:
Use COALESCE to fill in the 'orders.account_id' column with the 'account_id'
for the NULL value for the rable in 1.
*/

SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, o.standard_qty, o.gloss_qty, o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

/*
Output1 results
filled_id	  name	                 website	    lat	            long	           primary_poc	    sales_rep_id	account_id	occurred_at	standard_qty	gloss_qty	poster_qty	total	standard_amt_usd	gloss_amt_usd	poster_amt_usd	total_amt_usd
1731	      Goldman Sachs Group	   www.gs.com	  40.75744399	    -73.96730918	   Loris Manfredi	  321690	      1731									
*/
