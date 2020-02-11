/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Imagine you are a 'Sales Manager' at 'Parch and Posey', and want to see how
several key accounts are performing. Extarct information related to the
companies 'Walmart' and 'Apple' from 'accounts' table
*/


SELECT *
FROM accounts
WHERE name IN ('Walmart', 'Apple');

/*
In most SQL environments, although not in our Udacity's classroom, you can use
single or double quotation marks - and you may NEED to use double quotation
marks if you have an apostrophe within the text you are attempting to pull.

In our Udacity SQL workspaces, note you can include an apostrophe by putting
two single quotes together. For example, Macy's in our workspace would
be 'Macy''s'.
*/
