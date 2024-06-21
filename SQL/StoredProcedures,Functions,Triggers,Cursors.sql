/*Stored Procedured,Triggers,Functions*/

-- 1.1 Create Database
CREATE DATABASE org;
USE org;

-- 1.2 Create Worker Table
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

-- 1.3 Insert Data into Worker Table
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1, 'Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account');

-- 1.4 Create Bonus Table
CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

-- 1.5 Insert Data into Bonus Table
INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(1, 5000, '2016-02-20'),
(2, 3000, '2016-06-11'),
(3, 4000, '2016-02-20'),
(1, 4500, '2016-02-20'),
(2, 3500, '2016-06-11');

-- 1.6 Create Title Table
CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

-- 1.7 Insert Data into Title Table
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(1, 'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(5, 'Manager', '2016-06-11 00:00:00'),
(4, 'Asst. Manager', '2016-06-11 00:00:00'),
(3, 'Executive', '2016-06-11 00:00:00'),
(6, 'Lead', '2016-06-11 00:00:00'),
(3, 'Lead', '2016-06-11 00:00:00');

-- 2. Creating Stored Functions

-- 2.1 Function to Compute Income Tax
DELIMITER $$
CREATE FUNCTION computeTax(salary INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE taxcomputed DECIMAL(10,2);
    IF (salary <= 75000) THEN
        SET taxcomputed = salary * 10 / 100;
    ELSEIF (salary > 75000 AND salary <= 150000) THEN
        SET taxcomputed = salary * 20 / 100;
    ELSEIF (salary > 150000) THEN
        SET taxcomputed = salary * 30 / 100;
    END IF;
    RETURN taxcomputed;
END $$
DELIMITER ;

-- 2.2 Query to Display Worker Details with Computed Tax
SELECT worker.*, computeTax(worker.salary) AS taxcomputed 
FROM worker;

-- 2.3 Function to Calculate Length-Based Name Transformation
DELIMITER $$
CREATE FUNCTION calculate_len(first_name VARCHAR(20))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE length_f VARCHAR(20);
    IF (LENGTH(first_name) = 4) THEN
        SET length_f = UCASE(first_name);
    ELSEIF (LENGTH(first_name) = 5) THEN
        SET length_f = LCASE(first_name);
    END IF;
    RETURN length_f;
END $$
DELIMITER ;

-- 2.4 Query to Display Worker Details with Name Transformation
SELECT worker.*, calculate_len(worker.first_name) AS change_name 
FROM worker;

-- 3. Creating Triggers in MySQL

-- 3.1 Insert Trigger
DELIMITER //
CREATE TRIGGER after_worker_insert 
AFTER INSERT ON worker 
FOR EACH ROW 
BEGIN 
    INSERT INTO title 
    VALUES (NEW.worker_id, 'just joined', CURRENT_TIMESTAMP);
END //
DELIMITER ;

-- 3.2 Test Insert Trigger
SELECT * FROM title;
INSERT INTO worker VALUES (10, 'Karan', 'Seth', 1000, NOW(), 'Account');
INSERT INTO worker VALUES (11, 'Karma', 'Seth', 1000, NOW(), 'Account');
INSERT INTO worker VALUES (12, 'Karesf', 'Seth', 1000, NOW(), 'ount');
SELECT * FROM title;

-- 3.3 Create Update Trigger
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

-- 3.4 Test Update Trigger
SET foreign_key_checks = 0;
SET SQL_SAFE_UPDATES = 0;
UPDATE worker SET worker_id = 101 WHERE worker_id = 11;
SET foreign_key_checks = 1;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM worker;
SELECT * FROM title;

-- 3.5 Create Delete Trigger
DELIMITER //
CREATE TRIGGER after_worker_deletion
AFTER DELETE ON worker
FOR EACH ROW
BEGIN
    DELETE FROM title 
    WHERE worker_ref_id = OLD.worker_id;
END //
DELIMITER ;

-- 3.6 Test Delete Trigger
SET foreign_key_checks = 0;
DELETE FROM worker WHERE worker_id = 101;
SET foreign_key_checks = 1;
SELECT * FROM title;
SELECT * FROM worker;

-- 4. Creating Cursors

-- 4.1 Creating a Cursor to Iterate Over Worker Records
DELIMITER $$
CREATE PROCEDURE iterate_worker()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE w_id INT;
    DECLARE w_first_name CHAR(25);
    DECLARE w_last_name CHAR(25);
    DECLARE w_salary INT;
    DECLARE cur CURSOR FOR SELECT WORKER_ID, FIRST_NAME, LAST_NAME, SALARY FROM Worker;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO w_id, w_first_name, w_last_name, w_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Process each row
        SELECT w_id, w_first_name, w_last_name, w_salary, computeTax(w_salary) AS taxcomputed;
    END LOOP;

    CLOSE cur;
END $$
DELIMITER ;

