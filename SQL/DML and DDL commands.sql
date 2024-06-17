-- Data Definition Language (DDL) Commands

-- 1.CREATE: Used to create database objects like tables, views, indexes, etc.
-- Create customer ,drivers,cabs,trips ,payment 

create database uber1;
use uber1;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Rating DECIMAL(3,2)
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Rating DECIMAL(3,2),
    CabID INT,
    FOREIGN KEY (CabID) REFERENCES Cabs(CabID)
);

CREATE TABLE Cabs (
    CabID INT PRIMARY KEY,
    LicensePlate VARCHAR(10),
    Model VARCHAR(255),
    Capacity INT
);

CREATE TABLE Trips (
    TripID INT PRIMARY KEY,
    CustomerID INT,
    DriverID INT,
    StartDateTime DATETIME,
    EndDateTime DATETIME,
    StartLocation VARCHAR(255),
    EndLocation VARCHAR(255),
    Fare DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    TripID INT,
    Amount DECIMAL(10,2),
    PaymentDateTime DATETIME,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (TripID) REFERENCES Trips(TripID)
);

/*insert is ddl commands just to showcase some example on dml we are using this */
INSERT INTO Customers (CustomerID, Name, Email, Phone, Rating)
VALUES
    (1, 'John Smith', 'john@example.com', '1234567890', 4.5),
    (2, 'Alice Johnson', 'alice@example.com', '2345678901', 4.8),
    (3, 'Bob Williams', 'bob@example.com', '3456789012', 4.2),
    (4, 'Emily Davis', 'emily@example.com', '4567890123', 4.6),
    (5, 'Michael Brown', 'michael@example.com', '5678901234', 4.3),
    (6, 'Sophia Miller', 'sophia@example.com', '6789012345', 4.9),
    (7, 'James Wilson', 'james@example.com', '7890123456', 4.7),
    (8, 'Olivia Moore', 'olivia@example.com', '8901234567', 4.1),
    (9, 'William Taylor', 'william@example.com', '9012345678', 4.4),
    (10, 'Emma Anderson', 'emma@example.com', '0123456789', 4.0),
    (11, 'Daniel Jackson', 'daniel@example.com', '1234509876', 4.8),
    (12, 'Isabella White', 'isabella@example.com', '2345098765', 4.6),
    (13, 'Alexander Harris', 'alexander@example.com', '3450987654', 4.2),
    (14, 'Mia Martin', 'mia@example.com', '4569876543', 4.5),
    (15, 'Ethan Thompson', 'ethan@example.com', '5678765432', 4.7),
    (16, 'Ava Garcia', 'ava@example.com', '6787654321', 4.3),
    (17, 'Matthew Martinez', 'matthew@example.com', '7896543210', 4.9),
    (18, 'Sofia Robinson', 'sofia@example.com', '8965432109', 4.8),
    (19, 'David Clark', 'david@example.com', '9876543210', 4.0),
    (20, 'Madison Lewis', 'madison@example.com', '8765432109', 4.6);

    INSERT INTO Customers (CustomerID, Name, Email, Phone, Rating) VALUES
    (21, 'Hannah Montana', 'hannah.montana@email.com', '555-0133', 4.4),
    (22, 'Louis Clark', 'louis.clark@email.com', '555-0134', 4.6),
    (23, 'Mia Wong', 'mia.wong@email.com', '555-0135', 4.7),
    (24, 'Nathan Ford', 'nathan.ford@email.com', '555-0136', 4.5),
    (25, 'Olivia Dunne', 'olivia.dunne@email.com', '555-0137', 4.8);



