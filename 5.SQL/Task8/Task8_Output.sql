SQL> SET ECHO ON
SQL> @"C:\Rohith\Backup\Desktop\Presidio\Pre-Training\5.SQL\Task8\Task8.sql"
SQL> REM Drop  Table Employees
SQL> 
SQL> DROP TABLE Employees CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> 
SQL> REM Creation of Employees Table
SQL> 
SQL> CREATE TABLE Employees (
  2  	 EmpID NUMBER PRIMARY KEY,
  3  	 Name VARCHAR2(50),
  4  	 DepartmentID NUMBER,
  5  	 Salary NUMBER
  6  );

Table created.

SQL> 
SQL> 
SQL> REM Insertion of Data
SQL> 
SQL> INSERT INTO Employees VALUES (1, 'Rohit Sharma', 10, 60000);

1 row created.

SQL> INSERT INTO Employees VALUES (2, 'MS Dhoni', 10, 80000);

1 row created.

SQL> INSERT INTO Employees VALUES (3, 'Virat Kohli', 10, 75000);

1 row created.

SQL> INSERT INTO Employees VALUES (4, 'David Warner', 20, 90000);

1 row created.

SQL> INSERT INTO Employees VALUES (5, 'Yuvraj Singh', 20, 95000);

1 row created.

SQL> INSERT INTO Employees VALUES (6, 'Dinesh Kartik', 20, 85000);

1 row created.

SQL> INSERT INTO Employees VALUES (7, 'R Ashwin', 30, 72000);

1 row created.

SQL> INSERT INTO Employees VALUES (8, 'Suresh Raina', 30, 72000);

1 row created.

SQL> INSERT INTO Employees VALUES (9, 'Chris Gayle', 30, 68000);

1 row created.

SQL> 
SQL> 
SQL> REM Display the rows
SQL> 
SQL> SELECT *
  2  FROM Employees;

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY                                                                      
----------                                                                      
         1 Rohit Sharma                                                 10      
     60000                                                                      
                                                                                
         2 MS Dhoni                                                     10      
     80000                                                                      
                                                                                
         3 Virat Kohli                                                  10      
     75000                                                                      
                                                                                

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY                                                                      
----------                                                                      
         4 David Warner                                                 20      
     90000                                                                      
                                                                                
         5 Yuvraj Singh                                                 20      
     95000                                                                      
                                                                                
         6 Dinesh Kartik                                                20      
     85000                                                                      
                                                                                

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY                                                                      
----------                                                                      
         7 R Ashwin                                                     30      
     72000                                                                      
                                                                                
         8 Suresh Raina                                                 30      
     72000                                                                      
                                                                                
         9 Chris Gayle                                                  30      
     68000                                                                      
                                                                                

9 rows selected.

SQL> 
SQL> 
SQL> 
SQL> REM A Common Table Expression (CTE) is a temporary result set defined within the execution scope of a single SELECT, INSERT, UPDATE, or DELETE statement using the WITH keyword.
SQL> 
SQL> 
SQL> 
SQL> REM 1. Non-Recursive CTE
SQL> 
SQL> REM Break down a complex query like total salary per department and filtering departments where total salary exceeds a threshold.
SQL> 
SQL> REM DeptSalary is a named temporary result set (like a view). The outer query then filters the result using TotalSalary > 150000.
SQL> 
SQL> 
SQL> WITH DeptSalary AS (
  2  	 SELECT DepartmentID, SUM(Salary) AS TotalSalary
  3  	 FROM Employees
  4  	 GROUP BY DepartmentID
  5  )
  6  SELECT DepartmentID, TotalSalary
  7  FROM DeptSalary
  8  WHERE TotalSalary > 150000;

DEPARTMENTID TOTALSALARY                                                        
------------ -----------                                                        
          30      212000                                                        
          20      270000                                                        
          10      215000                                                        

SQL> 
SQL> 
SQL> 
SQL> REM Alternative (No CTE):
SQL> 
SQL> SELECT DepartmentID, TotalSalary
  2  FROM (
  3  	 SELECT DepartmentID, SUM(Salary) AS TotalSalary
  4  	 FROM Employees
  5  	 GROUP BY DepartmentID
  6  )
  7  WHERE TotalSalary > 150000;

DEPARTMENTID TOTALSALARY                                                        
------------ -----------                                                        
          30      212000                                                        
          20      270000                                                        
          10      215000                                                        

SQL> 
SQL> 
SQL> 
SQL> REM 2. Recursive CTE - Hierarchical data (e.g., organization tree — who reports to whom).
SQL> 
SQL> REM Drop  Table Employees
SQL> 
SQL> DROP TABLE Employees CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> 
SQL> REM Creation of Employees Table
SQL> 
SQL> CREATE TABLE Employees (
  2  	 EmpID NUMBER PRIMARY KEY,
  3  	 Name VARCHAR2(50),
  4  	 ManagerID NUMBER, -- NULL for top-level manager
  5  	 FOREIGN KEY (ManagerID) REFERENCES Employees(EmpID)
  6  );

Table created.

SQL> 
SQL> 
SQL> REM Insert Data into Table
SQL> 
SQL> INSERT INTO Employees VALUES (1, 'CEO', NULL);

1 row created.

SQL> INSERT INTO Employees VALUES (2, 'VP of Sales', 1);

1 row created.

SQL> INSERT INTO Employees VALUES (3, 'Sales Manager', 2);

1 row created.

SQL> INSERT INTO Employees VALUES (4, 'Sales Rep', 3);

1 row created.

SQL> INSERT INTO Employees VALUES (5, 'VP of HR', 1);

1 row created.

SQL> INSERT INTO Employees VALUES (6, 'HR Manager', 5);

1 row created.

SQL> 
SQL> 
SQL> REM Display Table
SQL> 
SQL> SELECT *
  2  FROM Employees;

     EMPID NAME                                                MANAGERID        
---------- -------------------------------------------------- ----------        
         1 CEO                                                                  
         2 VP of Sales                                                 1        
         3 Sales Manager                                               2        
         4 Sales Rep                                                   3        
         5 VP of HR                                                    1        
         6 HR Manager                                                  5        

6 rows selected.

SQL> 
SQL> 
SQL> REM Recursive CTE
SQL> 
SQL> 
SQL> REM Hierarchical Query
SQL> REM START WITH: identifies the root (CEO). CONNECT BY: defines the parent-child relationship. LEVEL: Oracle pseudo-column that auto-increments with each l
SQL> 
SQL> SELECT EmpID, Name, ManagerID, LEVEL AS LevelNum
  2  FROM Employees
  3  START WITH ManagerID IS NULL
  4  CONNECT BY PRIOR EmpID = ManagerID;

     EMPID NAME                                                MANAGERID        
---------- -------------------------------------------------- ----------        
  LEVELNUM                                                                      
----------                                                                      
         1 CEO                                                                  
         1                                                                      
                                                                                
         2 VP of Sales                                                 1        
         2                                                                      
                                                                                
         3 Sales Manager                                               2        
         3                                                                      
                                                                                

     EMPID NAME                                                MANAGERID        
---------- -------------------------------------------------- ----------        
  LEVELNUM                                                                      
----------                                                                      
         4 Sales Rep                                                   3        
         4                                                                      
                                                                                
         5 VP of HR                                                    1        
         2                                                                      
                                                                                
         6 HR Manager                                                  5        
         3                                                                      
                                                                                

6 rows selected.

SQL> 
SQL> spool off
