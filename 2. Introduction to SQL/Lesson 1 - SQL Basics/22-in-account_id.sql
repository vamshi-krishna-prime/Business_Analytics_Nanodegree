/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Imagine you are a 'Sales Manager' at 'Parch and Posey', and want to see how
several key accounts are performing. Extarct information related to the
company 'account_id' s - '1001' and '1021' from 'orders' table.
*/


SELECT *
FROM orders
WHERE account_id IN (1001,1021);

/*
the numerics does not need to be enclosed in quotations, while quotations are
a must for the string searches. For example:
WHERE name IN ('Walmart', 'Apple');

Also must use double quotations if the search string contain a apostrophe in it.
Example:
WHERE name IN "Macy's"; 
*/
