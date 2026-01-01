CREATE Database  DRDO;

USE DRDO;

/* --------------------------------------------
   1. Directorate 
   Purpose: Represents a top‐level organizational directorate within DRDO.
-------------------------------------------- */

CREATE TABLE Directorate (
  directorate_id   SERIAL PRIMARY KEY,  -- Unique identifier for the directorate
  name             VARCHAR(200) NOT NULL UNIQUE,  -- Name of the directorate
  description      TEXT,                -- Description of the directorate’s functions
  head_scientist_id INT,                 -- ID of the directorate’s top scientist (for reference)
  established_date DATE,                -- Date when the directorate was established
  contact_email    VARCHAR(200),        -- Official email contact
  contact_phone    VARCHAR(50),         -- Official contact phone number
  location_city    VARCHAR(100),        -- City where the directorate is based
  location_state   VARCHAR(100),        -- State where the directorate is based
  website_url      VARCHAR(200)         -- URL for the directorate’s website
);
/* --------------------------------------------
   Inserting sample data into Directorate table
-------------------------------------------- */
INSERT INTO Directorate (name, description, head_scientist_id, established_date, contact_email, contact_phone, location_city, location_state, website_url) VALUES
('Directorate of Aeronautics', 'Focuses on research and development in aeronautics.', NULL, '2000-01-15', 'aeronautics@drdo.in', '0123-4567890', 'New Delhi', 'Delhi', 'http://aeronautics.drdo.in'),
('Directorate of Missiles', 'Responsible for missile technology and development.', NULL, '1995-05-20', 'missiles@drdo.in', '0123-4567891', 'Hyderabad', 'Telangana', 'http://missiles.drdo.in'),
('Directorate of Electronics', 'Engaged in electronics and communication systems.', NULL, '2005-03-10', 'electronics@drdo.in', '0123-4567892', 'Bangalore', 'Karnataka', 'http://electronics.drdo.in'),
('Directorate of Naval Systems', 'Develops technologies for naval systems.', NULL, '2010-07-25', 'naval@drdo.in', '0123-4567893', 'Mumbai', 'Maharashtra', 'http://naval.drdo.in'),
('Directorate of Armaments', 'Focuses on armament systems and technologies.', NULL, '2002-11-30', 'armaments@drdo.in', '0123-4567894', 'Chennai', 'Tamil Nadu', 'http://armaments.drdo.in'),
('Directorate of Combat Vehicles', 'Researches and develops combat vehicle technologies.', NULL, '1998-09-15', 'combatvehicles@drdo.in', '0123-4567895', 'Ahmedabad', 'Gujarat', 'http://combatvehicles.drdo.in'),
('Directorate of Chemical and Biological Defense', 'Works on chemical and biological defense technologies.', NULL, '2003-04-18', 'cbdefense@drdo.in', '0123-4567896', 'Pune', 'Maharashtra', 'http://cbdefense.drdo.in'),
('Directorate of Information Technology', 'Focuses on IT solutions for defense.', NULL, '2015-06-22', 'it@drdo.in', '0123-4567897', 'Noida', 'Uttar Pradesh', 'http://it.drdo.in'),
('Directorate of Advanced Systems', 'Engaged in advanced technology systems.', NULL, '2018-12-01', 'advanced@drdo.in', '0123-4567898', 'Gurgaon', 'Haryana', 'http://advanced.drdo.in'),
('Directorate of Space Systems', 'Researches and develops space technologies.', NULL, '2016-08-14', 'space@drdo.in', '0123-4567899', 'Thiruvananthapuram', 'Kerala', 'http://space.drdo.in');



SELECT * FROM Directorate;     -- 1 

SELECT name, established_date FROM Directorate;        -- 2

SELECT name, established_date FROM Directorate;    -- 3  

SELECT * FROM Directorate WHERE location_city = 'New Delhi';  -- 4

SELECT * FROM Directorate WHERE location_state = 'Maharashtra' AND established_date > '2000-01-01';   -- 5

SELECT * FROM Directorate ORDER BY established_date ASC;          --  6

SELECT * FROM Directorate LIMIT 5;    -- 7

SELECT COUNT(*) AS total_directorates FROM Directorate;     -- 8

SELECT DISTINCT location_state FROM Directorate;    -- 9

SELECT location_state, contact_email,name fROM Directorate;  -- 10 

  --  2. Laboratory 
  --  Purpose: Represents an individual laboratory under a Directorate.
