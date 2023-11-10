
DROP TABLE Customers;
CREATE TABLE IF NOT EXISTS Customers (
    c_custID INTEGER PRIMARY KEY AUTOINCREMENT,
    c_name TEXT NOT NULL,
    c_password TEXT NOT NULL,
    c_email TEXT NOT NULL UNIQUE,
    c_usertype TEXT NOT NULL
);


DROP TABLE Vehicles;
CREATE TABLE IF NOT EXISTS Vehicles (
    v_vehID INTEGER PRIMARY KEY AUTOINCREMENT,
    v_make TEXT NOT NULL,
    v_type TEXT NOT NULL,
    v_model TEXT NOT NULL,
    v_price REAL NOT NULL
);


DROP TABLE Dealers;
CREATE TABLE IF NOT EXISTS Dealers (
    d_dealID INTEGER PRIMARY KEY AUTOINCREMENT,
    d_phone TEXT NOT NULL,
    d_email TEXT NOT NULL UNIQUE,
    d_name TEXT NOT NULL,
    d_password TEXT NOT NULL,
    d_rating INTEGER
);


DROP TABLE Locations;;
CREATE TABLE IF NOT EXISTS Locations (
    l_locID INTEGER PRIMARY KEY AUTOINCREMENT,
    l_city TEXT NOT NULL,
    l_state TEXT NOT NULL,
    l_zipcode TEXT NOT NULL
);


DROP TABLE History;
CREATE TABLE IF NOT EXISTS History (
    h_vehID INTEGER PRIMARY KEY,
    h_numown INTEGER NOT NULL,
    h_accident INTEGER NOT NULL,
    FOREIGN KEY (h_vehID) REFERENCES Vehicles (v_vehID)
);


DROP TABLE Performance;
CREATE TABLE IF NOT EXISTS Performance (
    p_vehID INTEGER PRIMARY KEY,
    p_cylinder INTEGER NOT NULL,
    p_citympg INTEGER NOT NULL,
    p_horsepower INTEGER NOT NULL,
    p_highwaympg INTEGER NOT NULL
   /* FOREIGN KEY (p_vehID) REFERENCES Vehicles (v_vehID)*/
);

drop table Listings;
CREATE TABLE IF NOT EXISTS Listings (
    v_listID INTEGER PRIMARY KEY AUTOINCREMENT,
    v_dealID INTEGER NOT NULL,
    v_make TEXT NOT NULL,
    v_model TEXT NOT NULL,
    v_type TEXT NOT NULL,
    v_price REAL NOT NULL,
    v_status TEXT CHECK(v_status IN ('Available', 'Sold', 'Pending')),
    FOREIGN KEY (v_dealID) REFERENCES Dealers(d_dealID)
);

drop table Fee;
CREATE TABLE IF NOT EXISTS Fee (
    fee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    list_id INTEGER NOT NULL,
    deal_id INTEGER NOT NULL,
    amount DECIMAL(10, 2) NOT NULL, -- Assuming a monetary value with two decimal places
    date_charged DATE NOT NULL,
    payment_due_date DATE NOT NULL,
    payment_status TEXT CHECK(payment_status IN ('Paid', 'Pending', 'Overdue')) NOT NULL,
    FOREIGN KEY (list_id) REFERENCES Listings(v_vehID),
    FOREIGN KEY (deal_id) REFERENCES Dealers(d_dealID)
);


drop table Bookmark;
CREATE TABLE IF NOT EXISTS Bookmark (
    b_bookID INTEGER PRIMARY KEY AUTOINCREMENT,
    b_listID INTEGER NOT NULL,
    b_dealID INTEGER NOT NULL,
    b_custID INTEGER NOT NULL,
    FOREIGN KEY (b_listID) REFERENCES Vehichles(v_vehID),
    FOREIGN KEY (b_dealID) REFERENCES Dealers(d_dealID),
    FOREIGN KEY (b_custID) REFERENCES Customers(c_custID)
);

drop table Ratings;
CREATE TABLE IF NOT EXISTS Ratings (
    r_rateID INTEGER PRIMARY KEY AUTOINCREMENT,
    r_custID INTEGER NOT NULL,
    r_dealID INTEGER NOT NULL,
    r_rate INTEGER CHECK(r_rate IN (1, 2, 3, 4, 5)),
    FOREIGN KEY (r_custID) REFERENCES Customers(c_custID),
    FOREIGN KEY (r_dealID) REFERENCES Dealers(d_dealID)
);


