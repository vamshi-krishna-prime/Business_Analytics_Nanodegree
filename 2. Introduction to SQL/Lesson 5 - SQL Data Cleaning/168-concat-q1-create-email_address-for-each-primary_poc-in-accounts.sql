/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning

Quizzes CONCAT

Question 1:
Each company in the accounts table wants to create an email address for each
primary_poc. The email address should be the
('first name of the primary_poc '.' last name primary_poc' @ 'company name .com')
*/

WITH customer_details AS (SELECT LEFT(a.primary_poc, STRPOS(a.primary_poc, ' ') - 1) AS firstname,
                                 RIGHT(a.primary_poc, (LENGTH(a.primary_poc) - POSITION(' ' IN a.primary_poc))) AS lastname,
                                 a.name AS company_name
                          FROM accounts a)

SELECT CONCAT(firstname, '.', lastname, '@', company_name, '.com') AS email_address
FROM customer_details;

/*
Output 351 results:

email_address
Tamara.Tuma@Walmart.com
Sung.Shields@Exxon Mobil.com
Jodee.Lupo@Apple.com
.
.
and 348 results
*/
