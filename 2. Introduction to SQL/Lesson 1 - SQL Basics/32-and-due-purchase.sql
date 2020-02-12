/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Imagine you are a 'Sales Manager' at 'Parch and Posey', you want to see which
of your customers bought paper a while ago and might be due to make a purchase
soon. Lets assume this is January 2017, you probably want to look up customers
who made purchases some where between 3 and 9 months prior (or between April
and October of 2016).
*/


SELECT *
FROM orders
WHERE occurred_at >= '2015-04-01' AND occurred_at <= '2015-10-01'
ORDER BY occurred_at DESC;


/*
The AND operator is used within a WHERE statement to consider more than one
logical clause at a time. Each time you link a new statement with an AND, you
will need to specify the column you are interested in looking at. You may link
as many statements as you would like to consider at the same time. This
operator works with all of the operations we have seen so far including
arithmetic operators (+, *, -, /). LIKE, IN, and NOT logic can also be linked
together using the AND operator.

For better solution check the file '33-between-due-purchse.sql'
*/
