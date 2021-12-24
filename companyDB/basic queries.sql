-- Find all employees ordered by salary
SELECT * 
FROM employee
ORDER BY salary DESC;

-- Find all employees ordered by sex then name
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;

-- Find the first 5 employees in the table
SELECT *
FROM employee
LIMIT 5;

-- Find the first and last names of all employees
SELECT first_name, employee.last_name
FROM employee;

-- Find the forename and surnames names of all employees
SELECT first_name AS forename, last_name AS surname
FROM employee;

-- Find out all the different genders
SELECT DISTINCT sex
FROM employee;

-- Find all male employees
SELECT *
FROM employee
WHERE sex = 'M';

-- Find out all the different branch ids
SELECT DISTINCT branch_id
FROM branch;

-- Find all employee's id's and names who were born after 1969
SELECT emp_id, first_name, last_name, birth_day
FROM employee 
WHERE birth_day >= '1970-01-01';

-- Find all female employees at branch 2
SELECT *
FROM employee
WHERE branch_id = 2 AND sex = 'F';

-- Find number of female employees born after 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_day > '1971-01-01';


-- Find all employees who are female & born after 1969 or who make over 80000
SELECT *
FROM employee
WHERE (birth_day >= '1970-01-01' AND sex = 'F') OR salary > 80000;

-- Find all employees born between 1970 and 1975
SELECT *
FROM employee
WHERE birth_day BETWEEN '1970-01-01' AND '1975-01-01';

-- Find all employees named Jim, Michael, Johnny or David
SELECT *
FROM employee
WHERE first_name IN ('Jim', 'Michael', 'Johnny', 'David');