/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL - Data cleaning

LEFT & RIGHT Quizzes

Question 1:
In the accounts table, there is a column holding the website for each company.
The last three digits specify what type of web address they are using. A list
of extensions (and pricing) is provided here (https://iwantmyname.com/domains).
Pull these extensions and provide how many of each website type exist in the
accounts table.
*/


SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

/*
Result:
domain	      num_companies
com	              349
net	                1
org	                1
*/
