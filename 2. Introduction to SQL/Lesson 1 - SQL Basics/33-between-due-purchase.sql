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
WHERE occurred_at BETWEEN '2015-04-01' AND '2015-10-01'
ORDER BY occurred_at DESC;


/*
Sometimes we can make a cleaner statement using BETWEEN than we can using AND.
Particularly this is true when we are using the same column for different parts
of our AND statement. In the previous video, we probably should have used
BETWEEN.

Instead of writing :

WHERE column >= 6 AND column <= 10

we can instead write, equivalently:

WHERE column BETWEEN 6 AND 10
*/
