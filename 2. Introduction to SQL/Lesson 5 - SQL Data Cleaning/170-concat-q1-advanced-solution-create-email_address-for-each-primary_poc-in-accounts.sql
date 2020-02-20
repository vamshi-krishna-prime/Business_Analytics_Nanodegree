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

/*--------------------------*/

/* The above method is correct for all '.com' companies, but incorrect for the
companies with '.net' or other extensions. */

/* STEP 1: So lets extract the website extension from the website column in
the accounts */

SELECT RIGHT(a.website, LENGTH(a.website) - POSITION('.' IN a.website)) AS web_subpart
FROM accounts a

/*
Output351 results:

web_subpart
walmart.com
exxonmobil.com
apple.com
.
.
and 348 other results
*/

/* STEP 2: Extract the website extension from the web_subpart */

WITH website_part AS (SELECT RIGHT(a.website, LENGTH(a.website) - POSITION('.' IN a.website)) AS web_subpart
                      FROM accounts a)

SELECT RIGHT(web_subpart, LENGTH(web_subpart) - STRPOS(web_subpart, '.')) AS extension
FROM website_part

/*
Output351 results:

extension
com
com
com
com
.
.
and 348 other results
*/

/* STEP 3: */
/*----------------SOLUTION----------------*/

WITH website_part AS (SELECT RIGHT(a.website, LENGTH(a.website) - POSITION('.' IN a.website)) AS web_subpart,
                             a.name
                      FROM accounts a),

     web_extension AS (SELECT RIGHT(web_subpart, LENGTH(web_subpart) - STRPOS(web_subpart, '.')) AS extension,
                              name
                       FROM website_part),

     customer_details AS (SELECT LEFT(a.primary_poc, STRPOS(a.primary_poc, ' ') - 1 ) AS firstname,
                                 RIGHT(a.primary_poc, LENGTH(a.primary_poc) - POSITION(' ' IN a.primary_poc)) AS lastname,
                                 a.name
                          FROM accounts a)

SELECT CONCAT(c.firstname, '.', c.lastname, '@', c.name, '.', w.extension) AS email_address
FROM customer_details c
JOIN web_extension w
ON w.name = c.name
ORDER BY w.extension DESC;

/*
Output351 results:

email_address
Deeanna.Burpo@TIAA.org
Grazyna.Dewald@Community Health Systems.net
Jodee.Lupo@Apple.com
Serafina.Banda@Berkshire Hathaway.com
Angeles.Crusoe@McKesson.com
Savanna.Gayman@UnitedHealth Group.com
.
.
and 345 other results
*/

/* Hence websites with '.org' and '.net' have the contact email addresses
with the same extensions instead of '.com' extension */
