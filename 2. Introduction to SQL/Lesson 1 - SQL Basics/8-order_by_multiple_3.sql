/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Now write a query that again displays order ID, account ID, and
total dollar amount for each order, but this time sorted first by
total dollar amount (in descending order), and then by account ID
(in ascending order).
*/

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;

/*
 In above query, since you sorted by the total dollar amount first, the orders
 appear from greatest to least regardless of which account ID they were from.
 Then they are sorted by account ID next. (The secondary sorting by account ID
 is difficult to see here, since only if there were two orders with equal
 total dollar amounts would there need to be any sorting by account ID.)
*/
