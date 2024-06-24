-- 1. Creating Triggers 
use organisation;

-- What is a Trigger 
-- A trigger is a collection of SQL statements with particular names that are stored in system memory. It belongs to a specific class of stored procedures that are automatically invoked in response to database server events.


-- 1.1 Insert Trigger
DELIMITER //
CREATE TRIGGER after_worker_insert 
AFTER INSERT ON worker 
FOR EACH ROW 
BEGIN 
    INSERT INTO title 
    VALUES (NEW.worker_id, 'just joined', CURRENT_TIMESTAMP);
END //
DELIMITER ;

-- 1.2 Test Insert Trigger
SELECT * FROM title;
INSERT INTO worker VALUES (10, 'Karan', 'Seth', 1000, NOW(), 'Account');
INSERT INTO worker VALUES (11, 'Karma', 'Seth', 1000, NOW(), 'Account');
INSERT INTO worker VALUES (12, 'Karesf', 'Seth', 1000, NOW(), 'ount');
SELECT * FROM title;

-- 1.3 Create Update Trigger
DELIMITER //
CREATE TRIGGER after_update
AFTER UPDATE ON worker
FOR EACH ROW
BEGIN
    UPDATE title
    SET worker_ref_id = NEW.worker_id
    WHERE worker_ref_id = OLD.worker_id;
END //
DELIMITER ;

-- 1.4 Test Update Trigger
SET foreign_key_checks = 0;
SET SQL_SAFE_UPDATES = 0;
UPDATE worker SET worker_id = 101 WHERE worker_id = 11;
SET foreign_key_checks = 1;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM worker;
SELECT * FROM title;

-- 1.5 Create Delete Trigger
DELIMITER //
CREATE TRIGGER after_worker_deletion
AFTER DELETE ON worker
FOR EACH ROW
BEGIN
    DELETE FROM title 
    WHERE worker_ref_id = OLD.worker_id;
END //
DELIMITER ;

-- 1.6 Test Delete Trigger
SET foreign_key_checks = 0;
DELETE FROM worker WHERE worker_id = 101;
SET foreign_key_checks = 1;
SELECT * FROM title;
SELECT * FROM worker;


-- TCL commands 
-- COMMIT. ROLLBACK and SAVEPOINT are the most commonly used TCL commands in SQL.

-- COMMIT
--COMMIT command in SQL is used to save all the transaction-related changes permanently to the disk. 
-- Whenever DDL commands such as INSERT, UPDATE and DELETE are used, the changes made by these commands are permanent only after closing the current session. -- So before closing the session, one can easily roll back the changes made by the DDL commands. 
-- Hence, if we want the changes to be saved permanently to the disk without closing the session, we will use the commit command.

commit;
insert into worker(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(7, 'Manan', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
(8, 'Naman', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin');


/*SET autocommit = 0;  by default it is 1, we dont need to write commit again and again */

-- the SAVEPOINT command in SQL, we can save these different parts of the same transaction using different names

savepoint insertioncmds;

-- Rollback is to revert changes to the specific savepoint
BEGIN;


-- Insert records

insert into worker(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(9, 'Raman', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
(10, 'sanam', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin');


-- Create savepoint
SAVEPOINT ins;

-- Execute delete query
DELETE FROM Worker WHERE name = 'Bob';

-- Rollback to savepoint if delete was a mistake
ROLLBACK TO SAVEPOINT ins;

-- Commit the transaction
COMMIT;

-- revert changes to a specific point within a transaction using savepoints and rollbacks.



/* Views 
View is a virtual table created by a query by joining one or more tables. 
It is operated similarly to the base table but does not contain any data of its own. 
The View and table have one main difference that the views are definitions built on top of other tables (or views). 
If any changes occur in the underlying table, the same changes reflected in the View also.
*/

-- This view will display worker details along with their computed tax using the computeTax function.
-- Basic view to show worker details and their computed tax
CREATE VIEW WorkerTaxView AS
SELECT 
    WORKER_ID,
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    DEPARTMENT,
    computeTax(SALARY) AS tax_computed
FROM Worker;

SELECT * FROM WorkerTaxView;

-- This view joins Worker and Bonus tables to display worker details along with their bonus amounts.

CREATE VIEW WorkerBonusView AS
SELECT 
    w.WORKER_ID,
    w.FIRST_NAME,
    w.LAST_NAME,
    w.SALARY,
    b.BONUS_AMOUNT,
    b.BONUS_DATE
FROM Worker w
JOIN Bonus b ON w.WORKER_ID = b.WORKER_REF_ID;

SELECT * FROM WorkerBonusView;


-- View to show worker details, their bonus amounts, and titles
CREATE VIEW WorkerFullView AS
SELECT 
    w.WORKER_ID,
    w.FIRST_NAME,
    w.LAST_NAME,
    w.SALARY,
    b.BONUS_AMOUNT,
    b.BONUS_DATE,
    t.WORKER_TITLE,
    t.AFFECTED_FROM
FROM Worker w
JOIN Bonus b ON w.WORKER_ID = b.WORKER_REF_ID
JOIN Title t ON w.WORKER_ID = t.WORKER_REF_ID;

select * from workerfullview;

/*If we want to create different views we just need to select that particualr columns and it will form a view of that 
Simplification: Views provide a simplified interface to query complex logic, making it easier to retrieve computed values alongside raw data.
Reuse: Views can be reused in multiple queries and reports without rewriting the logic each time, promoting code reusability.
Performance: Views can improve performance by storing computed results and reducing the need for complex calculations in each query.
Means you are just going to fetch the values from the smaller dataset instead of the larger one 
Views can restrict access to specific columns or rows of data, providing a layer of security by controlling what data users can see.
*/

