/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Use the accounts table to find - All the companies whose names start with 'C'.
*/


SELECT name
FROM accounts
WHERE name LIKE 'C%';
