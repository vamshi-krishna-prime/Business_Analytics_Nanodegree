/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the total amount of 'standard_qty' paper ordered in the 'orders' table.
*/


SELECT SUM(o.standard_qty) total_standard_sales
FROM orders o;
