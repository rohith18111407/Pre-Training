SQL> SET ECHO ON
SQL> 
SQL> @"C:\Rohith\Backup\Desktop\Presidio\Pre-Training\5.SQL\Task5\Task5.sql"
SQL> REM Drop Tables Employees
SQL> 
SQL> DROP TABLE Employees CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> 
SQL> REM Drop Table Departments
SQL> 
SQL> DROP TABLE Departments CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> 
SQL> REM Creation of Departments Table
SQL> 
SQL> CREATE TABLE Departments (
  2  	 DepartmentID INT CONSTRAINT Departments_pk PRIMARY KEY,
  3  	 DepartmentName VARCHAR(50)
  4  );

Table created.

SQL> 
SQL> 
SQL> 
SQL> REM Creation of Employees Table
SQL> 
SQL> CREATE TABLE Employees (
  2  	 EmpID INT PRIMARY KEY,
  3  	 Name VARCHAR(50),
  4  	 Salary DECIMAL(10, 2),
  5  	 DepartmentID INT CONSTRAINT Employees_fk REFERENCES Departments(DepartmentID)
  6  );

Table created.

SQL> 
SQL> 
SQL> REM ADD data to Departments Table
SQL> 
SQL> INSERT INTO Departments VALUES (10, 'HR');

1 row created.

SQL> INSERT INTO Departments VALUES (20, 'IT');

1 row created.

SQL> INSERT INTO Departments VALUES (30, 'Finance');

1 row created.

SQL> 
SQL> 
SQL> REM Add data to Employees Table
SQL> 
SQL> INSERT INTO Employees VALUES (1, 'MS Dhoni', 80000, 10);

1 row created.

SQL> INSERT INTO Employees VALUES (2, 'Virat Kohli', 95000, 10);

1 row created.

SQL> INSERT INTO Employees VALUES (3, 'Dinesh Karthik', 70000, 20);

1 row created.

SQL> INSERT INTO Employees VALUES (4, 'R Ashwin', 99000, 20);

1 row created.

SQL> INSERT INTO Employees VALUES (5, 'Rohit Sharma', 65000, 30);

1 row created.

SQL> INSERT INTO Employees (EmpID, Name, Salary, DepartmentID)
  2  VALUES (6, 'Sachin', 85000, 10);

1 row created.

SQL> 
SQL> INSERT INTO Employees (EmpID, Name, Salary, DepartmentID)
  2  VALUES (7, 'Yuvraj', 87000, 10);

1 row created.

SQL> 
SQL> 
SQL> 
SQL> REM 1. Subquery in WHERE Clause
SQL> 
SQL> REM Select employees whose salary is greater than the average salary of their department.
SQL> 
SQL> REM This subquery depends on the outer query (i.e., for each employee, it recalculates the department average). For each employee, SQL calculates the average salary of their own department. It then checks if their salary is higher than that average.
SQL> 
SQL> 
SQL> SELECT Name, Salary, DepartmentID
  2  FROM Employees E
  3  WHERE Salary > (
  4  	 SELECT AVG(Salary)
  5  	 FROM Employees
  6  	 WHERE DepartmentID = E.DepartmentID
  7  );

NAME                                                   SALARY DEPARTMENTID      
-------------------------------------------------- ---------- ------------      
Virat Kohli                                             95000           10      
R Ashwin                                                99000           20      
Yuvraj                                                  87000           10      

SQL> 
SQL> 
SQL> 
SQL> REM 2. Subquery in SELECT List
SQL> 
SQL> REM show employee names and the average salary of their department beside them.
SQL> 
SQL> REM For every employee row, SQL executes a subquery to get the average salary for their department. The result appears as a dynamic column.
SQL> 
SQL> SELECT
  2  	 Name,
  3  	 Salary,
  4  	 DepartmentID,
  5  	 (SELECT AVG(Salary)
  6  	  FROM Employees E2
  7  	  WHERE E2.DepartmentID = E1.DepartmentID) AS AvgDeptSalary
  8  FROM Employees E1;

NAME                                                   SALARY DEPARTMENTID      
-------------------------------------------------- ---------- ------------      
AVGDEPTSALARY                                                                   
-------------                                                                   
MS Dhoni                                                80000           10      
        86750                                                                   
                                                                                
Virat Kohli                                             95000           10      
        86750                                                                   
                                                                                
Dinesh Karthik                                          70000           20      
        84500                                                                   
                                                                                

NAME                                                   SALARY DEPARTMENTID      
-------------------------------------------------- ---------- ------------      
AVGDEPTSALARY                                                                   
-------------                                                                   
R Ashwin                                                99000           20      
        84500                                                                   
                                                                                
Rohit Sharma                                            65000           30      
        65000                                                                   
                                                                                
Sachin                                                  85000           10      
        86750                                                                   
                                                                                

NAME                                                   SALARY DEPARTMENTID      
-------------------------------------------------- ---------- ------------      
AVGDEPTSALARY                                                                   
-------------                                                                   
Yuvraj                                                  87000           10      
        86750                                                                   
                                                                                

7 rows selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 3. Non-Correlated Subquery
SQL> 
SQL> REM List employees working in the highest-paid department
SQL> 
SQL> SELECT DepartmentID
  2  FROM Employees
  3  GROUP BY DepartmentID
  4  ORDER BY AVG(Salary) DESC;

DEPARTMENTID                                                                    
------------                                                                    
          10                                                                    
          20                                                                    
          30                                                                    

SQL> 
SQL> 
SQL> REM This is a non-correlated subquery because it runs independently of the outer query.
SQL> 
SQL> SELECT Name, Salary, DepartmentID
  2  FROM Employees
  3  WHERE DepartmentID = (
  4  	 SELECT DepartmentID
  5  	 FROM (
  6  	     SELECT DepartmentID, AVG(Salary) AS AvgSal
  7  	     FROM Employees
  8  	     GROUP BY DepartmentID
  9  	     ORDER BY AvgSal DESC
 10  	 )
 11  	 WHERE ROWNUM = 1
 12  );

NAME                                                   SALARY DEPARTMENTID      
-------------------------------------------------- ---------- ------------      
MS Dhoni                                                80000           10      
Virat Kohli                                             95000           10      
Sachin                                                  85000           10      
Yuvraj                                                  87000           10      

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 4.  Subquery with HAVING Clause
SQL> 
SQL> REM  Show departments with more than 1 employee earning above 80,000.
SQL> 
SQL> SELECT DepartmentID
  2  FROM Employees
  3  WHERE Salary > 80000
  4  GROUP BY DepartmentID
  5  HAVING COUNT(*) > 1;

DEPARTMENTID                                                                    
------------                                                                    
          10                                                                    

SQL> 
SQL> 
SQL> 
SQL> spool off