-- Insert sample records into Drivers table
INSERT INTO Drivers (DriverID, Name, Email, Phone, Rating, CabID)
VALUES
    (1, 'Liam Neeson', 'liam@example.com', '9876543210', 4.5, 1),
    (2, 'Noah Centineo', 'noah@example.com', '8765432109', 4.7, 2),
    (3, 'Oliver Twist', 'oliver@example.com', '7654321098', 4.2, 3),
    (4, 'Elijah Wood', 'elijah@example.com', '6543210987', 4.8, 4),
    (5, 'William Wallace', 'william@example.com', '5432109876', 4.6, 5),
    (6, 'James Bond', 'james@example.com', '4321098765', 4.9, 6),
    (7, 'Benjamin Button', 'benjamin@example.com', '3210987654', 4.4, 7),
    (8, 'Lucas Graham', 'lucas@example.com', '2109876543', 4.3, 8),
    (9, 'Mason Mount', 'mason@example.com', '1098765432', 4.5, 9),
    (10, 'Ethan Hunt', 'ethan@example.com', '0987654321', 4.7, 10),
    (11, 'Alexander the Great', 'alexander@example.com', '9876543211', 4.6, 11),
    (12, 'Henry Ford', 'henry@example.com', '8765432101', 4.4, 12),
    (13, 'Sebastian Vettel', 'sebastian@example.com', '7654321012', 4.8, 13),
    (14, 'Jack Sparrow', 'jack@example.com', '6543210123', 4.9, 14),
    (15, 'Oscar Wilde', 'oscar@example.com', '5432101234', 4.1, 15),
    (16, 'Finn Wolfhard', 'finn@example.com', '4321012345', 4.5, 16),
    (17, 'Dominic Toretto', 'dominic@example.com', '3210123456', 4.7, 17),
    (18, 'Nathan Drake', 'nathan@example.com', '2101234567', 4.2, 18),
    (19, 'Gordon Freeman', 'gordon@example.com', '1012345678', 4.8, 19),
    (20, 'Arthur Morgan', 'arthur@example.com', '0123456789', 4.6, 20);
    INSERT INTO Drivers (DriverID, Name, Email, Phone, Rating, CabID) VALUES
    (21, 'Pete Quinn', 'pete.quinn@email.com', '555-0233', 4.7, 21),
    (22, 'Quincy Adam', 'quincy.adam@email.com', '555-0234', 4.5, 22),
    (23, 'Rita Young', 'rita.young@email.com', '555-0235', 4.6, 23),
    (24, 'Sam Troy', 'sam.troy@email.com', '555-0236', 4.8, 24),
    (25, 'Tina Fay', 'tina.fay@email.com', '555-0237', 4.9,25);


-- Insert sample records into Cabs table
INSERT INTO Cabs (CabID, LicensePlate, Model, Capacity)
VALUES
    (1, 'ABC123', 'Toyota Prius', 4),
    (2, 'DEF456', 'Honda Civic', 4),
    (3, 'GHI789', 'Ford Focus', 5),
    (4, 'JKL012', 'Chevrolet Volt', 4),
    (5, 'MNO345', 'Tesla Model S', 5),
    (6, 'PQR678', 'Nissan Leaf', 5),
    (7, 'STU901', 'BMW 3 Series', 5),
    (8, 'VWX234', 'Mercedes-Benz C-Class', 5),
    (9, 'YZA567', 'Audi A3', 5),
    (10, 'BCD890', 'Hyundai Ioniq', 4),
    (11, 'EFG123', 'Kia Optima', 5),
    (12, 'HIJ456', 'Toyota Camry', 4),
    (13, 'KLM789', 'Honda Accord', 5),
    (14, 'NOP012', 'Ford Fusion', 5),
    (15, 'QRS345', 'Chevrolet Malibu', 5),
    (16, 'TUV678', 'Tesla Model 3', 5),
    (17, 'WXY901', 'Nissan Sentra', 5),
    (18, 'ZAB234', 'BMW i3', 4),
    (19, 'CDE567', 'Mercedes-Benz A-Class', 5),
    (20, 'FGH890', 'Audi A4', 5);
    INSERT INTO Cabs (CabID, LicensePlate, Model, Capacity) VALUES
    (21, 'XYZ 901', 'Model Y', 4),
    (22, 'XYZ 902', 'Model Z', 4),
    (23, 'XYZ 903', 'Model X', 4),
    (24, 'XYZ 904', 'Model W', 6),
    (25, 'XYZ 905', 'Model V', 6);



