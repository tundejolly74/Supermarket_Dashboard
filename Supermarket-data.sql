/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Invoice_ID]
      ,[Branch]
      ,[City]
      ,[Customer_type]
      ,[Gender]
      ,[Product_line]
      ,[Unit_price]
      ,[Quantity]
      ,[Tax_5]
      ,[Total]
      ,[Date]
      ,[Time]
      ,[Payment]
      ,[cogs]
      ,[gross_margin_percentage]
      ,[gross_income]
      ,[Rating]
  FROM [Supermarket].[dbo].[supermarket_sales]

  Select Branch, City, Customer_type, Product_line, Total, Date, Payment, gross_income, Rating
  FROM [Supermarket].[dbo].[supermarket_sales]

  SELECT Branch, City, Customer_type, Product_line, max(gross_income) AS max_gross
  FROM [Supermarket].[dbo].[supermarket_sales]
  GROUP BY Branch, City, Customer_type, Product_line

  --Revenue by Branch
  SELECT Branch, Round(sum(Total),2) AS total_revenue
  FROM [Supermarket].[dbo].[supermarket_sales]
  GROUP BY Branch
  ORDER BY total_revenue DESC

  --Revenue by Product_line
  SELECT Product_line, Round(sum(Total),2) AS total_revenue
  FROM [Supermarket].[dbo].[supermarket_sales]
  GROUP BY Product_line
  ORDER BY total_revenue DESC

  --Revenue by City
  SELECT City, Branch, Round(sum(Total),2) AS total_revenue
  FROM [Supermarket].[dbo].[supermarket_sales]
  GROUP BY City, Branch
  ORDER BY total_revenue DESC

  --Revenue generation by Gender
  SELECT Gender, Round(sum(Total),2) AS total_revenue
  FROM [Supermarket].[dbo].[supermarket_sales]
  GROUP BY Gender
  ORDER BY total_revenue DESC
  
  SELECT Branch, City, Product_line, YEAR(Date) AS sales_year, MONTH(Date) AS sales_month, Total 
  FROM [Supermarket].[dbo].[supermarket_sales]
  ORDER BY Total

  --Quantity sold by Product_line
  SELECT Product_line, sum(Quantity) As quantity_sold, sum(Total) AS total_revenue
  FROM [Supermarket].[dbo].[supermarket_sales]
  GROUP BY Product_line
  ORDER BY total_revenue

  --Quantity sold by Branch
  SELECT Branch, sum(Quantity) As quantity_sold, sum(Total) AS total_revenue
  FROM [Supermarket].[dbo].[supermarket_sales]
  GROUP BY Branch
  ORDER BY total_revenue


  --Quantity sold by City
  SELECT City, sum(Quantity) As quantity_sold, sum(Total) AS total_revenue
  FROM [Supermarket].[dbo].[supermarket_sales]
  GROUP BY City
  ORDER BY total_revenue

  --Rating by 
  SELECT Branch, Product_line, min(Rating) As min_rating, max(Rating) AS max_rating
  FROM [Supermarket].[dbo].[supermarket_sales]
  GROUP BY Branch, Product_line
  ORDER BY min_rating,max_rating

