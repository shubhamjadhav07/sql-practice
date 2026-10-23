
/*
Problem: The Report
Source: https://www.hackerrank.com/challenges/the-report/problem

Requirements:
1. Display Name, Grade, and Marks.
2. Hide names for students with grades below 8.
3. Sort grades in descending order.
4. For grades 8-10, sort names alphabetically.
5. For grades 1-7, sort marks in ascending order.

Concepts:
INNER JOIN, BETWEEN, CASE WHEN, ORDER BY
*/

SELECT
    CASE
        WHEN G.Grade < 8 THEN 'NULL'
        ELSE S.Name
    END AS Name,
    G.Grade,
    S.Marks
FROM Students AS S
INNER JOIN Grades AS G
    ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY
    G.Grade DESC,
    CASE WHEN G.Grade >= 8 THEN S.Name END ASC,
    CASE WHEN G.Grade < 8 THEN S.Marks END ASC;