-- Insert sample records into Trips table
INSERT INTO Trips (TripID, CustomerID, DriverID, StartDateTime, EndDateTime, StartLocation, EndLocation, Fare)
VALUES
    (1, 1, 20, '2023-01-01 08:00:00', '2023-01-01 08:30:00', '100 Main St', '200 Oak St', 15.00),
    (2, 2, 19, '2023-01-02 09:00:00', '2023-01-02 09:45:00', '300 Pine St', '400 Maple St', 22.50),
    (3, 3, 18, '2023-01-03 10:00:00', '2023-01-03 10:15:00', '500 Cedar St', '600 Elm St', 10.00),
    (4, 4, 17, '2023-01-04 11:30:00', '2023-01-04 12:00:00', '700 Birch St', '800 Spruce St', 18.00),
    (5, 5, 16, '2023-01-05 12:00:00', '2023-01-05 12:30:00', '900 Redwood St', '1000 Willow St', 20.00),
    (6, 6, 15, '2023-01-06 13:15:00', '2023-01-06 13:50:00', '1100 Chestnut St', '1200 Linden St', 25.00),
    (7, 7, 14, '2023-01-07 14:30:00', '2023-01-07 15:00:00', '1300 Ash St', '1400 Dogwood St', 17.50),
    (8, 8, 13, '2023-01-08 15:45:00', '2023-01-08 16:10:00', '1500 Fir St', '1600 Holly St', 15.75),
    (9, 9, 12, '2023-01-09 16:00:00', '2023-01-09 16:30:00', '1700 Oak St', '1800 Palm St', 18.25),
    (10, 10, 11, '2023-01-10 17:05:00', '2023-01-10 17:35:00', '1900 Pine St', '2000 Poplar St', 16.00),
    (11, 11, 10, '2023-01-11 18:15:00', '2023-01-11 18:45:00', '2100 Sequoia St', '2200 Sycamore St', 19.50),
    (12, 12, 9, '2023-01-12 19:25:00', '2023-01-12 19:55:00', '2300 Teak St', '2400 Walnut St', 21.00),
    (13, 13, 8, '2023-01-13 20:00:00', '2023-01-13 20:20:00', '2500 Cherry St', '2600 Magnolia St', 12.00),
    (14, 14, 7, '2023-01-14 21:10:00', '2023-01-14 21:40:00', '2700 Myrtle St', '2800 Hickory St', 22.00),
    (15, 15, 6, '2023-01-15 22:30:00', '2023-01-15 23:00:00', '2900 Beech St', '3000 Alder St', 24.00),
    (16, 16, 5, '2023-01-16 23:45:00', '2023-01-17 00:15:00', '3100 Basswood St', '3200 Cedar St', 18.50),
    (17, 17, 4, '2023-01-17 07:20:00', '2023-01-17 07:50:00', '3300 Fir St', '3400 Gum St', 16.75),
    (18, 18, 3, '2023-01-18 08:30:00', '2023-01-18 09:00:00', '3500 Holly St', '3600 Jasmine St', 14.50),
    (19, 19, 2, '2023-01-19 09:40:00', '2023-01-19 10:10:00', '3700 Koa St', '3800 Locust St', 20.25),
    (20, 20, 1, '2023-01-20 09:30:00', '2023-01-20 11:10:00', '3800 Koa St', '38 fade st', 23.25);
    INSERT INTO Trips (TripID, CustomerID, DriverID, StartDateTime, EndDateTime, StartLocation, EndLocation, Fare) VALUES
    (21, 21, 21, '2023-07-15 08:00:00', '2023-07-15 08:30:00', 'Location A', 'Location B', 25.00),
    (22, 22, 22, '2023-07-15 09:00:00', '2023-07-15 09:45:00', 'Location C', 'Location D', 35.00),
    (23, 23, 23, '2023-07-15 10:00:00', '2023-07-15 10:15:00', 'Location E', 'Location F', 15.00),
    (24, 24, 24, '2023-07-15 11:00:00', '2023-07-15 11:30:00', 'Location G', 'Location H', 25.00),
    (25, 25, 25, '2023-07-15 12:00:00', '2023-07-15 12:45:00', 'Location I', 'Location J', 35.00);
    -- Additional trips for customer 21
    INSERT INTO Trips (TripID, CustomerID, DriverID, StartDateTime, EndDateTime, StartLocation, EndLocation, Fare) VALUES
    (26, 21, 22, '2023-08-01 09:00:00', '2023-08-01 09:30:00', 'Location K', 'Location L', 30.00),
    (27, 21, 23, '2023-08-02 10:00:00', '2023-08-02 10:30:00', 'Location M', 'Location N', 20.00);
    
    -- Additional trips for customer 22
    INSERT INTO Trips (TripID, CustomerID, DriverID, StartDateTime, EndDateTime, StartLocation, EndLocation, Fare) VALUES
    (28, 22, 24, '2023-08-03 11:00:00', '2023-08-03 11:45:00', 'Location O', 'Location P', 45.00),
    (29, 22, 25, '2023-08-04 12:00:00', '2023-08-04 12:30:00', 'Location Q', 'Location R', 25.00);
    
    -- Additional trips for customer 23
    INSERT INTO Trips (TripID, CustomerID, DriverID, StartDateTime, EndDateTime, StartLocation, EndLocation, Fare) VALUES
    (30, 23, 21, '2023-08-05 13:00:00', '2023-08-05 13:20:00', 'Location S', 'Location T', 18.00),
    (31, 23, 22, '2023-08-06 14:00:00', '2023-08-06 14:30:00', 'Location U', 'Location V', 22.00);

     -- Additional trip for customer 24 to ensure they don't meet the "HAVING COUNT(Trips.TripID) >= 2" condition
     INSERT INTO Trips (TripID, CustomerID, DriverID, StartDateTime, EndDateTime, StartLocation, EndLocation, Fare) VALUES
     (32, 24, 23, '2023-08-07 15:00:00', '2023-08-07 15:45:00', 'Location W', 'Location X', 50.00);

