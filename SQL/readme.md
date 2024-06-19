## DAY 1 

# Welcome to the World of Databases

## Introduction

Imagine a mall with neatly categorized sections like clothes, trousers, etc. You describe what you want to a salesperson, who fetches it for you. This is similar to how SQL works with databases. Let’s explore some key concepts:

## Key Terms

- **Database**: An organized collection of structured information.
- **DBMS**: Database Management System – software to store, retrieve, and manage data.
- **RDBMS**: Relational Database Management System – stores data in tables with predefined relationships.

## SQL and MySQL

- **SQL**: Structured Query Language, used to interact with RDBMS.
- **MySQL**: A popular RDBMS based on SQL, known for its reliability and ease of use.

## Why Learn SQL?

SQL is the language to communicate with databases, enabling you to retrieve, add, and manage data effectively.


# Understanding Data Types and Constraints in Databases

## Data Types

In databases, **data types** define the type of data that can be stored in a column of a table. Each column in a table is assigned a specific data type, which dictates the kind of values it can hold. Common data types include:

- **Integer**: Whole numbers without decimal points.
- **Varchar**: Variable-length character strings.
- **Date**: Date values.
- **Boolean**: True or false values.
- **Numeric**: Numbers with decimal points.

Choosing the appropriate data type ensures efficient storage and manipulation of data in the database.

## Constraints

**Constraints** in databases enforce rules and restrictions on data columns. They maintain data integrity by preventing invalid data from being inserted into tables. Common constraints include:

- **Primary Key**: Uniquely identifies each record in a table.
- **Foreign Key**: Establishes a link between two tables.
- **Not Null**: Ensures a column cannot have a null value.
- **Unique**: Ensures all values in a column are distinct.
- **Check**: Enforces specific conditions on data values.
  

### DML (Data Manipulation Language)

DML commands in SQL are used to manipulate data within the database. These commands enable users to insert, update, delete, and retrieve data from tables. Here are the primary DML commands:

- **INSERT**: Adds new rows of data into a table.
- **UPDATE**: Modifies existing data within a table.
- **DELETE**: Removes rows of data from a table.
- **SELECT**: Retrieves data from a table or views it.

### DDL (Data Definition Language)

DDL commands in SQL are used to define the structure and schema of the database and its objects. These commands are responsible for creating, altering, and dropping database objects. Here are the primary DDL commands:

- **CREATE**: Defines new database objects such as tables, views, indexes, etc.
- **ALTER**: Modifies the structure of existing database objects.
- **DROP**: Deletes database objects such as tables or views.
- **TRUNCATE**: Removes all rows from a table (often considered a DDL command in some database systems).

### Operators in SQL

Operators in SQL are symbols or keywords used to perform operations on data. They are classified into several categories based on their functions:

1. **Arithmetic Operators**: Perform mathematical calculations on numeric data.
   - Examples: `+` (addition), `-` (subtraction), `*` (multiplication), `/` (division), `%` (modulo).

2. **Comparison Operators**: Compare values to return boolean results (true or false).
   - Examples: `=` (equal to), `>` (greater than), `<` (less than), `>=` (greater than or equal to), `<=` (less than or equal to), `<>` or `!=` (not equal to).

3. **Logical Operators**: Combine multiple conditions and return a boolean result.
   - Examples: `AND`, `OR`, `NOT`.

4. **Bitwise Operators**: Perform operations at bit level on binary numbers.
   - Examples: `&` (bitwise AND), `|` (bitwise OR), `^` (bitwise XOR).


## DAY 2


### DQL (Data Query Language)

DQL commands in SQL are used to retrieve data from the database. These commands allow users to specify the data they want to fetch and filter it based on various conditions. Here are the primary DQL commands:

- **SELECT**: Retrieves data from one or more tables.
- **FROM**: Specifies the table from which data should be retrieved.
- **WHERE**: Filters data based on specified conditions.
- **GROUP BY**: Groups rows that have the same values into summary rows.
- **HAVING**: Filters groups based on specified conditions.
- **ORDER BY**: Sorts the result set in ascending or descending order.
- **LIMIT**: Limits the number of rows returned in the result set.

### SQL Inbuilt Functions

In SQL, built-in functions are predefined functions that perform operations on data. These functions are categorized into different types based on their functionality:

#### Aggregate Functions

Aggregate functions perform calculations on a set of values and return a single value. They are often used with the GROUP BY clause.

- **COUNT()**: Returns the number of rows in a group.
- **SUM()**: Returns the sum of values in a group.
- **AVG()**: Returns the average of values in a group.
- **MIN()**: Returns the minimum value in a group.
- **MAX()**: Returns the maximum value in a group.

#### String Functions

String functions operate on character strings and manipulate them in various ways.

- **CHAR_LENGTH() / LENGTH()**: Returns the length of a string.
- **CONCAT() / CONCAT_WS()**: Concatenates two or more strings together.
- **UPPER() / LOWER() / LCASE()**: Converts a string to uppercase or lowercase.
- **SUBSTR() / SUBSTRING()**: Extracts a substring from a string.
- **TRIM() / LTRIM() / RTRIM()**: Removes leading and/or trailing spaces from a string.

#### Date and Time Functions

Date and time functions operate on date and time values and perform calculations or extract components from them.

- **CURRENT_DATE() / CURDATE()**: Returns the current date.
- **CURRENT_TIME() / CURTIME()**: Returns the current time.
- **DATE() / EXTRACT()**: Extracts parts of a date or time value.
- **DATE_ADD() / DATE_SUB()**: Adds or subtracts a specified time interval from a date.

#### Numeric Functions

Numeric functions perform mathematical operations on numeric data types.

- **ROUND()**: Rounds a numeric value to a specified number of decimal places.
- **FLOOR() / CEILING()**: Rounds a numeric value down or up to the nearest integer.
- **ABS()**: Returns the absolute (positive) value of a numeric expression.
- **POW()**: Raises a number to the power of another number.