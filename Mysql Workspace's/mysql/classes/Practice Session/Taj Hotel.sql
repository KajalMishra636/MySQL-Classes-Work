/* ===========================================================
   Taj Mahal Tourism Management System Database
   Purpose: Manage tourists, tickets, guides, facilities, and events.
   Author: Student
   Date: 2025-10-20
=========================================================== */

/* ============================================
   1. Table: Visitor
   Purpose: Stores visitor information
============================================ */
CREATE TABLE Visitor (
    visitor_id INT PRIMARY KEY AUTO_INCREMENT,   -- Unique ID for visitor
    first_name VARCHAR(100) NOT NULL,           -- Visitor's first name
    last_name VARCHAR(100) NOT NULL,            -- Visitor's last name
    email VARCHAR(150) UNIQUE NOT NULL,         -- Visitor's email
    phone VARCHAR(20),                           -- Visitor's phone number
    nationality VARCHAR(50),                     -- Visitor's nationality
    gender VARCHAR(10),                          -- Visitor's gender
    date_of_birth DATE,                          -- Visitor's date of birth
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Registration date
    preferred_language VARCHAR(50)              -- Visitor's preferred language
);

-- INSERT VALUES
INSERT INTO Visitor VALUES
(1,'Amit','Sharma','amit.sharma@example.com','9876543210','India','Male','1990-05-12','2025-10-01','English'),
(2,'Priya','Verma','priya.verma@example.com','9123456780','India','Female','1992-11-23','2025-10-02','Hindi'),
(3,'John','Doe','john.doe@example.com','+11234567890','USA','Male','1988-08-10','2025-10-03','English'),
(4,'Maria','Lopez','maria.lopez@example.com','+51987654321','Spain','Female','1995-07-19','2025-10-04','Spanish'),
(5,'Chen','Wei','chen.wei@example.com','+8613800138000','China','Male','1991-12-02','2025-10-05','Mandarin'),
(6,'Fatima','Khan','fatima.khan@example.com','+919876543210','Pakistan','Female','1993-03-15','2025-10-06','Urdu'),
(7,'David','Smith','david.smith@example.com','+441234567890','UK','Male','1985-09-21','2025-10-07','English'),
(8,'Sara','Ali','sara.ali@example.com','+971501234567','UAE','Female','1990-11-05','2025-10-08','Arabic'),
(9,'Akira','Yamamoto','akira.yamamoto@example.com','+81312345678','Japan','Male','1987-01-30','2025-10-09','Japanese'),
(10,'Olivia','Brown','olivia.brown@example.com','+61234567890','Australia','Female','1994-06-12','2025-10-10','English');


-- Sample INSERT queries
INSERT INTO Visitor (first_name, last_name, email, phone, nationality, gender, date_of_birth, preferred_language)
VALUES ('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', 'India', 'Male', '1990-05-12', 'English');

INSERT INTO Visitor (first_name, last_name, email, phone, nationality, gender, date_of_birth, preferred_language)
VALUES ('Priya', 'Verma', 'priya.verma@example.com', '9123456780', 'India', 'Female', '1992-11-23', 'Hindi');

-- Sample SELECT queries
SELECT * FROM Visitor;
SELECT first_name, last_name, email FROM Visitor;
SELECT * FROM Visitor WHERE nationality='India';
SELECT * FROM Visitor WHERE date_of_birth > '1990-01-01';
SELECT COUNT(*) AS total_visitors FROM Visitor;
SELECT DISTINCT nationality FROM Visitor;
SELECT * FROM Visitor ORDER BY registration_date DESC;
SELECT * FROM Visitor WHERE preferred_language='English';
SELECT first_name, last_name FROM Visitor WHERE gender='Female';
SELECT email FROM Visitor WHERE visitor_id=1;

-- TRUNCATE & DROP
TRUNCATE TABLE Visitor;
DROP TABLE Visitor;


