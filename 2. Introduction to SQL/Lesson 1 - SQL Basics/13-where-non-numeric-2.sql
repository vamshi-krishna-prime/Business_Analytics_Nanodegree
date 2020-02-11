/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Filter the accounts table to include the company name, website, and the
primary point of contact (primary_poc) just for the 'Exxon Mobil' company in the
accounts table.
*/

SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';
