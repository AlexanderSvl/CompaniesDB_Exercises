# 📈 Stock Market Database Project

## 🚀 Overview

Welcome to the **Stock Market Database Project**! This project is designed to manage and analyze financial data of various companies. The database consists of multiple tables that store information related to stocks, dividends, financials, stock prices, analyst ratings, and shareholders. 

This project serves as a **practical exercise** to enhance my SQL skills, including data manipulation, querying, and database design.

---

## 📊 Tables

### 1. **Stocks**

- **Description**: This table holds information about different stocks, including their name, symbol, sector, industry, market capitalization, and country of origin.

| **Column Name**                            | **Data Type**      | **Description**                              |
|--------------------------------------------|---------------------|----------------------------------------------|
| `id`                                       | BIGINT              | Unique identifier for each stock.           |
| `stock_name`                               | NVARCHAR(MAX)       | Name of the stock.                          |
| `stock_symbol`                             | NVARCHAR(10)        | Symbol used to identify the stock.          |
| `stock_sector`                             | NVARCHAR(255)       | Sector in which the stock operates.         |
| `stock_industry`                           | NVARCHAR(MAX)       | Industry of the stock.                       |
| `stock_market`                             | NVARCHAR(MAX)       | The market where the stock is traded.       |
| `stock_market_cap_USD$_billion`           | FLOAT               | Market capitalization in billions of USD.   |
| `country_of_origin`                        | NVARCHAR(50)        | Country where the company is based.         |
| `country_code`                             | NVARCHAR(3)         | ISO code of the country.                     |

---

### 2. **Dividends**

- **Description**: This table tracks dividend payments made by companies.

| **Column Name**                            | **Data Type**      | **Description**                              |
|--------------------------------------------|---------------------|----------------------------------------------|
| `id`                                       | BIGINT              | Unique identifier for each dividend entry.  |
| `stock_symbol`                             | NVARCHAR(10)        | Foreign key linked to the `Stocks` table.   |
| `dividend_date`                           | DATE                | Date of the dividend payment.               |
| `dividend_amount`                         | DECIMAL(10, 2)      | Amount of dividend paid.                    |
| `currency`                                 | NVARCHAR(3)         | Currency code of the dividend amount.      |

---

### 3. **CompanyFinancials**

- **Description**: This table stores key financial data for each company.

| **Column Name**                            | **Data Type**      | **Description**                              |
|--------------------------------------------|---------------------|----------------------------------------------|
| `id`                                       | BIGINT              | Unique identifier for each financial entry. |
| `stock_symbol`                             | NVARCHAR(10)        | Foreign key linked to the `Stocks` table.   |
| `fiscal_year`                             | INT                 | Fiscal year for the financial data.        |
| `revenue`                                  | DECIMAL(18, 2)      | Revenue in USD (in millions or billions).  |
| `net_income`                               | DECIMAL(18, 2)      | Net income in USD (in millions or billions).|
| `earnings_per_share`                       | DECIMAL(10, 2)      | Earnings per share (EPS).                  |
| `total_assets`                             | DECIMAL(18, 2)      | Total assets in USD.                        |
| `total_liabilities`                        | DECIMAL(18, 2)      | Total liabilities in USD.                   |

---

### 4. **StockPrices**

- **Description**: This table maintains historical stock prices for analysis.

| **Column Name**                            | **Data Type**      | **Description**                              |
|--------------------------------------------|---------------------|----------------------------------------------|
| `id`                                       | BIGINT              | Unique identifier for each stock price entry.|
| `stock_symbol`                             | NVARCHAR(10)        | Foreign key linked to the `Stocks` table.   |
| `price_date`                               | DATE                | Date of the stock price entry.             |
| `opening_price`                            | DECIMAL(10, 2)      | Opening price of the stock.                 |
| `closing_price`                            | DECIMAL(10, 2)      | Closing price of the stock.                 |
| `highest_price`                            | DECIMAL(10, 2)      | Highest price during the trading day.       |
| `lowest_price`                             | DECIMAL(10, 2)      | Lowest price during the trading day.        |
| `volume`                                   | BIGINT              | Number of shares traded on that day.        |

---

### 5. **Shareholders**

- **Description**: This table keeps track of shareholders and their ownership details.

| **Column Name**                            | **Data Type**      | **Description**                              |
|--------------------------------------------|---------------------|----------------------------------------------|
| `id`                                       | BIGINT              | Unique identifier for each shareholder entry.|
| `shareholder_name`                         | NVARCHAR(100)       | Name of the shareholder.                    |
| `stock_symbol`                             | NVARCHAR(10)        | Foreign key linked to the `Stocks` table.   |
| `shares_held`                              | BIGINT              | Number of shares held by the shareholder.    |
| `percentage_ownership`                     | DECIMAL(5, 2)       | Percentage of total shares owned.            |
| `ownership_type`                           | NVARCHAR(50)        | Type of shareholder (Institutional, Retail, etc.). |

---

### 6. **AnalystRatings**

- **Description**: This table stores ratings given by analysts to different stocks.

| **Column Name**                            | **Data Type**      | **Description**                              |
|--------------------------------------------|---------------------|----------------------------------------------|
| `id`                                       | BIGINT              | Unique identifier for each rating entry.   |
| `stock_symbol`                             | NVARCHAR(10)        | Foreign key linked to the `Stocks` table.   |
| `analyst_name`                             | NVARCHAR(100)       | Name of the analyst providing the rating.   |
| `rating_date`                              | DATE                | Date of the rating.                         |
| `rating`                                   | NVARCHAR(20)        | Rating (e.g., "Buy", "Hold", "Sell").      |
| `target_price`                             | DECIMAL(10, 2)      | Target price set by the analyst.            |
| `notes`                                    | NVARCHAR(255)       | Additional notes or comments.               |

---

## 🎯 Learning Objectives

Through this project, I aim to:

- Enhance my **SQL skills** by practicing various queries and data manipulations.
- Understand **relational database design** and the importance of foreign keys.
- Gain insights into **financial data analysis** and reporting.
