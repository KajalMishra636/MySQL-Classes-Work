-- single line comments

/*
multiline
comments
*/

-- ------------------------------------------------------------Database Queries--------------------------------------------------------------
-- to create a database CryptoCurrency
create database CryptoCurrency;

-- to work on it, we need to use it first
use CryptoCurrency;

-- to delete a database 
drop database CryptoCurrency;


-- -------------------------------------------------------Database Analysis----------------------------------------------------------------
/*
T1: Users (UserID, Username, Email, Password, Country, Phone, Created_at, kyc_verified, WalletID, Account_status)

*/

/*
T2: Wallets (wallet_id, user_id, balance_usd, balance_btc, balance_eth, created_at, wallet_type, is_active, last_txn_date, network)

*/

/*
T3: Transactions (txn_id, wallet_id, user_id, crypto_type, amount, txn_type, status, date, fee, txn_hash)


*/

/*
T4: Coins (coin_id, coin_name, symbol, price_usd, market_cap_usd, supply, volume_24h, ranks, launched_on, active)

*/

/*
T5: Exchanges (exchange_id, name, country, launch_year, users_count, volume_24h_usd, listed_coins, website, kyc_required, status)

*/

/*
T6: Orders (order_id, user_id, coin_id, exchange_id, order_type, price, quantity, status, order_date, filled_percentage)

*/

/*
T7: MarketData (data_id, coin_id, date, open_price, close_price, high_price, low_price, volume, market_cap, change_percent)

*/

/*
T8: Staking (stake_id, user_id, coin_id, amount, start_date, end_date, interest_rate, reward, status, auto_renew) 

*/

/*
T9: NFTs (nft_id, name, owner_id, mint_date, price_usd, collection, file_type, blockchain, rarity, listed)

*/

/*
T10: Minings (mining_id, user_id, coin_id, hash_rate, power_usage, mined_amount, hardware, location, status, started_on)

*/

-- ----------------------------------------------Table Queries------------------------
-- to create a table Users
CREATE table Users (
UserID INT PRIMARY KEY,
Username VARCHAR(50),
Email VARCHAR(100),
Password VARCHAR(100),
Country VARCHAR(50),
Phone VARCHAR(15),
Created_at DATE,
kyc_verified BOOLEAN,
Wallet_ID INT,
Account_status VARCHAR(20)
);


-- to display/retrieve table
SELECT * FROM Users; 

-- to remove complete records from table
truncate table Users;

-- to remove complete records and attributes from table 
drop table Users;

-- to insert values into the table
INSERT INTO Users (UserID, Username, Email, Password, Country, Phone, Created_at, kyc_verified, Wallet_ID, Account_status)
VALUES
(1, 'crypto_king', 'ck@gmail.com', 'pass123', 'USA', '1234567890', '2022-01-01', TRUE, 101, 'Active'),
(2, 'satoshi01', 'sat@gmail.com', 'bitpass', 'Japan', '9876543210', '2022-02-15', TRUE, 102, 'Active'),
(3, 'luna_moon', 'luna@gmail.com', 'moonpass', 'UK', '7771234567', '2022-03-01', FALSE, 103, 'Suspended'),
(4, 'alice.eth', 'alice@gmail.com', 'eth123', 'India', '9988776655', '2023-04-10', TRUE, 104, 'Active'),
(5, 'bob_chain', 'bob@gmail.com', 'bchain', 'Germany', '8877665544', '2023-06-21', FALSE, 105, 'Inactive'),
(6, 'neo_matrix', 'neo@gmail.com', 'matrix', 'USA', '1233211234', '2023-07-01', TRUE, 106, 'Active'),
(7, 'ripple_ray', 'ray@gmail.com', 'ripple123', 'Canada', '5554443333', '2023-07-15', TRUE, 107, 'Active'),
(8, 'zk_snark', 'zk@gmail.com', 'zkp123', 'France', '6667778888', '2023-08-10', FALSE, 108, 'Suspended'),
(9, 'defi_dude', 'dd@gmail.com', 'defi2023', 'Australia', '7778889999', '2023-09-20', TRUE, 109, 'Active'),
(10, 'bitqueen', 'queen@gmail.com', 'bq2023', 'Brazil', '1010101010', '2023-10-05', TRUE, 110, 'Active');


