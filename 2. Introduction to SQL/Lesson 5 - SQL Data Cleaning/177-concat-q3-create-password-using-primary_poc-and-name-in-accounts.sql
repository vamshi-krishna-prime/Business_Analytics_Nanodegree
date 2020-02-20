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

WITH names AS (
  SELECT CASE WHEN STRPOS(primary_poc, ' ') = 0
              THEN primary_poc
              ELSE LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1)
              END AS firstname,
         CASE WHEN STRPOS(primary_poc, ' ') = 0
              THEN NULL
              ELSE RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc))
              END AS lastname,
         UPPER(REPLACE(name, ' ', '')) AS company_name
  FROM accounts)

SELECT CONCAT(
          LOWER(LEFT(firstname, 1)),
          LOWER(RIGHT(firstname, 1)),
          LOWER(LEFT(lastname, 1)),
          LOWER(RIGHT(lastname, 1)),
          LENGTH(firstname),
          LENGTH(lastname),
          company_name) AS password
FROM names;

/*
Output 351 results:

password
tata64WALMART
sgss47EXXONMOBIL
jelo54APPLE
saba85BERKSHIREHATHAWAY
asce76MCKESSON
.
.
and 346 other results
*/
