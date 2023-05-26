use hr;
select * from employees;

SELECT 
    department_id,
    MAX(CASE WHEN salary > 10000 THEN 1 ELSE 0 END) AS bigSalary
FROM
    employees
GROUP BY department_id;

SELECT 
    department_id,
    MIN(CASE WHEN salary > 10000 THEN 1 ELSE 0 END) AS bigSalary
FROM
    employees
GROUP BY department_id;