/*Normalisation*/

/*
1 NF ->
Each col must contain a unique value 

So we take a example in which we are going to make a table:
Student 
*/ 
create database norm;
use norm;

create table student(
rollno int ,
name  varchar(30),
subject varchar(30)
);

insert into student(rollno,name,subject)values
(1,"Muskan","C++/SQL"),
(2,"RAM","C++"),
(3,"Sham","SQL");

/*This above table is violating the 1 NF bcoz acc to the 1 NF the col must have atomic value BUT muskan is having two values in the same column
So following the 1NF RULES WE NEED TO CONVERT THE ABOVE TABLE INTO :*/

insert into student(rollno,name,subject)values
(1,"Muskan","C++"),
(1,"Muskan","SQL"),
(2,"RAM","C++"),
(3,"Sham","SQL");


/*
Second Normal Form (2NF)
In the 2NF, relational must be in 1NF.
In the second normal form, all non-key attributes are fully functional dependent on the primary key
*/

CREATE TABLE student (
    rollno INT,
    name VARCHAR(30),
    subject VARCHAR(30),
    PRIMARY KEY (rollno, subject)  -- Composite primary key 
);
-- by making a compsite key there will be no partial dependencies 
INSERT INTO student (rollno, name, subject) VALUES
(1, 'Muskan', 'C++'),
(1, 'Muskan', 'SQL'),
(2, 'RAM', 'C++'),
(3, 'Sham', 'SQL');


/*3NF 
It is in 2NF
There are no transitive dependencies ,non key columns must not depend on other no key colums
*/


CREATE TABLE emp (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    deptid INT,
    deptname VARCHAR(50),
    managerid INT,
    managername VARCHAR(50)
);

-- emp table is converted into 3 table 
CREATE TABLE employee (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    deptid INT,
    managerid INT,
    FOREIGN KEY (deptid) REFERENCES dept(deptid),
    FOREIGN KEY (managerid) REFERENCES manager(managerid)
);
CREATE TABLE dept (
    deptid INT PRIMARY KEY,
    deptname VARCHAR(50)
);
CREATE TABLE manager (
    managerid INT PRIMARY KEY,
    managername VARCHAR(50)
);

-- BCNF 
-- we cant derive prime attribute from non prime attribute 
/*
Functional Dependencies:
{stuid,subject}→professor (Composite key determines professor)
{professor}→subject (A non-prime attribute determines a prime attribute)
The second functional dependency violates BCNF because a non-prime attribute (professor) determines a prime attribute (subject). 
To achieve BCNF, we need to decompose the table to remove this violation.
*/


-- Original Table Creation
CREATE TABLE student_subject_professor (
    stuid INT,
    subject VARCHAR(50),
    professor VARCHAR(50),
    PRIMARY KEY (stuid, subject)
);

-- Inserting data into the original table
INSERT INTO student_subject_professor (stuid, subject, professor) VALUES
(101, 'java', 'pj'),
(101, 'c++', 'pc'),
(102, 'java', 'pj2'),
(103, 'c', 'pc');

-- Decomposition into BCNF

-- Table 1: student_subject
CREATE TABLE student_subject (
    stuid INT,
    pid INT,
    PRIMARY KEY (stuid, pid)
);

-- Table 2: professor_subject
CREATE TABLE professor_subject (
    pid INT,
    professor VARCHAR(50),
    subject VARCHAR(50),
    PRIMARY KEY (pid)
);

-- Inserting data into professor_subject table
INSERT INTO professor_subject (pid, professor, subject) VALUES
(1, 'pj', 'java'),
(2, 'pc', 'c++'),
(3, 'pj2', 'java'),
(4, 'pc', 'c');

-- Inserting data into student_subject table
INSERT INTO student_subject (stuid, pid) VALUES
(101, 1),
(101, 2),
(102, 3),
(103, 2);

-- 4NF
/*
Violation of 4NF
The table is in 1NF because all values are atomic. However, it violates 4NF because it has multivalued dependencies. Specifically:
NAME can determine multiple PROJECT values.
NAME can determine multiple HOBBY values.
*/

-- Original Table Creation
CREATE TABLE name_project_hobby (
    name VARCHAR(50),
    project VARCHAR(50),
    hobby VARCHAR(50)
);

-- Inserting data into the original table
INSERT INTO name_project_hobby (name, project, hobby) VALUES
('TIM', 'MS', 'READ'),
('TIM', 'ORACLE', 'DANCE'),
('TIM', 'MS', 'DANCE'),
('TIM', 'ORACLE', 'READ');

-- Table 1: name_project
CREATE TABLE name_project (
    name VARCHAR(50),
    project VARCHAR(50),
    PRIMARY KEY (name, project)
);

-- Table 2: name_hobby
CREATE TABLE name_hobby (
    name VARCHAR(50),
    hobby VARCHAR(50),
    PRIMARY KEY (name, hobby)
);

-- Inserting data into name_project table
INSERT INTO name_project (name, project) VALUES
('TIM', 'MS'),
('TIM', 'ORACLE');

-- Inserting data into name_hobby table
INSERT INTO name_hobby (name, hobby) VALUES
('TIM', 'READ'),
('TIM', 'DANCE');








