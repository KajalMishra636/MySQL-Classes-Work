-- single line comments

/*
multiline 
comments
*/

-- ------------------------------database queries----------------------------------------------------------------------------------------
-- to create a database StockMarket
CREATE DATABASE StockMarket;

-- to work on it, we need to use it first
use StockMarket;

-- to delete a database
drop database StockMarket;

-- --------------------------------database analysis-------------------------------------------------------------------------------------
/*
T1:Companies (company_id, company_name, ticket_symbol, sector, industry, ceo, headquaters, founded_year, markte_cap, exchange) 

*/

/*
T2:Stock_Prices (price_id, company_id, trade_date, open_price, high_price,low_price, close_price, volume, adjusted_close, exchange) 

*/

/*
T3:Investors (investor_id, first_name, last_name, gender, dob, email, phone, address, city, country)

*/

/*
T4:Trades (trade_id, investor_id, company_id, trade_date, trade_type, quantity, price, broker_id, exchange, trade_status)

*/

/*
T5:Brokers (broker_id, broker_name, firm_name, license_number, phone, email, city, country, rating, active_status)

*/

/*
T6:Portfolios (portfolio_id, investor_id, portfolio_name, total_value, risk_level, creation_date, last_updated, status, investment_strategy, broker_id)

*/

/*
T7:Exchanges (exchange_id, exchange_name, country, city, established_year, currency, timezone, num_listed_comapnies, website, status)

*/

/*
T8:Mutual_Funds (fund_id, fund_name, fund_type, nav, inception_date, fund_manager, risk_level, totaL_assets, benchmark, status)

*/

/*
T9:Dividends (dividend_id, company_id, dividend_type, amount_per_share, declaration_date, record_date, payment_date, financial_year, dividend_yield, status) 

*/

/*
T10:Market_Indices (index_id, index_name, exchange, current_value, open_value, close_value, high_value, low_value, change_percent, date)

*/
-- -----------------------------------Table Queries-------------------------------------------------------------------------------------
-- to create table Companies
CREATE TABLE Companies (
company_id INT PRIMARY KEY,
company_name VARCHAR(100),
ticket_symbol VARCHAR(10),
sector VARCHAR(50),
industry VARCHAR(50),
ceo VARCHAR(100),
headquaters VARCHAR(100),
founded_year INT,
market_cap DECIMAL(15, 2),
exchange VARCHAR(50)
);


-- to display/retriev table
SELECT * FROM Companies;


-- to remove complete records from table 
truncate table Companies;

-- to remove complete records and attributes from table
drop table Companies;


-- to insert values into the table
INSERT INTO Companies (company_id, company_name, ticket_symbol, sector, industry, ceo, headquaters, founded_year, markte_cap, exchange) 
VALUES
(1, 'Reliance Industries', 'RELI', 'Energy', 'Oil & Gas', 'Mukesh Ambani', 'Mumbai, India', 1960, 200000000000.00, 'NSE'),
(2, 'Tata Consultancy Services', 'TCS', 'Technology', 'IT Services', 'K. Krithivasan', 'Mumbai, India', 1968, 150000000000.00, 'NSE'),
(3, 'Infosys', 'INFY', 'Technology', 'IT Services', 'Salil Parekh', 'Bangalore, India', 1981, 80000000000.00, 'NSE'),
(4, 'HDFC Bank', 'HDFC', 'Financials', 'Banking', 'Sashidhar Jagdishan', 'Mumbai, India', 1994, 110000000000.00, 'BSE'),
(5, 'ICICI Bank', 'ICIC', 'Financials', 'Banking', 'Sandeep Bakhshi', 'Mumbai, India', 1994, 95000000000.00, 'BSE'),
(6, 'Bharti Airtel', 'BART', 'Telecom', 'Wireless', 'Gopal Vittal', 'New Delhi, India', 1995, 70000000000.00, 'NSE'),
(7, 'Adani Enterprises', 'ADEN', 'Conglomerate', 'Infrastructure', 'Gautam Adani', 'Ahmedabad, India', 1988, 60000000000.00, 'BSE'),
(8, 'Wipro', 'WPRO', 'Technology', 'IT Services', 'Thierry Delaporte', 'Bangalore, India', 1945, 35000000000.00, 'NSE'),
(9, 'Maruti Suzuki', 'MRTI', 'Consumer', 'Automobile', 'Hisashi Takeuchi', 'Gurgaon, India', 1981, 50000000000.00, 'NSE'),
(10, 'Hindustan Unilever', 'HUL', 'Consumer', 'FMCG', 'Rohit Jawa', 'Mumbai, India', 1933, 65000000000.00, 'BSE');


