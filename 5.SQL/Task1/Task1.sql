REM Dropping table Employees

DROP TABLE Employees CASCADE CONSTRAINTS;



REM Creation of table Employees

CREATE TABLE Employees (
    EmployeeID INT CONSTRAINT Employees_Pk PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
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


