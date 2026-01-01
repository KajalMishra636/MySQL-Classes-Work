-- single line comments

/*
multiline
comments
*/


-- ----------------------------------------------Database Queries---------------------------------------------------------------------------
-- to create database ISRO 
create database ISRO;


-- to work on it, we need to use it first
use ISRO;

-- to delete database
drop database ISRO;

-- --------------------------------------------Database Analysis--------------------------------------------------------------------------
/*
T1:Missions (MissionID, Mission_name, Launch_date, Mission_type, Status, SatelliteID, VehicleID, Duration_days, Cost_million_USD, Success_rate)

*/

/*
T2:Satellite (SatelliteID, Name, Type, Weight_kg, Launch_year, Orbit_type, Manufacturer, MissionID, Lifespan_years, Status) 

*/

/*
T3:Launch_Vehicles (VehicleID, Name, Type, Stages, Fuel_type, Height_m, Weight_tons, Payload_kg, Manufacturer, First_launch_year) 

*/

/*
T4:Launch_Sites (SiteID, Name, Location, Country, Year_established, Launch_pads, Areas_acres, Latitude, Longitude, Status) 

*/

/*
T5:Scientists (ScientistID, Name, Gender, Age, Specialization, DepartmentID, Experience_years, Publications, Awards, Status) 

*/

/*
T6:Departments (DepartmentID, Name, Head, Total_staff, Established_year, Budget_million_USD, Focus_area, CentreID, Labs_count, Location)

*/

/*
T7:Space_Centres (CentreID, Name, Location, Director, Established_years, Staff_count, Facilities, Budget_millions_USD, Areas_acres, Type) 

*/

/*
T8:Collaborations (CollaborationID, Partner_name, Country, Mission_name, Type, Start_year, End_year, Budget_million_USD, Status, Notes)

*/

/*
T9:Research_Projects (ProjectID, Name, Field, Lead_scientist, DepartmentID, Budget_million_USD, Duration_years, Start_year, Status, Outcome) 

*/

/*
T10:

*/

-- --------------------------------------------------Table Queries-------------------------------------------------------------------------
-- to create table 
CREATE TABLE Missions (
MissionID INT PRIMARY KEY,
Mission_name VARCHAR(50),
Launch_date DATE,
Mission_type VARCHAR(50),
Status VARCHAR(20),
SatelliteID INT,
VehicleID INT,
Duration_days INT,
Cost_million_USD DECIMAL(10, 2),
Success_rate FLOAT
);


-- to display/retrieve table
select * from Missions;


-- to remove complete records from table
truncate table Missions;

-- to remove complete records and attributes from table
drop table Missions;


-- to insert values into the table
INSERT INTO Missions (MissionID, Mission_name, Launch_date, Mission_type, Status, SatelliteID, VehicleID, Duration_days, Cost_million_USD, Success_rate)
VALUES
(1, 'Chandrayaan-1', '2008-10-22', 'Lunar', 'Success', 1, 1, 312, 80.0, 0.95),
(2, 'Mars Orbiter', '2013-11-05', 'Mars', 'Success', 2, 2, 300, 74.0, 0.90),
(3, 'Chandrayaan-2', '2019-07-22', 'Lunar', 'Partial Success', 3, 3, 365, 140.0, 0.75),
(4, 'RISAT-2BR1', '2019-12-11', 'Earth Obs.', 'Success', 4, 4, 200, 20.0, 0.98),
(5, 'INSAT-3DR', '2016-09-08', 'Weather', 'Success', 5, 5, 730, 45.0, 0.93),
(6, 'PSLV-C37', '2017-02-15', 'Multi-sat', 'Success', 6, 6, 180, 30.0, 0.96),
(7, 'GSAT-6A', '2018-03-29', 'Comm.', 'Failure', 7, 7, 0, 60.0, 0.0),
(8, 'EOS-01', '2020-11-07', 'Earth Obs.', 'Success', 8, 8, 300, 22.0, 0.97),
(9, 'Chandrayaan-3', '2023-07-14', 'Lunar', 'Success', 9, 3, 360, 90.0, 0.95),
(10, 'Aditya-L1', '2023-09-02', 'Solar', 'Ongoing', 10, 9, 500, 50.0, 0.85);



