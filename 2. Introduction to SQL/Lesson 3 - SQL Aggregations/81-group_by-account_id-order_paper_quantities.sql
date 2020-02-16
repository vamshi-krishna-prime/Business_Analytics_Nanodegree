/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Calculate the SUM of individual paper quantities grouped by/ related to
individual accounts.
*/



SELECT o.account_id, SUM(o.standard_qty) standard_sum, SUM(o.gloss_qty) gloss_sum, SUM(o.poster_qty) poster_sum
FROM orders o
GROUP BY o.account_id
ORDER BY o.account_id;


/*
The key takeaways here:
1. GROUP BY can be used to aggregate data within subsets of the data. For
example, grouping for different accounts, different regions, or different
sales representatives.
2. Any column in the SELECT statement that is not within an aggregator must be
in the GROUP BY clause.
3. The GROUP BY always goes between WHERE and ORDER BY.
4. ORDER BY works like SORT in spreadsheet software.
*/

/*
GROUP BY - Expert Tip
Before we dive deeper into aggregations using GROUP BY statements, it is worth
noting that SQL evaluates the aggregations before the LIMIT clause. If you
don’t group by any columns, you’ll get a 1-row result—no problem there. If you
group by a column with enough unique values that it exceeds the LIMIT number,
the aggregates will be calculated, and then some rows will simply be omitted
from the results.

This is actually a nice way to do things because you know you’re going to get
the correct aggregates. If SQL cuts the table down to 100 rows, then performed
the aggregations, your results would be substantially different. The above
query’s results exceed 100 rows, so it’s a perfect example. In the next
concept, use the SQL environment to try removing the LIMIT and running it again
to see what changes.
*/
