/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Advanced JOINs

Advanced JOINs:

Section 12: UNION

JOIN accounts with accounts itself using UNION

Add a WHERE clause to each of the tables that you unioned in the query above,
filtering the first table where name equals Walmart and filtering the second
table where name equals Disney.
*/

SELECT *
FROM accounts a
WHERE a.name = 'Walmart'

UNION ALL

SELECT *
FROM accounts a
WHERE a.name = 'Disney';

/*
Output 2 results

id	  name	  website	        lat	         long	        primary_poc	      sales_rep_id
1001	Walmart	www.walmart.com	40.23849561	-75.10329704	Tamara Tuma	      321500
1521	Disney	www.disney.com	41.87879976	-74.81102607	Timika Mistretta	321600
*/

/* The above result can also be achieved using the following query: */

SELECT *
FROM accounts a
WHERE a.name IN ('Walmart', 'Disney');

/* or */

SELECT *
FROM accounts a
WHERE a.name = 'Walmart' OR a.name = 'Disney';

/*
Same Output 2 results

id	  name	  website	        lat	         long	        primary_poc	      sales_rep_id
1001	Walmart	www.walmart.com	40.23849561	-75.10329704	Tamara Tuma	      321500
1521	Disney	www.disney.com	41.87879976	-74.81102607	Timika Mistretta	321600
*/
