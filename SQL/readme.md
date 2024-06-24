# DAY 1   ( 17 June 2024 )


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


# DAY 2   ( 18 June 2024 )


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


# DAY 3   ( 19 June 2024 )

Detailed sql query is in Joins in SQL file

This is the visual representation of the tables and the result 

### Employee Table

| EMP_ID | EMP_NAME | DEPT_ID |
|--------|----------|---------|
| 1      | RAM      | 1       |
| 2      | SHAM     | 1       |
| 3      | GEETA    | 2       |
| 4      | RAMAN    | NULL    |
| 5      | SHEETAL  | 3       |
| 6      | MEGHA    | NULL    |
| 7      | KHUSHI   | 4       |
| 8      | KEERTHI  | 4       |
| 9      | SUMNA    | 2       |
| 10     | PRAKASH  | 3       |

### Department Table

| DEPT_ID | DEPT_NAME   |
|---------|-------------|
| 1       | MARKETING   |
| 2       | SALES       |
| 3       | HR          |
| 4       | TECHNICAL   |
| 5       | OTHERS      |

### INNER JOIN

An `INNER JOIN` returns rows when there is a match in both tables.

```sql
SELECT EMP_ID, EMP_NAME, EMPLOYEE.DEPT_ID, DEPT_NAME
FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID;
```

| EMP_ID | EMP_NAME | DEPT_ID | DEPT_NAME  |
|--------|----------|---------|------------|
| 1      | RAM      | 1       | MARKETING  |
| 2      | SHAM     | 1       | MARKETING  |
| 3      | GEETA    | 2       | SALES      |
| 5      | SHEETAL  | 3       | HR         |
| 7      | KHUSHI   | 4       | TECHNICAL  |
| 8      | KEERTHI  | 4       | TECHNICAL  |
| 9      | SUMNA    | 2       | SALES      |
| 10     | PRAKASH  | 3       | HR         |

### LEFT JOIN

A `LEFT JOIN` returns all rows from the left table (EMPLOYEE), and the matched rows from the right table (DEPARTMENT). The result is `NULL` from the right side if there is no match.

```sql
SELECT EMP_ID, EMP_NAME, EMPLOYEE.DEPT_ID, DEPT_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT
ON EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID;
```

| EMP_ID | EMP_NAME | DEPT_ID | DEPT_NAME  |
|--------|----------|---------|------------|
| 1      | RAM      | 1       | MARKETING  |
| 2      | SHAM     | 1       | MARKETING  |
| 3      | GEETA    | 2       | SALES      |
| 4      | RAMAN    | NULL    | NULL       |
| 5      | SHEETAL  | 3       | HR         |
| 6      | MEGHA    | NULL    | NULL       |
| 7      | KHUSHI   | 4       | TECHNICAL  |
| 8      | KEERTHI  | 4       | TECHNICAL  |
| 9      | SUMNA    | 2       | SALES      |
| 10     | PRAKASH  | 3       | HR         |

### RIGHT JOIN

A `RIGHT JOIN` returns all rows from the right table (DEPARTMENT), and the matched rows from the left table (EMPLOYEE). The result is `NULL` from the left side if there is no match.

```sql
SELECT EMP_ID, EMP_NAME, EMPLOYEE.DEPT_ID, DEPARTMENT.DEPT_ID, DEPT_NAME
FROM EMPLOYEE
RIGHT JOIN DEPARTMENT
ON EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID;
```

| EMP_ID | EMP_NAME | EMPLOYEE.DEPT_ID | DEPARTMENT.DEPT_ID | DEPT_NAME  |
|--------|----------|------------------|--------------------|------------|
| 1      | RAM      | 1                | 1                  | MARKETING  |
| 2      | SHAM     | 1                | 1                  | MARKETING  |
| 3      | GEETA    | 2                | 2                  | SALES      |
| 9      | SUMNA    | 2                | 2                  | SALES      |
| 5      | SHEETAL  | 3                | 3                  | HR         |
| 10     | PRAKASH  | 3                | 3                  | HR         |
| 7      | KHUSHI   | 4                | 4                  | TECHNICAL  |
| 8      | KEERTHI  | 4                | 4                  | TECHNICAL  |
| NULL   | NULL     | NULL             | 5                  | OTHERS     |

