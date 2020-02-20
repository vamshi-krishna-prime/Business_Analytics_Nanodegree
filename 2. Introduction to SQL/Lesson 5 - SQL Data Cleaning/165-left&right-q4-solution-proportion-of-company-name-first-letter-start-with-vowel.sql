/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL - Data cleaning

LEFT & RIGHT Quizzes

Question 4:
Consider vowels as a, e, i, o, and u. What proportion of company names start
with a vowel, and what percent start with anything else?
*/

SELECT SUM(vowels) vowels, SUM(other) other
FROM (SELECT name,
             CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U')
                  THEN 1 ELSE 0 END AS vowels,
             CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U')
                  THEN 0 ELSE 1 END AS other
      FROM accounts) t1;

/*
RESULT:
vowels	     other
80	         271
*/

/*
There are 80 company names that start with a vowel and 271 that start with
other characters. Therefore 80/351 are vowels or 22.8%. Therefore, 77.2% of
company names do not start with vowels.
*/
