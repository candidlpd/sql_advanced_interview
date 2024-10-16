
--===========================Employee Manager Hierarchy - Self Join=========================================



--- Create the Employee2 table
CREATE TABLE dbo.Employee2 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ManagerID INT NULL
);

-- Insert records into the Employee2 table
INSERT INTO dbo.Employee2 (EmployeeID, FirstName, LastName, ManagerID) VALUES
(1, 'Adam', 'Owens', 3),
(2, 'Mark', 'Hopkins', NULL),
(3, 'Natasha', 'Lee', 2),
(4, 'Riley', 'Cooper', 5),
(5, 'Jennifer', 'Hudson', 2),
(6, 'David', 'Warner', 5);

select * from dbo.Employee2;

select e.FirstName + ' ' + e.LastName as Employee, m.FirstName + ' ' + m.LastName as Manager
from dbo.Employee2 e 
inner join dbo.Employee2 m 
on m.EmployeeID = E.ManagerID