-- to create table Wallets
CREATE TABLE Wallets (
wallet_id INT PRIMARY KEY,
user_id INT,
balance_usd DECIMAL(15, 2),
balance_btc DECIMAL(10, 8),
balance_eth DECIMAL(10, 8),
created_at DATE,
wallet_type VARCHAR(10),
is_active BOOLEAN,
last_txn_date DATE,
network VARCHAR(50)
);

-- to display/retrieve table
SELECT * FROM Wallets;

-- to remove complete records from table
truncate table Wallets;

-- to remove complete records and attributes from table
drop table Wallets;

-- to insert values into the table 
INSERT INTO Wallets (wallet_id, user_id, balance_usd, balance_btc, balance_eth, created_at, wallet_type, is_active, last_txn_date, network)
VALUES
(101, 1, 50000, 1.2, 15.0, '2022-01-01', 'Hot', TRUE, '2024-06-10', 'Bitcoin'),
(102, 2, 100000, 3.1, 0.5, '2022-02-15', 'Cold', TRUE, '2024-06-01', 'Bitcoin'),
(103, 3, 300, 0.002, 1.0, '2022-03-01', 'Hot', FALSE, '2024-01-01', 'Ethereum'),
(104, 4, 2500, 0.01, 4.0, '2023-04-10', 'Hot', TRUE, '2024-05-21', 'Ethereum'),
(105, 5, 100, 0.0001, 0.5, '2023-06-21', 'Cold', FALSE, '2023-12-01', 'Ethereum'),
(106, 6, 10000, 0.5, 2.0, '2023-07-01', 'Hot', TRUE, '2024-06-30', 'Bitcoin'),
(107, 7, 20000, 0.8, 3.5, '2023-07-15', 'Cold', TRUE, '2024-06-10', 'Ripple'),
(108, 8, 50, 0.0005, 0.1, '2023-08-10', 'Hot', FALSE, '2024-01-15', 'Zcash'),
(109, 9, 8000, 0.3, 6.0, '2023-09-20', 'Hot', TRUE, '2024-06-11', 'Polygon'),
(110, 10, 60000, 2.0, 7.2, '2023-10-05', 'Cold', TRUE, '2024-06-09', 'Ethereum');


-- to create table Transactions
CREATE TABLE Transactions (
txn_id INT PRIMARY KEY,
wallet_id INT,
user_id INT,
crypto_type VARCHAR(10),
amount DECIMAL(10, 8),
txn_type VARCHAR(10),
status VARCHAR(10),
date DATE,
fee DECIMAL(10, 6),
txn_hash VARCHAR(50)
);

-- to display/retriev table 
SELECT * FROM Transactions;

-- to remove complete records from table
truncate table Transactions;

-- to remove complete records and attributes from table 
drop table Transactions;

-- to insert values into the table 
INSERT INTO Transactions (txn_id, wallet_id, user_id, crypto_type, amount, txn_type, status, date, fee, txn_hash)
VALUES
(1, 101, 1, 'BTC', 0.5, 'Buy', 'Success', '2024-06-10', 0.0001, 'TXN001'),
(2, 102, 2, 'BTC', 1.0, 'Sell', 'Success', '2024-06-01', 0.0002, 'TXN002'),
(3, 103, 3, 'ETH', 1.0, 'Buy', 'Failed', '2024-01-01', 0.005, 'TXN003'),
(4, 104, 4, 'ETH', 2.0, 'Buy', 'Success', '2024-05-21', 0.01, 'TXN004'),
(5, 105, 5, 'BTC', 0.0001, 'Sell', 'Failed', '2023-12-01', 0.00001, 'TXN005'),
(6, 106, 6, 'BTC', 0.25, 'Buy', 'Success', '2024-06-30', 0.0001, 'TXN006'),
(7, 107, 7, 'XRP', 1000, 'Buy', 'Success', '2024-06-10', 0.5, 'TXN007'),
(8, 108, 8, 'ZEC', 0.2, 'Sell', 'Failed', '2024-01-15', 0.001, 'TXN008'),
(9, 109, 9, 'MATIC', 300, 'Buy', 'Success', '2024-06-11', 0.2, 'TXN009'),
(10, 110, 10, 'ETH', 5.0, 'Buy', 'Success', '2024-06-09', 0.02, 'TXN010');


