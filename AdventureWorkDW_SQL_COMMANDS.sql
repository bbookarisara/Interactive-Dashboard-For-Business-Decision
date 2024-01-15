--FactResellerSales--
SELECT [ProductKey]
      ,[OrderQuantity]
      ,[SalesAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]
      ,[EmployeeKey]
FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]



--DimEmployee--
SELECT [EmployeeKey]
      ,CONCAT(FirstName,' ',isnull([MiddleName],''),' ',LastName) as Name
FROM [AdventureWorksDW2019].[dbo].[DimEmployee]



--DimEmployeeQuota--
SELECT e.[EmployeeKey]
FROM [AdventureWorksDW2019].[dbo].[FactSalesQuota] Q
FULL JOIN DimEmployee e
ON e.EmployeeKey = Q.EmployeeKey
GROUP by e.EmployeeKey



--DimProduct--
SELECT  [ProductKey]
      ,EnglishProductName
      ,isnull([ProductSubcategoryKey],0) asProductSubcategoryKey
      ,[StandardCost]
      ,[ListPrice]
      ,[DealerPrice]    
FROM [AdventureWorksDW2019].[dbo].[DimProduct]
WHERE StandardCost is not NULL



--DimProductSubCat--
SELECT [ProductSubcategoryKey]
      ,[ProductCategoryKey],[EnglishProductSubcategoryName]
FROM [AdventureWorksDW2019].[dbo].[DimProductSubcategory]



--DimProductCat--
SELECT [ProductCategoryKey]
      ,[EnglishProductCategoryName]
FROM [AdventureWorksDW2019].[dbo].[DimProductCategory]



----FactInternetSales--
SELECT [ProductKey]
      ,[CustomerKey]
      ,I.[SalesOrderNumber]
      ,DR.SalesReasonName
      ,[SalesAmount]
      ,[TotalProductCost] as InternetProductCost
FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] I
LEFT JOIN FactInternetSalesReason FR 
ON I.SalesOrderNumber = FR.SalesOrderNumber
LEFT JOIN DimSalesReason DR
ON FR.SalesReasonKey = DR.SalesReasonKey



--DimCustomer
SELECT [CustomerKey]
      ,[GeographyKey]
      ,CONCAT(FirstName,' ',isnull([MiddleName],''),' ',LastName) as CustName
      ,[BirthDate]
      ,[Gender]
FROM [AdventureWorksDW2019].[dbo].[DimCustomer]