/* ============================================
   2. Table: Ticket
   Purpose: Stores ticket details for visitors
============================================ */
CREATE TABLE Ticket (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    visitor_id INT NOT NULL,                      -- Foreign key to Visitor
    ticket_type VARCHAR(50) NOT NULL,            -- Type of ticket (Adult, Child)
    ticket_price DECIMAL(10,2) NOT NULL,         -- Price of ticket
    purchase_date DATE NOT NULL,                 -- Date of purchase
    visit_date DATE NOT NULL,                    -- Date of visit
    payment_method VARCHAR(50),                  -- Payment method (Cash, Card)
    status VARCHAR(20) DEFAULT 'Booked',         -- Status (Booked, Cancelled)
    seat_number VARCHAR(10),                     -- Optional seat number
    remarks TEXT                                  -- Additional notes
);
-- INSERT VALUES
INSERT INTO Ticket VALUES
(1,1,'Adult',1000,'2025-10-01','2025-10-20','Card','Booked','A1','VIP seat'),
(2,2,'Child',500,'2025-10-02','2025-10-21','Cash','Booked','B2','Near entrance'),
(3,3,'Adult',1200,'2025-10-03','2025-10-22','Card','Booked','C3','Window view'),
(4,4,'Adult',1000,'2025-10-04','2025-10-23','Card','Booked','D4','VIP'),
(5,5,'Child',600,'2025-10-05','2025-10-24','Cash','Booked','E5','Near guide'),
(6,6,'Adult',1100,'2025-10-06','2025-10-25','Card','Booked','F6','Front row'),
(7,7,'Adult',1000,'2025-10-07','2025-10-26','Card','Booked','G7','Regular seat'),
(8,8,'Child',500,'2025-10-08','2025-10-27','Cash','Booked','H8','Family section'),
(9,9,'Adult',1300,'2025-10-09','2025-10-28','Card','Booked','I9','Premium'),
(10,10,'Adult',1000,'2025-10-10','2025-10-29','Card','Booked','J10','VIP');




-- Sample INSERT queries
INSERT INTO Ticket (visitor_id, ticket_type, ticket_price, purchase_date, visit_date, payment_method)
VALUES (1, 'Adult', 1000, '2025-10-01', '2025-10-20', 'Card');

INSERT INTO Ticket (visitor_id, ticket_type, ticket_price, purchase_date, visit_date, payment_method)
VALUES (2, 'Child', 500, '2025-10-02', '2025-10-21', 'Cash');

-- Sample SELECT queries
SELECT * FROM Ticket;
SELECT ticket_type, ticket_price FROM Ticket;
SELECT * FROM Ticket WHERE status='Booked';
SELECT COUNT(*) AS total_tickets FROM Ticket;
SELECT * FROM Ticket WHERE visit_date='2025-10-20';
SELECT visitor_id, SUM(ticket_price) AS total_spent FROM Ticket GROUP BY visitor_id;
SELECT * FROM Ticket ORDER BY purchase_date DESC;
SELECT * FROM Ticket WHERE ticket_type='Adult';
SELECT * FROM Ticket WHERE payment_method='Card';
SELECT ticket_id, status FROM Ticket WHERE visitor_id=2;

-- TRUNCATE & DROP
TRUNCATE TABLE Ticket;
DROP TABLE Ticket;


/* ============================================
   3. Table: Guide
   Purpose: Stores tour guide information
============================================ */
CREATE TABLE Guide (
    guide_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    language_specialty VARCHAR(50),
    hire_date DATE,
    status VARCHAR(20) DEFAULT 'Active',
    experience_years INT,
    remarks TEXT
);

