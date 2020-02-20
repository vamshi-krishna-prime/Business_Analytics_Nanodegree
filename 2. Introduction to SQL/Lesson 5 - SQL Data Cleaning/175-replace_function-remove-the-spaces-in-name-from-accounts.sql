/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning
*/

/*
REPLACE Function

remove the space in between the company names and list them
*/

SELECT REPLACE(primary_poc, ' ', '') AS company_names
FROM accounts;

/*
Output 351 results:

company_names
TamaraTuma
SungShields
JodeeLupo
SerafinaBanda
.
.
and 347 other results
*/
