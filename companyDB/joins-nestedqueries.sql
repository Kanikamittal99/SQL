-- Find all branches and names of their managers
SELECT b.branch_name, e.first_name AS manager
FROM employee AS e 
JOIN branch AS b
ON e.emp_id = b.mgr_id; 


SELECT e.emp_id, e.first_name, b.branch_name
FROM employee AS e 
LEFT JOIN branch AS b
ON e.emp_id = b.mgr_id; 

SELECT e.emp_id, e.first_name, b.branch_name
FROM employee AS e 
RIGHT JOIN branch AS b
ON e.emp_id = b.mgr_id; 


# NESTED QUERIES

-- Find names of all employees who have sold over 50,000
SELECT CONCAT(first_name," ", last_name) AS name
FROM employee
WHERE emp_id IN (
	SELECT emp_id
	FROM works_with
	GROUP BY emp_id
	HAVING SUM(total_sales) > 50000
);

-- Find names of all employees who have sold over 20,000 to a single client
SELECT CONCAT(first_name," ", last_name) AS name
FROM employee
WHERE emp_id IN (
	SELECT emp_id
	FROM works_with
	where total_sales > 20000);

-- Find all clients who are handles by the branch that Michael Scott manages
-- Assume you know Michael's ID
SELECT *
FROM client
WHERE branch_id = (SELECT branch_id
                          FROM branch
                          WHERE branch.mgr_id = 102);
                          

 -- Find all clients who are handles by the branch that Michael Scott manages
 -- Assume you DONT'T know Michael's ID
 -- IN can be used if there is more than one output expected from subquery. Assuming, Michael manages more than one branch
SELECT * 
FROM client
WHERE branch_id IN(SELECT branch_id
					FROM branch
                    WHERE mgr_id =(SELECT emp_id
									FROM employee
                                    WHERE first_name = 'Michael'));


-- Find the names of employees who work with clients handled by the scranton branch
select first_name
from employee
where branch_id = 2 and emp_id in(select emp_id
									from works_with);
                

-- Find the names of all clients who have spent more than 100,000 dollars
SELECT client_name
from client
where client_id in(select client_id
					from works_with
                    group by client_id
                    having sum(total_sales)>100000);

