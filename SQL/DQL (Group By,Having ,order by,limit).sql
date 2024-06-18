/*Practicing the concept :
Group by
Having
Order by 
Limit 
Offset 
*/

use uber1; 
/*USING THE DATABASE-UBER */
-- Write a SQL query to list all trips in ascending order of fare.
SELECT * FROM Trips
ORDER BY Fare ASC;

-- Retrieve the top 3 highest paying trips.
SELECT * FROM Trips
ORDER BY Fare DESC
LIMIT 3;

-- Find the total number of trips made by each customer.
SELECT CustomerID, COUNT(*) AS NumberOfTrips
FROM Trips
GROUP BY CustomerID;

-- Identify the top 5 drivers with the highest ratings.
SELECT * FROM Drivers
ORDER BY Rating DESC
LIMIT 5;

-- Calculate the average fare of trips for each cab.
SELECT CabID, AVG(Fare) AS AverageFare
FROM Trips JOIN Drivers ON Trips.DriverID = Drivers.DriverID
GROUP BY CabID;

-- List cabs that have completed more than 2 trips.
SELECT CabID
FROM Trips JOIN Drivers ON Trips.DriverID = Drivers.DriverID
GROUP BY CabID
HAVING COUNT(TripID) > 2;

-- Display the second set of 5 customers based on alphabetical order.
SELECT * FROM Customers
ORDER BY Name ASC
LIMIT 5 OFFSET 5;

-- Find the total earnings for each driver, ordered by earnings in descending order.
SELECT DriverID, SUM(Fare) AS TotalEarnings 
FROM Trips 
GROUP BY DriverID 
ORDER BY TotalEarnings DESC;


-- Find the average rating of drivers who have completed more than 10 trips.
SELECT d.DriverID, AVG(Rating) AS AverageRating
FROM Trips 
JOIN Drivers d
ON Trips.DriverID = d.DriverID
GROUP BY d.DriverID
HAVING COUNT(TripID) > 10;

-- List customers who have made at least 3 trips and sort them by the total fare they've paid.
SELECT CustomerID, COUNT(*) AS NumberOfTrips, SUM(Fare) AS TotalFarePaid
FROM Trips
GROUP BY CustomerID
HAVING COUNT(*) >= 3
ORDER BY TotalFarePaid DESC;


-- Retrieve the top 5 destinations where the highest total fare has been paid.
SELECT EndLocation, SUM(Fare) AS TotalFare
FROM Trips
GROUP BY EndLocation
ORDER BY TotalFare DESC
LIMIT 5;

-- Calculate the average fare of trips for each customer and display only those whose average fare is above 200.
SELECT CustomerID, AVG(Fare) AS AverageFare
FROM Trips
GROUP BY CustomerID
HAVING AVG(Fare) > 200;

-- List all drivers and the total number of trips they have completed, including those who have completed zero trips.
SELECT Drivers.DriverID, IFNULL(COUNT(Trips.TripID), 0) AS NumberOfTrips
FROM Drivers LEFT JOIN Trips ON Drivers.DriverID = Trips.DriverID
GROUP BY Drivers.DriverID
ORDER BY NumberOfTrips DESC;

-- Display the second set of 10 trips sorted by the trip date, skipping the first 10.
SELECT *
FROM Trips
ORDER BY StartDateTime ASC
LIMIT 10 OFFSET 10;

-- Find the total fare collected for each cab type and list them in descending order of total fare.
SELECT CabType, SUM(Fare) AS TotalFareCollected
FROM Trips JOIN Cabs ON Trips.CabID = Cabs.CabID
GROUP BY CabType
ORDER BY TotalFareCollected DESC;



