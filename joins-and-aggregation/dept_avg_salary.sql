SELECT
    d.dept_name,
    AVG(e.salary) AS avg_salary
FROM Employees e
JOIN Departments d
    ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 55000;
