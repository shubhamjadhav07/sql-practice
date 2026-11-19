WITH EmployeeRanking AS (
    SELECT
        emp_name,
        dept_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS rn
    FROM Employees
)
SELECT
    emp_name,
    dept_id,
    salary
FROM EmployeeRanking
WHERE rn = 1;
