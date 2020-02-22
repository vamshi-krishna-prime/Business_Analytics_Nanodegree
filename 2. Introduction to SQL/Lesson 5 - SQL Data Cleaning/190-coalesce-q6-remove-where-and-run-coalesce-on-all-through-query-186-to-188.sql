/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning

COALESCE Quizzes

You learned about how to use COALESCE to work with NULL values. Unfortunately,
our dataset does not have the NULL values that were fabricated in this dataset,
so you will work through a different example in the next concept to get used to
the COALESCE function.

-----------Note: Database for these queries are not available locally-----------

Question 5:
Run the query in 5, but with the COALESCE function used in questions 2 through 4
(query 186 to 188)
*/

SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;

/*
Output 6913 results:

filled_id	    name	   website	        lat	        long	        primary_poc	 sales_rep_id	 account_id	   occurred_at	              standard_qty	gloss_qty	poster_qty	total	   standard_amt_usd	  gloss_amt_usd	  poster_amt_usd	total_amt_usd
1001	        Walmart	 www.walmart.com	40.23849561	-75.10329704	Tamara Tuma	 321500	       1001	         2015-10-06T17:31:14.000Z	  123	          22	      24	        169	     613.77	           164.78	          194.88	        973.43
1001	        Walmart	 www.walmart.com	40.23849561	-75.10329704	Tamara Tuma	 321500	       1001	         2015-11-05T03:34:33.000Z	  190	          41	      57	        288	     948.10	           307.09	          462.84	        1718.03
1001	        Walmart	 www.walmart.com	40.23849561	-75.10329704	Tamara Tuma	 321500	       1001	         2015-12-04T04:21:55.000Z	  85	          47	       0	        132	     424.15	           352.03	            0.00	        776.18
1001	        Walmart	 www.walmart.com	40.23849561	-75.10329704	Tamara Tuma	 321500	       1001	         2016-01-02T01:18:24.000Z	  144	          32	       0	        176	     718.56	           239.68	            0.00	        958.24
1001	        Walmart	 www.walmart.com	40.23849561	-75.10329704	Tamara Tuma	 321500	       1001	         2016-02-01T19:27:27.000Z	  108	          29	      28	        165	     538.92	           217.21	          227.36	        983.49
.
.
and 6908 more results
*/
