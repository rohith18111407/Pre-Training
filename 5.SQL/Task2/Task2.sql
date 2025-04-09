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




REM 1. Filtering with WHERE clause

REM  Employees from the IT department

SELECT * FROM Employees
WHERE Department = 'IT';



REM 2. Sorting with ORDER BY clause

REM Sort employees by LastName

SELECT * FROM Employees
ORDER BY LastName;

REM Sort by Salary (Descending)

SELECT * FROM Employees
ORDER BY Salary DESC;



REM 3. Filtering with Multiple Conditions

REM Employees in IT AND age > 30

SELECT * FROM Employees
WHERE Department = 'IT' AND Age > 30;

REM Employees in HR OR with salary > 60000

SELECT * FROM Employees
WHERE Department = 'HR' OR Salary > 60000;




REM 4. Combine Filtering + Sorting

REM Employees with salary > 50000, ordered by age ascending

SELECT * FROM Employees
WHERE Salary > 50000
ORDER BY Age ASC;


REM IT department employees with age < 40, sorted by LastName

SELECT * FROM Employees
WHERE Department = 'IT' AND Age < 40
ORDER BY LastName;



-- Task2.sql: Filtering and Sorting Examples

-- IT employees
SELECT * FROM Employees WHERE Department = 'IT';

-- Sort by LastName
SELECT * FROM Employees ORDER BY LastName;

-- Employees with salary > 60000
SELECT * FROM Employees WHERE Salary > 60000;

-- IT AND Age > 30
SELECT * FROM Employees WHERE Department = 'IT' AND Age > 30;

-- HR OR Salary > 60000
SELECT * FROM Employees WHERE Department = 'HR' OR Salary > 60000;

-- Salary > 50000, sorted by Age
SELECT * FROM Employees WHERE Salary > 50000 ORDER BY Age;

-- IT, age < 40, ordered by LastName
SELECT * FROM Employees WHERE Department = 'IT' AND Age < 40 ORDER BY LastName;


