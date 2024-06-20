/*Subquery */

USE UBER1;
-- QUESTIONS

-- Find the name of the driver with the highest rating.
select name from drivers where rating=(select max(rating) from drivers);

-- Find the name of the customer who has taken the most expensive trip.
SELECT Name
FROM Customers
WHERE CustomerID = (SELECT CustomerID FROM Trips ORDER BY Fare DESC LIMIT 1);

-- List the names of all drivers who have a rating higher than any customer.
SELECT Name
FROM Drivers
WHERE Rating > ANY (SELECT Rating FROM Customers);

-- Find all trips that have a fare greater than the average fare.
SELECT *
FROM Trips
WHERE Fare > (SELECT AVG(Fare) FROM Trips);

-- List the names of customers who have taken more than 5 trips.
SELECT Name
FROM Customers C
WHERE (SELECT COUNT(*) FROM Trips T WHERE T.CustomerID = C.CustomerID) > 5;


-- Find the average rating of drivers who drive a cab with a capacity greater than 4.
SELECT AVG(D.Rating)
FROM Drivers D
WHERE D.CabID IN (SELECT CabID FROM Cabs WHERE Capacity > 4);

-- Find all trips with a fare higher than the average fare of trips taken by customers who have a rating of 4.5 or higher.
SELECT *
FROM Trips
WHERE Fare > (
    SELECT AVG(T.Fare)
    FROM Trips T
    JOIN Customers C ON T.CustomerID = C.CustomerID
    WHERE C.Rating >= 4.5
);

-- List the customers who have made a payment using 'Credit Card':
SELECT Name
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Trips t
    JOIN Payments p ON t.TripID = p.TripID
    WHERE p.PaymentMethod = 'Credit Card'
);

-- List the drivers who have driven more than the average number of trips per driver
-- requirement - name 
-- agg func- avg
-- group by driver (per driver)

SELECT Name
FROM Drivers
WHERE DriverID IN (
    SELECT DriverID
    FROM Trips
    GROUP BY DriverID
    HAVING COUNT(TripID) > (
        SELECT AVG(TripCount)
        FROM (
            SELECT COUNT(TripID) AS TripCount
            FROM Trips
            GROUP BY DriverID
        ) AS DriverTrips
    )
);

-- list the locations with total fare higher than the average total fare of all locations:

SELECT StartLocation
FROM Trips
GROUP BY StartLocation
HAVING SUM(Fare) > (
    SELECT AVG(TotalFare)
    FROM (
        SELECT StartLocation, SUM(Fare) AS TotalFare
        FROM Trips
        GROUP BY StartLocation
    ) AS LocationFares
);



/*Analytics Functions*/
-- Retrieve the names of customers along with their total fares and the ranking of each customer based on their total fares,
-- where the customers are ranked in descending order of total fare:

SELECT c.Name, SUM(t.Fare) AS TotalFare,
       RANK() OVER (ORDER BY SUM(t.Fare) DESC) AS FareRank
FROM Customers c
JOIN Trips t ON c.CustomerID = t.CustomerID
GROUP BY c.Name;

-- same fare same rank but it will create gaps 

-- Retrieve the names of drivers along with their total fares and the dense ranking of each driver based on their total fares,
-- where drivers are ranked in descending order of total fare:

SELECT d.Name, SUM(t.Fare) AS TotalFare,
       DENSE_RANK() OVER (ORDER BY SUM(t.Fare) DESC) AS FareDenseRank
FROM Drivers d
JOIN Trips t ON d.DriverID = t.DriverID
GROUP BY d.Name;

-- same fare same rank but it will not create gaps 

-- Retrieve the names of customers along with their total fares and the row number of each customer,
-- where customers are ordered by their total fares in descending order:

SELECT c.Name, SUM(t.Fare) AS TotalFare,
       ROW_NUMBER() OVER (ORDER BY SUM(t.Fare) DESC) AS FareRowNumber
FROM Customers c
JOIN Trips t ON c.CustomerID = t.CustomerID
GROUP BY c.Name;


/*Retrieve the names of drivers along with their total fares and the cumulative distribution of each driver's total fare, 
indicating what fraction of drivers have total fares less than or equal to the total fare of each driver:*/

SELECT d.Name, SUM(t.Fare) AS TotalFare,
       CUME_DIST() OVER (ORDER BY SUM(t.Fare) ASC) AS FareCumulativeDistribution
FROM Drivers d
JOIN Trips t ON d.DriverID = t.DriverID
GROUP BY d.Name;


/* Retrieve the names of customers along with their total fares and the total fare of the previous customer in the list, 
ordered by total fare in ascending order:*/
SELECT c.Name, SUM(t.Fare) AS TotalFare,
       LAG(SUM(t.Fare), 1) OVER (ORDER BY SUM(t.Fare) ASC) AS PreviousFare
FROM Customers c
JOIN Trips t ON c.CustomerID = t.CustomerID
GROUP BY c.Name;

/*Retrieve the names of drivers along with their total fares and the total fare of the next driver in the list, ordered by total fare in ascending order:*/

SELECT d.Name, SUM(t.Fare) AS TotalFare,
       LEAD(SUM(t.Fare), 1) OVER (ORDER BY SUM(t.Fare) ASC) AS NextFare
FROM Drivers d
JOIN Trips t ON d.DriverID = t.DriverID
GROUP BY d.Name;








