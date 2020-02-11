/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Use the 'accounts' table to find the account 'name', 'primary_poc', and
'sales_rep_id' for 'Walmart', 'Target', and 'Nordstrom'.
*/


SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');
