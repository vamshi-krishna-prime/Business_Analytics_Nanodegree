/*
Udacity's Business Analytics Nanodegree Program
Project: Query a Digital Music Store Database - Chinook Database

Query 5: Classify the customers domain based on business orientation and on
which section does the company should focus their customer services?

Note:
Some customers are from business domain, while some are from domestic/public,
which is determined from, whether the customer is listed under 'Company' column
in the customer table or not.
*/

/*--------------------------------QUERY 5 START-------------------------------*/


WITH customer_type
AS (SELECT
  CASE
    WHEN Company IS NULL
    THEN 1
    ELSE 0
  END AS domestic_customer,
  CASE
    WHEN Company IS NULL
    THEN 0
    ELSE 1
  END AS business_customer
FROM Customer)

SELECT
  SUM(domestic_customer) AS domestic_customers,
  SUM(business_customer) AS business_customers
FROM customer_type;


/*---------------------------------QUERY 5 END--------------------------------*/
/*
Output:

domestic_customers      business_customers
49	                    10
*/