-- to create table Satellite
CREATE TABLE Satellites (
SatelliteID INT PRIMARY KEY,
Name VARCHAR(50),
Type VARCHAR(30),
Weight_kg INT,
Launch_year INT,
Orbit_type VARCHAR(30),
Manufacturer VARCHAR(50), 
MissionID INT,
Lifespan_years INT,
Status VARCHAR(20)
);


-- to display/retrieve table
select * from Satellites;


-- to remove complete records from table
truncate table Satellites;

-- to remove complete records and attributes from table
drop table Satellites;


-- to insert values into the table
INSERT INTO Satellites (SatelliteID, Name, Type, Weight_kg, Launch_year, Orbit_type, Manufacturer, MissionID, Lifespan_years, Status) 
VALUES
(1, 'Chandrayaan-1', 'Lunar Probe', 1380, 2008, 'Lunar Orbit', 'ISRO', 1, 1, 'Inactive'),
(2, 'Mangalyaan', 'Mars Orbiter', 1337, 2013, 'Mars Orbit', 'ISRO', 2, 6, 'Inactive'),
(3, 'Chandrayaan-2 Orbiter', 'Lunar Probe', 2379, 2019, 'Lunar Orbit', 'ISRO', 3, 7, 'Active'),
(4, 'RISAT-2BR1', 'Radar Imaging', 628, 2019, 'LEO', 'ISRO', 4, 5, 'Active'),
(5, 'INSAT-3DR', 'Weather', 2211, 2016, 'GEO', 'ISRO', 5, 7, 'Active'),
(6, 'Cartosat-2', 'Earth Obs.', 714, 2017, 'SSO', 'ISRO', 6, 5, 'Active'),
(7, 'GSAT-6A', 'Comm.', 2140, 2018, 'GEO', 'ISRO', 7, 0, 'Failed'),
(8, 'EOS-01', 'Earth Obs.', 636, 2020, 'LEO', 'ISRO', 8, 7, 'Active'),
(9, 'Chandrayaan-3 Lander', 'Lunar Lander', 1749, 2023, 'Lunar Surface', 'ISRO', 9, 1, 'Active'),
(10, 'Aditya-L1', 'Solar', 1360, 2023, 'L1 Halo', 'ISRO', 10, 5, 'Active');



-- to create table Launch_Vehicles
CREATE TABLE Launch_Vehicles (
VehicleID INT PRIMARY KEY,
Name VARCHAR(50),
Type VARCHAR(30),
Stages INT,
Fuel_type VARCHAR(30),
Height_m FLOAT,
Weight_tons FLOAT,
Payload_kg INT,
Manufacturer VARCHAR(50),
First_launch_year INT
);


-- to display/retrieve table
select * from Launch_Vehicles;


-- to remove complete records from table 
truncate table Launch_Vehicles;

-- to remove complete records from table
drop table Launch_Vehicles;


-- to insert values into table
INSERT INTO Launch_Vehicles (VehicleID, Name, Type, Stages, Fuel_type, Height_m, Weight_tons, Payload_kg, Manufacturer, First_launch_year) 
VALUES
(1, 'PSLV-C11', 'PSLV', 4, 'Solid/Liquid', 44.0, 295, 1380, 'ISRO', 2008),
(2, 'PSLV-C25', 'PSLV', 4, 'Solid/Liquid', 44.0, 295, 1337, 'ISRO', 2013),
(3, 'GSLV Mk III', 'GSLV', 3, 'Liquid/Cryogenic', 43.4, 640, 4000, 'ISRO', 2014),
(4, 'PSLV-C48', 'PSLV', 4, 'Solid/Liquid', 44.0, 295, 628, 'ISRO', 2019),
(5, 'GSLV-F05', 'GSLV', 3, 'Liquid/Cryogenic', 51.7, 415, 2211, 'ISRO', 2016),
(6, 'PSLV-C37', 'PSLV', 4, 'Solid/Liquid', 44.0, 295, 714, 'ISRO', 2017),
(7, 'GSLV-F08', 'GSLV', 3, 'Liquid/Cryogenic', 51.7, 415, 2140, 'ISRO', 2018),
(8, 'PSLV-C49', 'PSLV', 4, 'Solid/Liquid', 44.0, 295, 636, 'ISRO', 2020),
(9, 'PSLV-C57', 'PSLV', 4, 'Solid/Liquid', 44.0, 295, 1360, 'ISRO', 2023),
(10, 'SSLV-D1', 'SSLV', 3, 'Solid', 34.0, 120, 500, 'ISRO', 2022);