-- INSERT VALUES
INSERT INTO Guide VALUES
(1,'Ravi','Kumar','9876501234','ravi.kumar@tajguides.com','English','2015-06-01','Active',10,'Senior guide'),
(2,'Sneha','Patel','9123405678','sneha.patel@tajguides.com','Hindi','2018-04-15','Active',7,'Specialist in history'),
(3,'Anil','Singh','9876512345','anil.singh@tajguides.com','French','2016-03-10','Active',9,'Multilingual guide'),
(4,'Maria','Lopez','+51987654321','maria.lopez@tajguides.com','Spanish','2019-05-05','Active',6,'Tour guide for foreign tourists'),
(5,'Chen','Wei','+8613800138000','chen.wei@tajguides.com','Mandarin','2017-09-01','Active',8,'Asian tourist specialist'),
(6,'David','Smith','+441234567890','david.smith@tajguides.com','English','2014-11-11','Active',11,'Senior guide for VIP'),
(7,'Olivia','Brown','+61234567890','olivia.brown@tajguides.com','English','2020-01-15','Active',5,'Junior guide'),
(8,'Akira','Yamamoto','+81312345678','akira.yamamoto@tajguides.com','Japanese','2018-08-20','Active',7,'Specialized in architecture'),
(9,'Fatima','Khan','+919876543210','fatima.khan@tajguides.com','Urdu','2016-07-07','Active',9,'Foreign group guide'),
(10,'Sara','Ali','+971501234567','sara.ali@tajguides.com','Arabic','2019-02-10','Active',6,'Arabic speaking guide');
-- INSERT queries
INSERT INTO Guide (first_name, last_name, phone, email, language_specialty, hire_date, experience_years)
VALUES ('Ravi', 'Kumar', '9876501234', 'ravi.kumar@tajguides.com', 'English', '2015-06-01', 10);

INSERT INTO Guide (first_name, last_name, phone, email, language_specialty, hire_date, experience_years)
VALUES ('Sneha', 'Patel', '9123405678', 'sneha.patel@tajguides.com', 'Hindi', '2018-04-15', 7);

-- SELECT queries
SELECT * FROM Guide;
SELECT first_name, last_name, language_specialty FROM Guide;
SELECT * FROM Guide WHERE status='Active';
SELECT * FROM Guide WHERE experience_years>5;
SELECT COUNT(*) AS total_guides FROM Guide;
SELECT * FROM Guide ORDER BY hire_date ASC;
SELECT * FROM Guide WHERE language_specialty='English';
SELECT * FROM Guide WHERE email LIKE '%@tajguides.com';
SELECT guide_id, status FROM Guide;
SELECT first_name, last_name FROM Guide WHERE experience_years>=10;

-- TRUNCATE & DROP
TRUNCATE TABLE Guide;
DROP TABLE Guide;


/* ============================================
   4. Table: Event
   Purpose: Stores events or shows at Taj Mahal
============================================ */
CREATE TABLE Event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    event_type VARCHAR(50),           -- e.g., Cultural, Light & Sound Show
    start_date DATE,
    end_date DATE,
    duration_hours DECIMAL(5,2),
    ticket_required BOOLEAN DEFAULT TRUE,
    location VARCHAR(100),
    organizer VARCHAR(100),
    remarks TEXT
);

-- INSERT VALUES
INSERT INTO Event VALUES
(1,'Taj Light Show','Cultural','2025-11-01','2025-11-30',1.5,TRUE,'Main Courtyard','Taj Management','Evening show'),
(2,'Heritage Walk','Guided Tour','2025-10-15','2025-12-15',2,TRUE,'Entire Complex','Taj Guides','Morning tours'),
(3,'Photography Contest','Competition','2025-10-20','2025-10-25',4,FALSE,'Gardens','Taj Management','Open to public'),
(4,'History Talk','Seminar','2025-11-05','2025-11-05',1.5,TRUE,'Conference Hall','Taj Guides','Special lecture'),
(5,'Cultural Dance','Cultural','2025-11-10','2025-11-12',2,TRUE,'Main Courtyard','Local Artists','Traditional dance show'),
(6,'Art Exhibition','Exhibition','2025-10-18','2025-10-25',5,TRUE,'Museum','Taj Management','Local art display'),
(7,'Sunrise Tour','Guided Tour','2025-10-21','2025-12-20',2,TRUE,'Main Complex','Taj Guides','Sunrise experience'),
(8,'Night Photography','Workshop','2025-11-01','2025-11-10',3,TRUE,'Main Courtyard','Photography Club','Workshop on night photography'),
(9,'Garden Walk','Guided Tour','2025-10-25','2025-12-31',1,TRUE,'Gardens','Taj Guides','Botanical details'),
(10,'Food Festival','Festival','2025-12-05','2025-12-10',6,TRUE,'Visitor Area','Local Vendors','Taste of Agra');

