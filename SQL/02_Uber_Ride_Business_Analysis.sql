-- Q1. What is the Overall Booking Outcome
SELECT 
COUNT(*) AS Total_Bookings,
COUNT(CASE 
        WHEN `Booking Status` = 'Completed' 
        THEN 1 
END) AS Completed_Rides,
COUNT(CASE 
        WHEN `Booking Status` <> 'Completed' 
        THEN 1 
END) AS Unsuccessful_Rides
FROM uber_rides;

-- Q2. Overall Ride Completion Rate & Unsuccessful Booking Rate
WITH Overall_Rate AS
(
 SELECT 
 COUNT(*) as Total_Bookings,
 COUNT(CASE 
        WHEN `Booking Status` = 'Completed' 
        THEN 1 
END) AS Completed_Rides,
COUNT(CASE 
        WHEN `Booking Status` <> 'Completed' 
        THEN 1 
END) AS Unsuccessful_Rides
From uber_rides
)
SELECT 
Total_Bookings,
Completed_Rides,
Unsuccessful_Rides,
ROUND((Completed_Rides / Total_Bookings) * 100, 2) 
	AS Completion_Rate,
ROUND((Unsuccessful_Rides / Total_Bookings) * 100, 2) 
        AS Unsuccessful_Rate
FROM Overall_Rate;

-- Q3. What is the breakdown of unsuccessful bookings by type?

SELECT `Booking Status`,
COUNT(*) AS unsuccessful_bookings
FROM uber_rides
WHERE `Booking Status` <> 'Completed'
GROUP BY `Booking Status`;

-- Q4. What are the most common reasons for customer cancellations?

SELECT `Reason for cancelling by Customer`,
COUNT(*) AS customer_cancellation
FROM uber_rides
WHERE `Reason for cancelling by Customer` IS NOT NULL
GROUP BY `Reason for cancelling by Customer`
ORDER BY customer_cancellation DESC;

-- Q5. What are the most common reasons for driver cancellations?
SELECT `Driver Cancellation Reason`,
COUNT(*) AS Driver_Cancellations
FROM uber_rides
WHERE `Driver Cancellation Reason` IS NOT NULL
GROUP BY `Driver Cancellation Reason`
ORDER BY Driver_Cancellations DESC;

-- Q6. Which vehicle types have the highest and lowest ride completion rates?
WITH Vehicle_Performance AS
(
 SELECT `Vehicle Type`,
 COUNT(*) AS Total_Bookings,
 COUNT(
       CASE WHEN `Booking Status` ='Completed' THEN 1
       END ) AS Completed_Rides
 FROM uber_rides
 GROUP BY `Vehicle Type`
 )
 SELECT 
 `Vehicle Type`,
 Total_Bookings,
 Completed_Rides,
 ROUND((Completed_Rides / Total_Bookings)*100,2) AS Completion_Rate
 FROM Vehicle_Performance
 ORDER BY Completion_Rate DESC;
 
 -- Q7. Which vehicle types have the highest unsuccessful booking rates, and what are the main failure types?
 WITH Vehicle_Performance AS
 (
  SELECT `Vehicle Type`,
 COUNT(*) AS Total_Bookings,
 COUNT(
       CASE WHEN `Booking Status` <>'Completed' THEN 1
       END ) AS Unsuccessful_Rides
 FROM uber_rides
 GROUP BY `Vehicle Type`
 )
 SELECT 
 `Vehicle Type`,
 Total_Bookings,
 Unsuccessful_Rides,
 ROUND((Unsuccessful_Rides / Total_Bookings)*100,2) AS Unsuccessful_Rate
 FROM Vehicle_Performance
 ORDER BY Unsuccessful_Rate DESC;
 
 SELECT 
 `Vehicle Type`,
 `Booking Status`,
 COUNT(*) AS Unsuccessful_Bookings
 FROM uber_rides
 WHERE `Booking Status` <> 'Completed'
 GROUP BY `Vehicle Type`,
 `Booking Status`
 ORDER BY `Vehicle Type`, Unsuccessful_Bookings DESC;
 
 -- Q8. Which pickup locations have the highest unsuccessful booking rates?
 WITH Location_Performance AS
 (
  SELECT `Pickup Location`,
 COUNT(*) AS Total_Bookings,
 COUNT(
       CASE WHEN `Booking Status` <>'Completed' THEN 1
       END ) AS Unsuccessful_Rides
 FROM uber_rides
 GROUP BY `Pickup Location`
 )
 SELECT 
 `Pickup Location`,
 Total_Bookings,
 Unsuccessful_Rides,
 ROUND((Unsuccessful_Rides / Total_Bookings)*100,2) AS Unsuccessful_Rate
 FROM Location_Performance
 ORDER BY Unsuccessful_Rate DESC;
 
 -- Q9. Which pickup locations have the highest number of “No Driver Found” bookings?
 
 SELECT `Pickup Location`,
 COUNT(*) AS Affected_Bookings
 FROM uber_rides
 WHERE `Booking Status` = 'No Driver Found'
 GROUP BY `Pickup Location`
 ORDER BY Affected_Bookings DESC;
 
 -- Q10. Which pickup locations perform below the overall completion-rate benchmark (62%)?
 WITH Location_Performance AS
 (
  SELECT `Pickup Location`,
  COUNT(*) AS Total_Bookings,
  COUNT(
        CASE WHEN `Booking Status` = 'Completed' THEN 1
        END ) AS Completed_Rides
 FROM uber_rides
 GROUP BY `Pickup Location`
 )
 SELECT `Pickup Location`,
 Total_Bookings,
 Completed_Rides,
 ROUND((Completed_Rides / Total_Bookings) * 100,2) AS Location_Completion_Rate
 FROM Location_Performance
 WHERE (Completed_Rides / Total_Bookings) * 100 < 62;
 
 -- Q11. During which hours/time periods is booking demand highest?
 -- A: Booking demand by Hour 
 SELECT `Hour`,
 COUNT(*) AS Total_Bookings
 FROM uber_rides
 GROUP BY `Hour`
 ORDER BY Total_Bookings DESC;
 
 -- Booking demand by Time Period
 SELECT `Time Period`,
 COUNT(*) AS Total_Bookings
 FROM uber_rides
 GROUP BY `Time Period`
 ORDER BY Total_Bookings DESC;
 
 -- Q12. At which hours and time periods is the percentage of unsuccessful bookings highest?
 -- By Hour
 WITH Hour_Performance AS
 (
  SELECT `Hour`,
  COUNT(*) AS Total_Bookings,
  COUNT(
		CASE WHEN `Booking Status`<> 'Completed' THEN 1
        END ) AS Unsuccessful_Bookings
  FROM uber_rides
  GROUP BY `Hour`
  )
  SELECT `Hour`,
  Total_Bookings,
  Unsuccessful_Bookings,
  ROUND((Unsuccessful_Bookings / Total_Bookings) *100,2) AS Unsuccessful_Booking_Rate
  FROM Hour_Performance
  ORDER BY Unsuccessful_Booking_Rate DESC;
  