-- Inserting sample data into 'Customers'
INSERT INTO Customers (c_name, c_password, c_email, c_usertype, c_custID) VALUES 
('John Doe', 'doe123', 'john.doe@example.com', 'buyer', 1);
INSERT INTO Customers (c_name, c_password, c_email, c_usertype, c_custID) VALUES 
('Jane Smith', 'smith123', 'jane.smith@example.com', 'buyer', 2);
INSERT INTO Customers (c_name, c_password, c_email, c_usertype, c_custID) VALUES 
('Alice Johnson', 'alice123', 'alice.j@example.com', 'seller', 3);
INSERT INTO Customers (c_name, c_password, c_email, c_usertype, c_custID) VALUES 
('Bob Brown', 'bobby123', 'bob.b@example.com', 'seller', 4);
INSERT INTO Customers (c_name, c_password, c_email, c_usertype, c_custID) VALUES 
('Charlie Davis', 'charlie123', 'charlie.d@example.com', 'buyer', 5);

-- Inserting sample data into 'Vehicles'
INSERT INTO Vehicles (v_make, v_type, v_model, v_price, v_vehID) VALUES 
('Toyota', 'Sedan', 'Camry', 25000.0, 1);
INSERT INTO Vehicles (v_make, v_type, v_model, v_price, v_vehID) VALUES 
('Honda', 'Coupe', 'Civic', 22000.0, 2);
INSERT INTO Vehicles (v_make, v_type, v_model, v_price, v_vehID) VALUES 
('Ford', 'SUV', 'Escape', 27000.0, 3);
INSERT INTO Vehicles (v_make, v_type, v_model, v_price, v_vehID) VALUES 
('Chevrolet', 'Truck', 'Silverado', 30000.0, 4);
INSERT INTO Vehicles (v_make, v_type, v_model, v_price, v_vehID) VALUES 
('Nissan', 'Sedan', 'Altima', 23000.0, 5);

-- Inserting sample data into 'Dealers'
INSERT INTO Dealers (d_phone, d_email, d_name, d_rating, d_password, d_dealID) VALUES 
('555-0101', 'speedymotors@example.com', 'Speedy Motors', 4, 'sppedy123', 01);
INSERT INTO Dealers (d_phone, d_email, d_name, d_rating, d_password, d_dealID) VALUES 
('555-0202', 'luxurycars@example.com', 'Luxury Cars', 5, 'luxury123', 02);
INSERT INTO Dealers (d_phone, d_email, d_name, d_rating, d_password, d_dealID) VALUES 
('555-0303', 'economyautos@example.com', 'Economy Autos', 3, 'economy123', 03);
INSERT INTO Dealers (d_phone, d_email, d_name, d_rating, d_password, d_dealID) VALUES 
('555-0404', 'familyautos@example.com', 'Family Autos', 4, 'family123', 04);
INSERT INTO Dealers (d_phone, d_email, d_name, d_rating, d_password, d_dealID) VALUES 
('555-0505', 'electrocars@example.com', 'Electro Cars', 5, 'electro123', 05);

-- Inserting sample data into 'Locations'
INSERT INTO Locations (l_city, l_state, l_zipcode, l_locID) VALUES ('New York', 'NY', '10001',10);
INSERT INTO Locations (l_city, l_state, l_zipcode, l_locID) VALUES ('Los Angeles', 'CA', '90001',11);
INSERT INTO Locations (l_city, l_state, l_zipcode, l_locID) VALUES ('Chicago', 'IL', '60007',12);
INSERT INTO Locations (l_city, l_state, l_zipcode, l_locID) VALUES ('Houston', 'TX', '77001',13);
INSERT INTO Locations (l_city, l_state, l_zipcode, l_locID) VALUES ('Phoenix', 'AZ', '85001',14);

-- Inserting sample data into 'History'
INSERT INTO History (h_vehID, h_numown, h_accident) VALUES (1, 0, 0);
INSERT INTO History (h_vehID, h_numown, h_accident) VALUES (2, 1, 0);
INSERT INTO History (h_vehID, h_numown, h_accident) VALUES (3, 2, 1);
INSERT INTO History (h_vehID, h_numown, h_accident) VALUES (4, 1, 0);
INSERT INTO History (h_vehID, h_numown, h_accident) VALUES (5, 0, 0);