-- INSERT queries
INSERT INTO Event (name, event_type, start_date, end_date, duration_hours, location, organizer)
VALUES ('Taj Light Show', 'Cultural', '2025-11-01', '2025-11-30', 1.5, 'Main Courtyard', 'Taj Management');

INSERT INTO Event (name, event_type, start_date, end_date, duration_hours, location, organizer)
VALUES ('Heritage Walk', 'Guided Tour', '2025-10-15', '2025-12-15', 2, 'Entire Complex', 'Taj Guides');

-- SELECT queries
SELECT * FROM Event;
SELECT name, event_type FROM Event;
SELECT * FROM Event WHERE ticket_required=TRUE;
SELECT * FROM Event WHERE start_date>'2025-10-01';
SELECT COUNT(*) AS total_events FROM Event;
SELECT * FROM Event ORDER BY start_date ASC;
SELECT * FROM Event WHERE location LIKE '%Courtyard%';
SELECT name, duration_hours FROM Event;
SELECT * FROM Event WHERE organizer='Taj Management';
SELECT * FROM Event WHERE duration_hours>1;

-- TRUNCATE & DROP
TRUNCATE TABLE Event;
DROP TABLE Event;


/* ============================================
   5. Table: Facility
   Purpose: Stores facilities at Taj Mahal
============================================ */
CREATE TABLE Facility (
    facility_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    facility_type VARCHAR(50),
    location VARCHAR(100),
    capacity INT,
    availability_status VARCHAR(20) DEFAULT 'Available',
    maintenance_date DATE,
    contact_person VARCHAR(100),
    contact_phone VARCHAR(20),
    remarks TEXT
);

-- INSERT VALUES
INSERT INTO Facility VALUES
(1,'Visitor Rest Area','Rest','North Wing',50,'Available',NULL,'Ravi Kumar','9876543210','Comfortable seating'),
(2,'Souvenir Shop','Shopping','Main Entrance',100,'Available',NULL,'Sneha Patel','9123456780','Local crafts'),
(3,'Food Court','Food','South Wing',200,'Available',NULL,'Maria Lopez','+51987654321','Multiple cuisines'),
(4,'First Aid Center','Medical','West Wing',20,'Available',NULL,'David Smith','+441234567890','Emergency services'),
(5,'Parking Lot','Transport','East Side',150,'Available',NULL,'Chen Wei','+8613800138000','Vehicles parking'),
(6,'Restrooms','Sanitary','All Wings',30,'Available',NULL,'Akira Yamamoto','+81312345678','Clean and hygienic'),
(7,'Information Center','Support','Entrance','N/A','Available',NULL,'Fatima Khan','+919876543210','Tourist help'),
(8,'Guided Tour Desk','Support','Entrance',15,'Available',NULL,'Sara Ali','+971501234567','Guide allocation'),
(9,'Photography Spot','Attraction','Gardens',100,'Available',NULL,'Amit Sharma','9876543210','Popular photo location'),
(10,'Security Check','Security','All Entrances',50,'Available',NULL,'Priya Verma','9123456780','Visitor screening');

-- INSERT queries
INSERT INTO Facility (name, facility_type, location, capacity, contact_person, contact_phone)
VALUES ('Visitor Rest Area', 'Rest', 'North Wing', 50, 'Ravi Kumar', '9876543210');

INSERT INTO Facility (name, facility_type, location, capacity, contact_person, contact_phone)
VALUES ('Souvenir Shop', 'Shopping', 'Main Entrance', 100, 'Sneha Patel', '9123456780');

-- SELECT queries
SELECT * FROM Facility;
SELECT name, facility_type FROM Facility;
SELECT * FROM Facility WHERE availability_status='Available';
SELECT * FROM Facility WHERE capacity>50;
SELECT COUNT(*) AS total_facilities FROM Facility;
SELECT * FROM Facility ORDER BY name ASC;
SELECT * FROM Facility WHERE location LIKE '%Wing%';
SELECT name, contact_person FROM Facility;
SELECT * FROM Facility WHERE facility_type='Shopping';
SELECT * FROM Facility WHERE maintenance_date IS NULL;

