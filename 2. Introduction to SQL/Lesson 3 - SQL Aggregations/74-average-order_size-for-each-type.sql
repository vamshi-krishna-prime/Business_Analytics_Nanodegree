/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the average order value received by the 'parch and posey' company
regarding standard paper, gloss paper and poster paper
*/


SELECT AVG(o.standard_qty) standard_qty_average_order, AVG(o.gloss_qty) gloss_qty_average_order, AVG(o.poster_qty) poster_qty_average_order
FROM order o;


/*
Similar to other software AVG returns the mean of the data - that is the sum
of all of the values in the column divided by the number of values in a column.
This aggregate function again ignores the NULL values in both the numerator and
the denominator.

If you want to count NULLs as zero, you will need to use SUM and COUNT.
However, this is probably not a good idea if the NULL values truly just
represent unknown values for a cell.

MEDIAN - Expert Tip
One quick note that a median might be a more appropriate measure of center for
this data, but finding the median happens to be a pretty difficult thing to get
using SQL alone — so difficult that finding a median is occasionally asked as
an interview question.
*/