-------------------------------------------- */
CREATE TABLE Laboratory (
  lab_id              SERIAL PRIMARY KEY,  -- Unique identifier for the lab
  directorate_id      INT NOT NULL,          -- Reference to the directorate (logical link)
  name                VARCHAR(200) NOT NULL UNIQUE,  -- Name of the lab
  location_city       VARCHAR(100),          -- City location of the lab
  location_state      VARCHAR(100),          -- State location of the lab
  area_of_research    VARCHAR(200),          -- Main research focus (e.g., missiles, electronics)
  date_established    DATE,                  -- Date the lab was established
  annual_budget       BIGINT,                -- Annual budget allocated to the lab
  num_scientists      INT,                   -- Number of scientists working in the lab
  contact_email       VARCHAR(200)           -- Lab's official email contact
);
/* --------------------------------------------
   Inserting sample data into Laboratory table
-------------------------------------------- */
INSERT INTO Laboratory (directorate_id, name, location_city, location_state, area_of_research, date_established, annual_budget, num_scientists, contact_email) VALUES
(1, 'Aeronautics Lab', 'New Delhi', 'Delhi', 'Aerodynamics', '2000-01-20', 50000000, 30, 'aeronauticslab@drdo.in'),
(2, 'Missile Technology Lab', 'Hyderabad', 'Telangana', 'Missile Systems', '1995-06-15', 70000000, 50, 'missilelab@drdo.in'),
(3, 'Electronics Lab', 'Bangalore', 'Karnataka', 'Electronics', '2005-04-10', 60000000, 40, 'electronicslab@drdo.in'),
(4, 'Naval Systems Lab', 'Mumbai', 'Maharashtra', 'Naval Technology', '2010-08-25', 80000000, 35, 'navallab@drdo.in'),
(5, 'Armaments Lab', 'Chennai', 'Tamil Nadu', 'Armament Systems', '2002-12-30', 55000000, 25, 'armamentslab@drdo.in'),
(6, 'Combat Vehicles Lab', 'Ahmedabad', 'Gujarat', 'Combat Vehicles', '1998-10-15', 65000000, 45, 'combatvehicleslab@drdo.in'),
(7, 'Chemical Defense Lab', 'Pune', 'Maharashtra', 'Chemical Defense', '2003-05-18', 40000000, 20, 'cbdefenselab@drdo.in'),
(8, 'IT Solutions Lab', 'Noida', 'Uttar Pradesh', 'Information Technology', '2015-07-22', 30000000, 15, 'itsolutionslab@drdo.in'),
(9, 'Advanced Systems Lab', 'Gurgaon', 'Haryana', 'Advanced Systems', '2018-01-01', 90000000, 60, 'advancedsystemslab@drdo.in'),
(10, 'Space Technology Lab', 'Thiruvananthapuram', 'Kerala', 'Space Technology', '2016-09-14', 75000000, 55, 'spacetechnologylab@drdo.in');
/* --------------------------------------------*/

select * from Laboratory; -- 1

SELECT  directorate_id, name FROM  Laboratory;   -- 2

SELECT name,  date_established FROM Laboratory;   -- 3

SELECT  annual_budget FROM Laboratory;    -- 4

SELECT * FROM Laboratory WHERE location_state = 'New Delhi';      -- 5

SELECT * FROM Laboratory WHERE location_state = 'Maharashtra' AND date_established > '2010-08-25';     -- 6

SELECT DISTINCT location_state FROM Laboratory;   -- 7

SELECT num_scientists FROM Laboratory;     -- 8

SELECT  directorate_id FROM Laboratory;   -- 9

SELECT name,directorate_id,annual_budget, contact_email FROM Laboratory;   -- 10

truncate TABLE Laboratory;   -- 11

DROP TABLE Laboratory;   -- 12 



   -- 3. Scientist 
  --  Purpose: Stores information about scientists employed at DRDO.
