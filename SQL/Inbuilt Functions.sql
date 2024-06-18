-- String Functions

-- Find the length of the name for each driver.
SELECT DriverID, Name, CHAR_LENGTH(Name) AS NameLength
FROM Drivers;

-- Retrieve the ASCII value of the first character in the driver's name.
SELECT DriverID, Name, ASCII(LEFT(Name, 1)) AS FirstCharASCII
FROM Drivers;

-- Concatenate the first name and last name of each customer.
SELECT CustomerID, CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

-- Convert the email addresses of all customers to lowercase.
SELECT CustomerID, LCASE(Email) AS LowercaseEmail
FROM Customers;

-- Convert the city names of all drivers to uppercase.
SELECT DriverID, UCASE(City) AS UppercaseCity
FROM Drivers;

-- Extract the first 5 characters from the start location of each trip.
SELECT TripID, SUBSTR(StartLocation, 1, 5) AS StartLocationAbbrev
FROM Trips;

-- Left-pad the phone numbers of all customers with '0' to make them 12 characters long.
SELECT CustomerID, LPAD(Phone, 12, '0') AS PaddedPhone
FROM Customers;

-- Right-pad the license plate numbers of all vehicles with '-' to make them 10 characters long.
SELECT VehicleID, RPAD(LicensePlateNumber, 10, '-') AS PaddedLicensePlate
FROM Vehicles;

-- Trim leading and trailing spaces from the names of all drivers.
SELECT DriverID, TRIM(Name) AS TrimmedName
FROM Drivers;


-- Date and Time Functions

-- Calculate the age of each customer based on their birthdate.
SELECT CustomerID, Birthdate, YEAR(CURRENT_DATE()) - YEAR(Birthdate) - 
       CASE WHEN DATE_FORMAT(CURRENT_DATE(), '%m%d') >= DATE_FORMAT(Birthdate, '%m%d') THEN 0 ELSE 1 END AS Age
FROM Customers;

-- Find the number of days between the trip date and the current date for each trip.
SELECT TripID, TripDate, DATEDIFF(CURRENT_DATE(), TripDate) AS DaysAgo
FROM Trips;

-- Extract the date part from the timestamp of each payment.
SELECT PaymentID, PaymentTimestamp, DATE(PaymentTimestamp) AS PaymentDate
FROM Payments;

-- Retrieve the timestamp of the last payment made by each customer.
SELECT CustomerID, MAX(PaymentTimestamp) AS LastPaymentTimestamp
FROM Payments
GROUP BY CustomerID;

-- etermine the last day of the month for the payment date of each payment.
SELECT PaymentID, PaymentDate, LAST_DAY(PaymentDate) AS LastDayOfMonth
FROM Payments;

-- Display the current date and time alongside the timestamp of the last payment.
SELECT CURRENT_TIMESTAMP() AS CurrentDateTime, MAX(PaymentDateTime) AS LastPaymentTimestamp
FROM Payments;


-- Numeric Functions

-- Count the number of trips completed by each driver.
SELECT DriverID, COUNT(*) AS NumberOfTrips
FROM Trips
GROUP BY DriverID;

-- Find the minimum fare collected from all trips.
SELECT MIN(Fare) AS MinFare
FROM Trips;

-- Calculate the maximum rating received by each driver.
SELECT DriverID, MAX(Rating) AS MaxRating
FROM Drivers;

-- Round the average rating of each driver to two decimal places.
SELECT DriverID, ROUND(AVG(Rating), 2) AS AverageRating
FROM Drivers
GROUP BY DriverID;

-- ompute the square root of the total earnings for each driver.
SELECT DriverID, SQRT(SUM(Fare)) AS EarningsSqrt
FROM Trips
GROUP BY DriverID;


