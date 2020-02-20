/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL - Data cleaning

Quizzes POSITION & STRPOS:
You will need to use what you have learned about LEFT & RIGHT, as well as what
you know about POSITION or STRPOS to do the following quizzes.

Question 1:
Use the accounts table to create first and last name columns that hold the
first and last names for the primary_poc.
*/

SELECT LEFT(a.primary_poc, POSITION(' ' IN a.primary_poc) - 1) AS first_name,
       RIGHT(a.primaty_poc, (LENGTH(a.primary_poc) - STRPOS(a.primary_poc, ' '))) AS lastname
FROM accounts a;

/*
Output 351 results:

first_name	     lastname
Tamara	         Tuma
Sung	           Shields
Jodee	           Lupo
Serafina	       Banda
Angeles	         Crusoe
.
.
and 346 more results
*/