### FULL OUTER JOIN

A `FULL OUTER JOIN` returns all rows when there is a match in one of the tables. This means it returns all rows from the left table and all rows from the right table. Where there is no match, the result is `NULL`.

(Note: Not all SQL databases support FULL OUTER JOIN directly; you may need to use a UNION of LEFT JOIN and RIGHT JOIN for similar results.)

```sql
SELECT EMP_ID, EMP_NAME, EMPLOYEE.DEPT_ID, DEPT_NAME
FROM EMPLOYEE
FULL OUTER JOIN DEPARTMENT
ON EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID;
```

| EMP_ID | EMP_NAME | DEPT_ID | DEPT_NAME  |
|--------|----------|---------|------------|
| 1      | RAM      | 1       | MARKETING  |
| 2      | SHAM     | 1       | MARKETING  |
| 3      | GEETA    | 2       | SALES      |
| 4      | RAMAN    | NULL    | NULL       |
| 5      | SHEETAL  | 3       | HR         |
| 6      | MEGHA    | NULL    | NULL       |
| 7      | KHUSHI   | 4       | TECHNICAL  |
| 8      | KEERTHI  | 4       | TECHNICAL  |
| 9      | SUMNA    | 2       | SALES      |
| 10     | PRAKASH  | 3       | HR         |
| NULL   | NULL     | 5       | OTHERS     |

By following these tables and SQL queries, you can see how different types of joins affect the output of your data when combining the `EMPLOYEE` and `DEPARTMENT` tables.

## Normalisation

Normalization is the process of organizing a database to minimize redundancy and ensure data integrity. The primary objective is to structure the data so that dependencies are logical, making the database more efficient to manage and query.

### 🏛️ Normal Forms

#### 1️⃣ First Normal Form (1NF)
**Definition:**
- Ensures that each column contains atomic (indivisible) values.
- Removes duplicate columns from the same table.
- Creates separate tables for each group of related data and identifies each row with a unique column or set of columns (the primary key).

#### 2️⃣ Second Normal Form (2NF)
**Definition:**
- Meets all the requirements of the first normal form.
- Ensures that all non-key attributes are fully functionally dependent on the primary key, meaning each non-key attribute is related to the whole primary key.

#### 3️⃣ Third Normal Form (3NF)
**Definition:**
- Meets all the requirements of the second normal form.
- Ensures that all non-key attributes are not only fully functionally dependent on the primary key but are also non-transitively dependent on it. This means that non-key attributes should not depend on other non-key attributes.

#### 🅱️ Boyce-Codd Normal Form (BCNF)
**Definition:**
- Meets all the requirements of the third normal form.
- For every functional dependency, the determinant must be a superkey. This is a stricter version of the third normal form.

#### 4️⃣ Fourth Normal Form (4NF)
**Definition:**
- Meets all the requirements of the Boyce-Codd normal form.
- A table should not have multi-valued dependencies. This means that one attribute should not have more than one value for a single value of the primary key.



# DAY 4   ( 20 June 2024 )

## Subqueries and window functions 

## 🔍 Subqueries

### Definition

A subquery, also known as an inner query or nested query, is a query within another SQL query. The subquery provides results that are used by the outer query. Subqueries can be used in various clauses such as `SELECT`, `FROM`, `WHERE`, and `HAVING`.

### Types of Subqueries

#### 1. Single Row Subqueries
**Definition:**
- Return only one row of results.
- Commonly used with comparison operators such as `=`, `<`, `>`, `<=`, `>=`.

