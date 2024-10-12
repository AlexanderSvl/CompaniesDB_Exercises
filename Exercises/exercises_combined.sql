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
SELECT stock_symbol, rating, COUNT(*) AS rating_count         
	FROM AnalystRatings
	GROUP BY stock_symbol, rating                           
	ORDER BY stock_symbol, rating;           