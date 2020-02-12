/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Write a query that returns a list of orders where the standard_qty is zero and
either the gloss_qty or poster_qty is over 1000.
*/


SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);
