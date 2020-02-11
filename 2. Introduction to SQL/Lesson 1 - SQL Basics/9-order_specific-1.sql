/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Now write a query that displays all the data relecant to a specific customer
and order by the time stamp. Say the customer has an account_id number 4251.
*/

SELECT *
FROM orders
WHERE account_id = 4251
ORDER BY occurred_at;

/*
Returns all the data related to the customre with the account_id 4251, in the
ascending order of the purchase made (earlier to the latest).
*/
