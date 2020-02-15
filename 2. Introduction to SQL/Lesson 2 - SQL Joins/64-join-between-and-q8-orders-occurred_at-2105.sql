/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 2 : SQL Joins

Find all the orders that occurred in 2015. Your final table should have
4 columns: occurred_at, account name, order total, and order total_amt_usd.
*/



SELECT o.occurred_at occurred_at, a.name account, o.total total_order, o.total_amt_usd total_price
FROM order o
JOIN accounts a
ON a.id = o.account_id
WHERE o.occurred_at BETWEEN '1-1-2015' AND '1-1-2016'
ORDER BY o.occurred_at DESC;
