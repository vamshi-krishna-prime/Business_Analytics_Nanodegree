/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Pull all the data related to the company named 'United Technologies' in the
accounts table
*/

SELECT *
FROM accounts
WHERE name = 'United Technologies';

/*
The WHERE statement can also be used with non-numeric data. We can use
the '=' and '!=' operators here. You need to be sure to use single quotes (just
be careful if you have quotes in the original text) with the text data,
not double quotes.

Commonly when we are using WHERE with non-numeric data fields, we use
the 'LIKE', 'NOT', or 'IN' operators.
*/