-- TRUNCATE & DROP
TRUNCATE TABLE Facility;
DROP TABLE Facility;


/* ============================================
   6. Table: Accommodation
   Purpose: Stores nearby hotels/accommodation
============================================ */
CREATE TABLE Accommodation (
    accommodation_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    type VARCHAR(50),                   -- e.g., Hotel, Guest House
    address VARCHAR(300),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(150),
    rating DECIMAL(2,1)
);

-- INSERT VALUES
INSERT INTO Accommodation VALUES
(1,'Taj Guest House','Guest House','Near Taj Mahal, Agra','Agra','Uttar Pradesh','India','0562-1234567','info@tajguesthouse.com',4.5),
(2,'Agra Heritage Hotel','Hotel','MG Road, Agra','Agra','Uttar Pradesh','India','0562-7654321','contact@agraheritage.com',4.0),
(3,'Royal Palace Hotel','Hotel','Station Road, Agra','Agra','Uttar Pradesh','India','0562-2345678','royal@palacehotel.com',4.2),
(4,'Garden Inn','Guest House','Near Taj Gardens, Agra','Agra','Uttar Pradesh','India','0562-8765432','info@gardeninn.com',3.8),
(5,'River View Hotel','Hotel','Yamuna Bank, Agra','Agra','Uttar Pradesh','India','0562-3456789','contact@riverview.com',4.1),
(6,'Sunrise Lodge','Guest House','West Agra, Agra','Agra','Uttar Pradesh','India','0562-9876543','info@sunriselodge.com',3.9),
(7,'Lotus Hotel','Hotel','Lotus Road, Agra','Agra','Uttar Pradesh','India','0562-4567890','lotus@hotel.com',4.3),
(8,'Amber Guest House','Guest House','East Agra, Agra','Agra','Uttar Pradesh','India','0562-5678901','info@ambergh.com',4.0),
(9,'Heritage Villa','Hotel','Near Taj Mahal, Agra','Agra','Uttar Pradesh','India','0562-6789012','villa@heritage.com',4.4),
(10,'Royal Stay','Hotel','MG Road, Agra','Agra','Uttar Pradesh','India','0562-7890123','royalstay@agra.com',4.2);

-- INSERT queries
INSERT INTO Accommodation (name, type, address, city, state, country, phone, email, rating)
VALUES ('Taj Guest House', 'Guest House', 'Near Taj Mahal, Agra', 'Agra', 'Uttar Pradesh', 'India', '0562-1234567', 'info@tajguesthouse.com', 4.5);

INSERT INTO Accommodation (name, type, address, city, state, country, phone, email, rating)
VALUES ('Agra Heritage Hotel', 'Hotel', 'MG Road, Agra', 'Agra', 'Uttar Pradesh', 'India', '0562-7654321', 'contact@agraheritage.com', 4.0);

-- SELECT queries
SELECT * FROM Accommodation;
SELECT name, type, rating FROM Accommodation;
SELECT * FROM Accommodation WHERE city='Agra';
SELECT * FROM Accommodation WHERE rating>4;
SELECT COUNT(*) AS total_accommodation FROM Accommodation;
SELECT * FROM Accommodation ORDER BY rating DESC;
SELECT name, phone FROM Accommodation;
SELECT * FROM Accommodation WHERE type='Hotel';
SELECT * FROM Accommodation WHERE email LIKE '%@agraheritage.com';
SELECT * FROM Accommodation WHERE state='Uttar Pradesh';

-- TRUNCATE & DROP
TRUNCATE TABLE Accommodation;
DROP TABLE Accommodation;


/* ============================================
   7. Table: Transport
   Purpose: Stores transport options for visitors
============================================ */
CREATE TABLE Transport (
    transport_id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50),                -- e.g., Bus, Rickshaw
    company_name VARCHAR(100),
    capacity INT,
    fare DECIMAL(8,2),
    departure_location VARCHAR(100),
    arrival_location VARCHAR(100),
    departure_time TIME,
    arrival_time TIME,
    remarks TEXT
);

