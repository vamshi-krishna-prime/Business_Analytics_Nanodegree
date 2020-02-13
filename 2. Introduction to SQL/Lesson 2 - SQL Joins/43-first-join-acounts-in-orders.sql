/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 2 : SQL Joins

First JOIN
JOIN / merge 'id' column in the accounts table with 'account_id' column in the
orders table then display all the data in the orders table.
*/


SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = account.id;


/*
the SELECT clause indicates which column(s) of data you'd like to see in the
output (For Example, orders.* gives us all the columns in orders table in the
output). The FROM clause indicates the first table from which we're pulling
data, and the JOIN indicates the second table. The ON clause specifies the
column on which you'd like to merge the two tables together.

you will need to know how to specify tables and columns in the SELECT statement:
1. The table name is always before the period.
2. The column you want from that table is always after the period.
*/
