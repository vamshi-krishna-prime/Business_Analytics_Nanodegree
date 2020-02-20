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

/*---------------------------------SOLUTION-----------------------------------*/

/* New Function 'REPLACE' is introduced in this query */

SELECT LOWER(CONCAT(REPLACE(primary_poc, ' ', '.'), '@', REPLACE(name, ' ', ''), '.com')) AS contact
FROM accounts;

/*
Output 351 results:

contact
tamara.tuma@walmart.com
sung.shields@exxonmobil.com
jodee.lupo@apple.com
serafina.banda@berkshirehathaway.com
.
.
and 347 other results
*/

/*-----------------------------MOST ACCURATE SOLUTION-------------------------*/
/* but the most accurate solution is the one with the correct web extension,
rather than all '.com' extensions */

WITH
website_part AS (
  SELECT RIGHT(a.website, LENGTH(a.website) - POSITION('.' IN a.website)) AS web_subpart,
         id
  FROM accounts a),

web_extension AS (
  SELECT RIGHT(web_subpart, LENGTH(web_subpart) - STRPOS(web_subpart, '.')) AS extension,
         id
  FROM website_part)

  SELECT LOWER(CONCAT(REPLACE(primary_poc, ' ', '.'), '@', REPLACE(name, ' ', ''), '.', w.extension)) AS contact
  FROM accounts a
  JOIN web_extension w
  ON a.id = w.id;

/*
Output 351 results:

contact
tamara.tuma@walmart.com
sung.shields@exxonmobil.com
jodee.lupo@apple.com
serafina.banda@berkshirehathaway.com
.
.
and 347 other results
*/

/* But if you add one more line ordering the result with respect to web
extension you can see the difference

ADDED LINE: */

ORDER BY w.extension DESC

/*
Output 351 results:

contact
deeanna.burpo@tiaa.org
grazyna.dewald@communityhealthsystems.net
jodee.lupo@apple.com
serafina.banda@berkshirehathaway.com
.
.
and 347 other results
*/

/* In the above query it is clear that the first and second contacts use the
web extensions other than '.com'.
The above line is added only to check the correctness of the query */
