/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 2 : SQL Joins

What are the different channels used by account id 1001? Your final table
should have only 2 columns: account name and the different channels. You can
try SELECT DISTINCT to narrow down the results to only the unique values.
*/



SELECT DISTINCT a.name account, w.channel channel
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
WHERE a.id = 1001;
