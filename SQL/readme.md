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