-------------------------------------------- */
CREATE TABLE Scientist (

  scientist_id    SERIAL PRIMARY KEY,  -- Unique identifier for each scientist
  lab_id          INT NOT NULL,          -- ID of the lab where the scientist works
  first_name      VARCHAR(100),          -- Scientist's first name
  last_name       VARCHAR(100),          -- Scientist's last name
  dob             DATE,                  -- Date of birth
  gender          CHAR(1),               -- Gender (e.g., 'M' or 'F')
  designation     VARCHAR(50),           -- Job title or designation (e.g., Scientist-G)
  expertise_area  VARCHAR(200),          -- Field of specialization
  date_of_joining DATE,                  -- Date the scientist joined DRDO
  email           VARCHAR(200)           -- Contact email address
);
/* --------------------------------------------
   Inserting sample data into Scientist table
-------------------------------------------- */
INSERT INTO Scientist (lab_id, first_name, last_name, dob, gender, designation, expertise_area, date_of_joining, email) VALUES
(1, 'Amit', 'Sharma', '1980-05-15', 'M', 'Scientist-G', 'Aerodynamics', '2005-01-10', 'amit.sharma@drdo.in'),
(2, 'Priya', 'Verma', '1985-07-20', 'F', 'Scientist-F', 'Missile Systems', '2010-03-15', 'priya.verma@drdo.in'),
(3, 'Raj', 'Kumar', '1990-11-30', 'M', 'Scientist-E', 'Electronics', '2015-06-22', 'raj.kumar@drdo.in'),
(4, 'Sneha', 'Reddy', '1988-02-10', 'F', 'Scientist-D', 'Naval Technology', '2012-08-25', 'sneha.reddy@drdo.in'),
(5, 'Vikram', 'Singh', '1982-09-05', 'M', 'Scientist-C', 'Armament Systems', '2008-04-18', 'vikram.singh@drdo.in'),
(6, 'Neha', 'Patel', '1993-12-12', 'F', 'Scientist-B', 'Combat Vehicles', '2016-01-01', 'neha.patel@drdo.in'),
(7, 'Karan', 'Mehta', '1987-03-25', 'M', 'Scientist-A', 'Chemical Defense', '2014-05-30', 'karan.mehta@drdo.in'),
(8, 'Anjali', 'Nair', '1991-08-15', 'F', 'Scientist-G', 'Information Technology', '2017-07-22', 'anjali.nair@drdo.in'),
(9, 'Ravi', 'Choudhary', '1984-10-10', 'M', 'Scientist-F', 'Advanced Systems', '2019-02-14', 'ravi.choudhary@drdo.in'),
(10, 'Pooja', 'Iyer', '1995-04-20', 'F', 'Scientist-E', 'Space Technology', '2020-09-01', 'pooja.iyer@drdo.in');




-- -------------------------------------------------------   Select Queries ---------------------------------------------------------------

SELECT * FROM  Scientist;   -- 1

SELECT lab_id, first_name, last_name, dob, gender FROM Scientist;     -- 2 

SELECT  gender  FROM Scientist WHERE  'F';  -- 3

SELECT date_of_joining FROM Scientist WHERE date_of_joining <  '2017-07-22';

-- 2. Select scientists from lab 3
SELECT first_name,last_name, designation
FROM Scientist
WHERE lab_id = 3;

-- 3. Get Get scientists who joined after 2010
SELECT scientist_id, first_name, date_of_joining
FROM Scientist
Where date_of_joining > '2010-01-01';

-- 4. List scientists ordered by date of of birth (youngest first)
SELECT first_name, last_name, dob
FROM Scientist
ORDER BY dob DESC;

-- 5. Count scientists per designation
SELECT designation, COUNT(*) AS num_scientists
FROM Scientist
GROUP BY designation;

-- Upate Queries 
UPDATE Scientist
SET designation = 'Scientist-D'
WHERE first_name = 'Vikram ' AND last_name = 'Singh';

-- Update email for Amit Sharma
UPDATE Scientist
SET email = 'amit.sharma@drdo.in'
WHERE scientist_id = 1;

UPDATE Scientist  
SET email = 'rajj.kumar@drdo.in'
WHERE lab_id = 3;

UPDATE Scientist
SET lab_id = lab_id + 1
WHERE date_of_joining > '2018-01-01';

-- 5. Use Case to adjust designing based on criteria
UPDATE Scientist 
SET designation = CASE 
WHEN expertise_area LIKE '%Electronics%' THEN 'Scientist-Electronics Lead'
WHEN expertise_area LIKE '%Naval%' THEN 'Scientist-Naval Lead'
ELSE designation

END;

-- DELETE Queries

-- 1.Remove scientists in lab 5
    DELETE FROM Scientist
    WHERE lab_id = 5;
    
-- 3. Delete restired scientists older than 60 years
DELETE FROM Scientist
WHERE dob < CURRENT_DATE - INTERVAL '60 years';