**Example Use Case:**
- Finding the employee with the highest salary within a department.

#### 2. Multi Row Subqueries
**Definition:**
- Return more than one row of results.
- Used with operators such as `IN`, `ANY`, `ALL`.

**Example Use Case:**
- Listing employees who work in departments located in specific cities.

#### 3. Correlated Subqueries
**Definition:**
- Reference columns from the outer query.
- Re-evaluated for each row of the outer query, making them more complex and often slower than regular subqueries.

**Example Use Case:**
- Finding employees whose salary is above the average salary of their department.


## 🔄 Window Functions

### Definition

Window functions perform calculations across a set of table rows that are related to the current row. Unlike aggregate functions, window functions do not cause rows to become grouped into a single output row. Instead, the rows retain their separate identities.

### Common Window Functions

#### 1. `ROW_NUMBER()`
Assigns a unique sequential integer to rows within a partition of a result set.

#### 2. `RANK()`
Assigns a rank to each row within a partition of a result set. Rows with equal values receive the same rank, with gaps in the ranking sequence.

#### 3. `DENSE_RANK()`
Similar to `RANK()`, but assigns ranks without gaps between the ranking groups.

#### 4. `NTILE(n)`
Divides rows in an ordered partition into a specified number of groups and assigns a number to each group, ranging from 1 to n.

#### 5. `LAG()` and `LEAD()`
Provides access to a row at a specified physical offset before (`LAG()`) or after (`LEAD()`) the current row within a partition.


# DAY 5 ( 21 June 2024 )


## 🚀 Key Points

1. **🗄️ Database and Table Creation**
   - Created a database named `organsation`.
   - Created three tables: `Worker`, `Bonus`, and `Title`.

2. **📥 Data Insertion**
   - Inserted sample data into the `Worker`, `Bonus`, and `Title` tables.

3. **🔧 Stored Functions**
   - **`computeTax`:** Calculates income tax based on the salary of a worker.
   - **`calculate_len`:** Transforms worker's first name based on its length.

4. **🔄 Cursors**
   - **`iterate_worker`:** Uses a cursor to iterate over worker records and display their details along with computed tax.

# DAY 6 ( 17 June 2024 )


#### What is a Trigger?

🔔 A trigger in SQL is a set of SQL statements that automatically "fires" or executes in response to specific events on a table. These events can include INSERT, UPDATE, or DELETE operations.

#### Triggers Implemented:

- **Insert Trigger (`after_worker_insert`):**
  - **Purpose:** Automatically adds a record to the `Title` table when a new worker is inserted into the `Worker` table.
  
- **Update Trigger (`after_update`):**
  - **Purpose:** Updates the `Title` table when a worker's ID is updated.

- **Delete Trigger (`after_worker_deletion`):**
  - **Purpose:** Deletes related records from the `Title` table when a worker is deleted from the `Worker` table.

### 2. Transactions and TCL Commands

#### TCL Commands

🔒 **Transaction Control Language (TCL)** commands manage transactions within the database:

- **`COMMIT`:** Saves transaction-related changes permanently to the database.
- **`ROLLBACK`:** Reverts changes made since the last `COMMIT`.
- **`SAVEPOINT`:** Sets a point within a transaction to which you can roll back later.

### 3. Views

#### What are Views?

🖼️ Views in SQL are virtual tables generated by queries. They provide a way to present specific data from one or more tables in a structured format.

#### Views Implemented:

- **Worker Tax View (`WorkerTaxView`):**
  - **Purpose:** Displays worker details along with computed tax using the `computeTax` function.

- **Worker Bonus View (`WorkerBonusView`):**
  - **Purpose:** Joins `Worker` and `Bonus` tables to display worker details along with their bonus amounts.

- **Worker Full View (`WorkerFullView`):**
  - **Purpose:** Combines `Worker`, `Bonus`, and `Title` tables to show comprehensive worker details including bonuses and job titles.
