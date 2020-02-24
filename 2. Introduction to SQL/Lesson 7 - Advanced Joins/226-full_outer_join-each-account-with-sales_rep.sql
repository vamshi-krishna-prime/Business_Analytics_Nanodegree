/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Advanced JOINs

Advanced JOINs:

Section 3: FULL OUTER JOIN
*/

/*
You’re not likely to use FULL JOIN (which can also be written as
FULL OUTER JOIN) too often, but the syntax is worth practicing anyway.
LEFT JOIN and RIGHT JOIN each return unmatched rows from one of the
tables—FULL JOIN returns unmatched rows from both tables. FULL JOIN is
commonly used in conjunction with aggregations to understand the amount
of overlap between two tables.

Say you're an analyst at Parch & Posey and you want to see:

Question 1: (must datisfy both conditions given below in single query)
1. Each account who has a sales rep and each sales rep that has an account
(all of the columns in these returned rows will be full)

2. but also each account that does not have a sales rep and each sales rep that
does not have an account (some of the columns in these returned rows will
be empty)
*/

SELECT *
FROM accounts a
FULL OUTER JOIN sales_reps s
ON a.sales_rep_id = s.id

/*
Output 351 results

id	    name	        website	                lat	         long	        primary_poc	      sales_rep_id	region_id
321500	Samuel Racine	www.johnsoncontrols.com	40.76346837	-73.97890353	Cammy Sosnowski	  321500	         1
321500	Samuel Racine	www.aa.com	            40.77158500	-73.98195470	Sasha Haughey	    321500	         1
321500	Samuel Racine	www.ingrammicro.com	    40.76945841	-73.98081794	Chanelle Keach	  321500	         1
321500	Samuel Racine	www.freddiemac.com	    42.77051343	-75.18810094	Elayne Grunewald	321500	         1
*/


/*------------Given Solution-------------*/

SELECT *
  FROM accounts
 FULL JOIN sales_reps ON accounts.sales_rep_id = sales_reps.id
