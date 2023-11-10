--Retrieves the customer ID of a customer with the specified email and password combination. This is typically used for user authentication purposes.--
SELECT c_custID FROM Customers WHERE c_email = 'john.doe@example.com' AND c_password = 'doe123';

--Selects all details of vehicles categorized as 'Sedan' and whose price falls between $20,000.00 and $43,000.00.--
SELECT * FROM Vehicles WHERE v_type = 'Sedan' AND v_price BETWEEN 20000.0 AND 43000.0;

--Inserts a new vehicle entry into the Vehicles table with the make of 'Mercedes', type 'Coupe', model 'CLA250', and a price of $35,000.00.--
INSERT INTO Vehicles (v_make, v_type, v_model, v_price) VALUES ('Mercedes', 'Coupe', 'CLA250', 35000.0);

--Deletes the vehicle record from the Vehicles table where the vehicle ID is 6.--
DELETE FROM Vehicles WHERE v_vehID = 6;

--Retrieves the dealer ID for a dealer with a given email and password. This might be used for dealer authentication.--
SELECT d_dealID FROM Dealers WHERE d_email = 'luxurycars@example.com' AND d_password = 'luxury123';

--Updates the price of the vehicle with ID 4 to $40,000.00 in the Vehicles table.--
UPDATE Vehicles SET v_price = 40000.0 WHERE v_vehID = 4;

--Updates the name and password of the customer with customer ID 4 in the Customers table.--
UPDATE Customers SET c_name = 'Bob Brown', c_password = 'Brown1234' WHERE c_custID = 4;

--Changes the rating of the dealer with dealer ID 3 to 2 in the Dealers table.--
UPDATE Dealers SET d_rating = 2 WHERE d_dealID = 3;

--Retrieves all records of vehicles where the type is 'Sedan'.--
SELECT * FROM Vehicles WHERE v_type = 'Sedan';

--Inserts a new rating record with customer ID 5, dealer ID 2, and a rating of 4 into the Ratings table.--
INSERT INTO Ratings (r_custID, r_dealID, r_rate) VALUES (5, 2, 4);

--Deletes the rating record from the Ratings table where the rating ID is 7.--
DELETE FROM ratings WHERE r_rateID = 7;

--Increments the number of owners (h_numown) by 1 for the vehicle with vehicle ID 1 in the History table.--
UPDATE History SET h_numown = h_numown + 1 WHERE h_vehID = 1;

--Inserts a new dealer record into the Dealers table with provided contact information, name, rating, and password.--
INSERT INTO Dealers (d_phone, d_email, d_name, d_rating, d_password) VALUES ('555-0606', 'fastmotors@example.com', 'Fast Motors', 5, 'fast123');

--Selects all details of vehicles priced over $25,000.--
SELECT * FROM Vehicles WHERE v_price > 25000;

--Joins the Listings, Dealers, and Vehicles tables to select all available vehicle listings, along with the dealer's name and email, and vehicle details such as make, model, type, and price.--
SELECT L.v_listID, L.v_status, D.d_name, D.d_email, V.v_make, V.v_model, V.v_type, V.v_price
FROM Listings L
JOIN Dealers D ON L.v_dealID = D.d_dealID
JOIN Vehicles V ON L.v_make = V.v_make AND L.v_model = V.v_model AND L.v_type = V.v_type
WHERE L.v_status = 'Available';

--Joins the Customers, Bookmark, and Dealers tables to retrieve customer names and emails, along with the ID of the bookmarked listings and the names and emails of the dealers who listed those vehicles.--
SELECT C.c_name, C.c_email, B.b_listID, D.d_name, D.d_email
FROM Customers C
JOIN Bookmark B ON C.c_custID = B.b_custID
JOIN Dealers D ON B.b_dealID = D.d_dealID;

--Joins the Ratings, Customers, and Dealers tables to retrieve customer names, the ratings they've given, and the names of the dealers they've rated.--
SELECT C.c_name, R.r_rate, D.d_name
FROM Ratings R
JOIN Customers C ON R.r_custID = C.c_custID
JOIN Dealers D ON R.r_dealID = D.d_dealID;

--Selects all details from the Dealers table where the dealer rating is greater than 3.--
SELECT * FROM Dealers WHERE d_rating > 3;

--Joins the Vehicles table with the History table to select all details of vehicles that have had accidents.--
SELECT V.*, H.h_accident
FROM Vehicles V
JOIN History H ON V.v_vehID = H.h_vehID
WHERE H.h_accident > 0;

--Joins the Vehicles table with the Performance table to retrieve make and model of the vehicle along with performance-related details like cylinder count, city and highway MPG, and horsepower.--
SELECT v.v_make, v.v_model, p.p_cylinder, p.p_citympg, p.p_horsepower, p.p_highwaympg
FROM Vehicles v
JOIN Performance p ON v.v_vehID = p.p_vehID;
