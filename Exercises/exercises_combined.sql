USE Companies;

SELECT * FROM Dividends

-- Join the table Dividends and the Stocks table and show data from both -- 
SELECT 
    [Dividends].[id] AS DividendID,          
    [Dividends].[stock_symbol],             
    [Dividends].[dividend_date],             
    [Dividends].[dividend_amount],          
    [Stocks].[stock_name],                
    [Stocks].[stock_sector]                
FROM [Dividends] INNER JOIN Stocks ON [Dividends].[stock_symbol] = [Stocks].[stock_symbol];

-- Find the highest valued dividents --
SELECT [stock_symbol], [dividend_amount], [currency] FROM Dividends
	ORDER BY [dividend_amount] DESC;

-- A query to join the CompanyFinancials table with the Stocks table and retrieve the stock name, revenue, and net income.
SELECT 
	[Stocks].[stock_name],
	[CompanyFinancials].[revenue],
	[CompanyFinancials].[net_income]
FROM [CompanyFinancials] INNER JOIN Stocks ON [CompanyFinancials].[stock_symbol] = [Stocks].[stock_symbol];

-- A query to join the Analyst Ratings and Stocks tables to display the analyst name, rating, and target price for each stock.
SELECT
	[Stocks].[stock_name],
	[Stocks].[stock_symbol],
	[AnalystRatings].[analyst_name],
	[AnalystRatings].[rating],
	[AnalystRatings].[target_price]
FROM [AnalystRatings] INNER JOIN Stocks ON [AnalystRatings].[stock_symbol] = [Stocks].[stock_symbol];

-- A query to find out how many "Buy", "Hold", and "Sell" ratings exist for each stock in the AnalystRatings table.
SELECT [stock_symbol], [rating], COUNT(*) AS RatingCount        
	FROM [AnalystRatings]
	GROUP BY [stock_symbol], [rating]                           
	ORDER BY [stock_symbol], [rating];           

-- A query to calculate the daily price volatility (highest price - lowest price) for each stock in the StockPrices table.
SELECT [stock_symbol], [price_date], ([highest_price] - [lowest_price]) AS PriceVolatility 
	FROM StockPrices;

-- A query to calculate the total percentage ownership for each stock in the Shareholders 
SELECT [stock_symbol], SUM([percentage_ownership]) AS 'Ownership (in %)' FROM Shareholders
	GROUP BY [stock_symbol];
	
-- A query to calculate the year-over-year revenue growth for each stock symbol.
SELECT [stock_symbol], [fiscal_year], SUM([revenue]) AS RevenueGrowth 
	FROM CompanyFinancials
	GROUP BY [stock_symbol], [fiscal_year];

-- A query to compare the target price set by analysts (from AnalystRatings) 
-- with the highest stock price (from StockPrices) for each stock symbol and dates
-- and calculate if the target price has been met.
SELECT 
	[AnalystRatings].[stock_symbol], 
	[StockPrices].[price_date], 
	[target_price], 
	[highest_price],
	CASE 
        WHEN [StockPrices].[highest_price] >= [AnalystRatings].[target_price] THEN 'Yes'
        ELSE 'No'
    END AS [Met the Price Target]
FROM AnalystRatings 
	INNER JOIN StockPrices ON AnalystRatings.stock_symbol = StockPrices.stock_symbol;

-- Join the Stocks and Dividends tables to find out which stock in each sector paid the highest average dividend.
SELECT 
    Stocks.stock_sector, 
    Dividends.stock_symbol, 
    AVG(Dividends.dividend_amount) AS AverageDividend
FROM 
    Dividends 
INNER JOIN 
    Stocks ON Dividends.stock_symbol = Stocks.stock_symbol
GROUP BY 
    Stocks.stock_sector, 
    Dividends.stock_symbol
ORDER BY 
    Stocks.stock_sector, 
    AverageDividend DESC;