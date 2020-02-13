/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 2 : SQL Joins

Provide a table that provides the region for each sales_rep along with their
associated accounts. Your final table should include three columns:
the region name, the sales rep name, and the account name.
Sort the accounts alphabetically (A-Z) according to account name.
*/



SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
ORDER BY a.name;


/*
If you have two or more columns in your SELECT that have the same name after
the table name such as accounts.name and sales_reps.name you will need to
alias them. Otherwise it will only show one of the columns. You can alias
them like accounts.name AS AcountName, sales_rep.name AS SalesRepName

For example in the above query, if we write
`SELECT r.name region, s.name rep, a.name account`
then the result will have only one column from `a.name account` because
all three columns have same name, it is overwritten twice.
*/
