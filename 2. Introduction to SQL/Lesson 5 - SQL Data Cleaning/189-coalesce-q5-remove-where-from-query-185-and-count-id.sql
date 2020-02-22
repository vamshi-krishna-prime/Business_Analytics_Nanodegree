/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning

COALESCE Quizzes

You learned about how to use COALESCE to work with NULL values. Unfortunately,
our dataset does not have the NULL values that were fabricated in this dataset,
so you will work through a different example in the next concept to get used to
the COALESCE function.

-----------Note: Database for these queries are not available locally-----------

Question 4:
Run the query in 1 with the 'WHERE' removed an the 'COUNT' the number of 'id''s.
*/

SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;

/*
Result:
count
6913
*/
