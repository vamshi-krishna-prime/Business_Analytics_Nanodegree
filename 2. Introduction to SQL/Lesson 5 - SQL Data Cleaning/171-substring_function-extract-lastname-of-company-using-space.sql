/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning
*/

/* substring function example query */

/* normal names in the accounts table */

SELECT name
from accounts
LIMIT 4;

/*
Result:

name
Walmart
Exxon Mobil
Apple
Berkshire Hathaway
*/

/* Extracted last name using space with 'substring' function */

SELECT substring(name from STRPOS(name, ' ')) AS lastname
FROM accounts
LIMIT 4;

/*
Result:

lastname
Walmart
Mobil
Apple
Hathaway
*/

/* Interesting query, odd behaviour/lack of expertise to extract firstname
and lastname of the company 'name' from accounts table */

SELECT SUBSTRING(name from 1 for STRPOS(name, ' ')) AS firstname,
       SUBSTRING(name from POSITION(' ' IN name)) AS lastname
FROM accounts
LIMIT 10;

/*
Output10 results:

firstname	      lastname
                Walmart
Exxon	          Mobil
                Apple
Berkshire	      Hathaway
                McKesson
UnitedHealth	  Group
CVS	            Health
General	        Motors
Ford	          Motor
                AT&T
*/

/* Notice that the names without lastname are moved to lastname column instead
of firstname column, this needs to be corrected */

/*----------------SOLUTION--------------------*/

SELECT CASE WHEN STRPOS(name, ' ') = 0
            THEN SUBSTRING(name from 1 for LENGTH(name))
            ELSE SUBSTRING(name from 1 for STRPOS(name, ' '))
            END AS firstname,
       CASE WHEN STRPOS(name, ' ') = 0
            THEN NULL
            ELSE SUBSTRING(name from POSITION(' ' IN name))
            END AS lastname

FROM accounts
LIMIT 10;

/*
Output10 results:

firstname	      lastname
Walmart
Exxon	          Mobil
Apple
Berkshire	      Hathaway
McKesson
UnitedHealth	  Group
CVS	            Health
General	        Motors
Ford	          Motor
AT&T
*/