-- to create table Launch_Sites
CREATE TABLE Launch_Sites (
SiteID INT PRIMARY KEY,
Name VARCHAR(50),
Location VARCHAR(50),
Country VARCHAR(30),
Year_established INT,
Launch_pads INT,
Areas_acres FLOAT,
Latitude FLOAT,
Longitude FLOAT,
Status VARCHAR(20)
);


-- to display/retrieve table
select * from Launch_Sites;


-- to remove complete records from table 
truncate table Launch_Sites;

-- to remove complete records and attributes from table
drop table Launch_Sites;


-- to insert values into the table
INSERT INTO Launch_Sites (SiteID, Name, Location, Country, Year_established, Launch_pads, Areas_acres, Latitude, Longitude, Status) 
VALUES
(1, 'Satish Dhawan Space Centre', 'Sriharikota', 'India', 1971, 2, 14500.0, 13.7, 80.2, 'Active'),
(2, 'Thumba Equatorial Rocket Launching Station', 'Thiruvananthapuram', 'India', 1963, 1, 600.0, 8.5, 76.9, 'Active'),
(3, 'Balasore Test Range', 'Odisha', 'India', 1980, 1, 800.0, 21.5, 87.2, 'Active'),
(4, 'Chitradurga Test Range', 'Karnataka', 'India', 2012, 1, 2500.0, 14.2, 76.4, 'Active'),
(5, 'Mahendragiri', 'Tamil Nadu', 'India', 1972, 1, 500.0, 8.6, 77.2, 'Testing'),
(6, 'ISRO Propulsion Complex', 'Tamil Nadu', 'India', 2005, 1, 700.0, 8.5, 77.0, 'Active'),
(7, 'Ahmedabad Site', 'Gujarat', 'India', 1970, 1, 400.0, 23.0, 72.5, 'Research'),
(8, 'Bangalore Research Centre', 'Karnataka', 'India', 1969, 0, 1200.0, 12.9, 77.6, 'Active'),
(9, 'Port Blair Station', 'Andaman', 'India', 1985, 1, 300.0, 11.7, 92.8, 'Tracking'),
(10, 'Hassan Earth Station', 'Karnataka', 'India', 1983, 1, 900.0, 13.0, 76.0, 'Operational');



-- to create table Scientists
CREATE TABLE Scientists (
ScientistID INT PRIMARY KEY,
Name VARCHAR(50),
Gender VARCHAR(10),
Age INT,
Specialization VARCHAR(50),
DepartmentID INT,
Experience_years INT,
Publications INT,
Awards INT,
Status VARCHAR(20)
);



-- to display/retrieve table
select * from Scientists;


-- to remove complete records from table
truncate table Scientists;

-- to remove complete records and attributes from table
drop table Scientists;


-- to insert values into table
INSERT INTO Scientists (ScientistID, Name, Gender, Age, Specialization, DepartmentID, Experience_years, Publications, Awards, Status) 
VALUES
(1, 'K. Sivan', 'Male', 60, 'Rocket Propulsion', 1, 38, 120, 12, 'Retired'),
(2, 'Tessy Thomas', 'Female', 60, 'Missile Tech', 2, 35, 90, 8, 'Active'),
(3, 'Ritu Karidhal', 'Female', 50, 'Mission Design', 3, 28, 60, 5, 'Active'),
(4, 'Mylswamy Annadurai', 'Male', 65, 'Satellite Systems', 4, 40, 100, 15, 'Retired'),
(5, 'S. Somanath', 'Male', 61, 'Aerospace Engg', 1, 36, 110, 9, 'Active'),
(6, 'Anuradha TK', 'Female', 58, 'Communication Sat', 5, 33, 85, 6, 'Retired'),
(7, 'Nigar Shaji', 'Female', 55, 'Solar Missions', 6, 30, 70, 3, 'Active'),
(8, 'T.K. Alex', 'Male', 67, 'Electronics', 7, 42, 95, 10, 'Retired'),
(9, 'P. Kunhikrishnan', 'Male', 60, 'Vehicle Integration', 8, 35, 88, 7, 'Active'),
(10, 'Nilesh Desai', 'Male', 58, 'Radar Systems', 9, 34, 75, 5, 'Active');