-- INSERT VALUES
INSERT INTO Transport VALUES
(1,'Bus','Agra Transport',40,100,'Agra Railway Station','Taj Mahal','09:00:00','09:30:00','Comfortable bus'),
(2,'Rickshaw','Local Rickshaw',2,20,'Agra Market','Taj Mahal','09:15:00','09:25:00','Quick ride'),
(3,'Taxi','City Taxi',4,150,'Agra Hotel','Taj Mahal','10:00:00','10:20:00','Private taxi'),
(4,'Bus','Agra Transport',40,120,'Agra Bus Stand','Taj Mahal','11:00:00','11:30:00','Morning bus'),
(5,'Rickshaw','Local Rickshaw',2,25,'Agra Mall','Taj Mahal','11:15:00','11:25:00','Convenient'),
(6,'Taxi','City Taxi',4,160,'Railway Station','Taj Mahal','12:00:00','12:20:00','Premium taxi'),
(7,'Bus','Tourist Bus Co',50,200,'Agra Airport','Taj Mahal','08:00:00','08:45:00','AC Bus'),
(8,'Rickshaw','Local Rickshaw',2,30,'Hotel to Taj','Taj Mahal','14:00:00','14:10:00','Fast route'),
(9,'Bus','Agra Transport',40,110,'City Center','Taj Mahal','13:00:00','13:30:00','Regular bus'),
(10,'Taxi','City Taxi',4,170,'Hotel','Taj Mahal','15:00:00','15:20:00','Private ride');

-- INSERT queries
INSERT INTO Transport (type, company_name, capacity, fare, departure_location, arrival_location, departure_time, arrival_time)
VALUES ('Bus', 'Agra Transport', 40, 100, 'Agra Railway Station', 'Taj Mahal', '09:00:00', '09:30:00');

INSERT INTO Transport (type, company_name, capacity, fare, departure_location, arrival_location, departure_time, arrival_time)
VALUES ('Rickshaw', 'Local Rickshaw', 2, 20, 'Agra Market', 'Taj Mahal', '09:15:00', '09:25:00');

-- SELECT queries
SELECT * FROM Transport;
SELECT type, company_name, fare FROM Transport;
SELECT * FROM Transport WHERE capacity>10;
SELECT * FROM Transport WHERE departure_location='Agra Railway Station';
SELECT COUNT(*) AS total_transports FROM Transport;
SELECT * FROM Transport ORDER BY fare ASC;
SELECT * FROM Transport WHERE type='Rickshaw';
SELECT departure_location, arrival_location FROM Transport;
SELECT * FROM Transport WHERE arrival_time<'10:00:00';
SELECT * FROM Transport WHERE company_name='Agra Transport';

-- TRUNCATE & DROP
TRUNCATE TABLE Transport;
DROP TABLE Transport;


/* ============================================
   8. Table: Souvenir
   Purpose: Stores souvenir items available
============================================ */
CREATE TABLE Souvenir (
    souvenir_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),               -- e.g., Mug, Keychain
    price DECIMAL(6,2),
    stock_quantity INT,
    vendor_name VARCHAR(100),
    vendor_phone VARCHAR(20),
    material VARCHAR(50),
    added_date DATE,
    remarks TEXT
);

-- INSERT VALUES
INSERT INTO Souvenir VALUES
(1,'Taj Mug','Mug',250,100,'Souvenir Co','9876543210','Ceramic','2025-10-01','Popular item'),
(2,'Taj Keychain','Keychain',50,200,'Souvenir Co','9876543210','Metal','2025-10-02','Affordable'),
(3,'Taj T-Shirt','Clothing',500,150,'Taj Merch','9123456780','Cotton','2025-10-03','Souvenir apparel'),
(4,'Taj Notebook','Stationery',150,300,'Taj Merch','9123456780','Paper','2025-10-04','Notebook with Taj print'),
(5,'Taj Cap','Clothing',200,120,'Souvenir Co','9876543210','Fabric','2025-10-05','Sun protection'),
(6,'Taj Magnet','Magnet',100,250,'Souvenir Co','9876543210','Metal','2025-10-06','Fridge magnet'),
(7,'Taj Poster','Decor','300',50,'Taj Merch','9123456780','Paper','2025-10-07','Wall decoration'),
(8,'Taj Pen','Stationery',80,500,'Souvenir Co','9876543210','Plastic','2025-10-08','Affordable pen'),
(9,'Taj Bag','Clothing',400,100,'Taj Merch','9123456780','Fabric','2025-10-09','Travel bag'),
(10,'Taj Keyring','Keychain',60,300,'Souvenir Co','9876543210','Metal','2025-10-10','Popular keyring');