-- Inserting sample data into 'Performance'
INSERT INTO Performance (p_cylinder, p_citympg, p_horsepower, p_highwaympg) VALUES (4, 24, 150, 35);
INSERT INTO Performance (p_cylinder, p_citympg, p_horsepower, p_highwaympg) VALUES (4, 28, 130, 40);
INSERT INTO Performance (p_cylinder, p_citympg, p_horsepower, p_highwaympg) VALUES (6, 20, 200, 30);
INSERT INTO Performance (p_cylinder, p_citympg, p_horsepower, p_highwaympg) VALUES (8, 15, 400, 22);
INSERT INTO Performance (p_cylinder, p_citympg, p_horsepower, p_highwaympg) VALUES (4, 25, 180, 32);

-- Inserting sample data into 'Listing'

INSERT INTO Listings (v_dealID, v_make, v_model, v_type, v_price, v_status)
VALUES (1, 'Toyota', 'Camry', 'Sedan', 25000.0, 'Sold');

INSERT INTO Listings (v_dealID, v_make, v_model, v_type, v_price, v_status)
VALUES (2, 'Honda', 'Civic', 'Coupe', 22000.0, 'Available');


INSERT INTO Listings (v_dealID, v_make, v_model, v_type, v_price, v_status)
VALUES (3, 'Ford', 'Escape', 'SUV', 27000.0, 'Available');


INSERT INTO Listings (v_dealID, v_make, v_model, v_type, v_price, v_status)
VALUES (4, 'Chevrolet', 'Silverado', 'Truck', 30000.0, 'Pending');


INSERT INTO Listings (v_dealID, v_make, v_model, v_type, v_price, v_status)
VALUES (5, 'Nissan', 'Altima', 'Sedan', 23000.0, 'Available');



-- Inserting sample data into 'Fee'

INSERT INTO Fee (list_id, deal_id, amount, date_charged, payment_due_date, payment_status)
VALUES (1, 1, 25, '01-15-23', '04-15-23', 'Paid');

INSERT INTO Fee (list_id, deal_id, amount, date_charged, payment_due_date, payment_status)
VALUES (2, 2, 25, '02-17-23', '04-15-23', 'Paid');

INSERT INTO Fee (list_id, deal_id, amount, date_charged, payment_due_date, payment_status)
VALUES (3, 3, 25, '07-09-23', '09-22-23', 'Overdue');

INSERT INTO Fee (list_id, deal_id, amount, date_charged, payment_due_date, payment_status)
VALUES (4, 4, 25, '03-20-23', '12-20-23', 'Pending');

INSERT INTO Fee (list_id, deal_id, amount, date_charged, payment_due_date, payment_status)
VALUES (5, 5, 25, '11-9-22', '1-10-23', 'Overdue');


-- Inserting sample data into 'Bookmark'
INSERT INTO Bookmark (b_listID, b_dealID, b_custID)
VALUES (5, 1, 1);

INSERT INTO Bookmark (b_listID, b_dealID, b_custID)
VALUES (4, 2, 2);

INSERT INTO Bookmark (b_listID, b_dealID, b_custID)
VALUES (3, 3, 3);

INSERT INTO Bookmark (b_listID, b_dealID, b_custID)
VALUES (2, 4, 4);

INSERT INTO Bookmark (b_listID, b_dealID, b_custID)
VALUES (1, 5, 5);


-- Inserting sample data into 'Rating'

INSERT INTO Ratings (r_custID, r_dealID, r_rate) VALUES
(1, 1, 5);

INSERT INTO Ratings (r_custID, r_dealID, r_rate) VALUES
(2, 2, 3);


INSERT INTO Ratings (r_custID, r_dealID, r_rate) VALUES
(3, 3, 4);


INSERT INTO Ratings (r_custID, r_dealID, r_rate) VALUES
(4, 4, 2);


INSERT INTO Ratings (r_custID, r_dealID, r_rate) VALUES
(5, 5, 1);

-- Inserting sample data into 'CustomerDealer'
/*INSERT INTO CustomerDealer (cd_custID, cd_dealID) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Inserting sample data into 'DealerLocation'
INSERT INTO DealerLocation (dl_dealID, dl_locID) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);
*/