-- to create table Coins
CREATE TABLE Coins (
coin_id INT PRIMARY KEY,
coin_name VARCHAR(50),
symbol VARCHAR(10),
price_usd DECIMAL(18, 2),
market_cap_usd DECIMAL(18, 2),
supply DECIMAL(18, 2),
volume_24h DECIMAL(18, 2),
ranks INT,
launched_on DATE,
active BOOLEAN
);

-- to display/retrieve table
SELECT * FROM Coins;

-- to remove complete records from table
truncate table Coins;

-- to remove complete records and attributes from table 
drop table Coins;

-- to insert values into the table
INSERT INTO Coins (coin_id, coin_name, symbol, price_usd, market_cap_usd, supply, volume_24h, ranks, launched_on, active)
VALUES
(1, 'Bitcoin', 'BTC', 60000.00, 1000000000.00, 21000000, 50000000, 1, '2009-01-03', TRUE),
(2, 'Ethereum', 'ETH', 3000.00, 500000000.00, 120000000, 30000000, 2, '2015-07-30', TRUE),
(3, 'Tether', 'USDT', 1.00, 700000000.00, 700000000, 100000000, 3, '2014-10-06', TRUE),
(4, 'Binance Coin', 'BNB', 400.00, 80000000.00, 170000000, 20000000, 4, '2017-07-25', TRUE),
(5, 'Litecoin', 'LTC', 150.00, 20000000.00, 84000000, 10000000, 5, '2011-10-07', TRUE),
(6, 'Ripple', 'XRP', 0.80, 35000000.00, 100000000000, 15000000, 6, '2012-08-02', TRUE),
(7, 'Dogecoin', 'DOGE', 0.25, 33000000.00, 130000000000, 8000000, 7, '2013-12-06', TRUE),
(8, 'Cardano', 'ADA', 1.20, 40000000.00, 45000000000, 9000000, 8, '2017-09-29', TRUE),
(9, 'Polkadot', 'DOT', 25.00, 20000000.00, 1000000000, 5000000, 9, '2020-08-21', TRUE),
(10, 'Solana', 'SOL', 100.00, 60000000.00, 500000000, 7000000, 10, '2020-03-20', TRUE);

-- to create table Exchanges
CREATE TABLE Exchanges (
exchange_id INT PRIMARY KEY,
name VARCHAR(100),
country VARCHAR(50),
launch_year INT,
users_count INT,
volume_24h_usd DECIMAL(18, 2),
listed_coins INT,
website VARCHAR(100),
kyc_required BOOLEAN,
status VARCHAR(20)
);


-- to display/retrieve table
SELECT * FROM Exchanges;

-- to remove complete records from table
truncate table Exchanges;

-- to remove complete records and attributes from table
drop table Exchanges;

