

--======find nth highest salary===============================



-- Create the Employee table
create database test;
use test;
CREATE TABLE Employee1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Salary INT
);

-- Insert records into the Employee table
INSERT INTO Employee1 (EmployeeID, FirstName, LastName, Phone, Email, Salary) VALUES
(3, 'Natasha', 'Lee', '321888909', 'natasha@demo.com', 30000),
(2, 'Mark', 'Wills', '245666921', 'mark@demo.com', 85000),
(1, 'Melissa', 'Rhodes', '1893456702', 'melissa@demo.com', 40000),
(5, 'Adam', 'Owens', '444345999', 'adam@demo.com', 60000),
(4, 'Riley', 'Jones', '123345599', 'riley@demo.com', 75000),
(6, 'Nick', 'Adams', '1363456702', 'nick@demo.com', 45000);

select * from Employee1;
--method 1 for highest salary
select max(salary) from dbo.Employee1
where salary < (select max(salary) from dbo.Employee1)


--method 2  ..3rd hightest salary
select top 1 * from 
(
select top 3 * from dbo.Employee1
order by salary desc) sal_order
order by salary;



--mehtod 3 ..3rd highest salary
with salary_cte as 
(
select *, 
dense_rank() over (order by salary desc) as rnk 
from dbo.Employee1
)

select * from salary_cte where rnk =3;