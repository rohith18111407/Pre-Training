REM Drop  Table Employees

DROP TABLE Employees CASCADE CONSTRAINTS;


REM Creation of Employees Table

CREATE TABLE Employees (
    EmpID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    DepartmentID NUMBER,
    Salary NUMBER
);


REM Insertion of Data

INSERT INTO Employees VALUES (1, 'Rohit Sharma', 10, 60000);
INSERT INTO Employees VALUES (2, 'MS Dhoni', 10, 80000);
INSERT INTO Employees VALUES (3, 'Virat Kohli', 10, 75000);
INSERT INTO Employees VALUES (4, 'David Warner', 20, 90000);
INSERT INTO Employees VALUES (5, 'Yuvraj Singh', 20, 95000);
INSERT INTO Employees VALUES (6, 'Dinesh Kartik', 20, 85000);
INSERT INTO Employees VALUES (7, 'R Ashwin', 30, 72000);
INSERT INTO Employees VALUES (8, 'Suresh Raina', 30, 72000);
INSERT INTO Employees VALUES (9, 'Chris Gayle', 30, 68000);


REM Display the rows

SELECT *
FROM Employees;



REM A Common Table Expression (CTE) is a temporary result set defined within the execution scope of a single SELECT, INSERT, UPDATE, or DELETE statement using the WITH keyword.



REM 1. Non-Recursive CTE

REM Break down a complex query like total salary per department and filtering departments where total salary exceeds a threshold.

REM DeptSalary is a named temporary result set (like a view). The outer query then filters the result using TotalSalary > 150000.


WITH DeptSalary AS (
    SELECT DepartmentID, SUM(Salary) AS TotalSalary
    FROM Employees
    GROUP BY DepartmentID
)
SELECT DepartmentID, TotalSalary
FROM DeptSalary
WHERE TotalSalary > 150000;



REM Alternative (No CTE):

SELECT DepartmentID, TotalSalary
FROM (
    SELECT DepartmentID, SUM(Salary) AS TotalSalary
    FROM Employees
    GROUP BY DepartmentID
) 
WHERE TotalSalary > 150000;



REM 2. Recursive CTE - Hierarchical data (e.g., organization tree — who reports to whom).

REM Drop  Table Employees

DROP TABLE Employees CASCADE CONSTRAINTS;


REM Creation of Employees Table

CREATE TABLE Employees (
    EmpID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    ManagerID NUMBER, -- NULL for top-level manager
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmpID)
);


REM Insert Data into Table

INSERT INTO Employees VALUES (1, 'CEO', NULL);
INSERT INTO Employees VALUES (2, 'VP of Sales', 1);
INSERT INTO Employees VALUES (3, 'Sales Manager', 2);
INSERT INTO Employees VALUES (4, 'Sales Rep', 3);
INSERT INTO Employees VALUES (5, 'VP of HR', 1);
INSERT INTO Employees VALUES (6, 'HR Manager', 5);


REM Display Table

SELECT *
FROM Employees;


REM Recursive CTE


REM Hierarchical Query
REM START WITH: identifies the root (CEO). CONNECT BY: defines the parent-child relationship. LEVEL: Oracle pseudo-column that auto-increments with each l

SELECT EmpID, Name, ManagerID, LEVEL AS LevelNum
FROM Employees
START WITH ManagerID IS NULL
CONNECT BY PRIOR EmpID = ManagerID;

