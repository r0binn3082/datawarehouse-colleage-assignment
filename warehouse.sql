CREATE DATABASE Financial_Data_Warehouse;
USE Financial_Data_Warehouse;

CREATE TABLE Stock_Prices (
    Date DATETIME NOT NULL,
    Adj_Close FLOAT NOT NULL,
    Close FLOAT NOT NULL,
    High FLOAT NOT NULL,
    Low FLOAT NOT NULL,
    Open FLOAT NOT NULL,
    Volume FLOAT NOT NULL,
    PRIMARY KEY (Date)
);

CREATE TABLE Dividends (
    Date DATETIME NOT NULL,
    Dividend_Amount FLOAT NOT NULL,
    PRIMARY KEY (Date)
);

-- Inserting data into Stock_Prices table
LOAD DATA INFILE '/var/lib/mysql-files/AAPL_stock_data_cleaned.csv' -- the file path to load in data 
INTO TABLE Stock_Prices
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Date, Adj_Close, Close, High, Low,Open, Volume);

LOAD DATA INFILE '/var/lib/mysql-files/AAPL_dividends_cleaned.csv' -- the file path to load in data 
INTO TABLE Dividends
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS -- to skip the header row
(Date,Dividends); 

SELECT * FROM Stock_Prices LIMIT 10;
SELECT * FROM Dividends LIMIT 10;
