create database newdb2;
use newdb2;
CREATE TABLE departments (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(255) NOT NULL
);
CREATE TABLE employees (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(255) NOT NULL,
    DEPT_ID INT,
    FOREIGN KEY (DEPT_ID) REFERENCES departments(DEPT_ID)
);

INSERT INTO departments (DEPT_ID, DEPT_NAME) VALUES
(1, 'MARKETING'),
(2, 'SALES'),
(3, 'HR'),
(4, 'TECHNICAL'),
(5, 'OTHERS');

INSERT INTO employees (EMP_ID, EMP_NAME, DEPT_ID) VALUES
(1, 'RAM', 1),
(2, 'SHAM', 1),
(3, 'GEETA', 2),
(4, 'RAMAN', 6),
(5, 'SHEETAL', 3),
(6, 'MEGHA', 6),
(7, 'KHUSHI', 4),
(8, 'KEERTHI', 4),
(9, 'SUMNA', 2),
(10, 'PRAKASH', 3);


/*INNER JOIN*/
select * 
from employees 
inner join departments on
employees.DEPT_ID=departments.DEPT_ID ;


/*LEFT JOIN*/
select * 
from employees 
LEFT join departments on
employees.DEPT_ID=departments.DEPT_ID ;

/*RIGHT JOIN*/
select * 
from employees 
RIGHT join departments on
employees.DEPT_ID=departments.DEPT_ID ;

/*OUTER JOIN */
select * 
from employees 
LEFT join departments on
employees.DEPT_ID=departments.DEPT_ID 
UNION
select * 
from employees 
RIGHT join departments on
employees.DEPT_ID=departments.DEPT_ID ;


/*For question I am using the uber database*/
use uber ;

-- List all trips with customer names.
SELECT Trips.TripID, Customers.Name
FROM Trips
JOIN Customers ON Trips.CustomerID = Customers.CustomerID;


-- Display all payments along with driver names.
SELECT Payments.PaymentID, Drivers.Name
FROM Payments
JOIN Trips ON Payments.TripID = Trips.TripID
JOIN Drivers ON Trips.DriverID = Drivers.DriverID;

-- Show the cab model for each trip.
SELECT Trips.TripID, Cabs.Model
FROM Trips
JOIN Drivers ON Trips.DriverID = Drivers.DriverID
JOIN Cabs ON Drivers.CabID = Cabs.CabID;

-- Find all customers and their trip start locations.
SELECT Customers.Name, Trips.StartLocation
FROM Customers
JOIN Trips ON Customers.CustomerID = Trips.CustomerID;

-- List the fare and payment method for each trip.
SELECT Trips.Fare, Payments.PaymentMethod
FROM Trips
JOIN Payments ON Trips.TripID = Payments.TripID;

-- Get the average rating of drivers for each cab model.
SELECT Cabs.Model, AVG(Drivers.Rating) AS AverageRating
FROM Cabs
JOIN Drivers ON Cabs.CabID = Drivers.CabID
GROUP BY Cabs.Model;

-- Find the total number of trips for each type of cab capacity.
SELECT Cabs.Capacity, COUNT(Trips.TripID) AS NumberOfTrips
FROM Cabs
JOIN Drivers ON Cabs.CabID = Drivers.CabID
JOIN Trips ON Drivers.DriverID = Trips.DriverID
GROUP BY Cabs.Capacity;

-- List the name of customers who have taken a trip in a specific cab model, say 'Model X'.
SELECT DISTINCT Customers.Name
FROM Customers
JOIN Trips ON Customers.CustomerID = Trips.CustomerID
JOIN Drivers ON Trips.DriverID = Drivers.DriverID
JOIN Cabs ON Drivers.CabID = Cabs.CabID
WHERE Cabs.Model = 'Model X';

-- Identify customers who have used more than one cab model for their trips.
SELECT Customers.Name
FROM Customers
JOIN Trips ON Customers.CustomerID = Trips.CustomerID
JOIN Drivers ON Trips.DriverID = Drivers.DriverID
JOIN Cabs ON Drivers.CabID = Cabs.CabID
GROUP BY Customers.Name
HAVING COUNT(DISTINCT Cabs.Model) > 1;

-- List all payments made for trips, starting with the most recent payment and include the corresponding customer name.
SELECT Payments.*, Customers.Name
FROM Payments
JOIN Trips ON Payments.TripID = Trips.TripID
JOIN Customers ON Trips.CustomerID = Customers.CustomerID
ORDER BY Payments.PaymentDateTime DESC;

-- Identify the top 3 customers in terms of money spent on trips, but only include those who have taken at least 2 trips.
SELECT Customers.CustomerID, Customers.Name, SUM(Trips.Fare) AS TotalSpent
FROM Customers
JOIN Trips ON Customers.CustomerID = Trips.CustomerID
GROUP BY Customers.CustomerID
HAVING COUNT(Trips.TripID) >= 2
ORDER BY TotalSpent DESC
LIMIT 3;


