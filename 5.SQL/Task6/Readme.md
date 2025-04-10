# Task 6: Date and Time Functions

## Objective

This task demonstrates how to manipulate and query data based on date and time values using Oracle SQL plus. It covers common date functions such as retrieving the current date, adding months, formatting dates, and filtering records based on date intervals.

---

## Date Functions

### SYSDATE

Returns the current date and time

### ADD_MONTHS(date, n)

Adds n months to a date

### MONTHS_BETWEEN(date1, date2)

Returns months between two dates

### NEXT_DAY(date, 'DAY')

Returns the next specified weekday

### LAST_DAY(date)

Returns last date of the month

### TRUNC(date)

Removes time part from date

### TO_CHAR(date, format)

Converts date to string with format

### TO_DATE(string, format)

Converts string to date

## Key Use Cases

### Orders in the last 30 days

WHERE OrderDate >= SYSDATE - 30

### Calculate date difference

SYSDATE - OrderDate

### Add months/days

ADD_MONTHS(OrderDate, 1) or OrderDate + 7
