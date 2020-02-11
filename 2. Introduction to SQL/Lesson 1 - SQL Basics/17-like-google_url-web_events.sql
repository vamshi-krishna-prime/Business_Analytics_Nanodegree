/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Imagine yourself as the 'Digital Marketing Manager' at 'Parch and Posey'
company. Identify the web traffic that came via any 'Google' page.
Also display, id, account_id, accurred_at and channel columns in the
'web_events' table.

Hint: links are listed under 'referrer_url' column in the 'web_events' table.
*/

SELECT id, account_id, occurred_at, channel, referrer_url
FROM web_events
WHERE referrer_url LIKE '%google%';

/*
WHERE referrer_url = '%google%'
does not work as '=' demands exact match

The LIKE operator is extremely useful for working with text. You will use
'LIKE' within a 'WHERE' clause. The 'LIKE' operator is frequently used with '%'.
The '%' tells us that we might want any number of characters leading up to a
particular set of characters or following a certain set of characters, as we
saw with the google syntax above. Remember you will need to use single quotes
for the text you pass to the 'LIKE' operator, because of this lower and
uppercase letters are not the same within the string. Searching for 'T' is not
the same as searching for 't'. In other SQL environments (outside the classroom)
, you can use either single or double quotes.

you might use these types of applications to identify phone numbers from a
certain region, or an individual where you can't quite remember the full name.
*/
