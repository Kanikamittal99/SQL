-- ON DELETE SET NULL
-- Since, Foreign key(mgr_id) in branch table was set to ON DELETE SET NULL
-- Only the mgr_id changes to NULL when emp_id is deleted from parent table(employee)

delete from employee 
where emp_id = 102;

select *
from branch;

-- Foreign key(super_id) changes to null for employee with emp_id = 2 too. 
select * from employee;


-- ON DELETE CASCADE
-- deleting primary key(branch_id) of branch table
delete from branch 
where branch_id = 2;

--  whole rows with foreign key(branch_id) = 2 gets removed.
select * 
FROM branch_supplier;


