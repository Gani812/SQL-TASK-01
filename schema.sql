#Create Database
CREATE DATABASE RentalDB;
USE RentalDB;

#Table: Locations
CREATE TABLE Locations (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(10)
);

#Table: Owners
CREATE TABLE Owners (
    OwnerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);

#Table: Properties
CREATE TABLE Properties (
    PropertyID INT AUTO_INCREMENT PRIMARY KEY,
    OwnerID INT,
    LocationID INT,
    Title VARCHAR(150),
    Description TEXT,
    RentAmount DECIMAL(10,2),
    AvailableFrom DATE,
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

#Table: Renters
CREATE TABLE Renters (
    RenterID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);

#Table: Bookings
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    PropertyID INT,
    RenterID INT,
    BookingDate DATE,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID),
    FOREIGN KEY (RenterID) REFERENCES Renters(RenterID)
);

#Table: Payments
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    PaymentDate DATE,
    AmountPaid DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