INSERT INTO Payments (PaymentID, TripID, Amount, PaymentMethod, PaymentDateTime)
VALUES
    (1, 1, 15.00, 'Credit Card', '2023-01-01'),
    (2, 2, 22.50, 'Debit Card', '2023-01-02'),
    (3, 3, 10.00, 'Cash', '2023-01-03'),
    (4, 4, 18.00, 'Credit Card', '2023-01-04'),
    (5, 5, 20.00, 'Credit Card', '2023-01-05'),
    (6, 6, 25.00, 'Debit Card', '2023-01-06'),
    (7, 7, 17.50, 'Cash', '2023-01-07'),
    (8, 8, 15.75, 'Credit Card', '2023-01-08'),
    (9, 9, 18.25, 'Debit Card', '2023-01-09'),
    (10, 10, 16.00, 'Credit Card', '2023-01-10'),
    (11, 11, 19.50, 'Cash', '2023-01-11'),
    (12, 12, 21.00, 'Credit Card', '2023-01-12'),
    (13, 13, 12.00, 'Debit Card', '2023-01-13'),
    (14, 14, 22.00, 'Credit Card', '2023-01-14'),
    (15, 15, 24.00, 'Cash', '2023-01-15'),
    (16, 16, 18.50, 'Debit Card', '2023-01-16'),
    (17, 17, 16.75, 'Credit Card', '2023-01-17'),
    (18, 18, 14.50, 'Cash', '2023-01-18'),
    (19, 19, 20.25, 'Debit Card', '2023-01-19'),
    (20, 20, 15.00, 'Credit Card', '2023-01-20');
    INSERT INTO Payments (PaymentID, TripID, Amount, PaymentDateTime, PaymentMethod) VALUES
    (21, 21, 25.00, '2023-07-15 08:35:00', 'Credit Card'),
    (22, 22, 35.00, '2023-07-15 09:50:00', 'Cash'),
    (23, 23, 15.00, '2023-07-15 10:20:00', 'Credit Card'),
    (24, 24, 25.00, '2023-07-15 11:35:00', 'PayPal'),
    (25, 25, 35.00, '2023-07-15 12:50:00', 'Debit Card');

