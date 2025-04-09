SQL> SET ECHO ON
SQL> 
SQL> @"C:\Rohith\Backup\Desktop\Presidio\Pre-Training\5.SQL\Task2\Task2.sql"
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
                                                                                                    
         3 Virat                                                                                    
Kohli                                                      28                                       
Finance                                                 52000                                       
                                                                                                    
         4 David                                                                                    
Miller                                                     35                                       
IT                                                      58000                                       
                                                                                                    
         5 Jasprit                                                                                  
Bumrah                                                     45                                       
Operations                                              62000                                       
                                                                                                    

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 1. Filtering with WHERE clause
SQL> 
SQL> REM  Employees from the IT department
SQL> 
SQL> SELECT * FROM Employees
  2  WHERE Department = 'IT';

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         2 Steve                                                                                    
Smith                                                      40                                       
IT                                                      60000                                       
                                                                                                    
         4 David                                                                                    
Miller                                                     35                                       
IT                                                      58000                                       
                                                                                                    

SQL> 
SQL> 
SQL> 
SQL> REM 2. Sorting with ORDER BY clause
SQL> 
SQL> REM Sort employees by LastName
SQL> 
SQL> SELECT * FROM Employees
  2  ORDER BY LastName;

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         5 Jasprit                                                                                  
Bumrah                                                     45                                       
Operations                                              62000                                       
                                                                                                    
         3 Virat                                                                                    
Kohli                                                      28                                       
Finance                                                 52000                                       
                                                                                                    
         4 David                                                                                    
Miller                                                     35                                       
IT                                                      58000                                       
                                                                                                    
         1 Rohit                                                                                    
Sharma                                                     21                                       
HR                                                      45000                                       
                                                                                                    
         2 Steve                                                                                    
Smith                                                      40                                       
IT                                                      60000                                       
                                                                                                    

SQL> 
SQL> REM Sort by Salary (Descending)
SQL> 
SQL> SELECT * FROM Employees
  2  ORDER BY Salary DESC;

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         5 Jasprit                                                                                  
Bumrah                                                     45                                       
Operations                                              62000                                       
                                                                                                    
         2 Steve                                                                                    
Smith                                                      40                                       
IT                                                      60000                                       
                                                                                                    
         4 David                                                                                    
Miller                                                     35                                       
IT                                                      58000                                       
                                                                                                    
         3 Virat                                                                                    
Kohli                                                      28                                       
Finance                                                 52000                                       
                                                                                                    
         1 Rohit                                                                                    
Sharma                                                     21                                       
HR                                                      45000                                       
                                                                                                    

SQL> 
SQL> 
SQL> 
SQL> REM 3. Filtering with Multiple Conditions
SQL> 
SQL> REM Employees in IT AND age > 30
SQL> 
SQL> SELECT * FROM Employees
  2  WHERE Department = 'IT' AND Age > 30;

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         2 Steve                                                                                    
Smith                                                      40                                       
IT                                                      60000                                       
                                                                                                    
         4 David                                                                                    
Miller                                                     35                                       
IT                                                      58000                                       
                                                                                                    

SQL> 
SQL> REM Employees in HR OR with salary > 60000
SQL> 
SQL> SELECT * FROM Employees
  2  WHERE Department = 'HR' OR Salary > 60000;

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         1 Rohit                                                                                    
Sharma                                                     21                                       
HR                                                      45000                                       
                                                                                                    
         5 Jasprit                                                                                  
Bumrah                                                     45                                       
Operations                                              62000                                       
                                                                                                    

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 4. Combine Filtering + Sorting
SQL> 
SQL> REM Employees with salary > 50000, ordered by age ascending
SQL> 
SQL> SELECT * FROM Employees
  2  WHERE Salary > 50000
  3  ORDER BY Age ASC;

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
IT                                                      58000                                       
                                                                                                    
         2 Steve                                                                                    
Smith                                                      40                                       
IT                                                      60000                                       
                                                                                                    
         5 Jasprit                                                                                  
Bumrah                                                     45                                       
Operations                                              62000                                       
                                                                                                    

SQL> 
SQL> 
SQL> REM IT department employees with age < 40, sorted by LastName
SQL> 
SQL> SELECT * FROM Employees
  2  WHERE Department = 'IT' AND Age < 40
  3  ORDER BY LastName;

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         4 David                                                                                    
Miller                                                     35                                       
IT                                                      58000                                       
                                                                                                    

SQL> 
SQL> 
SQL> 
SQL> -- Task2.sql: Filtering and Sorting Examples
SQL> 
SQL> -- IT employees
SQL> SELECT * FROM Employees WHERE Department = 'IT';

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         2 Steve                                                                                    
Smith                                                      40                                       
IT                                                      60000                                       
                                                                                                    
         4 David                                                                                    
Miller                                                     35                                       
IT                                                      58000                                       
                                                                                                    

SQL> 
SQL> -- Sort by LastName
SQL> SELECT * FROM Employees ORDER BY LastName;

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         5 Jasprit                                                                                  
Bumrah                                                     45                                       
Operations                                              62000                                       
                                                                                                    
         3 Virat                                                                                    
Kohli                                                      28                                       
Finance                                                 52000                                       
                                                                                                    
         4 David                                                                                    
Miller                                                     35                                       
IT                                                      58000                                       
                                                                                                    
         1 Rohit                                                                                    
Sharma                                                     21                                       
HR                                                      45000                                       
                                                                                                    
         2 Steve                                                                                    
Smith                                                      40                                       
IT                                                      60000                                       
                                                                                                    

SQL> 
SQL> -- Employees with salary > 60000
SQL> SELECT * FROM Employees WHERE Salary > 60000;

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         5 Jasprit                                                                                  
Bumrah                                                     45                                       
Operations                                              62000                                       
                                                                                                    

SQL> 
SQL> -- IT AND Age > 30
SQL> SELECT * FROM Employees WHERE Department = 'IT' AND Age > 30;

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         2 Steve                                                                                    
Smith                                                      40                                       
IT                                                      60000                                       
                                                                                                    
         4 David                                                                                    
Miller                                                     35                                       
IT                                                      58000                                       
                                                                                                    

SQL> 
SQL> -- HR OR Salary > 60000
SQL> SELECT * FROM Employees WHERE Department = 'HR' OR Salary > 60000;

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         1 Rohit                                                                                    
Sharma                                                     21                                       
HR                                                      45000                                       
                                                                                                    
         5 Jasprit                                                                                  
Bumrah                                                     45                                       
Operations                                              62000                                       
                                                                                                    

SQL> 
SQL> -- Salary > 50000, sorted by Age
SQL> SELECT * FROM Employees WHERE Salary > 50000 ORDER BY Age;

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
IT                                                      58000                                       
                                                                                                    
         2 Steve                                                                                    
Smith                                                      40                                       
IT                                                      60000                                       
                                                                                                    
         5 Jasprit                                                                                  
Bumrah                                                     45                                       
Operations                                              62000                                       
                                                                                                    

SQL> 
SQL> -- IT, age < 40, ordered by LastName
SQL> SELECT * FROM Employees WHERE Department = 'IT' AND Age < 40 ORDER BY LastName;

EMPLOYEEID FIRSTNAME                                                                                
---------- --------------------------------------------------                                       
LASTNAME                                                  AGE                                       
-------------------------------------------------- ----------                                       
DEPARTMENT                                             SALARY                                       
-------------------------------------------------- ----------                                       
         4 David                                                                                    
Miller                                                     35                                       
IT                                                      58000                                       
                                                                                                    

SQL> 
SQL> 
SQL> spool off