-- INSERT queries
INSERT INTO Souvenir (name, type, price, stock_quantity, vendor_name, vendor_phone, material, added_date)
VALUES ('Taj Mug', 'Mug', 250, 100, 'Souvenir Co', '9876543210', 'Ceramic', '2025-10-01');

INSERT INTO Souvenir (name, type, price, stock_quantity, vendor_name, vendor_phone, material, added_date)
VALUES ('Taj Keychain', 'Keychain', 50, 200, 'Souvenir Co', '9876543210', 'Metal', '2025-10-02');

-- SELECT queries
SELECT * FROM Souvenir;
SELECT name, price, stock_quantity FROM Souvenir;
SELECT * FROM Souvenir WHERE stock_quantity>50;
SELECT * FROM Souvenir WHERE material='Metal';
SELECT COUNT(*) AS total_souvenirs FROM Souvenir;
SELECT * FROM Souvenir ORDER BY price ASC;
SELECT * FROM Souvenir WHERE type='Mug';
SELECT * FROM Souvenir WHERE vendor_name='Souvenir Co';
SELECT name, stock_quantity FROM Souvenir WHERE price>100;
SELECT * FROM Souvenir WHERE added_date>'2025-09-30';

-- TRUNCATE & DROP
TRUNCATE TABLE Souvenir;
DROP TABLE Souvenir;


/* ============================================
   9. Table: Feedback
   Purpose: Stores visitor feedback
============================================ */
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    visitor_id INT NOT NULL,
    rating INT,                       -- 1 to 5
    comments TEXT,
    feedback_date DATE,
    response_status VARCHAR(20) DEFAULT 'Pending',
    handled_by VARCHAR(100),
    category VARCHAR(50),
    remarks TEXT,
    follow_up_date DATE
);

-- INSERT VALUES
INSERT INTO Feedback VALUES
(1,1,5,'Excellent experience!','2025-10-20','Pending','Ravi Kumar','Tour Experience','N/A',NULL),
(2,2,4,'Good, but crowded.','2025-10-21','Pending','Sneha Patel','Crowd Management','N/A',NULL),
(3,3,3,'Average visit.','2025-10-22','Pending','Anil Singh','Tour Experience','N/A',NULL),
(4,4,5,'Loved the show!','2025-10-23','Pending','Maria Lopez','Event Experience','N/A',NULL),
(5,5,4,'Nice gardens.','2025-10-24','Pending','Chen Wei','Gardens','N/A',NULL),
(6,6,2,'Poor service.','2025-10-25','Pending','David Smith','Facilities','N/A',NULL),
(7,7,5,'Amazing!','2025-10-26','Pending','Olivia Brown','Tour Experience','N/A',NULL),
(8,8,4,'Well maintained.','2025-10-27','Pending','Akira Yamamoto','Maintenance','N/A',NULL),
(9,9,5,'Very informative guide.','2025-10-28','Pending','Fatima Khan','Guide Experience','N/A',NULL),
(10,10,3,'Could be better.','2025-10-29','Pending','Sara Ali','Tour Experience','N/A',NULL);

-- INSERT queries
INSERT INTO Feedback (visitor_id, rating, comments, feedback_date, category)
VALUES (1, 5, 'Excellent experience!', '2025-10-20', 'Tour Experience');

INSERT INTO Feedback (visitor_id, rating, comments, feedback_date, category)
VALUES (2, 4, 'Good, but crowded.', '2025-10-21', 'Crowd Management');

