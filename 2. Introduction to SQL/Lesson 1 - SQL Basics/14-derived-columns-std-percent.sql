/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Make a query to find the standard paper percent for the order, and use the
'AS' keyword to name this new column "std_percent." along with id and
total_amt_usd from 'orders' table. Limit the return to 10 rows.

HINT: divide the standard paper dollar amount by the total order amount to
find the standard paper percent.
*/

SELECT id, (standard_amt_usd/total_amt_usd)*100 AS std_percent, total_amt_usd
FROM orders
LIMIT 10;


/*
Creating a new column that is a combination of existing columns is known as a
'derived column' (or "calculated" or "computed" column). Usually you want to
give a name, or "alias," to your new column using the 'AS' keyword.

Order of operations applies when using arithmetic operators in SQL.
The following two statements have very different end results:

Standard_qty / standard_qty + gloss_qty + poster_qty
standard_qty / (standard_qty + gloss_qty + poster_qty)
*/