-- to create table Departments
CREATE TABLE Departments ( 
DepartmentID INT PRIMARY KEY, 
Name VARCHAR(50), 
Head VARCHAR(50), 
Total_staff INT,
Established_year INT, 
Budget_million_USD DECIMAL(10, 2), 
Focus_area VARCHAR(50), 
CentreID INT, 
Labs_count INT, 
Location VARCHAR(50)
);


-- to display/retrieve table
select * from Departments;


-- to remove complete records from table 
truncate table Departments;

-- to remove complete records and attributes from table
drop table Departments;


-- to insert values into the table
INSERT INTO Departments (DepartmentID, Name, Head, Total_staff, Established_year, Budget_million_USD, Focus_area, CentreID, Labs_count, Location)
VALUES 
(1, 'Launch Vehicle', 'S. Somanath', 300, 1985, 150.0, 'Rocket Dev', 1, 5, 'Sriharikota'),
(2, 'Missile Systems', 'Tessy Thomas', 250, 1990, 130.0, 'Defense', 2, 4, 'Thiruvananthapuram'),
(3, 'Mission Control', 'Ritu Karidhal', 220, 2000, 120.0, 'Nav & Control', 3, 3, 'Bangalore'),
(4, 'Satellites', 'M. Annadurai', 275, 1988, 140.0, 'Satellite Build', 4, 5, 'Bangalore'),
(5, 'Communication', 'Anuradha TK', 210, 1995, 110.0, 'Telecom', 5, 4, 'Hyderabad'),
(6, 'Solar Research', 'Nigar Shaji', 180, 2005, 90.0, 'Solar Missions', 6, 2, 'Tamil Nadu'),
(7, 'Electronics', 'T.K. Alex', 230, 1980, 100.0, 'Space Electronics', 7, 4, 'Ahmedabad'),
(8, 'Vehicle Assembly', 'P. Kunhikrishnan', 190, 1993, 115.0, 'Integration', 1, 3, 'Sriharikota'),
(9, 'Radar & Imaging', 'Nilesh Desai', 200, 1998, 125.0, 'Earth Obs.', 8, 3, 'Dehradun'),
(10, 'Cryogenics', 'V. Narayanan', 150, 2010, 105.0, 'Fuel Tech', 9, 2, 'Mahendragiri');


-- to create table Space_Centres
CREATE TABLE Space_Centres (
CentreID INT PRIMARY KEY,
Name VARCHAR(50),
Location VARCHAR(50),
Director VARCHAR(50),
Established_years INT,
Staff_count INT,
Facilities INT,
Budget_millions_USD DECIMAL(10, 2),
Areas_acres FLOAT,
Type VARCHAR(30)
);


-- to display/retrieve table
select * from Space_Centres;


-- to remove complete records from table
truncate table Space_Centres;

-- to remove complete records and attributes from table
drop table Space_Centres;


