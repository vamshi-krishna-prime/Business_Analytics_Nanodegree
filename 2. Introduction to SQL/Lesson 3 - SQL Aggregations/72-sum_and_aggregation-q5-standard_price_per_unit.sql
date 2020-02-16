/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the 'standard_amt_usd' per unit of 'standard_qty' paper. Your solution
should use both an aggregation and a mathematical operator.
*/


SELECT SUM(o.standard_amt_usd) / SUM(o.standard_qty) AS standard_price_per_unit
FROM orders o;
