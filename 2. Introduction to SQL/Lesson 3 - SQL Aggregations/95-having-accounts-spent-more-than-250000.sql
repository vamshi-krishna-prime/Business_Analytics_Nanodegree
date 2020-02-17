/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Display the list of accounts who spend 250000 or more usd
*/



SELECT o.account_id account, SUM(o.total_amt_usd) total_usd
FROM orders o
GROUP BY 1
HAVING o.total_amt_usd >= 250000
ORDER BY SUM(o.total_amt_usd) DESC;


/*
WHERE clause does not work on aggregated columns, and HAVING is used instead

HAVING - Expert Tip:

HAVING is the “clean” way to filter a query that has been aggregated, but this
is also commonly done using a subquery. Essentially, any time you want to
perform a WHERE on an element of your query that was created by an aggregate,
you need to use HAVING instead.
*/