-- SELECT queries
SELECT * FROM Feedback;
SELECT visitor_id, rating, comments FROM Feedback;
SELECT * FROM Feedback WHERE rating>=4;
SELECT * FROM Feedback WHERE response_status='Pending';
SELECT COUNT(*) AS total_feedback FROM Feedback;
SELECT * FROM Feedback ORDER BY feedback_date DESC;
SELECT visitor_id, category, comments FROM Feedback;
SELECT * FROM Feedback WHERE follow_up_date IS NULL;
SELECT rating, comments FROM Feedback WHERE category='Tour Experience';
SELECT * FROM Feedback WHERE handled_by='Ravi Kumar';

-- TRUNCATE & DROP
TRUNCATE TABLE Feedback;
DROP TABLE Feedback;


/* ============================================
   10. Table: Staff
   Purpose: Stores Taj Mahal staff information
============================================ */
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role VARCHAR(50),
    department VARCHAR(50),
    hire_date DATE,
    status VARCHAR(20) DEFAULT 'Active',
    phone VARCHAR(20),
    email VARCHAR(150),
    remarks TEXT
);

INSERT INTO Staff VALUES
(1,'Amit','Kumar','Security Officer','Security','2015-01-10','Active','9876543210','amit.kumar@tajstaff.com','VIP security'),
(2,'Sneha','Sharma','Maintenance Supervisor','Maintenance','2018-03-20','Active','9123456780','sneha.sharma@tajstaff.com','Responsible for cleaning'),
(3,'Ravi','Patel','Tour Coordinator','Tour','2016-05-15','Active','9876512345','ravi.patel@tajstaff.com','Guided tour allocation'),
(4,'Maria','Lopez','Event Manager','Events','2017-07-10','Active','+51987654321','maria.lopez@tajstaff.com','Manages shows'),
(5,'Chen','Wei','Receptionist','Front Desk','2018-09-05','Active','+8613800138000','chen.wei@tajstaff.com','Visitor registration'),
(6,'David','Smith','Security Guard','Security','2014-11-01','Active','+441234567890','david.smith@tajstaff.com','Entrance security'),
(7,'Olivia','Brown','Guide Supervisor','Tour','2020-01-12','Active','+61234567890','olivia.brown@tajstaff.com','Manages guides'),
(8,'Akira','Yamamoto','Facility Manager','Maintenance','2019-08-20','Active','+81312345678','akira.yamamoto@tajstaff.com','Oversees facilities'),
(9,'Fatima','Khan','Accounts Officer','Accounts','2016-07-15','Active','+919876543210','fatima.khan@tajstaff.com','Handles finances'),
(10,'Sara','Ali','Tour Guide','Tour','2019-02-18','Active','+971501234567','sara.ali@tajstaff.com','Guides tourists');

-- INSERT queries
INSERT INTO Staff (first_name, last_name, role, department, hire_date, phone, email)
VALUES ('Amit', 'Kumar', 'Security Officer', 'Security', '2015-01-10', '9876543210', 'amit.kumar@tajstaff.com');

INSERT INTO Staff (first_name, last_name, role, department, hire_date, phone, email)
VALUES ('Sneha', 'Sharma', 'Maintenance Supervisor', 'Maintenance', '2018-03-20', '9123456780', 'sneha.sharma@tajstaff.com');

-- SELECT queries
SELECT * FROM Staff;
SELECT first_name, last_name, role, department FROM Staff;
SELECT * FROM Staff WHERE status='Active';
SELECT * FROM Staff WHERE hire_date>'2017-01-01';
SELECT COUNT(*) AS total_staff FROM Staff;
SELECT * FROM Staff ORDER BY hire_date ASC;
SELECT * FROM Staff WHERE department='Security';
SELECT first_name, email FROM Staff;
SELECT role, department FROM Staff;
SELECT * FROM Staff WHERE email LIKE '%@tajstaff.com';

-- TRUNCATE & DROP
TRUNCATE TABLE Staff;
DROP TABLE Staff;
