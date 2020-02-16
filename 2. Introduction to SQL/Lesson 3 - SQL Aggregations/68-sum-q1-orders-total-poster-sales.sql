/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the total amount of 'poster_qty' paper ordered in the 'orders' table.
*/


SELECT SUM(o.poster_qty) total_poster_sales
FROM orders o;
