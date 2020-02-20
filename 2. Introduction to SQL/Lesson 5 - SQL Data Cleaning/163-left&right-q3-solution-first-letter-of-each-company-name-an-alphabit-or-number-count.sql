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

/*----------------SOLUTION--------------------*/

SELECT SUM(num) nums, SUM(letter) letters
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9')
                        THEN 1 ELSE 0 END AS num,
                   CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9')
                        THEN 0 ELSE 1 END AS letter
      FROM accounts) t1;

/*
Result:

nums	     letters
 1	         350
*/

/* There are 350 company names that start with a letter and 1 that starts with
a number. This gives a ratio of 350/351 that are company names that start with
a letter or 99.7%. */