-- to insert values into the table
INSERT INTO Exchanges (exchange_id, name, country, launch_year, users_count, volume_24h_usd, listed_coins, website, kyc_required, status)
VALUES
(1, 'Binance', 'Cayman Islands', 2017, 100000000, 1000000000.00, 350, 'https://binance.com', TRUE, 'Active'),
(2, 'Coinbase', 'USA', 2012, 89000000, 750000000.00, 150, 'https://coinbase.com', TRUE, 'Active'),
(3, 'Kraken', 'USA', 2011, 6000000, 350000000.00, 90, 'https://kraken.com', TRUE, 'Active'),
(4, 'Bitfinex', 'Hong Kong', 2012, 4500000, 220000000.00, 120, 'https://bitfinex.com', TRUE, 'Active'),
(5, 'KuCoin', 'Seychelles', 2017, 10000000, 180000000.00, 300, 'https://kucoin.com', TRUE, 'Active'),
(6, 'Bitstamp', 'Luxembourg', 2011, 4000000, 100000000.00, 80, 'https://bitstamp.net', TRUE, 'Active'),
(7, 'Huobi', 'Seychelles', 2013, 9000000, 160000000.00, 250, 'https://huobi.com', TRUE, 'Active'),
(8, 'OKX', 'Malta', 2014, 8000000, 140000000.00, 200, 'https://okx.com', TRUE, 'Active'),
(9, 'Gate.io', 'Cayman Islands', 2013, 7000000, 120000000.00, 300, 'https://gate.io', TRUE, 'Active'),
(10, 'WazirX', 'India', 2018, 6000000, 50000000.00, 100, 'https://wazirx.com', TRUE, 'Active');


-- to create table Orders
CREATE TABLE Orders (
order_id INT PRIMARY KEY,
user_id INT,
coin_id INT,
exchange_id INT,
order_type VARCHAR(10),
price DECIMAL(18, 2),
quantity DECIMAL(18, 8),
status VARCHAR(20),
order_date DATE,
filled_percentage DECIMAL(5, 2),
FOREIGN KEY (user_id) REFERENCES Users(user_id),
FOREIGN KEY (coin_id) REFERENCES Coins(coins_id),
FOREIGN KEY (exchange_id) REFERENCES Exchanges(exchange_id)
);


-- to display/retrieve table
SELECT * FROM Orders;


-- to remove complete records from table
truncate table Orders;

-- to remove complete records and attributes from table
drop table Orders;


-- to insert values into the table
INSERT INTO Orders (order_id, user_id, coin_id, exchange_id, order_type, price, quantity, status, order_date, filled_percentage)
VALUES
(1, 1, 1, 1, 'Buy', 58000.00, 0.01, 'Filled', '2023-01-01', 100.00),
(2, 2, 2, 2, 'Sell', 3100.00, 0.5, 'Pending', '2023-01-02', 50.00),
(3, 3, 3, 3, 'Buy', 1.00, 200.0, 'Filled', '2023-01-03', 100.00),
(4, 4, 4, 4, 'Sell', 390.00, 0.3, 'Cancelled', '2023-01-04', 0.00),
(5, 5, 5, 5, 'Buy', 140.00, 1.0, 'Filled', '2023-01-05', 100.00),
(6, 6, 6, 6, 'Sell', 0.70, 20.0, 'Pending', '2023-01-06', 20.00),
(7, 7, 7, 7, 'Buy', 0.20, 1000.0, 'Filled', '2023-01-07', 100.00),
(8, 8, 8, 8, 'Buy', 1.10, 10.0, 'Pending', '2023-01-08', 80.00),
(9, 9, 9, 9, 'Sell', 22.00, 5.0, 'Filled', '2023-01-09', 100.00),
(10, 10, 10, 10, 'Sell', 90.00, 2.0, 'Filled', '2023-01-10', 100.00);


-- to create table MarketData
CREATE TABLE MarketData (
data_id INT PRIMARY KEY,
coin_id INT,
date DATE,
open_price DECIMAL(18, 2),
close_price DECIMAL(18, 2),
high_price DECIMAL(18, 2),
low_price DECIMAL(18, 2),
volume DECIMAL(18, 2),
market_cap DECIMAL(18, 2),
change_percent DECIMAL(5, 2),
FOREIGN KEY (coin_id) REFERENCES Coins(coin_id)
);


-- to display/retrieve table 
SELECT * FROM MarketData;

-- to remove complete records from table
truncate table MarketData;

-- to remove complete records and attributes from table
drop table MarketData;