-- to create table stock_prices
CREATE TABLE Stock_prices (
price_id INT PRIMARY KEY,
company_id INT,
trade_date DATE,
open_price DECIMAL(10,2),
high_price DECIMAL(10,2),
low_price DECIMAL(10,2),
close_price DECIMAL(10,2),
volume BIGINT,
adjusted_close DECIMAL(10,2),
exchange VARCHAR(20),
FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);


-- to display/retrieve table
SELECT * FROM Stock_prices;


-- to remove complete records from table 
truncate table stock_prices;

-- to remove complete records and attributes from table
drop table stock_prices;


-- to insert values into the table
INSERT INTO Stock_Prices (price_id, company_id, trade_date, open_price, high_price,low_price, close_price, volume, adjusted_close, exchange) 
VALUES
(1, 1, '2025-07-01', 2700.50, 2750.00, 2680.00, 2725.00, 1500000, 2725.00, 'NSE'),
(2, 2, '2025-07-01', 3600.00, 3625.00, 3550.00, 3590.00, 1200000, 3590.00, 'NSE'),
(3, 3, '2025-07-01', 1600.00, 1650.00, 1590.00, 1610.00, 1000000, 1610.00, 'NSE'),
(4, 4, '2025-07-01', 1700.00, 1725.00, 1680.00, 1715.00, 800000, 1715.00, 'BSE'),
(5, 5, '2025-07-01', 950.00, 975.00, 940.00, 960.00, 750000, 960.00, 'BSE'),
(6, 6, '2025-07-01', 800.00, 820.00, 790.00, 805.00, 500000, 805.00, 'NSE'),
(7, 7, '2025-07-01', 2400.00, 2450.00, 2380.00, 2415.00, 400000, 2415.00, 'BSE'),
(8, 8, '2025-07-01', 720.00, 735.00, 710.00, 725.00, 620000, 725.00, 'NSE'),
(9, 9, '2025-07-01', 9500.00, 9600.00, 9400.00, 9550.00, 300000, 9550.00, 'NSE'),
(10, 10, '2025-07-01', 2500.00, 2550.00, 2480.00, 2510.00, 700000, 2510.00, 'BSE');



-- to create table Investors
CREATE TABLE Investors (
investor_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender VARCHAR(10),
dob DATE,
email VARCHAR(100),
phone VARCHAR(15),
address VARCHAR(150),
city VARCHAR(50),
country VARCHAR(50)
);


-- to display/retrieve table
SELECT * FROM Investors; 

-- to remove complete records from table
truncate table Investors;

-- to remove complete records and attributes from table
drop table Investors;


-- to insert values into the table
INSERT INTO Investors (investor_id, first_name, last_name, gender, dob, email, phone, address, city, country)
VALUES
(1, 'Amit', 'Sharma', 'Male', '1985-04-12', 'amit.sharma@email.com', '9876543210', '123 Market Road', 'Mumbai', 'India'),
(2, 'Priya', 'Verma', 'Female', '1990-07-25', 'priya.verma@email.com', '9123456780', '45 Lotus Street', 'Delhi', 'India'),
(3, 'Rohan', 'Mehta', 'Male', '1988-11-30', 'rohan.mehta@email.com', '9988776655', '89 Green Avenue', 'Bangalore', 'India'),
(4, 'Sneha', 'Patel', 'Female', '1992-03-05', 'sneha.patel@email.com', '9090909090', '76 Rose Lane', 'Ahmedabad', 'India'),
(5, 'Vikram', 'Singh', 'Male', '1979-09-18', 'vikram.singh@email.com', '9871234567', '34 King Circle', 'Chennai', 'India'),
(6, 'Neha', 'Gupta', 'Female', '1993-06-14', 'neha.gupta@email.com', '9988001122', '67 Palm Street', 'Hyderabad', 'India'),
(7, 'Karan', 'Kapoor', 'Male', '1987-12-20', 'karan.kapoor@email.com', '9001234567', '12 Cedar Lane', 'Pune', 'India'),
(8, 'Anjali', 'Reddy', 'Female', '1995-01-10', 'anjali.reddy@email.com', '9012345678', '23 Jasmine Road', 'Kolkata', 'India'),
(9, 'Suresh', 'Nair', 'Male', '1984-08-29', 'suresh.nair@email.com', '9898989898', '45 Hill Top', 'Trivandrum', 'India'),
(10, 'Meena', 'Joshi', 'Female', '1991-10-05', 'meena.joshi@email.com', '9112233445', '89 Coral Street', 'Jaipur', 'India');



