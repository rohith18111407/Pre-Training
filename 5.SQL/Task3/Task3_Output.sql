SQL> SET ECHO ON
SQL> 
SQL> @"C:\Rohith\Backup\Desktop\Presidio\Pre-Training\5.SQL\Task3\Task3.sql"
SQL> REM Dropping table Employees
SQL> 
SQL> DROP TABLE Employees CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> 
SQL> 
SQL> REM Creation of table Employees
SQL> 
SQL> CREATE TABLE Employees (
  2  	 EmployeeID INT PRIMARY KEY,
  3  	 FirstName VARCHAR(50),
  4  	 LastName VARCHAR(50),
  5  	 Age INT,
  6  	 Department VARCHAR(50),
  7  	 Salary DECIMAL(10, 2)
  8  );

Table created.

SQL> 
SQL> 
SQL> REM Inserting data into table
SQL> 
SQL> INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary)
  2  	 VALUES (1, 'Rohit', 'Sharma', 21, 'HR', 45000.00);

1 row created.

SQL> 
SQL> INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary)
  2  	 VALUES (2, 'Steve', 'Smith', 40, 'IT', 60000.00);

1 row created.

SQL> 
SQL> INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary)
  2  	 VALUES (3, 'Virat', 'Kohli', 28, 'Finance', 52000.00);

1 row created.

SQL> 
SQL> INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary)
  2  	 VALUES (4, 'David', 'Miller', 35, 'IT', 58000.00);

1 row created.

SQL> 
SQL> INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary)
  2  	 VALUES (5, 'Jasprit', 'Bumrah', 45, 'Operations', 62000.00);

1 row created.

SQL> 
SQL> 
SQL> 
SQL> REM Retrieving Data from the Table
SQL> 
SQL> SELECT * FROM Employees;

EMPLOYEEID FIRSTNAME                                                            
---------- --------------------------------------------------                   
LASTNAME                                                  AGE                   
-------------------------------------------------- ----------                   
DEPARTMENT                                             SALARY                   
-------------------------------------------------- ----------                   
         1 Rohit                                                                
Sharma                                                     21                   
HR                                                      45000                   
                                                                                
         2 Steve                                                                
Smith                                                      40                   
IT                                                      60000                   

EMPLOYEEID FIRSTNAME                                                            
---------- --------------------------------------------------                   
LASTNAME                                                  AGE                   
-------------------------------------------------- ----------                   
DEPARTMENT                                             SALARY                   
-------------------------------------------------- ----------                   
                                                                                
         3 Virat                                                                
Kohli                                                      28                   
Finance                                                 52000                   
                                                                                
         4 David                                                                
Miller                                                     35                   

EMPLOYEEID FIRSTNAME                                                            
---------- --------------------------------------------------                   
LASTNAME                                                  AGE                   
-------------------------------------------------- ----------                   
DEPARTMENT                                             SALARY                   
-------------------------------------------------- ----------                   
IT                                                      58000                   
                                                                                
         5 Jasprit                                                              
Bumrah                                                     45                   
Operations                                              62000                   
                                                                                

SQL> 
SQL> 
SQL> REM 1. Aggregate Functions
SQL> 
SQL> REM  Count total number of employees
SQL> 
SQL> SELECT COUNT(*) AS TotalEmployees FROM Employees;

TOTALEMPLOYEES                                                                  
--------------                                                                  
             5                                                                  

SQL> 
SQL> 
SQL> REM Find average salary of all employees
SQL> 
SQL> SELECT AVG(Salary) AS AverageSalary FROM Employees;

AVERAGESALARY                                                                   
-------------                                                                   
        55400                                                                   

SQL> 
SQL> 
SQL> REM Sum of all salaries
SQL> 
SQL> SELECT SUM(Salary) AS TotalSalaries FROM Employees;

TOTALSALARIES                                                                   
-------------                                                                   
       277000                                                                   

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 2. Group By Clause
SQL> 
SQL> REM Count number of employees per department
SQL> 
SQL> SELECT Department, COUNT(*) AS EmployeeCount
  2  FROM Employees
  3  GROUP BY Department;

DEPARTMENT                                         EMPLOYEECOUNT                
-------------------------------------------------- -------------                
IT                                                             2                
HR                                                             1                
Finance                                                        1                
Operations                                                     1                

SQL> 
SQL> 
SQL> REM Average salary per department
SQL> 
SQL> SELECT Department, AVG(Salary) AS AvgSalary
  2  FROM Employees
  3  GROUP BY Department;

DEPARTMENT                                          AVGSALARY                   
-------------------------------------------------- ----------                   
IT                                                      59000                   
HR                                                      45000                   
Finance                                                 52000                   
Operations                                              62000                   

SQL> 
SQL> 
SQL> 
SQL> REM 3. Having Clause
SQL> 
SQL> REM Departments with more than 1 employee
SQL> 
SQL> SELECT Department, COUNT(*) AS EmployeeCount
  2  FROM Employees
  3  GROUP BY Department
  4  HAVING COUNT(*) > 1;

DEPARTMENT                                         EMPLOYEECOUNT                
-------------------------------------------------- -------------                
IT                                                             2                

SQL> 
SQL> REM  Departments with average salary greater than 55000
SQL> 
SQL> SELECT Department, AVG(Salary) AS AvgSalary
  2  FROM Employees
  3  GROUP BY Department
  4  HAVING AVG(Salary) > 55000;

DEPARTMENT                                          AVGSALARY                   
-------------------------------------------------- ----------                   
IT                                                      59000                   
Operations                                              62000                   

SQL> 
SQL> 
SQL> 
SQL> spool off
