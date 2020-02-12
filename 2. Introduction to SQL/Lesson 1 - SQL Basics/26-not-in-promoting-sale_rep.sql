/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Imagine yourself as the 'Sales Manager' at 'Parch and Posey'
company. You are considering to promote two of your top sales reps
(sales_rep_id - 321500 and 321570) into management. Identify the accounts,
(company names) the other sales reps are currently working on the 'accounts'
table.
*/


SELECT sales_rep_id, name
FROM accounts
WHERE name NOT IN (321500, 321570);