-- to create table Trades
CREATE TABLE Trades(
trade_id INT PRIMARY KEY,
investor_id INT,
company_id INT,
trade_date DATE,
trade_type VARCHAR(10),
quantity INT,
price DECIMAL(10, 2),
broker_id INT,
exchange VARCHAR(20),
trade_status VARCHAR(20),
FOREIGN KEY (investor_id) REFERENCES Investors(investor_id),
FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);


-- to display/retrieve table
SELECT * FROM Trades;


-- to remove complete records from table
truncate table Trades;

-- to remove complete records and attributes from table
drop table Trades;

 
-- to insert values into the table
INSERT INTO Trades (trade_id, investor_id, company_id, trade_date, trade_type, quantity, price, broker_id, exchange, trade_status)
VALUES
(1, 1, 1, '2025-07-01', 'BUY', 10, 2700.50, 101, 'NSE', 'Completed'),
(2, 2, 3, '2025-07-01', 'SELL', 5, 1600.00, 102, 'NSE', 'Completed'),
(3, 3, 5, '2025-07-01', 'BUY', 15, 950.00, 101, 'BSE', 'Completed'),
(4, 4, 2, '2025-07-01', 'BUY', 20, 3600.00, 103, 'NSE', 'Pending'),
(5, 5, 6, '2025-07-01', 'SELL', 10, 800.00, 104, 'NSE', 'Completed'),
(6, 6, 8, '2025-07-01', 'BUY', 12, 720.00, 105, 'BSE', 'Completed'),
(7, 7, 9, '2025-07-01', 'SELL', 7, 9500.00, 102, 'NSE', 'Completed'),
(8, 8, 10, '2025-07-01', 'BUY', 6, 2500.00, 103, 'BSE', 'Pending'),
(9, 9, 4, '2025-07-01', 'BUY', 8, 1700.00, 101, 'NSE', 'Completed'),
(10, 10, 7, '2025-07-01', 'SELL', 9, 2400.00, 104, 'BSE', 'Completed');

  
 -- to create table Brokers
CREATE TABLE Brokers (
broker_id INT PRIMARY KEY,
broker_name VARCHAR(100),
firm_name VARCHAR(100),
license_number VARCHAR(50),
phone VARCHAR(15),
email VARCHAR(100),
city VARCHAR(50),
country VARCHAR(50),
rating DECIMAL(3, 2),
active_status VARCHAR(10)
);


-- to display/retrieve table
SELECT * FROM Brokers;


-- to remove complete records from table
truncate table Brokers;

-- to remove complete records and attributes from table
drop table Brokers;

 
-- to insert values into the table
INSERT INTO Brokers (broker_id, broker_name, firm_name, license_number, phone, email, city, country, rating, active_status)
VALUES
(101, 'Rahul Mehra', 'InvestWise Ltd.', 'LIC12345', '9876543210', 'rahul@investwise.com', 'Mumbai', 'India', 4.8, 'Active'),
(102, 'Kavita Sharma', 'TradeMax Corp.', 'LIC67890', '9123456780', 'kavita@trademax.com', 'Delhi', 'India', 4.6, 'Active'),
(103, 'Siddharth Jain', 'BrokerHub Pvt.', 'LIC54321', '9988776655', 'sid@brokerhub.com', 'Bangalore', 'India', 4.4, 'Active'),
(104, 'Anita Reddy', 'WealthBridge', 'LIC87654', '9090909090', 'anita@wealthbridge.com', 'Hyderabad', 'India', 4.7, 'Active'),
(105, 'Ravi Desai', 'SecureInvest', 'LIC34567', '9871234567', 'ravi@secureinvest.com', 'Ahmedabad', 'India', 4.3, 'Active'),
(106, 'Meena Kapoor', 'FinTrade Pro', 'LIC45678', '9988001122', 'meena@fintradepro.com', 'Chennai', 'India', 4.5, 'Inactive'),
(107, 'Alok Singh', 'SmartTrade', 'LIC11223', '9001234567', 'alok@smarttrade.com', 'Pune', 'India', 4.2, 'Active'),
(108, 'Pooja Nair', 'EquityOne', 'LIC33445', '9012345678', 'pooja@equityone.com', 'Kolkata', 'India', 4.6, 'Active'),
(109, 'Manish Verma', 'WealthyHands', 'LIC99887', '9898989898', 'manish@wealthyhands.com', 'Jaipur', 'India', 4.1, 'Active'),
(110, 'Sunita Rao', 'TradePros', 'LIC77889', '9112233445', 'sunita@tradepros.com', 'Lucknow', 'India', 4.0, 'Inactive');

 
 -- to create table Portfolios 
