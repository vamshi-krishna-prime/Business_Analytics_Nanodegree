/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the Minimum and maximum orders received by the 'parch and posey' company
regarding standard paper, gloss paper and poster paper
*/


SELECT MIN(o.standard_qty) standard_min, MIN(o.gloss_qty) gloss_min, MIN(o.poster_qty) poster_min, MAX(standard_qty) standard_max, MAX(o.gloss_qty) gloss_max, MAX(o.poster_qty) poster_max
FROM orders o;

/*
Notice that MIN and MAX are aggregators that again ignore NULL values. Check
the expert tip below for a cool trick with MAX & MIN.

Expert Tip
Functionally, MIN and MAX are similar to COUNT in that they can be used on
non-numerical columns. Depending on the column type, MIN will return the
lowest number, earliest date, or non-numerical value as early in the alphabet
as possible. As you might suspect, MAX does the opposite—it returns the
highest number, the latest date, or the non-numerical value closest
alphabetically to “Z.”
*/
