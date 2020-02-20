/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning

Quizzes CONCAT

Question 2:
Each company in the accounts table wants to create an email address for each
primary_poc. The email address should be the
('first name of the primary_poc '.' last name primary_poc' @ 'company name .com')

You may have noticed that in the previous solution some of the company names
include spaces, which will certainly not work in an email address. See if you
can create an email address that will work by removing all of the spaces in the
account name, but otherwise your solution should be just as in question 1. Some
helpful documentation is here:
(https://www.postgresql.org/docs/8.1/functions-string.html)
*/

/* previous solution: */

WITH t1 AS (
 SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
 RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
 name
 FROM accounts)

SELECT first_name,
       last_name,
       CONCAT(first_name, '.', last_name, '@', name, '.com')
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

/* Notice spacews in the email extension '@Exxon mobil.com'. The task is to
remove spaces from it and convert the letters to lowercase as email id's
does not have upper case letters */

/*
Points to remember:
In the above query all the 'primary_poc' have both firstname and lastname,
hence the above query worked perfectly but in the 'name', some have two words
while some have only one word, so above methodology does not work (refer query
171 for more information )
*/

/*---------------------------APPROACH 1 START---------------------------------*/
/* APPROACH 1: concat the website 'name' to remove spaces and then concat
along with other columns to form the email addresses without any spaces in it */

/* STEP 1: Extract firstname and lastname from 'name' column in accounts table*/

SELECT CASE WHEN STRPOS(name, ' ') = 0
            THEN name
            ELSE LEFT(name, POSITION(' ' IN name) - 1 )
            END AS firstname,
       CASE WHEN STRPOS(name, ' ') = 0
            THEN NULL
            ELSE RIGHT(name, LENGTH(name) - POSITION(' ' IN name))
            END AS lastname
FROM accounts a

/*
Output 351 results:

firstname	    lastname
Walmart
Exxon	        Mobil
Apple
Berkshire	    Hathaway
.
.
and 347 other results
*/

/* STEP 2: Now concatenate the both firstname and lastname extracted from
'name' column in accounts table while converting them to lower case as
email id's does not contain uppercase letters */

WITH first_and_last AS (SELECT CASE WHEN STRPOS(name, ' ') = 0
                                    THEN name
                                    ELSE LEFT(name, POSITION(' ' IN name) - 1 )
                                    END AS firstname,
                               CASE WHEN STRPOS(name, ' ') = 0
                                    THEN NULL
                                    ELSE RIGHT(name, LENGTH(name) - POSITION(' ' IN name))
                                    END AS lastname
                        FROM accounts a)

SELECT CONCAT(LOWER(firstname), LOWER(lastname)) AS company_name
FROM first_and_last

/*
Output 351 results:

company_name
walmart
exxonmobil
apple
berkshirehathaway
.
.
and 347 other results
*/

/* STEP 3: The given solution is correct for all '.com' companies, but
incorrect for the companies with '.net' or other extensions. So lets extract
the website extension from the website column in the accounts */

WITH website_part AS (
  SELECT RIGHT(a.website, LENGTH(a.website) - POSITION('.' IN a.website)) AS web_subpart,
         id
  FROM accounts a),

web_extension AS (
  SELECT RIGHT(web_subpart, LENGTH(web_subpart) - STRPOS(web_subpart, '.')) AS extension,
         id
  FROM website_part)

SELECT id, extension
FROM web_extension

/*
Output 351 results:
id	extension
1001	com
1011	com
1021	com
1031	com
.
.
and 347 other results
*/

/* STEP 4: Add 'id' column to each table for JOIN purpose and concatenate*/
/*--------------SOLUTION----------------*/

WITH
website_part AS (
  SELECT RIGHT(a.website, LENGTH(a.website) - POSITION('.' IN a.website)) AS web_subpart,
         id
  FROM accounts a),

web_extension AS (
  SELECT RIGHT(web_subpart, LENGTH(web_subpart) - STRPOS(web_subpart, '.')) AS extension,
         id
  FROM website_part),

first_and_last AS (
  SELECT CASE WHEN STRPOS(name, ' ') = 0
              THEN name
              ELSE LEFT(name, POSITION(' ' IN name) - 1 )
              END AS firstname,
          CASE WHEN STRPOS(name, ' ') = 0
              THEN NULL
              ELSE RIGHT(name, LENGTH(name) - POSITION(' ' IN name))
              END AS lastname,
          id
  FROM accounts a),

company_details AS (
  SELECT CONCAT(LOWER(firstname), LOWER(lastname)) AS company_name,
         id
  FROM first_and_last),

customer_details AS (
  SELECT LEFT(a.primary_poc, STRPOS(a.primary_poc, ' ') - 1) AS firstname,
         RIGHT(a.primary_poc, LENGTH(a.primary_poc) - POSITION(' ' IN a.primary_poc)) AS lastname,
         id
  FROM accounts a)

SELECT CONCAT(LOWER(cu.firstname), '.', LOWER(cu.lastname), '@', co.company_name, '.', w.extension) AS email_address
FROM customer_details cu
JOIN company_details co
ON cu.id = co.id
JOIN web_extension w
ON cu.id = w.id;

/*
Output 351 results:

email_address
tamara.tuma@walmart.com
sung.shields@exxonmobil.com
jodee.lupo@apple.com
serafina.banda@berkshirehathaway.com
.
.
and 347 other results
*/

/*-----------------------------APPROACH 1 END---------------------------------*/

/* Refer query 173 for APPROACH 2
   Refer query 174 for better and smaller approach
   Refer query 176 for the most efficient and smaller approach*/
