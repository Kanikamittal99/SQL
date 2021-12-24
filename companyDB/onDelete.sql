-- ON DELETE SET NULL
-- Since, Foreign key(mgr_id) in branch table was set to ON DELETE SET NULL
-- Only the mgr_id changes to NULL when emp_id is deleted from parent table(employee)

DELETE FROM employee 
WHERE emp_id = 102;

SELECT *
FROM branch;

-- Foreign key(super_id) changes to null for employee with emp_id = 2 too. 
SELECT * FROM employee;


-- ON DELETE CASCADE
-- deleting primary key(branch_id) of branch table
DELETE FROM branch 
WHERE branch_id = 2;

--  whole rows with foreign key(branch_id) = 2 gets removed.
SELECT * 
FROM branch_supplier;


