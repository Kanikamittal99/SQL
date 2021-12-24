-- UNION: should have same number of columns and similar datatype

-- Find a list of employee and branch names
select first_name as company_names
from employee
union
select branch_name
from branch;

-- Find a list of all clients & branch suppliers' names
SELECT client_name , client.branch_id 
FROM client
UNION
SELECT supplier_name, branch_supplier.branch_id
FROM branch_supplier;

-- Find a list of all money spent or earned by the company
select salary 
from employee
union
select total_sales 
from works_with