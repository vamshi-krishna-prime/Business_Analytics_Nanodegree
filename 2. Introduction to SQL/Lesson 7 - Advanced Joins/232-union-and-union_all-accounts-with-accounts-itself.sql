/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Advanced JOINs

Advanced JOINs:

Section 12: UNION

JOIN accounts with accounts itself using UNION
*/

SELECT *
FROM accounts

UNION

SELECT *
FROM accounts

/* Output 351 results*/
/*
UNION only appends distinct values. More specifically, when you use UNION, the
dataset is appended, and any rows in the appended table that are exactly
identical to rows in the first table are dropped. If you’d like to append all
the values from the second table, use UNION ALL. You’ll likely use UNION ALL
far more often than UNION.
*/

/* JOIN accounts with accounts itself using UNION ALL */

SELECT *
FROM accounts

UNION ALL

SELECT *
FROM accounts

/* Output 702 results*/