-- By Time Period
WITH Time_Period_Performance AS
 (
  SELECT `Time Period`,
  COUNT(*) AS Total_Bookings,
  COUNT(
		CASE WHEN `Booking Status`<> 'Completed' THEN 1
        END ) AS Unsuccessful_Bookings
  FROM uber_rides
  GROUP BY `Time Period`
  )
  SELECT `Time Period`,
  Total_Bookings,
  Unsuccessful_Bookings,
  ROUND((Unsuccessful_Bookings / Total_Bookings) *100,2) AS Unsuccessful_Booking_Rate
  FROM Time_Period_Performance
  ORDER BY Unsuccessful_Booking_Rate DESC;
  
-- Q13. How does average driver arrival time (VTAT) differ between completed and unsuccessful bookings?
  SELECT 
   CASE WHEN `Booking Status` = 'Completed' THEN 'Completed'
   ELSE 'Unsuccessful'
   END  AS Category,
   AVG(`Avg VTAT`) AS Average_VTAT
   FROM uber_rides
   GROUP BY Category;
   
-- Q14.Which vehicle types have the longest average driver arrival time (VTAT)?
SELECT `Vehicle Type`,
AVG(`Avg VTAT`) AS Average_VTAT
FROM uber_rides
GROUP BY `Vehicle Type`
ORDER BY Average_VTAT DESC;

-- Q15. Which vehicle types generate the highest completed-ride value and what is their average booking value?
SELECT `Vehicle Type`,
SUM(`Booking Value`) AS Total_Completed_Ride_Value,
AVG(`Booking Value`) AS Average_Booking_Value
FROM uber_rides
WHERE `Booking Status` = 'Completed'
GROUP BY `Vehicle Type`
ORDER BY Total_Completed_Ride_Value DESC;

-- Q16. Which pickup locations generate high booking demand but have poor completion rates?
WITH Location_Performance AS (
SELECT 
`Pickup Location`,
COUNT(*) AS Total_Bookings,
COUNT(CASE 
	 WHEN `Booking Status` = 'Completed' THEN 1 
END) AS Completed_Rides
FROM uber_rides
GROUP BY `Pickup Location`
),

Location_Analysis AS (
SELECT 
`Pickup Location`,
Total_Bookings,
Completed_Rides,
ROUND((Completed_Rides / Total_Bookings) * 100, 2) 
AS Completion_Rate
FROM Location_Performance
)
SELECT *
FROM Location_Analysis
WHERE Total_Bookings > (
SELECT AVG(Total_Bookings)
FROM Location_Analysis
)
AND Completion_Rate < 62
ORDER BY Total_Bookings DESC;