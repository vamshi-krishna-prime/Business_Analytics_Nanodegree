/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Advanced JOINs

Advanced JOINs:

Section 6: JOINs with Comparison Operators

*/

SELECT s.id AS sales_id,
       s.name AS sales_rep,
       s.region_id AS region_id,
       a.*
FROM accounts a
LEFT JOIN sales_reps s
ON a.sales_rep_id = s.id

/*  351 resuts */


/*------------------------------*/

SELECT a.name AS account_name,
	   a.primary_poc AS primary_contact,
       s.name AS sales_rep
FROM accounts a
LEFT JOIN sales_reps s
ON a.primary_poc < s.name;

/* 7952 results

The primary point of contact's full name comes before the sales
representative's name alphabetically
*/

/*------------------------------*/

SELECT accounts.name as account_name,
       accounts.primary_poc as poc_name,
       sales_reps.name as sales_rep_name
FROM accounts
LEFT JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id
ORDER BY 1;

/* 351 results without NULLS */

/*------------------------------*/

SELECT accounts.name as account_name,
       accounts.primary_poc as poc_name,
       sales_reps.name as sales_rep_name
FROM accounts
LEFT JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id
AND accounts.primary_poc < sales_reps.name
ORDER BY 1;

/* 351 results with NULLS */

/*------------------------------*/

SELECT accounts.name as account_name,
       accounts.primary_poc as poc_name,
       sales_reps.name as sales_rep_name
FROM accounts
JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id
AND accounts.primary_poc < sales_reps.name
ORDER BY 1;

/* 163 results without NULLS */

/*------------------------------*/

SELECT accounts.name as account_name,
       accounts.primary_poc as poc_name,
       sales_reps.name as sales_rep_name
FROM accounts
LEFT JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id
WHERE accounts.primary_poc < sales_reps.name
ORDER BY 1;

/* 163 results without NULLS */

/*
Expert Tip
If you recall from earlier lessons on joins, the join clause is evaluated
before the where clause -- filtering in the join clause will eliminate rows
before they are joined, while filtering in the WHERE clause will leave those
rows in and produce some nulls.
-----------
1. We are filtering in the JOIN clause in the above query, then why are we still
getting NULLS?

 Ans. Because we are using LEFT JOIN, which means the rows that does not satisfy
 the condition also remains with NULL values in them. See the queries number
 2 and 3 from bottom to better understanding
-----------
2. What is the difference between using the 'WHERE clause' and
'conditional JOIN' ? Both achieve the same result without any NULLS.
-----------
3. Also according to the expert tip mentioned above, filtering the rows using
WHERE clause will leave the rows in and produce NULLs, which is not the case
in the last query.
*/
