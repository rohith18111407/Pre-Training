REM Drop Tables Employees

DROP TABLE Employees CASCADE CONSTRAINTS;


REM Drop Table Departments

DROP TABLE Departments CASCADE CONSTRAINTS;


REM Creation of Departments Table

CREATE TABLE Departments (
    DepartmentID INT CONSTRAINT Departments_pk PRIMARY KEY,
    DepartmentName VARCHAR(50)
);



REM Creation of Employees Table

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2),
    DepartmentID INT CONSTRAINT Employees_fk REFERENCES Departments(DepartmentID)
);


REM ADD data to Departments Table

INSERT INTO Departments VALUES (10, 'HR');
INSERT INTO Departments VALUES (20, 'IT');
INSERT INTO Departments VALUES (30, 'Finance');


REM Add data to Employees Table

INSERT INTO Employees VALUES (1, 'MS Dhoni', 80000, 10);
INSERT INTO Employees VALUES (2, 'Virat Kohli', 95000, 10);
INSERT INTO Employees VALUES (3, 'Dinesh Karthik', 70000, 20);
INSERT INTO Employees VALUES (4, 'R Ashwin', 99000, 20);
INSERT INTO Employees VALUES (5, 'Rohit Sharma', 65000, 30);
INSERT INTO Employees (EmpID, Name, Salary, DepartmentID)
VALUES (6, 'Sachin', 85000, 10);

INSERT INTO Employees (EmpID, Name, Salary, DepartmentID)
VALUES (7, 'Yuvraj', 87000, 10);



REM 1. Subquery in WHERE Clause

REM Select employees whose salary is greater than the average salary of their department.

REM This subquery depends on the outer query (i.e., for each employee, it recalculates the department average). For each employee, SQL calculates the average salary of their own department. It then checks if their salary is higher than that average.


SELECT Name, Salary, DepartmentID
FROM Employees E
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = E.DepartmentID
);



REM 2. Subquery in SELECT List

REM show employee names and the average salary of their department beside them.

REM For every employee row, SQL executes a subquery to get the average salary for their department. The result appears as a dynamic column.

SELECT 
    Name,
    Salary,
    DepartmentID,
    (SELECT AVG(Salary)
     FROM Employees E2
     WHERE E2.DepartmentID = E1.DepartmentID) AS AvgDeptSalary
FROM Employees E1;




REM 3. Non-Correlated Subquery

REM List employees working in the highest-paid department

SELECT DepartmentID
FROM Employees
GROUP BY DepartmentID
ORDER BY AVG(Salary) DESC;


REM This is a non-correlated subquery because it runs independently of the outer query.

SELECT Name, Salary, DepartmentID
FROM Employees
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM (
        SELECT DepartmentID, AVG(Salary) AS AvgSal
        FROM Employees
        GROUP BY DepartmentID
        ORDER BY AvgSal DESC
    )
    WHERE ROWNUM = 1
);




REM 4.  Subquery with HAVING Clause

REM  Show departments with more than 1 employee earning above 80,000.

SELECT DepartmentID
FROM Employees
WHERE Salary > 80000
GROUP BY DepartmentID
HAVING COUNT(*) > 1;



