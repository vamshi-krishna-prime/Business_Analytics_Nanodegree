/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL - Data cleaning

Quizzes POSITION & STRPOS:
You will need to use what you have learned about LEFT & RIGHT, as well as what
you know about POSITION or STRPOS to do the following quizzes.

Question 2:
Now see if you can do the same thing (create first and last name columns) for
every rep name in the sales_reps table. Again provide first and last name
columns.
*/

SELECT LEFT(s.name, STRPOS(s.name, ' ') - 1) AS firstname,
       RIGHT(s.name, (LENGTH(s.name) - POSITION(' ' IN s.name))) AS lastname
FROM sales_reps s;

/*
Output 50 results:

firstname	     lastname
Samuel	       Racine
Eugena	       Esser
Michel	       Averette
Renetta	       Carew
Cara	         Clarke
.
.
and 45 results more
*/
