/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning

Quizzes CONCAT

Question 3:
We would also like to create an initial password, which they will change after
their first log in. The first password will be
the first letter of the primary_poc's first name (lowercase),
then the last letter of their first name (lowercase),
the first letter of their last name (lowercase),
the last letter of their last name (lowercase),
the number of letters in their first name,
the number of letters in their last name,
and then the name of the company they are working with, all capitalized
with no spaces.
*/

WITH t1 AS (
 SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
        RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
        name
 FROM accounts)
SELECT first_name,
       last_name,
       CONCAT(first_name, '.', last_name, '@', name, '.com'),
       LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name), 1) || LENGTH(first_name) || LENGTH(last_name) || REPLACE(UPPER(name), ' ', '')
FROM t1;

/*
Output 351 results:

first_name	  last_name	    concat	                        ?column?
Tamara	      Tuma	        Tamara.Tuma@Walmart.com	        tata64WALMART
Sung	        Shields	      Sung.Shields@Exxon Mobil.com	  sgss47EXXONMOBIL
Jodee	        Lupo	        Jodee.Lupo@Apple.com	          jelo54APPLE
.
.
and 348 other results
*/

/* For better 'contact' (email address) query refer query 170 */
