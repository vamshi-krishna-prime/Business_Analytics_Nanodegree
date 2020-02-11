/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Write a query that finds the percentage of revenue that comes from poster paper
for each order. You will need to use only the columns that end with _usd.
(Try to do this without using the total column.) Display the 'id' and
'account_id' fields also.

Note - you will receive an error with the correct solution to this question.
This occurs because at least one of the values in the data creates a
'division by zero' in your formula. You will learn later in the course how to
fully handle this issue. For now, you can just limit your calculations to the
first 10 orders, as we did in question #1, and you'll avoid that set of data
that causes the problem.
*/

SELECT id, account_id, (poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd))*100 AS poster_rev_percent
FROM orders
LIMIT 10;
