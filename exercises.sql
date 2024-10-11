USE Companies;

SELECT * FROM Stocks

-- Top 5 stocks by market cap --
SELECT TOP 5 * FROM Stocks 
	ORDER BY [stock_market_cap_USD$_billion] DESC;

-- Calculation of the average market cap for each sector -- 
SELECT 
	[stock_sector],
	ROUND(AVG([stock_market_cap_USD$_billion]), 2) AS Average_Market_Cap_USD$_Billion
FROM Stocks 
	GROUP BY [stock_sector]
	ORDER BY Average_Market_Cap_USD$_Billion DESC; 

-- Stock count by country --
SELECT [country_of_origin], COUNT(*) AS Count_Of_Registered_Companies FROM Stocks
	GROUP BY [country_of_origin]
	ORDER BY Count_Of_Registered_Companies DESC;

-- Select all stocks with names that contain more than 10 characters --
SELECT [stock_name] FROM Stocks
	WHERE LEN([stock_name]) > 10;

-- Filtered Healthcare sector stocks, sorted by market cap in ascending order --
SELECT [stock_name], [stock_sector], [stock_symbol], [stock_market_cap_USD$_billion] FROM Stocks
	WHERE [stock_sector] = 'Healthcare'
	ORDER BY [stock_market_cap_USD$_billion] DESC;

-- Make a table with the TOP 5 companies by market cap in each sector, sorted in ascending order --
WITH RankedStocks AS (
    SELECT 
        [stock_name],
        [stock_sector],
        [stock_market_cap_USD$_billion],
        ROW_NUMBER() OVER (PARTITION BY [stock_sector] ORDER BY [stock_market_cap_USD$_billion] DESC) AS rn
    FROM 
        Stocks
)
SELECT 
    [stock_name], 
    [stock_sector],
	[stock_market_cap_USD$_billion]
FROM 
    RankedStocks
WHERE 
    rn <= 5; 

-- Select TOP 3 stocks by market cap from each sector --
WITH RankedStocks AS (
    SELECT 
        [stock_name], 
		[stock_sector], 
		[stock_market_cap_USD$_billion],
        ROW_NUMBER() OVER (PARTITION BY [stock_sector] ORDER BY [stock_market_cap_USD$_billion] DESC) AS stock_rank
    FROM 
        Stocks
)
SELECT 
    *
FROM 
    RankedStocks
WHERE 
    stock_rank <= 3; 
