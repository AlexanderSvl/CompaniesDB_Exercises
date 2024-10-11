CREATE DATABASE [Companies]
USE [Companies]
GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 12.10.2024 г. 1:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[id] [bigint] NULL,
	[stock_name] [nvarchar](max) NULL,
	[stock_symbol] [text] NULL,
	[stock_sector] [varchar](255) NULL,
	[stock_industry] [text] NULL,
	[stock_market] [text] NULL,
	[stock_market_cap_USD$_billion] [float] NULL,
	[country_of_origin] [nvarchar](50) NULL,
	[country_code] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
