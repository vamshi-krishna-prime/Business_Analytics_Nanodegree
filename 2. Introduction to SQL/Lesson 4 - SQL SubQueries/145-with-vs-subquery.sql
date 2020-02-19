/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

WITH Statements:

The WITH statement is often called a Common Table Expression or CTE. Though
these expressions serve the exact same purpose as subqueries, they are more
common in practice, as they tend to be cleaner for a future reader to follow
the logic.
1. Queries which results only as tables can be used under 'WITH statements'.
2. 'WITH statements must be declared on top i.e; before using it.
*/

/* Question: Average number of events per day, in each marketing channel. */

/*Subquery Example:*/

SELECT channel,
       AVG(events_per_day) AS avg_events_per_day
FROM ( SELECT DATE_TRUNC('day', w.occurred_at) AS day,
       w.channel AS channel,
       COUNT(*) AS events_per_day
       FROM web_events w
       GROUP BY 1, 2
       ORDER BY 1, 2 ) temp
GROUP BY 1
ORDER BY 2 DESC;


/*----------'With Statements' Example:------------*/

WITH events AS ( SELECT DATE_TRUNC('day', w.occurred_at) AS day,
                        w.channel AS channel,
                        COUNT(*) AS events_per_day
                 FROM web_events w
                 GROUP BY 1, 2
                 ORDER BY 1, 2 )

SELECT channel, AVG(events_per_day) AS avg_events_per_day
FROM events
GROUP BY 1
ORDER BY 2 DESC;

/*
Result:
Output      6 results

channel	    avg_events_per_day
direct	    4.8964879852125693
organic	    1.6672504378283713
facebook	  1.5983471074380165
adwords	    1.5701906412478336
twitter	    1.3166666666666667
banner	    1.2899728997289973
*/
