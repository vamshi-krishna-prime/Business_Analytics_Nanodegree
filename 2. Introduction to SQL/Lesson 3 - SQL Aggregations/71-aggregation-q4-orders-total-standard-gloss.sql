/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the total amount spent on 'standard_amt_usd' and 'gloss_amt_usd' paper
for each order in the 'orders' table. This should give a dollar amount for
each order in the table.
*/


SELECT (o.standard_amt_usd + o.gloss_amt_usd) AS total_standard_gloss_amt
FROM orders o;
