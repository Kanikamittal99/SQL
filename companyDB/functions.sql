USE company;

-- Find the number of employees
SELECT COUNT(emp_id)
FROM employee;

-- How many employees have supervisors
SELECT emp_id
FROM employee 
WHERE super_id <> 'NULL';

-- Find all the supervisors
SELECT DISTINCT super_id
FROM employee;


-- Find the average of all employee's salaries
SELECT AVG(salary)
FROM employee;

-- Find the sum of all employee's salaries
SELECT SUM(salary)
FROM employee;

-- Find out how many males and females there are
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

-- Find the total sales of each salesman
SELECT emp_id, SUM(total_sales)
FROM works_with
GROUP BY emp_id;

-- Find the total amount of money spent by each client
SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id;

-- Find any employee born in October
SELECT * 
FROM employee
WHERE MONTH(birth_day) = 10;


-- Find the age of employee that has no supervisor (Can use is null too)
SELECT *, TIMESTAMPDIFF(YEAR, birth_day, CURDATE()) AS age
FROM employee
WHERE super_id <=> NULL;

-- Find how many employees each manager manages
SELECT super_id, COUNT(emp_id)
FROM employee
WHERE super_id IS NOT NULL
GROUP BY super_id;




