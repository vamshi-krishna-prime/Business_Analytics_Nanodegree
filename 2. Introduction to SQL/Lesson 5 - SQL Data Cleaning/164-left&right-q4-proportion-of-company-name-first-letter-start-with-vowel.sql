/*  DOUBT : why final solution not working ?
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL - Data cleaning

LEFT & RIGHT Quizzes

Question 4:
Consider vowels as a, e, i, o, and u. What proportion of company names start
with a vowel, and what percent start with anything else?
*/

WITH first_letter_type AS (SELECT LEFT(UPPER(a.name), 1) AS first_letter,
                                  CASE WHEN LEFT(UPPER(a.name), 1) IN ('A', 'E', 'I', 'O', 'U') THEN 'vowel'
                                  ELSE 'other' END AS letter_type
                           FROM accounts a)

SELECT letter_type, COUNT(*) AS type_count
FROM first_letter_type
GROUP BY 1
ORDER BY 2 DESC

/*
Result:
letter_type	    type_count
other	            271
vowel	             80
*/

/* The above query returns count in the same column which makes it difficult to
perform furthur calculations since it is not a optimal method to isolate vowel
count and other count */

/*STEP 1: So, lets try to isolate the count into individual columns */

WITH letter_type AS (SELECT LEFT(UPPER(a.name), 1) AS first_letter,
                            CASE WHEN LEFT(UPPER(a.name), 1) IN ('A', 'E', 'I', 'O', 'U') THEN 1 ELSE 0 END AS vowel,
                            CASE WHEN LEFT(UPPER(a.name), 1) IN ('A', 'E', 'I', 'O', 'U') THEN 0 ELSE 1 END AS other
                     FROM accounts a)

SELECT SUM(vowel) AS vowel_count,
       SUM(other) AS other_count
FROM letter_type;

/*
vowel_count   	other_count
    80	            271
*/

/*STEP 2: */
/*-------------------MY SOLUTION Approach 1-------------------*/
/* Now find the percentage of vowel count as the first letter in company names*/

WITH letter_type AS (SELECT LEFT(UPPER(a.name), 1) AS first_letter,
                            CASE WHEN LEFT(UPPER(a.name), 1) IN ('A', 'E', 'I', 'O', 'U') THEN 1 ELSE 0 END AS vowel,
                            CASE WHEN LEFT(UPPER(a.name), 1) IN ('A', 'E', 'I', 'O', 'U') THEN 0 ELSE 1 END AS other
                     FROM accounts a),

letter_type_count AS (SELECT SUM(vowel) AS vowel_count,
                             SUM(other) AS other_count
                      FROM letter_type)

SELECT (l.vowel_count) / ((l.vowel_count + l.other_count) * 0.01) AS vowel_proportion,
       (l.other_count) / ((l.vowel_count + l.other_count) * 0.01) AS other_proportion
FROM letter_type_count l;


/*
IMPORTANT:
1. convert all coompanies names into upper case or lower case letters, to count
all vowels irrespective of letter case.
2. In the CASE, must use capital vowels since all the companies names are
converted in to upper case letters
3. Must multiply with 0.01 to the denominator in the main query to find percentages
otherwise it will either result in 'zero division error' or returns value '0'.
*/


/*-------------------MY SOLUTION Approach 21-------------------*/
/* Now find the percentage of vowel count as the first letter in company names*/
SELECT (vowels) / ((vowels + others) * 0.01) AS percentage_vowels,
       (others) / ((vowels + others) * 0.01) AS percenatge_others
FROM (
    SELECT SUM(vowels) AS vowels, SUM(others) AS others
    FROM (
        SELECT name,
        CASE WHEN LEFT(UPPER(name), 1) IN ('A', 'E', 'I', 'O', 'U') THEN 1 ELSE 0 END AS vowels,
        CASE WHEN LEFT(UPPER(name), 1) IN ('A', 'E', 'I', 'O', 'U') THEN 0 ELSE 1 END AS others
        FROM accounts
        ) sub
    ) sub_state;
