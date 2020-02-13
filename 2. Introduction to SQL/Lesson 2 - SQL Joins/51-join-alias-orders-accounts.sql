/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

JOIN 'orders' table and 'accounts' table using aliases and display all data
*/



SELECT o.*, a.*
FROM orders o
JOIN accounts a
ON o.account_id = a.id;