-- to insert values into the table
INSERT INTO MarketData (data_id, coin_id, date, open_price, close_price, high_price, low_price, volume, market_cap, change_percent)
VALUES
(1, 1, '2023-01-01', 58000, 59000, 60000, 57000, 300000000.00, 1100000000.00, 1.72),
(2, 2, '2023-01-01', 2900, 3000, 3100, 2800, 250000000.00, 520000000.00, 3.45),
(3, 3, '2023-01-01', 1, 1, 1.01, 0.99, 100000000.00, 700000000.00, 0.00),
(4, 4, '2023-01-01', 390, 400, 410, 385, 180000000.00, 82000000.00, 2.56),
(5, 5, '2023-01-01', 145, 150, 155, 140, 120000000.00, 21000000.00, 3.45),
(6, 6, '2023-01-01', 0.75, 0.80, 0.85, 0.70, 80000000.00, 36000000.00, 6.67),
(7, 7, '2023-01-01', 0.23, 0.25, 0.27, 0.22, 90000000.00, 34000000.00, 8.70),
(8, 8, '2023-01-01', 1.15, 1.20, 1.25, 1.10, 70000000.00, 41000000.00, 4.35),
(9, 9, '2023-01-01', 23, 25, 26, 22, 60000000.00, 21000000.00, 8.70),
(10, 10, '2023-01-01', 95, 100, 105, 90, 65000000.00, 61000000.00, 5.26);


-- to create table Staking
CREATE TABLE Staking (
stake_id INT PRIMARY KEY,
user_id INT,
coin_id INT,
amount DECIMAL(18, 8),
start_date DATE,
end_date DATE,
interest_rate DECIMAL(5, 2),
reward DECIMAL(18, 8),
status VARCHAR(20),
auto_renew BOOLEAN,
FOREIGN KEY (user_id) REFERENCES Users(user_id),
FOREIGN KEY (coin_id) REFERENCES Coins(coin_id)
);


-- to display/retrieve table
SELECT * FROM Staking;


-- to remove complete records from table
truncate table Staking;

-- to remove complete records and attributes from table
drop table Staking;

-- to insert values into the table
INSERT INTO Staking (stake_id, user_id, coin_id, amount, start_date, end_date, interest_rate, reward, status, auto_renew)
VALUES 
(1, 1, 2, 0.5, '2023-01-01', '2023-07-01', 5.0, 0.0125, 'Active', TRUE),
(2, 2, 3, 100, '2023-01-05', '2023-07-05', 2.0, 1.00, 'Active', TRUE),
(3, 3, 4, 0.3, '2023-01-10', '2023-07-10', 4.5, 0.00675, 'Active', FALSE),
(4, 4, 5, 2.0, '2023-01-15', '2023-07-15', 3.0, 0.03, 'Completed', FALSE),
(5, 5, 6, 20.0, '2023-01-20', '2023-07-20', 6.0, 0.60, 'Completed', TRUE),
(6, 6, 7, 1000.0, '2023-01-25', '2023-07-25', 1.5, 15.00, 'Active', TRUE),
(7, 7, 8, 10.0, '2023-01-30', '2023-07-30', 4.0, 0.40, 'Active', TRUE),
(8, 8, 9, 5.0, '2023-02-01', '2023-08-01', 3.5, 0.175, 'Pending', FALSE),
(9, 9, 10, 1.0, '2023-02-05', '2023-08-05', 2.5, 0.025, 'Active', FALSE),
(10, 10, 1, 0.01, '2023-02-10', '2023-08-10', 1.0, 0.0001, 'Completed', TRUE);


