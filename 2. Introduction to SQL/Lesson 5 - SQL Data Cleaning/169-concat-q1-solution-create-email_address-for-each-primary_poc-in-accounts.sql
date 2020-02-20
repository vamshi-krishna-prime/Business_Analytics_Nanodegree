/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning

Quizzes CONCAT

Question 1:
Each company in the accounts table wants to create an email address for each
primary_poc. The email address should be the
('first name of the primary_poc '.' last name primary_poc' @ 'company name .com')
*/

/*-----------SOLUTION-------------*/

WITH t1 AS (
 SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
        RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
        name
        FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;

/*
Output 351 results:

first_name	   last_name	     contact
Tamara	       Tuma	           Tamara.Tuma@Walmart.com
Sung	         Shields	       Sung.Shields@Exxon Mobil.com
Jodee	         Lupo	           Jodee.Lupo@Apple.com
Serafina	     Banda	         Serafina.Banda@Berkshire Hathaway.com
.
.
and 348 results
*/