-- to insert values into the table
INSERT INTO Space_Centres (CentreID, Name, Location, Director, Established_years, Staff_count, Facilities, Budget_millions_USD, Areas_acres, Type) 
VALUES
(1, 'Vikram Sarabhai Space Centre', 'Thiruvananthapuram', 'S. Unnikrishnan Nair', 1963, 4000, 10, 300.0, 550.0, 'Research'),
(2, 'ISRO HQ', 'Bangalore', 'S. Somanath', 1969, 2000, 5, 250.0, 100.0, 'Admin'),
(3, 'URSC', 'Bangalore', 'M. Sankaran', 1982, 3500, 8, 275.0, 450.0, 'Satellite Dev'),
(4, 'SHAR', 'Sriharikota', 'A. Rajarajan', 1971, 5000, 12, 320.0, 14500.0, 'Launch Site'),
(5, 'SAC', 'Ahmedabad', 'Nilesh Desai', 1972, 2800, 7, 180.0, 200.0, 'Electronics'),
(6, 'IPRC', 'Mahendragiri', 'V. Narayanan', 2005, 1800, 4, 160.0, 300.0, 'Propulsion'),
(7, 'NRSC', 'Hyderabad', 'P.V. Subba Rao', 1995, 2200, 6, 190.0, 500.0, 'Remote Sensing'),
(8, 'ISTRAC', 'Bangalore', 'S. Sam Dayala', 1975, 2500, 7, 200.0, 600.0, 'Tracking'),
(9, 'LEOS', 'Bangalore', 'M. Ramesh', 1990, 1600, 3, 140.0, 250.0, 'Sensors'),
(10, 'Space Applications Centre', 'Ahmedabad', 'Tapan Misra', 1984, 3000, 6, 210.0, 700.0, 'Applications');



-- to create table Collaborations
CREATE TABLE Collaborations (
CollaborationID INT PRIMARY KEY, 
Partner_name VARCHAR(50), 
Country VARCHAR(30), 
Mission_name VARCHAR(50), 
Type VARCHAR(30), 
Start_year INT, 
End_year INT, 
Budget_million_USD DECIMAL(10, 2), 
Status VARCHAR(20), 
Notes TEXT
);


-- to display/retrieve table
select * from Collaborations;


-- to remove complete records from table
truncate table Collaborations;

-- to remove complete records and attributes from table
drop table Collaborations;


-- to insert values into the table
INSERT INTO Collaborations (CollaborationID, Partner_name, Country, Mission_name, Type, Start_year, End_year, Budget_million_USD, Status, Notes)
VALUES
(1, 'NASA', 'USA', 'Chandrayaan-1', 'Science', 2008, 2010, 15.0, 'Completed', 'Moon Mineral Mapping'),
(2, 'ESA', 'EU', 'Chandrayaan-1', 'Payload', 2008, 2010, 12.0, 'Completed', 'Spectrometer Support'),
(3, 'Roscosmos', 'Russia', 'Chandrayaan-2', 'Lander', 2009, 2011, 20.0, 'Cancelled', 'Lander not delivered'),
(4, 'NASA', 'USA', 'NISAR', 'Earth Obs', 2015, 2025, 50.0, 'Ongoing', 'SAR Imaging'),
(5, 'JAXA', 'Japan', 'LUPEX', 'Lunar', 2019, 2025, 40.0, 'Planning', 'Moon Rover Joint'),
(6, 'CNES', 'France', 'Trishna', 'Climate', 2018, 2025, 30.0, 'Ongoing', 'Thermal Mapping'),
(7, 'SpaceX', 'USA', 'SmallSats', 'Launch', 2020, 2024, 10.0, 'Active', 'Low-cost Access'),
(8, 'Israel Space Agency', 'Israel', 'AgriSat', 'Agriculture', 2016, 2021, 5.0, 'Completed', 'Crop Study'),
(9, 'UAE Space Agency', 'UAE', 'WeatherSat', 'Climate', 2021, 2025, 8.0, 'Ongoing', 'Weather Prediction'),
(10, 'DRDO', 'India', 'DefenseSat', 'Defense', 2020, 2025, 25.0, 'Ongoing', 'Border Surveillance');


-- to create table Research_Projects
CREATE TABLE Research_Projects (
ProjectID INT PRIMARY KEY,
Name VARCHAR(50),
Field VARCHAR(30),
Lead_Scientist VARCHAR(50),
DepartmentID INT, 
Budget_million_USD DECIMAL(10, 2),
Duration_years INT,
Start_year INT,
Status VARCHAR(20),
Outcome TEXT
);


-- to display/retrieve table
select * from Research_Projects;


