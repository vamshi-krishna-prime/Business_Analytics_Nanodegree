/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

What was the smallest order placed by each account in terms of total usd.
Provide only two columns - the account name and the total usd. Order from
smallest dollar amounts to largest.
*/



SELECT a.name acccount_name, MIN(o.total_amt_usd) smallest_order
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY a.name
ORDER BY smallest_order;

/*
you can also change the last line to

ORDER BY smallest_order, account_name;

for sorting the result on smallest_order first and sorting the resulting list
again on the name basis
*/
