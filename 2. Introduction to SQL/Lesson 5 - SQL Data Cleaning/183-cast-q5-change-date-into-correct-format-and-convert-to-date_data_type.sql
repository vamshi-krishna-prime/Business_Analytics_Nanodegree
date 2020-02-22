/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning

CAST Quizzes

For this set of quiz questions, you are going to be working with a single table
in the environment below. This is a different dataset than Parch & Posey, as
all of the data in that particular dataset were already clean.

-----------Note: Database for these queries are not available locally-----------

Question 5:
write a query to change the date into correct SQL date format. You'll need to
use atleast 'SUBSTRING' and 'CONCAT' to perform this operation.

Once you have created a column in the correct format, use either 'CAST' or '::'
to convert this to a date.
*/


/*
Date in sf_crime_data table is in the format :
01/31/2014 08:00:00 AM +0000

The correct SQL date format is (yyyy-mm-dd)
*/

/* Solution using CAST function */

SELECT CAST(SUBSTRING(date FROM 7 FOR 4) || '-' || SUBSTRING(date FROM 1 FOR 2) || '-' || SUBSTRING(date FROM 4 FOR 2) AS date) AS correct_date
FROM sf_crime_data
LIMIT 4;


/*
Output 4 results:

correct_date
2014-01-31T00:00:00.000Z
2014-01-31T00:00:00.000Z
2014-01-31T00:00:00.000Z
2014-01-31T00:00:00.000Z
*/

/* Solution using '::' operator */

SELECT (SUBSTRING(date FROM 7 FOR 4) || '-' || SUBSTRING(date FROM 1 FOR 2) || '-' || SUBSTRING(date FROM 4 FOR 2))::date AS correct_date
FROM sf_crime_data
LIMIT 4;

/*
Output 4 results:

correct_date
2014-01-31T00:00:00.000Z
2014-01-31T00:00:00.000Z
2014-01-31T00:00:00.000Z
2014-01-31T00:00:00.000Z
*/
