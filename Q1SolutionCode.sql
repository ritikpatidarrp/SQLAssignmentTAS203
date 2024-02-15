
-- Create Employee table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Department VARCHAR(50)
);

-- Insert data into the Employee table
INSERT INTO Employee (EmpID, Name, Gender, Department) VALUES
(1, 'X', 'Female', 'Finance'),
(2, 'Y', 'Male', 'IT'),
(3, 'Z', 'Male', 'HR'),
(4, 'W', 'Female', 'IT');


-- 1. Given a table of employees, find the number of male and female employees in each department:
SELECT DISTINCT Department, 
(	
	Select COUNT(Gender) 
    FROM Employee E2 
    WHERE Gender="Male" AND E1.Department = E2.Department
) as "Number of Male",
(	
	Select COUNT(Gender) 
    FROM Employee E3 
    WHERE Gender="Female" AND E1.Department = E3.Department
) as "Number of Female"
FROM Employee E1
ORDER BY 1;
