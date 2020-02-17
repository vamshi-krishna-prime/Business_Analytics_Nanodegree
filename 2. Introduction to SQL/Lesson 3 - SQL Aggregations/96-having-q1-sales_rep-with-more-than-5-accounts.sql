/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

How many of the sales reps have more than 5 accounts that they manage?
*/



SELECT s.id id,s.name sales_rep, COUNT(a.id) accounts
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
GROUP BY s.name, s.id
HAVING COUNT(a.id) > 5
ORDER BY accounts DESC, sales_rep;


/*
Answer:
34

Given solution:
*/

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY num_accounts;


/*
and technically, we can get this using a SUBQUERY as shown below:
*/

SELECT COUNT(*) num_reps_above5
FROM(SELECT s.id, s.name, COUNT(*) num_accounts
     FROM accounts a
     JOIN sales_reps s
     ON s.id = a.sales_rep_id
     GROUP BY s.id, s.name
     HAVING COUNT(*) > 5
     ORDER BY num_accounts) AS Table1;
