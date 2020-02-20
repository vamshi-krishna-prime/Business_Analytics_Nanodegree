/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL - Data cleaning

LEFT & RIGHT Quizzes

Question 3:
Use the accounts table and a CASE statement to create two groups: one group of
company names that start with a number and a second group of those company
names that start with a letter. What proportion of company names start with a
letter?
*/

/*STEP 1: list whether first letter of each company name whether a alphabit or
numeric. */
SELECT LEFT(a.name, 1) AS first_letter,
       CASE WHEN LEFT(a.name, 1) IN ('1', '2', '3', '4', '5', '6', '7', '8', '9', '0') THEN 'number'
            ELSE 'alphabit' END AS letter_type
FROM accounts a
ORDER BY 1;

/*
Output 351 results:

first_letter	   letter_type
3	               number
A	               alphabit
A	               alphabit
A	               alphabit
.
.
and 347 other results
*/

/*----------------SOLUTION--------------------*/

WITH data_type AS (SELECT LEFT(a.name, 1) AS first_letter,
                          CASE WHEN LEFT(a.name, 1) IN ('1', '2', '3', '4', '5', '6', '7', '8', '9', '0') THEN 'number'
                               ELSE 'alphabit' END AS letter_type
                   FROM accounts a
                   ORDER BY 1)

SELECT letter_type, COUNT(*) AS num_companies
FROM data_type
GROUP BY 1
ORDER BY 2 DESC;

/*
Output2 results:

letter_type	       num_companies
alphabit	             350
number	                 1
*/
