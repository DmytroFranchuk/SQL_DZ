SELECT
month(ODATE) AS mons,
COUNT(*) AS orderCount
FROM orders
GROUP BY 
mons
ORDER BY
orderCount DESC
LIMIT 1;

use hr;

SELECT
AVG(salary) AS averageSelary
FROM employees;

SELECT COUNT(*) AS totalDepartments
FROM departments;

SELECT COUNT(*) AS departmentsWithoutEmployees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

SELECT AVG(salary) AS averagSalary
FROM employees
WHERE department_id = 90;

SELECT MAX(salary) AS maxSalary
FROM employees
WHERE department_id IN (70, 80);