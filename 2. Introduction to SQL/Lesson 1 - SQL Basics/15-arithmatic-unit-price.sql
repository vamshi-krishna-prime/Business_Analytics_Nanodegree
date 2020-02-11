/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Create a column that divides the 'standard_amt_usd' by the 'standard_qty' to
find the unit price for standard paper for each order. Limit the results to the
first 10 orders, and include the 'id' and 'account_id' fields.
*/

/* Also check query 117 for more accurate solution */

SELECT id, account_id, (standard_amt_usd/standard_qty) AS unit_price
FROM orders
LIMIT 10;


/*
This will produce a 'Zero division error' incase there are zeros or Null values
present in the standard_qty (there are). Hence a quick fix is used to avoid
this error by adding the standard_qty a minor value of 0.01, which is shown
below:
*/

SELECT id, account_id, standard_amt_usd/(standard_qty + 0.01) AS unit_price
FROM orders
LIMIT 10;
