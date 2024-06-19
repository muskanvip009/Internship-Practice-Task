# SQLite3 Learnings 

This repo is consist of the basic operations using SQLite3 in Python, including creating a database, adding records, fetching data, deleting records, and more. SQLite3 is a lightweight, disk-based database that doesn’t require a separate server process.

## Prerequisites

- Python 3.x
- SQLite3 (comes pre-installed with Python)

## Overview

### Operations Performed

1. **Creating a Database and Table**
   - Establish a connection to an SQLite database file.
   - Create a table with columns for first name, last name, and email.

2. **Adding Records**
   - Insert single or multiple records into the database.
   - Use parameterized queries to securely insert data.

3. **Fetching Data**
   - Retrieve all records from the database.
   - Fetch records with specific criteria using SQL `SELECT` statements with `WHERE` clauses.
   - Sort records using `ORDER BY`.

4. **Updating Records**
   - Update existing records in the database based on specific conditions.

5. **Deleting Records**
   - Remove records from the database using the `DELETE` statement with specific conditions.

6. **Filtering Records**
   - Use SQL `LIKE` statements to filter records based on patterns.
   - Combine multiple conditions using `AND`/`OR` clauses.

7. **Handling Transactions**
   - Commit changes to the database to ensure data integrity.
   - Close the database connection after completing operations.

### How to Run

1. **Set Up the Environment:**
   - Ensure you have Python 3.x installed.
   - Create a virtual environment and install any necessary dependencies.

2. **Run the Script:**
   - Execute the main script to perform the database operations.
   - Use the provided functions to interact with the database and perform CRUD operations.


Learning this for understanding purpose that how can we run a database without the server 

MySQL is suitable for server-based applications requiring robust database management capabilities, while SQLite3 is ideal for lightweight, embedded use cases where simplicity, portability, and ease of deployment are priorities.

SQLite3 shines in scenarios where simplicity, portability, and local data storage are prioritized over extensive concurrency, advanced server features, and scalability. 

The major drawbacks of SQLite3 include:
1. Limited concurrency, which can lead to performance issues under heavy write loads.
2. Scaling limitations compared to traditional client-server databases like MySQL.
3. Lack of advanced features such as stored procedures and triggers.
4. Potential performance degradation with very large datasets or high concurrency.
5. Restricted network access and client-server architecture, as SQLite3 is designed for embedded and local use cases.