CREATE TABLE Portfolios (
portfolio_id INT PRIMARY KEY,
investor_id INT,
portfolio_name VARCHAR(100),
total_value DECIMAL(15, 2),
risk_level VARCHAR(20),
creation_date DATE,
last_updated DATE,
status VARCHAR(20),
investment_strategy VARCHAR(100),
broker_id INT,
FOREIGN KEY (investor_id) REFERENCES Investors(investor_id),
FOREIGN KEY (broker_id) REFERENCES Brokers(broker_id)
);


-- to display/retrieve table
SELECT * FROM Portfolios;


-- to remove complete records from table
truncate table Portfolios;

-- to remove complete records and attributes from table
drop table Portfolios;

 
-- to insert values into the table
INSERT INTO Portfolios (portfolio_id, investor_id, portfolio_name, total_value, risk_level, creation_date, last_updated, status, investment_strategy, broker_id)
VALUES
(1, 1, 'Growth Portfolio', 2500000.00, 'High', '2023-01-15', '2025-07-01', 'Active', 'Aggressive Equity', 101),
(2, 2, 'Retirement Fund', 1500000.00, 'Medium', '2022-03-10', '2025-07-01', 'Active', 'Balanced', 102),
(3, 3, 'Wealth Accumulator', 3200000.00, 'High', '2021-07-20', '2025-07-01', 'Active', 'Growth Stocks', 103),
(4, 4, 'Safe Bet', 900000.00, 'Low', '2020-11-05', '2025-07-01', 'Archived', 'Dividend Income', 104),
(5, 5, 'Startup Picks', 1300000.00, 'High', '2022-06-18', '2025-07-01', 'Active', 'Emerging Markets', 105),
(6, 6, 'Diversified Plan', 2100000.00, 'Medium', '2021-01-25', '2025-07-01', 'Active', 'Index + Bonds', 106),
(7, 7, 'Real Estate + Equity', 2700000.00, 'Medium', '2020-12-14', '2025-07-01', 'Archived', 'REIT & Stocks', 107),
(8, 8, 'Blue Chip Bundle', 1950000.00, 'Low', '2023-04-01', '2025-07-01', 'Active', 'Blue Chip Stocks', 108),
(9, 9, 'Balanced Returns', 1850000.00, 'Medium', '2022-02-09', '2025-07-01', 'Active', 'Mutual + Equity', 109),
(10, 10, 'Speculative Shots', 850000.00, 'High', '2021-09-30', '2025-07-01', 'Active', 'Options & Crypto', 110);


 -- to create table Exchanges
CREATE TABLE Exchanges (
exchange_id INT PRIMARY KEY,
exchange_name VARCHAR(100),
country VARCHAR(50),
city VARCHAR(50),
established_year INT,
currency VARCHAR(20),
timezone VARCHAR(50),
num_listed_comapnies INT,
website VARCHAR(100),
status VARCHAR(20)
);

-- to display/retrieve table
SELECT * FROM Exchanges;


-- to remove complete records from table
truncate table Exchanges;

-- to remove complete records and attributes from table
drop table Exchanges;

 
-- to insert values into the table
 INSERT INTO Exchanges (exchange_id, exchange_name, country, city, established_year, currency, timezone, num_listed_comapnies, website, status)
