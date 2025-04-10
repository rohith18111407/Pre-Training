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


REM 1. Apply Window Functions

REM ROW_NUMBER() - Assigns a unique sequential number to each row within a partition.

SELECT EmpID,
Name,
DepartmentID,
Salary,
ROW_NUMBER() OVER (
PARTITION BY DepartmentID
ORDER BY Salary DESC
) AS "RowNum"
FROM Employees;



REM RANK() - Gives same rank for ties, but leaves gaps in the ranking.

SELECT EmpID, Name, DepartmentID, Salary,
RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS RankPos
FROM Employees;


REM DENSE_RANK() - Same as RANK() but without gaps in the ranking.

SELECT EmpID, Name, DepartmentID, Salary,
DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS DenseRankPos
FROM Employees;


REM LEAD() and LAG()

REM LEAD() lets you look ahead to the next row's value.
REM LAG() lets you look behind to the previous row's value.

SELECT Name, DepartmentID, Salary,
LAG(Salary, 1) OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS PrevSalary,
LEAD(Salary, 1) OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS NextSalary
FROM Employees;

