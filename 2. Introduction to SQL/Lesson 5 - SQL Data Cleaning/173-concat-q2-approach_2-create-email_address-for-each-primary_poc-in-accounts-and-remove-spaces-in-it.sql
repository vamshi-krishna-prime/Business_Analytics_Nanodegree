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
       CONCAT(first_name, '.', last_name, '@', name, '.com') AS contact
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

/*---------------------------APPROACH 2 START---------------------------------*/
/* APPROACH 1: Take the query with that returns the email addresses and remove
the spaces in them */

/* STEP 1: */

WITH t1 AS (
 SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,
        RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
        name
        FROM accounts),

      t2 AS (
 SELECT first_name,
        last_name,
        CONCAT(first_name, '.', last_name, '@', name, '.com') AS contact
 FROM t1),

      t3 AS (
 SELECT CASE WHEN STRPOS(contact, ' ') = 0
             THEN contact
             ELSE LEFT(contact, POSITION(' ' IN contact) - 1)
             END AS left_half,
        CASE WHEN STRPOS(contact, ' ') = 0
             THEN NULL
             ELSE RIGHT(contact, LENGTH(contact) - POSITION(' ' IN contact))
             END AS right_half
 FROM t2)

SELECT CONCAT(LOWER(left_half), LOWER(right_half)) AS email_address
FROM t3;

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

/* The main flaw in this approach is we have given a common web extension to
all contacts (.com) but some websites have '.net' and '.org' extension. The
rest of the method is correct. */

/*-----------------------------APPROACH 2 END---------------------------------*/

/* Refer query 172 for more accurate, APPROACH 1
   Refer query 174 for better and smaller approach
   Refer query 176 for the most efficient and smaller approach */