VALUES
(1, 'Bombay Stock Exchange', 'India', 'Mumbai', 1875, 'INR', 'Asia/Kolkata', 5000, 'https://www.bseindia.com', 'Active'),
(2, 'National Stock Exchange', 'India', 'Mumbai', 1992, 'INR', 'Asia/Kolkata', 1800, 'https://www.nseindia.com', 'Active'),
(3, 'New York Stock Exchange', 'USA', 'New York', 1792, 'USD', 'America/New_York', 2400, 'https://www.nyse.com', 'Active'),
(4, 'NASDAQ', 'USA', 'New York', 1971, 'USD', 'America/New_York', 3300, 'https://www.nasdaq.com', 'Active'),
(5, 'London Stock Exchange', 'UK', 'London', 1801, 'GBP', 'Europe/London', 1300, 'https://www.londonstockexchange.com', 'Active'),
(6, 'Tokyo Stock Exchange', 'Japan', 'Tokyo', 1878, 'JPY', 'Asia/Tokyo', 3700, 'https://www.jpx.co.jp', 'Active'),
(7, 'Shanghai Stock Exchange', 'China', 'Shanghai', 1990, 'CNY', 'Asia/Shanghai', 1500, 'http://english.sse.com.cn', 'Active'),
(8, 'Hong Kong Stock Exchange', 'Hong Kong', 'Hong Kong', 1891, 'HKD', 'Asia/Hong_Kong', 2200, 'https://www.hkex.com.hk', 'Active'),
(9, 'Toronto Stock Exchange', 'Canada', 'Toronto', 1861, 'CAD', 'America/Toronto', 1500, 'https://www.tsx.com', 'Active'),
(10, 'Euronext', 'Netherlands', 'Amsterdam', 2000, 'EUR', 'Europe/Amsterdam', 1500, 'https://www.euronext.com', 'Active');

 
 -- to create table Mutual_Funds
CREATE TABLE Mutual_Funds (
fund_id INT PRIMARY KEY,
fund_name VARCHAR(100),
fund_type VARCHAR(50),
nav DECIMAL(10, 2),
inception_date DATE,
fund_manager VARCHAR(100),
risk_level VARCHAR(20),
totaL_assets DECIMAL(15, 2),
benchmark VARCHAR(100),
status VARCHAR(20)
);


-- to display/retrieve table
SELECT * FROM Mutual_Funds;


-- to remove complete records from table
truncate table Mutual_Funds;

-- to remove complete records and attributes from table
drop table Mutual_Funds;

 
-- to insert values into the table
INSERT INTO Mutual_Funds (fund_id, fund_name, fund_type, nav, inception_date, fund_manager, risk_level, totaL_assets, benchmark, status)
VALUES
(1, 'HDFC Equity Fund', 'Equity', 725.50, '2000-06-01', 'Amit Jain', 'High', 1000000000.00, 'Nifty 50', 'Active'),
(2, 'ICICI Prudential Bluechip Fund', 'Equity', 412.20, '2003-04-15', 'Neha Sharma', 'Medium', 750000000.00, 'Sensex', 'Active'),
(3, 'SBI Magnum Debt Fund', 'Debt', 215.30, '2005-08-10', 'Ravi Desai', 'Low', 520000000.00, 'CRISIL Short-Term Bond Index', 'Active'),
(4, 'Axis Balanced Advantage Fund', 'Hybrid', 330.80, '2010-01-01', 'Pooja Mehta', 'Medium', 640000000.00, 'Nifty 50 Hybrid', 'Active'),
(5, 'Nippon India Small Cap Fund', 'Equity', 299.95, '2013-07-20', 'Rahul Sinha', 'High', 450000000.00, 'Nifty Smallcap 250', 'Active'),
(6, 'Franklin India Liquid Fund', 'Debt', 102.10, '2008-05-30', 'Meera Iyer', 'Low', 310000000.00, 'CRISIL Liquid Fund Index', 'Active'),
(7, 'Kotak Flexicap Fund', 'Equity', 395.25, '2012-03-12', 'Vinay Rao', 'Medium', 580000000.00, 'Nifty 500', 'Active'),
(8, 'L&T Hybrid Equity Fund', 'Hybrid', 275.65, '2009-09-15', 'Arjun Khanna', 'Medium', 400000000.00, 'CRISIL Balanced Fund Index', 'Closed'),
(9, 'UTI Value Fund', 'Equity', 445.75, '2007-11-01', 'Simran Kaur', 'High', 670000000.00, 'S&P BSE 200', 'Active'),
(10, 'Tata Corporate Bond Fund', 'Debt', 185.90, '2011-02-18', 'Kunal Bhatia', 'Low', 270000000.00, 'CRISIL Corporate Bond Index', 'Active');
 
 
-- to create table Dividends
CREATE TABLE Dividends (
dividend_id INT PRIMARY KEY,
company_id INT,
dividend_type VARCHAR(50),
amount_per_share DECIMAL(10, 2),
declaration_date DATE,
record_date DATE,
payment_date DATE,
financial_year VARCHAR(10),
dividend_yield DECIMAL(5, 2),
status VARCHAR(20),
FOREIGN KEY (company_id) REFERENCES Companies (company_id)
);


