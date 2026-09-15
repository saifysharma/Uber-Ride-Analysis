CREATE DATABASE uber_analysis;
USE uber_analysis;

CREATE TABLE uber_rides (
    `Date` DATE,
    `Time` TIME,
    `Booking ID` VARCHAR(50),
    `Booking Status` VARCHAR(50),
    `Customer ID` VARCHAR(50),
    `Vehicle Type` VARCHAR(50),
    `Pickup Location` VARCHAR(100),
    `Drop Location` VARCHAR(100),
    `Avg VTAT` FLOAT,
    `Avg CTAT` FLOAT,
    `Cancelled Rides by Customer` FLOAT,
    `Reason for cancelling by Customer` VARCHAR(255),
    `Cancelled Rides by Driver` FLOAT,
    `Driver Cancellation Reason` VARCHAR(255),
    `Incomplete Rides` FLOAT,
    `Incomplete Rides Reason` VARCHAR(255),
    `Booking Value` FLOAT,
    `Ride Distance` FLOAT,
    `Driver Ratings` FLOAT,
    `Customer Rating` FLOAT,
    `Payment Method` VARCHAR(50),
    `Month` VARCHAR(20),
    `Day Name` VARCHAR(20),
    `Hour` INT,
    `Time Period` VARCHAR(20)
);

SELECT COUNT(*)
FROM uber_rides;

select * from uber_rides;
