/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL Data cleaning

CAST Quizzes

For this set of quiz questions, you are going to be working with a single table
in the environment below. This is a different dataset than Parch & Posey, as
all of the data in that particular dataset were already clean.

-----------Note: Database for these queries are not available locally-----------

Question 3:
Look at the 'date' column in the 'sf_crime_data' table. check whether the date
is in correct format or not.
*/

SELECT date
FROM sf_crime_data
LIMIT 4;

/*
date
01/31/2014 08:00:00 AM +0000
01/31/2014 08:00:00 AM +0000
01/31/2014 08:00:00 AM +0000
01/31/2014 08:00:00 AM +0000
*/

/* The date is not in correct format (yyyy-mm-dd) */
