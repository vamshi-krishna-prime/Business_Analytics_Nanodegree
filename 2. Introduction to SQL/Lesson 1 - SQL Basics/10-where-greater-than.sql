/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Pulls the first 5 rows and all columns from the orders table that have a
dollar amount of gloss_amt_usd greater than or equal to 1000.
*/

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;
