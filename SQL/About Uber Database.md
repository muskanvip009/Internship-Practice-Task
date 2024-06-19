# Uber cab

To systematically approach the design of a database for a ride-sharing application like Uber, focusing on the core requirement of managing trips, we break down the process into identifying the key components involved in a trip and then translating these components into database table requirements

## ER Diagram of UBER database

![Sample Creation](https://pcsepacpwttyfcafroqd.supabase.co/storage/v1/object/public/readme/Uber_Database.png)

### **Step 1: Identify Key Components of a Trip**

1. **Customer**:
    - A trip begins with a customer requesting a ride. Essential information includes customer identity, contact details, and possibly, a rating system based on past rides.
2. **Driver**:
    - Drivers accept ride requests from customers. Key information includes driver identity, contact details, vehicle information, and a rating system reflecting their service quality.
3. **Cab (Vehicle)**:
    - Each ride requires a vehicle. Relevant details include vehicle type, license plate number, capacity, and current status (e.g., available or on a trip).
4. **Trip Details**:
    - This includes the start and end locations, start and end times, distance, and the specific route taken (if applicable).
5. **Payment**:
    - Details about how each trip was paid for, including the amount, payment method (e.g., credit card, debit card, cash), and payment status.

### **Step 2: Translate Components into Database Table Requirements**

Based on the above components, the following tables are required for the database:

1. **Customers Table**:
    - Columns: CustomerID, Name, Email, Phone, Rating
    - Primary Key: CustomerID
2. **Drivers Table**:
    - Columns: DriverID, Name, Email, Phone, VehicleID, Rating
    - Primary Key: DriverID
    - Foreign Key: VehicleID references Cabs(VehicleID)
3. **Cabs Table** (Vehicles Table):
    - Columns: VehicleID, Make, Model, LicensePlate, Capacity, Status
    - Primary Key: VehicleID
4. **Trips Table**:
    - Columns: TripID, CustomerID, DriverID, VehicleID, StartLocation, EndLocation, StartDateTime, EndDateTime, Distance, Fare
    - Primary Key: TripID
    - Foreign Keys: CustomerID references Customers(CustomerID), DriverID references Drivers(DriverID), VehicleID references Cabs(VehicleID)
5. **Payments Table**:
    - Columns: PaymentID, TripID, Amount, PaymentMethod, PaymentDate
    - Primary Key: PaymentID
    - Foreign Key: TripID references Trips(TripID)

This structured approach ensures that each component of a trip is accounted for in the database design, allowing for comprehensive data management and analysis capabilities for a ride-sharing service.  