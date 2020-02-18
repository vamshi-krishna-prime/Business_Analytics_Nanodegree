/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

In a quiz question in the previous Basic SQL lesson, you saw this question:

Create a column that divides the standard_amt_usd by the standard_qty to find
the unit price for standard paper for each order. Limit the results to the
first 10 orders, and include the id and account_id fields.
Note - you will be thrown an error with the correct solution to this question.
This is for a division by zero. You will learn how to get a solution without
an error to this query using CASE statements.
*/

/*
Normal Case:
*/

SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

/*
Quick fix we used in the previous SQL Basics:
*/

SELECT id, account_id, standard_amt_usd/(standard_qty + 0.01) AS unit_price
FROM orders
LIMIT 10;

/*
Now, let's use a CASE statement. This way any time the standard_qty is zero,
we will return 0, and otherwise we will return the unit_price.
*/

SELECT id,
       account_id,
       CASE WHEN standard_qty = 0 OR standard_qty IS NULL THEN 0
            ELSE standard_amt_usd / standard_qty END AS unit_price
FROM orders
LIMIT 10;

/*
Now the first part of the statement will catch any of those division by zero
values that were causing the error, and the other components will compute the
division as necessary. You will notice, we essentially charge all of our
accounts 4.99 for standard paper. It makes sense this doesn't fluctuate, and
it is more accurate than adding 1 in the denominator like our quick fix might
have been in the earlier lesson.
*/
