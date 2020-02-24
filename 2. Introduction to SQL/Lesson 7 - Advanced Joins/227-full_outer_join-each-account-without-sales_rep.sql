/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Advanced JOINs

Advanced JOINs:

Section 4: FULL OUTER JOIN
*/

/*
You’re not likely to use FULL JOIN (which can also be written as
FULL OUTER JOIN) too often, but the syntax is worth practicing anyway.
LEFT JOIN and RIGHT JOIN each return unmatched rows from one of the
tables—FULL JOIN returns unmatched rows from both tables. FULL JOIN is
commonly used in conjunction with aggregations to understand the amount
of overlap between two tables.

Say you're an analyst at Parch & Posey and you want to see:

Display each account that does not have a sales rep and each sales rep that
does not have an account (some of the columns in these returned rows will
be empty)
*/

SELECT *
FROM sales_reps s
FULL OUTER JOIN accounts a
ON s.id = a.sales_rep_id
WHERE s.id IS NULL or a.sales_rep_id IS NULL

/*
Output 0 results
id	name	region_id	website	lat	long	primary_poc	 sales_rep_id
*/

/*
That's right. No unmatched rows are returned, which means that each account
has at least one sales rep and each sales rep has at least one account.
*/

/*------------Given Solution-------------*/

SELECT *
FROM accounts
FULL JOIN sales_reps ON accounts.sales_rep_id = sales_reps.id
WHERE accounts.sales_rep_id IS NULL OR sales_reps.id IS NULL
