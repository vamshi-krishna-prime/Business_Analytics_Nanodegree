/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Though SQL is not case sensitive (it doesn't care if you write your statements
as all uppercase or lowercase), we discussed some best practices. The order of
the key words does matter!

Example syntax:
*/


SELECT col1, col2
FROM table1
WHERE col3  > 5 AND col4 LIKE '%os%'
ORDER BY col5
LIMIT 10;


/*
Notice, you can retrieve different columns than those being used in the
ORDER BY and WHERE statements. Assuming all of these column names existed
in this way (col1, col2, col3, col4, col5) within a table called table1,
this query would run just fine.
*/
