/*
Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).

*/


-- to compare rows in same table -> we will use self join
-- on condition here is designed such that the join w2 table and w1 table both should 
-- have 3 rows in each. 

  
-- The table joins on itself where:     (w1.recordDate = w2.recordDate + 1 day)
-- This creates pairs like:
-- w1.id	w1.recordDate	w1.temperature	w2.id	w2.recordDate	w2.temperature
-- 2	      2015-01-02	    25	          1	    2015-01-01	    10
-- 3	      2015-01-03	    20	          2	    2015-01-02	    25
-- 4	      2015-01-04	    30	          3	    2015-01-03	    20




SELECT 
    w1.id
FROM
     Weather w1
JOIN
     Weather w2
ON 
    DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE
     w1.temperature > w2.temperature;