-- to create table NFTs
CREATE TABLE NFTs (
nft_id INT PRIMARY KEY,
name VARCHAR(50),
owner_id INT,
mint_date DATE,
price_usd DECIMAL(18, 2),
collection VARCHAR(50),
file_type VARCHAR(10),
blockchain VARCHAR(20),
rarity VARCHAR(20),
listed BOOLEAN,
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


-- to display/retrieve table
SELECT * FROM NFTs;


-- to remove complete records from table
truncate table NFTs;

-- to remove complete records and attributes from table
drop table NFTs;


-- to insert values into the table
INSERT INTO NFTs (nft_id, name, owner_id, mint_date, price_usd, collection, file_type, blockchain, rarity, listed)
VALUES
(1, 'CryptoPunk1', 1, '2022-01-01', 100000.00, 'CryptoPunks', 'PNG', 'Ethereum', 'Rare', TRUE),
(2, 'BoredApe2', 2, '2022-02-01', 120000.00, 'BAYC', 'JPG', 'Ethereum', 'Epic', TRUE),
(3, 'PixelCat', 3, '2022-03-01', 5000.00, 'PixelPets', 'GIF', 'Solana', 'Common', FALSE),
(4, 'CyberBear', 4, '2022-04-01', 30000.00, 'CyberZoo', 'MP4', 'Polygon', 'Legendary', TRUE),
(5, 'MetaFish', 5, '2022-05-01', 10000.00, 'MetaMarine', 'PNG', 'Ethereum', 'Uncommon', FALSE),
(6, 'AlienBoi', 6, '2022-06-01', 80000.00, 'AlienClub', 'GIF', 'Ethereum', 'Rare', TRUE),
(7, 'RobotGirl', 7, '2022-07-01', 45000.00, 'TechnoArt', 'MP4', 'Polygon', 'Epic', TRUE),
(8, 'FluffyFox', 8, '2022-08-01', 9000.00, 'FoxWorld', 'JPG', 'Solana', 'Rare', FALSE),
(9, 'GoldenEgg', 9, '2022-09-01', 200000.00, 'EggsDAO', 'PNG', 'Ethereum', 'Legendary', TRUE),
(10, 'MoonRock', 10, '2022-10-01', 7500.00, 'MoonNFTs', 'JPG', 'Binance', 'Common', FALSE);


-- to create table Minings
 CREATE TABLE Minings (
 mining_id INT PRIMARY KEY,
 user_id INT,
 coin_id INT,
 hash_rate DECIMAL(18, 2),
 power_usage DECIMAL(18, 2),
 mined_amount DECIMAL(18, 8),
 hardware VARCHAR(50),
 location VARCHAR(50),
 status VARCHAR(20),
 started_on DATE,
 FOREIGN KEY (user_id) REFERENCES Users(user_id),
 FOREIGN KEY (coin_id) REFERENCES Coins(coins_id)
 );
 

-- to display/retrieve table
SELECT * FROM Minings;


-- to remove complete records from table 
truncate table Minings;

-- to remove complete records and attributes from table
drop table Minings;


-- to insert values into the table
INSERT INTO Minings (mining_id, user_id, coin_id, hash_rate, power_usage, mined_amount, hardware, location, status, started_on)
VALUES
(1, 1, 1, 1000.00, 1200.50, 0.0025, 'AntMiner S19', 'Texas', 'Running', '2023-01-01'),
(2, 2, 2, 500.00, 800.00, 0.03, 'ASIC E9', 'California', 'Paused', '2023-01-02'),
(3, 3, 3, 200.00, 400.00, 25.00, 'GPU RTX 3080', 'UK', 'Running', '2023-01-03'),
(4, 4, 4, 150.00, 300.00, 0.02, 'ASIC Mini', 'India', 'Stopped', '2023-01-04'),
(5, 5, 5, 700.00, 1000.00, 0.10, 'L3+', 'Canada', 'Running', '2023-01-05'),
(6, 6, 6, 80.00, 200.00, 50.00, 'ASIC X', 'USA', 'Running', '2023-01-06'),
(7, 7, 7, 600.00, 900.00, 1000.00, 'DogeMiner', 'Russia', 'Running', '2023-01-07'),
(8, 8, 8, 250.00, 500.00, 5.00, 'ADA Miner', 'Japan', 'Running', '2023-01-08'),
(9, 9, 9, 450.00, 700.00, 3.00, 'DOT Power', 'Singapore', 'Running', '2023-01-09'),
(10, 10, 10, 350.00, 600.00, 0.50, 'SOL Farm', 'Australia', 'Running', '2023-01-10');