-- 4. Delete scirntist joined before 2008
DELETE FROM Scientist
WHERE date_of_joining < '2008-01-01';

truncate TABLE Scientist;

/* --------------------------------------------
   4. Project 
   Purpose: Represents a research or development project.
-------------------------------------------- */
CREATE TABLE Project (
  project_id                SERIAL PRIMARY KEY,  -- Unique project identifier
  project_code              VARCHAR(100) UNIQUE NOT NULL,  -- Unique project code (e.g., "IGMDP-XYZ")
  name                      VARCHAR(200) NOT NULL,  -- Project name
  summary                   TEXT,                 -- Brief description/summary of the project
  status                    VARCHAR(20) NOT NULL, -- Current status (e.g., Proposed, Ongoing, Completed)
  start_date                DATE NOT NULL,        -- Project start date
  planned_end_date          DATE,                 -- Planned end date
  funding_source            VARCHAR(100),         -- Funding source (e.g., DRDO budget)
  funding_amount            BIGINT,               -- Funding amount allocated (in local currency)
  project_lead_scientist_id INT                   -- ID of the lead scientist for the project
);
/* --------------------------------------------
   Inserting sample data into Project table
-------------------------------------------- */
INSERT INTO Project (project_code, name, summary, status, start_date, planned_end_date, funding_source, funding_amount, project_lead_scientist_id) VALUES
('IGMDP-001', 'Integrated Guided Missile Development Program', 'Development of various missile systems.', 'Ongoing', '2010-01-01', '2025-12-31', 'DRDO Budget', 100000000, 1),
('IGMDP-002', 'Advanced Aerodynamics Research', 'Research in advanced aerodynamics for aircraft.', 'Ongoing', '2015-05-01', '2023-12-31', 'DRDO Budget', 50000000, 3),
('IGMDP-003', 'Naval Combat Systems', 'Development of advanced naval combat systems.', 'Proposed', '2022-01-01', '2026-12-31', 'DRDO Budget', 80000000, 4),
('IGMDP-004', 'Next-Gen Armaments', 'Research on next-generation armament systems.', 'Ongoing', '2018-03-15', '2024-03-15', 'DRDO Budget', 60000000, 5),
('IGMDP-005', 'Combat Vehicle Technology', 'Development of new combat vehicle technologies.', 'Completed', '2016-06-01', '2021-06-01', 'DRDO Budget', 70000000, 6),
('IGMDP-006', 'Chemical Defense Systems', 'Research on chemical defense technologies.', 'Ongoing', '2019-01-01', '2023-01-01', 'DRDO Budget', 40000000, 7),
('IGMDP-007', 'IT Solutions for Defense', 'Development of IT solutions for defense applications.', 'Proposed', '2021-05-01', '2025-05-01', 'DRDO Budget', 30000000, 8),
('IGMDP-008', 'Advanced Systems Development', 'Research on advanced systems for defense.', 'Ongoing', '2020-02-01', '2024-02-01', 'DRDO Budget', 90000000, 9),
('IGMDP-009', 'Space Technology Development', 'Research on space technologies for defense.', 'Ongoing', '2021-07-01', '2025-07-01', 'DRDO Budget', 75000000, 10),
('IGMDP-010', 'Missile Defense Systems', 'Development of missile defense systems.', 'Proposed', '2023-01-01', '2028-01-01', 'DRDO Budget', 85000000, 2);

SELECT project_code, name, status, start_date
FROM Project
WHERE status = 'Ongoing';


SELECT lp.lab_id, lp.role_description, lp.contribution_pct
FROM Lab_Project lp
JOIN Project p ON lp.project_id = p.project_id
WHERE p.project_code = 'IGMDP-001';

