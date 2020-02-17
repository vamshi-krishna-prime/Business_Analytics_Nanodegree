/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

check whether the channel is 'facebook', then display 'yes' if true.
*/



SELECT id, account_id, occurred_at, channel, CASE WHEN channel = 'facebook' THEN 'yes' END AS is_facebook
FROM web_events
ORDER BY occurred_at;


/*
when channel is facebook, then 'yes' is displayed , if not left NULL value.
*/


SELECT id, account_id, occurred_at, channel, CASE WHEN channel = 'facebook' THEN 'yes' ELSE 'no' END AS is_facebook
FROM web_events
ORDER BY occurred_at;

/*
when channel is 'facebook' then 'yes' is displayed, if not 'no' is displayed.
*/

SELECT id, account_id, occurred_at, channel, CASE WHEN channel = 'facebook' OR channel = 'direct' THEN 'yes' ELSE 'no' END AS is_facebook
FROM web_events
ORDER BY occurred_at;

/*
when channel is either 'facebook' or 'direct', then 'yes' is displayed,
otherwise 'no' is displayed.
*/


/*
CASE - Expert Tip:

1.The CASE statement always goes in the SELECT clause.

2.CASE must include the following components: WHEN, THEN, and END. ELSE is an
optional component to catch cases that didn’t meet any of the other previous
CASE conditions.

3.You can make any conditional statement using any conditional operator
(like WHERE) between WHEN and THEN. This includes stringing together multiple
conditional statements using AND, OR, LIKE, IN.

4.You can include multiple WHEN statements, as well as an ELSE statement again,
to deal with any unaddressed conditions.
*/
