SQL> SET ECHO ON
SQL> 
SQL> @"C:\Rohith\Backup\Desktop\Presidio\Pre-Training\5.SQL\Task7\Task7.sql"
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
SQL> REM 1. Apply Window Functions
SQL> 
SQL> REM ROW_NUMBER() - Assigns a unique sequential number to each row within a partition.
SQL> 
SQL> SELECT EmpID,
  2  Name,
  3  DepartmentID,
  4  Salary,
  5  ROW_NUMBER() OVER (
  6  PARTITION BY DepartmentID
  7  ORDER BY Salary DESC
  8  ) AS "RowNum"
  9  FROM Employees;

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY     RowNum                                                           
---------- ----------                                                           
         2 MS Dhoni                                                     10      
     80000          1                                                           
                                                                                
         3 Virat Kohli                                                  10      
     75000          2                                                           
                                                                                
         1 Rohit Sharma                                                 10      
     60000          3                                                           
                                                                                

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY     RowNum                                                           
---------- ----------                                                           
         5 Yuvraj Singh                                                 20      
     95000          1                                                           
                                                                                
         4 David Warner                                                 20      
     90000          2                                                           
                                                                                
         6 Dinesh Kartik                                                20      
     85000          3                                                           
                                                                                

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY     RowNum                                                           
---------- ----------                                                           
         7 R Ashwin                                                     30      
     72000          1                                                           
                                                                                
         8 Suresh Raina                                                 30      
     72000          2                                                           
                                                                                
         9 Chris Gayle                                                  30      
     68000          3                                                           
                                                                                

9 rows selected.

SQL> 
SQL> 
SQL> 
SQL> REM RANK() - Gives same rank for ties, but leaves gaps in the ranking.
SQL> 
SQL> SELECT EmpID, Name, DepartmentID, Salary,
  2  RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS RankPos
  3  FROM Employees;

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY    RANKPOS                                                           
---------- ----------                                                           
         2 MS Dhoni                                                     10      
     80000          1                                                           
                                                                                
         3 Virat Kohli                                                  10      
     75000          2                                                           
                                                                                
         1 Rohit Sharma                                                 10      
     60000          3                                                           
                                                                                

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY    RANKPOS                                                           
---------- ----------                                                           
         5 Yuvraj Singh                                                 20      
     95000          1                                                           
                                                                                
         4 David Warner                                                 20      
     90000          2                                                           
                                                                                
         6 Dinesh Kartik                                                20      
     85000          3                                                           
                                                                                

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY    RANKPOS                                                           
---------- ----------                                                           
         7 R Ashwin                                                     30      
     72000          1                                                           
                                                                                
         8 Suresh Raina                                                 30      
     72000          1                                                           
                                                                                
         9 Chris Gayle                                                  30      
     68000          3                                                           
                                                                                

9 rows selected.

SQL> 
SQL> 
SQL> REM DENSE_RANK() - Same as RANK() but without gaps in the ranking.
SQL> 
SQL> SELECT EmpID, Name, DepartmentID, Salary,
  2  DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS DenseRankPos
  3  FROM Employees;

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY DENSERANKPOS                                                         
---------- ------------                                                         
         2 MS Dhoni                                                     10      
     80000            1                                                         
                                                                                
         3 Virat Kohli                                                  10      
     75000            2                                                         
                                                                                
         1 Rohit Sharma                                                 10      
     60000            3                                                         
                                                                                

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY DENSERANKPOS                                                         
---------- ------------                                                         
         5 Yuvraj Singh                                                 20      
     95000            1                                                         
                                                                                
         4 David Warner                                                 20      
     90000            2                                                         
                                                                                
         6 Dinesh Kartik                                                20      
     85000            3                                                         
                                                                                

     EMPID NAME                                               DEPARTMENTID      
---------- -------------------------------------------------- ------------      
    SALARY DENSERANKPOS                                                         
---------- ------------                                                         
         7 R Ashwin                                                     30      
     72000            1                                                         
                                                                                
         8 Suresh Raina                                                 30      
     72000            1                                                         
                                                                                
         9 Chris Gayle                                                  30      
     68000            2                                                         
                                                                                

9 rows selected.

SQL> 
SQL> 
SQL> REM LEAD() and LAG()
SQL> 
SQL> REM LEAD() lets you look ahead to the next row's value.
SQL> REM LAG() lets you look behind to the previous row's value.
SQL> 
SQL> SELECT Name, DepartmentID, Salary,
  2  LAG(Salary, 1) OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS PrevSalary,
  3  LEAD(Salary, 1) OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS NextSalary
  4  FROM Employees;

NAME                                               DEPARTMENTID     SALARY      
-------------------------------------------------- ------------ ----------      
PREVSALARY NEXTSALARY                                                           
---------- ----------                                                           
MS Dhoni                                                     10      80000      
                75000                                                           
                                                                                
Virat Kohli                                                  10      75000      
     80000      60000                                                           
                                                                                
Rohit Sharma                                                 10      60000      
     75000                                                                      
                                                                                

NAME                                               DEPARTMENTID     SALARY      
-------------------------------------------------- ------------ ----------      
PREVSALARY NEXTSALARY                                                           
---------- ----------                                                           
Yuvraj Singh                                                 20      95000      
                90000                                                           
                                                                                
David Warner                                                 20      90000      
     95000      85000                                                           
                                                                                
Dinesh Kartik                                                20      85000      
     90000                                                                      
                                                                                

NAME                                               DEPARTMENTID     SALARY      
-------------------------------------------------- ------------ ----------      
PREVSALARY NEXTSALARY                                                           
---------- ----------                                                           
R Ashwin                                                     30      72000      
                72000                                                           
                                                                                
Suresh Raina                                                 30      72000      
     72000      68000                                                           
                                                                                
Chris Gayle                                                  30      68000      
     72000                                                                      
                                                                                

9 rows selected.

SQL> 
SQL> spool off