/* --------------------------------------------
   5. Lab_Project 
   Purpose: Junction table linking Laboratories and Projects.
-------------------------------------------- */
CREATE TABLE Lab_Project (
  lab_id           INT NOT NULL,             -- Lab identifier
  project_id       INT NOT NULL,             -- Project identifier
  role_description TEXT,                     -- Description of the lab's role in the project
  start_date       DATE,                     -- Start date of lab’s involvement
  end_date         DATE,                     -- End date of lab’s involvement (if applicable)
  contribution_pct DECIMAL(5,2),             -- Percentage contribution by the lab
  remarks          TEXT,                     -- Additional remarks
  last_updated_by  VARCHAR(100),             -- Username of the last person to update record
  last_updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp of the last update
  is_primary_lab   BOOLEAN,                  -- Flag indicating if the lab is primary for the project
  PRIMARY KEY (lab_id, project_id)            -- Composite primary key ensures unique lab-project pair
);
/* --------------------------------------------
   Inserting sample data into Lab_Project table
-------------------------------------------- */
INSERT INTO Lab_Project (lab_id, project_id, role_description, start_date, end_date, contribution_pct, remarks, last_updated_by, last_updated_at, is_primary_lab) VALUES
(1, 1, 'Lead in aerodynamics research.', '2010-01-01', NULL, 50.00, 'Primary lab for aerodynamics.', 'admin', CURRENT_TIMESTAMP, TRUE),
(2, 2, 'Responsible for missile systems development.', '2015-05-01', NULL, 60.00, 'Key contributor to missile technology.', 'admin', CURRENT_TIMESTAMP, TRUE),
(3, 3, 'Engaged in electronics for naval systems.', '2022-01-01', NULL, 40.00, 'Supporting naval systems project.', 'admin', CURRENT_TIMESTAMP, FALSE),
(4, 4, 'Developing advanced armament systems.', '2018-03-15', NULL, 70.00, 'Primary lab for armaments.', 'admin', CURRENT_TIMESTAMP, TRUE),
(5, 5, 'Researching combat vehicle technologies.', '2016-06-01', NULL, 55.00, 'Key contributor to combat vehicles.', 'admin', CURRENT_TIMESTAMP, TRUE),
(6, 6, 'Working on chemical defense technologies.', '2019-01-01', NULL, 45.00, 'Supporting chemical defense project.', 'admin', CURRENT_TIMESTAMP, FALSE),
(7, 7, 'Developing IT solutions for defense.', '2021-05-01', NULL, 30.00, 'Key contributor to IT solutions.', 'admin', CURRENT_TIMESTAMP, TRUE),
(8, 8, 'Researching advanced systems.', '2020-02-01', NULL, 65.00, 'Primary lab for advanced systems.', 'admin', CURRENT_TIMESTAMP, TRUE),
(9, 9, 'Developing space technologies.', '2021-07-01', NULL, 50.00, 'Key contributor to space technology.', 'admin', CURRENT_TIMESTAMP, TRUE),
(10, 10, 'Researching missile defense systems.', '2023-01-01', NULL, 80.00, 'Primary lab for missile defense.', 'admin', CURRENT_TIMESTAMP, TRUE);
/* --------------------------------------------
   6. Equipment 
   Purpose: Catalog of equipment and assets owned by labs.
-------------------------------------------- */
CREATE TABLE Equipment (
  equipment_id    SERIAL PRIMARY KEY,  -- Unique equipment identifier
  lab_id          INT NOT NULL,          -- Lab where the equipment is housed
  name            VARCHAR(200) NOT NULL, -- Name or description of the equipment
  equipment_type  VARCHAR(100),          -- Type/category of equipment (e.g., radar, missile test rig)
  manufacturer    VARCHAR(100),          -- Manufacturer's name
  model_number    VARCHAR(100),          -- Model or serial number
  date_acquired   DATE,                  -- Acquisition date
  status          VARCHAR(50),           -- Current status (e.g., Active, Under Maintenance)
  cost            BIGINT,                -- Cost of the equipment in local currency
  location        VARCHAR(100)           -- Physical location or storage area within the lab
);
/* --------------------------------------------
   Inserting sample data into Equipment table
-------------------------------------------- */
INSERT INTO Equipment (lab_id, name, equipment_type, manufacturer, model_number, date_acquired, status, cost, location) VALUES
(1, 'Wind Tunnel', 'Aerodynamic Testing', 'AeroTech', 'WT-2020', '2010-01-15', 'Active', 15000000, 'Lab 1 - Testing Area'),
(2, 'Missile Test Rig', 'Missile Testing', 'MissileCorp', 'MTR-2021', '2015-06-20', 'Active', 20000000, 'Lab 2 - Testing Area'),
(3, 'Electronics Workbench', 'Electronics', 'ElectroTech', 'EW-2022', '2005-04-10', 'Active', 5000000, 'Lab 3 - Electronics Section'),
(4, 'Naval Simulator', 'Naval Systems', 'NavalTech', 'NS-2023', '2010-08-25', 'Active', 12000000, 'Lab 4 - Simulation Area'),
(5, 'Armament Testing Rig', 'Armament Testing', 'ArmamentCorp', 'ATR-2024', '2002-12-30', 'Active', 18000000, 'Lab 5 - Testing Area'),
(6, 'Combat Vehicle Simulator', 'Combat Vehicles', 'CombatTech', 'CVS-2025', '1998-10-15', 'Active', 16000000, 'Lab 6 - Simulation Area'),
(7, 'Chemical Analysis Equipment', 'Chemical Defense', 'ChemTech', 'CAE-2026', '2003-05-18', 'Active', 7000000, 'Lab 7 - Analysis Section'),
(8, 'IT Server', 'Information Technology', 'ITCorp', 'IT-2027', '2015-07-22', 'Active', 3000000, 'Lab 8 - IT Section'),
(9, 'Advanced Systems Prototype', 'Advanced Systems', 'AdvancedCorp', 'ASP-2028', '2020-02-01', 'Active', 25000000, 'Lab 9 - Prototyping Area'),
(10, 'Satellite Communication Equipment', 'Space Technology', 'SpaceCorp', 'SCE-2029', '2021-07-01', 'Active', 22000000, 'Lab 10 - Space Section');
/* --------------------------------------------
   7. Test_Facility 
   Purpose: Infrastructure and facilities used for testing projects.
-------------------------------------------- */
CREATE TABLE Test_Facility (
  facility_id       SERIAL PRIMARY KEY,  -- Unique identifier for the facility
  lab_id            INT NOT NULL,          -- Lab that operates the facility
  name              VARCHAR(200) NOT NULL, -- Facility name (e.g., "Wind Tunnel")
  facility_type     VARCHAR(100),          -- Type of facility (e.g., Aerodynamic Test, Hypersonic Chamber)
  location_city     VARCHAR(100),          -- City where the facility is located
  location_state    VARCHAR(100),          -- State location of the facility
  capacity          INT,                   -- Capacity or throughput (e.g., tests per year)
  accreditation_status VARCHAR(50),         -- Accreditation/approval status
  contact_phone     VARCHAR(50),           -- Facility contact phone
  established_date  DATE                   -- Date when the facility was established
);
/* --------------------------------------------
   Inserting sample data into Test_Facility table
-------------------------------------------- */
INSERT INTO Test_Facility (lab_id, name, facility_type, location_city, location_state, capacity, accreditation_status, contact_phone, established_date) VALUES
(1, 'Aerodynamic Test Facility', 'Aerodynamic Testing', 'New Delhi', 'Delhi', 100, 'Accredited', '0123-4567890', '2010-01-15'),
(2, 'Missile Test Facility', 'Missile Testing', 'Hyderabad', 'Telangana', 50, 'Accredited', '0123-4567891', '2015-06-20'),
(3, 'Electronics Testing Facility', 'Electronics', 'Bangalore', 'Karnataka', 30, 'Accredited', '0123-4567892', '2005-04-10'),
(4, 'Naval Testing Facility', 'Naval Systems', 'Mumbai', 'Maharashtra', 40, 'Accredited', '0123-4567893', '2010-08-25'),
(5, 'Armament Testing Facility', 'Armament Testing', 'Chennai', 'Tamil Nadu', 60, 'Accredited', '0123-4567894', '2002-12-30'),
(6, 'Combat Vehicle Testing Facility', 'Combat Vehicles', 'Ahmedabad', 'Gujarat', 70, 'Accredited', '0123-4567895', '1998-10-15'),
(7, 'Chemical Defense Testing Facility', 'Chemical Defense', 'Pune', 'Maharashtra', 20, 'Accredited', '0123-4567896', '2003-05-18'),
(8, 'IT Testing Facility', 'Information Technology', 'Noida', 'Uttar Pradesh', 25, 'Accredited', '0123-4567897', '2015-07-22'),
(9, 'Advanced Systems Testing Facility', 'Advanced Systems', 'Gurgaon', 'Haryana', 80, 'Accredited', '0123-4567898', '2020-02-01'),
(10, 'Space Testing Facility', 'Space Technology', 'Thiruvananthapuram', 'Kerala', 90, 'Accredited', '0123-4567899', '2021-07-01');
/* --------------------------------------------
   8. Patent 
   Purpose: Records of patents filed/generated from projects.
-------------------------------------------- */
CREATE TABLE Patent (
  patent_id        SERIAL PRIMARY KEY,  -- Unique patent identifier
  project_id       INT NOT NULL,          -- Associated project identifier
  title            VARCHAR(200) NOT NULL, -- Title of the patent
  application_date DATE,                  -- Date when the patent was applied for
  grant_date       DATE,                  -- Date when the patent was granted (if applicable)
  patent_number    VARCHAR(100),          -- Official patent number assigned
  country          VARCHAR(50),           -- Country where the patent is filed
  status           VARCHAR(50),           -- Patent status (e.g., Filed, Granted, Pending)
  category         VARCHAR(100),          -- Category or area (e.g., Defense Technology)
  filed_by         VARCHAR(100)           -- Name of the individual or department filing the patent
);
/* --------------------------------------------
   Inserting sample data into Patent table
-------------------------------------------- */
INSERT INTO Patent (project_id, title, application_date, grant_date, patent_number, country, status, category, filed_by) VALUES
(1, 'Missile Guidance System', '2001-01-15', '2003-05-20', 'IN123456', 'India', 'Granted', 'Defence Technology', 'Amit Sharma'),
(2, 'Electronic Warfare Device', '2015-02-10', NULL, 'IN654321', 'India', 'Filed', 'Defence Technology', 'Priya Verma'),
(3, 'Naval Combat System', '2022-03-01', NULL, 'IN789012', 'India', 'Pending', 'Defence Technology', 'Vikram Singh'),
(4, 'Combat Vehicle Upgrade', '2018-04-15', NULL, 'IN345678', 'India', 'Pending', 'Defence Technology', 'Sneha Patel'),
(5, 'Chemical Defence Technology', '2010-05-20', '2015-12-15', 'IN987654', 'India', 'Granted', 'Defence Technology', 'Karan Mehta'),
(6, 'IT Security System', '2019-06-25', NULL, 'IN456789', 'India', 'Filed', 'Defence Technology', 'Neha Gupta'),
(7, 'Advanced Materials for Defence', '2020-07-30', NULL, 'IN321654', 'India',);
/* --------------------------------------------
   9. Publication 
   Purpose: Tracks research publications or reports generated from projects.
-------------------------------------------- */
CREATE TABLE Publication (
  publication_id    SERIAL PRIMARY KEY,  -- Unique publication identifier
  project_id        INT NOT NULL,          -- Associated project identifier
  title             VARCHAR(200) NOT NULL, -- Title of the publication
  conference_or_journal VARCHAR(200),       -- Name of the conference or journal
  first_author      VARCHAR(100),          -- Name of the first author
  publication_date  DATE,                  -- Date of publication
  doi               VARCHAR(100),          -- Digital Object Identifier (if applicable)
  status            VARCHAR(50),           -- Status (e.g., Submitted, Accepted, Published)
  publisher         VARCHAR(100),          -- Name of the publisher
  abstract          TEXT                   -- Summary or abstract of the publication
);
/* --------------------------------------------
   Inserting sample data into Publication table
-------------------------------------------- */
INSERT INTO Publication (project_id, title, conference_or_journal, first_author, publication_date, doi, status, publisher, abstract) VALUES
(1, 'Development of Integrated Guided Missiles', 'International Journal of Defence Technology', 'Amit Sharma', '2003-06-15', '10.1000/xyz123', 'Published', 'Defence Publishers', 'This paper discusses the development of integrated guided missile systems.'),
(2, 'Advancements in Electronic Warfare', 'Journal of Electronics and Communication', 'Priya Verma', '2018-09-10', '10.1000/xyz124', 'Published', 'Electronics Press', 'This publication covers recent advancements in electronic warfare technologies.'),
(3, 'Naval Combat Systems: A New Era', 'Naval Research Review', 'Vikram Singh', '2022-11-20', NULL, 'Submitted', 'Naval Publishers', 'This article explores the new technologies in naval combat systems.'),
(4, 'Modern Combat Vehicle Technologies', 'Journal of Military Engineering', 'Sneha Patel', '2020-05-30', NULL, 'Accepted', 'Military Engineering Press', 'This paper presents modern technologies in combat vehicles.'),
(5, 'Chemical Defence Innovations', 'Journal of Chemical Defence', 'Karan Mehta', '2015-03-15', '10.1000/xyz125', 'Published', 'Chemical Defence Publishers', 'This publication discusses innovations in chemical defence technologies.'),
(6, 'IT Solutions for Defence Applications', 'International Journal of IT in Defence', 'Neha Gupta', '2021-07-25', NULL, 'Submitted', 'IT Defence Press', 'This paper discusses IT solutions tailored for defence applications.'),
(7, 'Materials for Defence Applications', 'Materials Science Journal', 'Ravi Nair', '2019-08-05', NULL, 'Accepted', 'Materials Publishers', 'This article reviews materials used in defence applications.'),
(8, 'Space Technology Developments', 'Journal of Space Research', 'Pooja Iyer', '2023-01-10', NULL, 'Submitted', 'Space Publishers', 'This publication discusses recent developments in space technology.'),
(9, 'Missile Defence Strategies', 'Defence Strategy Journal', 'Amit Sharma', '2020-12-15', '10.1000/xyz126', 'Published', 'Defence Strategy Press', 'This paper outlines strategies for missile defence systems.'),
(10, 'Advanced Armament Systems', 'Journal of Armament Technology', 'Sneha Patel', '2022-04-20', NULL, 'Accepted', 'Armament Publishers', 'This publication discusses advancements in armament systems.');
/* --------------------------------------------
   10. Industry_Partner 
   Purpose: Records external industry partners working with DRDO.
-------------------------------------------- */