-- to display/retrieve table
SELECT * FROM Dividends;


-- to remove complete records from table
truncate table Dividends;

-- to remove complete records and attributes from table
drop table Dividends;

 
-- to insert values into the table
INSERT INTO Dividends (dividend_id, company_id, dividend_type, amount_per_share, declaration_date, record_date, payment_date, financial_year, dividend_yield, status) 
VALUES
(1, 1, 'Final', 5.00, '2024-03-31', '2024-04-10', '2024-04-25', '2023-24', 2.50, 'Paid'),
(2, 2, 'Interim', 3.00, '2024-01-15', '2024-01-25', '2024-02-10', '2023-24', 1.80, 'Paid'),
(3, 3, 'Final', 4.50, '2024-03-20', '2024-04-01', '2024-04-15', '2023-24', 2.20, 'Paid'),
(4, 4, 'Interim', 2.75, '2023-12-10', '2023-12-20', '2024-01-05', '2023-24', 1.50, 'Paid'),
(5, 5, 'Final', 6.00, '2024-04-05', '2024-04-15', '2024-05-01', '2023-24', 2.90, 'Pending'),
(6, 6, 'Interim', 3.50, '2024-02-01', '2024-02-10', '2024-02-25', '2023-24', 1.70, 'Paid'),
(7, 7, 'Final', 5.25, '2024-03-25', '2024-04-05', '2024-04-20', '2023-24', 2.40, 'Paid'),
(8, 8, 'Interim', 4.00, '2023-11-30', '2023-12-10', '2023-12-25', '2023-24', 2.10, 'Paid'),
(9, 9, 'Final', 6.50, '2024-04-10', '2024-04-20', '2024-05-05', '2023-24', 3.00, 'Pending'),
(10, 10, 'Interim', 3.25, '2024-01-20', '2024-01-30', '2024-02-15', '2023-24', 1.60, 'Paid');
 
 
 -- to create table Market_Indices
CREATE TABLE Market_Indices(
index_id INT PRIMARY KEY,
index_name VARCHAR(100),
exchange VARCHAR(50),
current_value DECIMAL(10, 2),
open_value DECIMAL(10, 2),
close_value DECIMAL(10, 2),
high_value DECIMAL(10, 2),
low_value DECIMAL(10, 2),
change_percent DECIMAL(5, 2),
date DATE
);


-- to display/retrieve table
SELECT * FROM Market_Indices;


-- to remove complete records from table
truncate table Market_Indices;

-- to remove complete records and attributes from table
drop table Market_Indices;

 
-- to insert values into the table
INSERT INTO Market_Indices (index_id, index_name, exchange, current_value, open_value, close_value, high_value, low_value, change_percent, date)
VALUES
(1, 'Nifty 50', 'NSE', 19785.25, 19650.50, 19700.75, 19850.00, 19590.00, 0.43, '2025-07-16'),
(2, 'Sensex', 'BSE', 66650.30, 66300.00, 66400.45, 66800.00, 66150.00, 0.38, '2025-07-16'),
(3, 'Nifty Bank', 'NSE', 44200.55, 44000.00, 44150.75, 44350.00, 43900.00, 0.57, '2025-07-16'),
(4, 'Nifty IT', 'NSE', 33250.90, 33000.00, 33100.30, 33400.00, 32850.00, 0.45, '2025-07-16'),
(5, 'BSE MidCap', 'BSE', 30450.40, 30200.00, 30300.75, 30550.00, 30100.00, 0.50, '2025-07-16'),
(6, 'BSE SmallCap', 'BSE', 17650.10, 17400.00, 17500.65, 17700.00, 17350.00, 0.86, '2025-07-16'),
(7, 'Nifty FMCG', 'NSE', 42050.75, 41800.00, 41900.30, 42100.00, 41700.00, 0.36, '2025-07-16'),
(8, 'BSE Healthcare', 'BSE', 25400.20, 25200.00, 25300.80, 25500.00, 25100.00, 0.52, '2025-07-16'),
(9, 'Nifty Auto', 'NSE', 16900.35, 16750.00, 16850.00, 17000.00, 16650.00, 0.63, '2025-07-16'),
(10, 'BSE PSU', 'BSE', 11200.90, 11050.00, 11100.75, 11300.00, 10950.00, 0.74, '2025-07-16');
 
