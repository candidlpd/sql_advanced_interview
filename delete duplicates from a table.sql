

--delete duplicates from a table
CREATE TABLE dbo.Employee
(
 EmployeeID INT , 
 FirstName  varchar(50) ,
 LastName varchar(50) ,
 Phone varchar(20) ,
 Email varchar(50)
);

INSERT INTO dbo.Employee VALUES 
(1, 'Adam', 'Owens', '444345999' , 'adam@demo.com'),
(2, 'Mark', 'Wilis', '245666921' , 'mark@demo.com'),
(3, 'Natasha', 'Lee', '321888909' , 'natasha@demo.com'),
(4, 'Adam', 'Owens', '444345999' , 'adam@demo.com'),
(5, 'Riley', 'Jones', '123345959' , 'riley@demo.com'),
(6, 'Natasha', 'Lee', '321888909' , 'natasha@demo.com');

select * from dbo.Employee;


--method 1
select FirstName, LastName, count(*) from dbo.Employee
group by FirstName, LastName
having count(*)>1;


--method 2
delete from dbo.Employee where EmployeeID NOT IN 
(
select max(EmployeeID) from dbo.Employee
group by FirstName, LastName
);

select * from dbo.Employee;


--method 3

With Employee_CTE as
(
SELECT *, 
row_number() over (partition by FirstName, LastName order by EmployeeID desc) as rn
from dbo.Employee)


delete from Employee_CTE where rn>1;


select * from dbo.Employee;