# Increase the linesize and page size

```
set pagesize 300
set linesize 500
```

# @"Z:\Rohith_085\Assignment-2\Assignment-2.sql"

- Run a SQL script file located at the specified path.
- The @ symbol tells SQL Plus to execute the contents of a file.
- "Open and execute the SQL commands inside the file Assignment-2.sql located at Z:\Rohith_085\Assignment-2\"

# spool off

- Stop writing output to a spool file.
- In SQL Plus, spool is used to capture the output of commands (like SELECT results) to a file (usually .lst or .txt).
- "Stop recording the output to the spool file."

```
spool Z:\Rohith_085\Assignment-2\output.txt

@"Z:\Rohith_085\Assignment-2\Assignment-2.sql"

spool off

```

# CLear Screen

```
cl scr
```

# To spool the output along with the commands

- SET ECHO ON Shows the commands from Task1.sql in the output file
- SPOOL filename Starts writing everything to the specified file
- SPOOL OFF Stops writing to the file
- @file.sql Executes your main SQL file

```
-- run_task1.sql

-- Set to show commands in the output
SET ECHO ON

-- Start spooling
SPOOL C:\SQL\Task1_output.txt

-- Run the actual SQL commands
@C:\SQL\Task1.sql

-- Stop spooling
SPOOL OFF

```
