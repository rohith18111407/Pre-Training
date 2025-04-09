REM Dropping table Employees

DROP TABLE Employees CASCADE CONSTRAINTS;



REM Creation of table Employees

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);


REM Inserting data into table

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary)
    VALUES (1, 'Rohit', 'Sharma', 21, 'HR', 45000.00);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary)
    VALUES (2, 'Steve', 'Smith', 40, 'IT', 60000.00);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary)
    VALUES (3, 'Virat', 'Kohli', 28, 'Finance', 52000.00);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary)
    VALUES (4, 'David', 'Miller', 35, 'IT', 58000.00);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary)
    VALUES (5, 'Jasprit', 'Bumrah', 45, 'Operations', 62000.00);



REM Retrieving Data from the Table

SELECT * FROM Employees;


REM 1. Aggregate Functions

REM  Count total number of employees

SELECT COUNT(*) AS TotalEmployees FROM Employees;


REM Find average salary of all employees

SELECT AVG(Salary) AS AverageSalary FROM Employees;


REM Sum of all salaries

SELECT SUM(Salary) AS TotalSalaries FROM Employees;




REM 2. Group By Clause

REM Count number of employees per department

SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;


REM Average salary per department

SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;



REM 3. Having Clause

REM Departments with more than 1 employee

SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 1;

REM  Departments with average salary greater than 55000

SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 55000;



