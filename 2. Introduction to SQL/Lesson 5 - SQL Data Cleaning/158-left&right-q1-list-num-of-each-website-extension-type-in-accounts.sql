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

/*STEP 1: Lists the web extensions and confirms that all extension are whether
'dotcom' or 'other' */

SELECT a.website,
       RIGHT(a.website, 3) AS extension,
       CASE WHEN RIGHT(a.website, 3) = 'com' THEN 'dotcom'
            ELSE 'other' END AS web_ext_type
FROM accounts a
ORDER BY 1;

/*STEP 2: */

WITH extension_list AS (SELECT RIGHT(a.website, 3) AS extension
FROM accounts a
ORDER BY 1)

SELECT extension_list AS extension_type, COUNT(*) AS ext_count
FROM extension_list
GROUP BY 1
ORDER BY 2 DESC;

/*
Result:
extension_type	     ext_count
(com)	                 349
(net)	                   1
(org)	                   1
*/


WITH extension_list AS (SELECT RIGHT(a.website, 3) AS extension
FROM accounts a)

SELECT el.extension as extension_type, COUNT(*) AS web_num
FROM extension_list el
GROUP BY 1
ORDER BY 2 DESC;