CREATE TABLE Industry_Partner (
  partner_id    SERIAL PRIMARY KEY,  -- Unique identifier for the industry partner
  name          VARCHAR(200) NOT NULL, -- Name of the partner organization
  address       VARCHAR(300),          -- Full address
  city          VARCHAR(100),          -- City of the partner
  state         VARCHAR(100),          -- State of the partner
  country       VARCHAR(50),           -- Country where the partner is based
  contact_person VARCHAR(100),         -- Primary contact person's name
  contact_email VARCHAR(200),          -- Contact email address
  contact_phone VARCHAR(50),           -- Contact phone number
  website       VARCHAR(200)           -- Website URL of the partner
);

/* --------------------------------------------
   Inserting sample data into Industry_Partner table
-------------------------------------------- */
INSERT INTO Industry_Partner (name, address, city, state, country, contact_person, contact_email, contact_phone, website) VALUES
('AeroTech Industries', '123 Aero Lane, Sector 10', 'New Delhi', 'Delhi', 'India', 'Rajesh Kumar', 'rajesh.kumar@aerotech.com', '011-23456789', 'http://aerotech.com'),
('MissileCorp', '456 Missile Road, Industrial Area', 'Hyderabad', 'Telangana', 'India', 'Priya Verma', 'priya.verma@missilecorp.com', '040-98765432', 'http://missilecorp.com'),
('ElectroTech Solutions', '789 Electronics Park, Tech City', 'Bangalore', 'Karnataka', 'India', 'Anjali Reddy', 'anjali.reddy@electrotech.com', '080-12345678', 'http://electrotech.com'),
('ArmamentInc', '321 Armament Street, Defence Complex', 'Pune', 'Maharashtra', 'India', 'Vikram Singh', 'vikram.singh@armamentinc.com', '020-23456789', 'http://armamentinc.com'),
('NavalTech', '654 Naval Base, Port Area', 'Visakhapatnam', 'Andhra Pradesh', 'India', 'Karan Mehta', 'karan.mehta@navaltech.com', '0891-3456789', 'http://navaltech.com'),
('CombatTech', '987 Combat Road, Military Zone', 'Chennai', 'Tamil Nadu', 'India', 'Ravi Nair', 'ravi.nair@combattech.com', '044-45678901', 'http://combattech.com'),
('ChemTech Industries', '159 Chemical Lane, Industrial Park', 'Delhi', 'Delhi', 'India', 'Neha Gupta', 'neha.gupta@chemtech.com', '011-56789012', 'http://chemtech.com'),
('ITCorp Solutions', '753 IT Avenue, Cyber City', 'Noida', 'Uttar Pradesh', 'India', 'Pooja Iyer', 'pooja.iyer@itcorp.com', '0120-67890123', 'http://itcorp.com'),
('MaterialTech', '852 Material Road, Research Park', 'Ahmedabad', 'Gujarat', 'India', 'Sneha Patel', 'sneha.patel@materialtech.com', '079-78901234', 'http://materialtech.com'),
('SpaceCorp', '963 Space Lane, Space City', 'Thiruvananthapuram', 'Kerala', 'India', 'Amit Sharma', 'amit.sharma@spacecorp.com', '0471-89012345', 'http://spacecorp.com');