-- ALTER commands

-- 1. Alter the Customers table to add a new column
ALTER TABLE Customers
ADD MembershipLevel VARCHAR(50);

-- 2. Alter the Drivers table to rename the Phone column to PhoneNumber
ALTER TABLE Drivers
CHANGE COLUMN Phone PhoneNumber VARCHAR(20);

-- 3. Alter the Trips table to add an additional foreign key reference to the Payments table
ALTER TABLE Trips
ADD CONSTRAINT FK_Trips_Payments FOREIGN KEY (TripID) REFERENCES Payments(TripID);

-- DROP commands

-- 1. Drop the Customers table
DROP TABLE IF EXISTS Customers;

-- 2. Drop the Cabs table
DROP TABLE IF EXISTS Cabs;

-- 3. Drop the Payments table
DROP TABLE IF EXISTS Payments;

-- TRUNCATE command

-- Truncate the Drivers table to remove all rows
TRUNCATE TABLE Drivers;

-- RENAME command

-- Rename the Trips table to TripDetails
ALTER TABLE Trips
RENAME TO TripDetails;



/*--------------------------DML COMMANDS (DATA MANUPULATION LANGUAGE)----------------------------------------------*/

-- insert OPERATION IS PERFORMED (IT IS TO INSERT THE ROWS INSIDE THE TABLES)

-- Update record in Customers table
UPDATE Customers SET Rating = 4.7 WHERE CustomerID = 10;

-- Delete records from Trips table
DELETE FROM Trips WHERE TripID > 20;

-- Select statement to retrieve data
SELECT CustomerID, Name, Email FROM Customers WHERE Rating > 4.5;

-- these operations can be useful when used with aggregates ,joins and different clauses in sql 

-- Update records in Customers table
UPDATE Customers SET Phone = '9999999999' WHERE CustomerID = 1;

-- Update records using a subquery
UPDATE Drivers
SET Rating = Rating + 0.1
WHERE CabID IN (SELECT CabID FROM Cabs WHERE Model = 'Tesla Model S');

-- Delete records from Trips table
DELETE FROM Trips WHERE Fare < 20.00;

-- Delete records using EXISTS
DELETE FROM Customers
WHERE EXISTS (
    SELECT * FROM Trips WHERE Trips.CustomerID = Customers.CustomerID AND Fare < 20.00
);

-- Select statement to retrieve data with JOIN
SELECT Customers.Name, Drivers.Name AS DriverName, Trips.StartDateTime, Trips.EndDateTime
FROM Trips
JOIN Customers ON Trips.CustomerID = Customers.CustomerID
JOIN Drivers ON Trips.DriverID = Drivers.DriverID
WHERE Trips.StartDateTime >= '2023-01-01';

-- Select statement with ORDER BY and LIMIT
SELECT Name, Phone
FROM Customers
ORDER BY Rating DESC
LIMIT 5;

-- Select statement with aggregate function and GROUP BY
SELECT Drivers.Name, AVG(Trips.Fare) AS AvgFare
FROM Drivers
JOIN Trips ON Drivers.DriverID = Trips.DriverID
GROUP BY Drivers.Name
HAVING AVG(Trips.Fare) > 20.00;

-- Select statement with subquery
SELECT Name, Rating
FROM Customers
WHERE Rating > (SELECT AVG(Rating) FROM Customers);





