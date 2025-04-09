SQL> @"C:\Rohith\Backup\Desktop\Presidio\Pre-Training\5.SQL\Task1\Task1.sql"
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
  2  	 EmployeeID INT CONSTRAINT Employees_Pk PRIMARY KEY,
  3  	 FirstName VARCHAR(50),
  4  	 LastName VARCHAR(50),
  5  	 Age INT,
  6  	 Department VARCHAR(50),
  7  	 Salary DECIMAL(10,2)
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

EMPLOYEEID FIRSTNAME                                          LASTNAME                                                  AGE DEPARTMENT                                             SALARY                                                                                                                                                                                                                       
---------- -------------------------------------------------- -------------------------------------------------- ---------- -------------------------------------------------- ----------                                                                                                                                                                                                                       
         1 Rohit                                              Sharma                                                     21 HR                                                      45000                                                                                                                                                                                                                       
         2 Steve                                              Smith                                                      40 IT                                                      60000                                                                                                                                                                                                                       
         3 Virat                                              Kohli                                                      28 Finance                                                 52000                                                                                                                                                                                                                       
         4 David                                              Miller                                                     35 IT                                                      58000                                                                                                                                                                                                                       
         5 Jasprit                                            Bumrah                                                     45 Operations                                              62000                                                                                                                                                                                                                       

SQL> 
SQL> 
SQL> spool off
