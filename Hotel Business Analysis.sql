USE [Anudesh Saini]
SELECT * FROM [Hotel]
SELECT * FROM [Location]

--- Q.1 Find the number of total hotels available ?
SELECT COUNT(DISTINCT(hotel_id)) as Total_hotels  FROM [Hotel]

--- Q.2 In how many cities sevices are available ?
SELECT COUNT(DISTINCT(City)) as Total_city  FROM [Location]

--- Q.3 What are the number of hotels available in different cities ?
SELECT City,COUNT(Hotel_id) as Total_hotels FROM [Location] GROUP BY (city)

---Q.4 Create a new column for how many no.of nights customers stayed 
ALTER TABLE [Hotel] ADD  no_of_nights int;
UPDATE [Hotel] SET no_of_nights= DATEDIFF(day,check_in,check_out);

---Q.5 Create a new column to calculate total amount paid by customers
ALTER TABLE [Hotel] ADD Paid_Amount FLOAT;
UPDATE [Hotel] SET Paid_Amount=(amount-discount)*no_of_nights*no_of_rooms

---Q.9 Calculate average hotel room rate in different cities ?
SELECT City, ROUND(AVG(amount),0) AS Average_rate_in_city 
FROM [Location] L,[Hotel] H 
WHERE H.hotel_id = L.hotel_id 
GROUP BY City ORDER BY 1 DESC;

---Q.7 Calculate the numbers of bookings made in different Cities ?
SELECT City, COUNT(booking_id) AS Total_Booking_In_City 
FROM  [Location] L ,[Hotel] H
WHERE H.hotel_id = L.hotel_id GROUP BY City;

--- Q.8 Calculate the number of bookings cancelled by customers 
--- in different cities ?
SELECT City,Count(status) AS Total_Cancelled_Booking_In_City
FROM  [Location] L ,[Hotel] H
WHERE H.hotel_id = L.hotel_id AND[status] ='Cancelled'
GROUP BY City ORDER BY Total_Cancelled_Booking_In_City DESC;

---Q.9 Calculate the number of customers stayed more than 5 Nights
SELECT COUNT(customer_id)AS No_of_Customers
FROM [Hotel] WHERE no_of_nights>5

---Q.10 Calculate the number of customers who have booked more than 2 rooms
SELECT COUNT(customer_id)AS No_of_Customers 
FROM [Hotel] WHERE no_of_rooms>2

---Q.11 Calculate the total revenue by cities
SELECT City, SUM(Paid_Amount)AS Total_Revenue_In_City 
FROM [Location] L ,[Hotel] H
WHERE H.hotel_id = L.hotel_id 
GROUP BY City ORDER BY Total_Revenue_In_City DESC;