-- to remove complete records from table
truncate table Research_Projects;

-- to remove complete records and attributes from table
drop table Research_Projects;


-- to insert values into the table
INSERT INTO Research_Projects (ProjectID, Name, Field, Lead_scientist, DepartmentID, Budget_million_USD, Duration_years, Start_year, Status, Outcome) 
VALUES
(1, 'Cryogenic Engine Dev', 'Propulsion', 'S. Somanath', 1, 100.0, 5, 2015, 'Completed', 'CE-20 engine operational'),
(2, 'NavIC', 'Navigation', 'K. Sivan', 3, 90.0, 6, 2013, 'Completed', 'Regional GPS system'),
(3, 'Reusable Launch Vehicle', 'Aerospace', 'Ritu Karidhal', 1, 120.0, 8, 2016, 'Ongoing', 'Winged vehicle tested'),
(4, 'Solar Observatory', 'Solar', 'Nigar Shaji', 6, 50.0, 5, 2019, 'Ongoing', 'Aditya-L1 mission'),
(5, 'Agri Mapping', 'Earth Obs.', 'Anuradha TK', 5, 40.0, 4, 2017, 'Completed', 'Crop monitoring system'),
(6, 'Deep Space Network', 'Comms', 'T.K. Alex', 7, 60.0, 7, 2012, 'Completed', 'Tracking Moon & Mars'),
(7, 'Hypersonic Tech Demo', 'Defense', 'Tessy Thomas', 2, 80.0, 6, 2020, 'Ongoing', 'Mach 6 flights'),
(8, 'Data Relay Satellite', 'Comm.', 'M. Annadurai', 5, 45.0, 4, 2021, 'Planned', 'Real-time data relay'),
(9, 'Lunar Soil Study', 'Planetary', 'Ritu Karidhal', 4, 30.0, 3, 2022, 'Ongoing', 'Lunar regolith samples'),
(10, 'Space Robotics', 'Automation', 'P. Kunhikrishnan', 8, 55.0, 5, 2018, 'Completed', 'Robotic arm prototype');



-- to create table Inventory
CREATE TABLE Inventory (
ItemID INT PRIMARY KEY,
Item_name VARCHAR(50),
Category VARCHAR(30),
Quantity INT,
Unit_cost DECIMAL(10, 2),
DepartmentID INT,
Supplier VARCHAR(50),
Purchase_year INT,
Status VARCHAR(20),
Location VARCHAR(50)
);


-- to display/retrieve table
select * from Inventory;

-- to remove complete records from table 
truncate table Inventory;

-- to remove complete records and attributes from table
drop table Inventory;


-- to insert values into the table
INSERT INTO Inventory 
VALUES
(1, 'CE-20 Engine', 'Propulsion', 4, 3.5, 1, 'BHEL', 2021, 'Available', 'IPRC'),
(2, 'Solar Panels', 'Power', 20, 0.5, 4, 'BEL', 2020, 'Available', 'URSC'),
(3, 'Tracking Antennas', 'Comms', 5, 1.2, 7, 'ECIL', 2018, 'Operational', 'ISTRAC'),
(4, 'Liquid Fuel Tanks', 'Propulsion', 8, 0.8, 1, 'HAL', 2022, 'Available', 'VSSC'),
(5, 'Microprocessors', 'Electronics', 50, 0.02, 7, 'Intel India', 2019, 'Stocked', 'SAC'),
(6, 'Cryogenic Fuel', 'Fuel', 10, 1.5, 9, 'IOCL', 2023, 'Stocked', 'Mahendragiri'),
(7, 'Thermal Blankets', 'Thermal', 15, 0.1, 4, 'ISAC', 2020, 'Available', 'URSC'),
(8, 'Star Trackers', 'Sensors', 10, 0.3, 5, 'ISRO', 2021, 'Operational', 'URSC'),
(9, 'Rocket Nozzles', 'Hardware', 6, 2.0, 1, 'L&T', 2023, 'Available', 'VSSC'),
(10, 'Lithium Batteries', 'Power', 30, 0.4, 7, 'Amara Raja', 2022, 'Available', 'SAC');



