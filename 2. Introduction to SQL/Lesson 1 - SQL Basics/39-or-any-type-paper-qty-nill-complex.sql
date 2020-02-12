/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Imagine yourself as a 'Sales Manager' at 'Parch and Posey', You've determined
that another great way to expand revenue is to sell new types of paper to the
existing customers. On order to figure out the best prospects, you'd like to
see existing customers whose orders omitted some type of paper.

Find all the customers who left out atleast one type of paper in their orders
occurred on or after october 2016. order by recent to earliest.
find customer data as in account_id, occurred_at, standard_qty, gloss_qty and
poster_qty
*/


SELECT account_id, occurred_at, standard_qty, gloss_qty, poster_qty
FROM orders
WHERE (standard_qty = 0 OR gloss_qty = 0 OR poster_qty = 0) AND occurred_at >= '2016-10-01'
ORDER BY occurred_at DESC;


/*
When combining multiple of these operations, we frequently might need to use
parentheses to assure that logic we want to perform is being executed correctly.
*/
