--DimEmployee
SELECT [EmployeeKey]
      ,[ParentEmployeeKey]
      ,CONCAT(FirstName,' ',isnull([MiddleName],''),' ',LastName) as Name
      ,[PayFrequency]
      ,[BaseRate]
      ,[DepartmentName]
      ,[Status]
  FROM [AdventureWorksDW2019].[dbo].[DimEmployee]

--FactSalesQuota
SELECT e.[EmployeeKey]
      ,isnull(SUM([SalesAmountQuota]),0) as QuotaSum
  FROM [AdventureWorksDW2019].[dbo].[FactSalesQuota] Q
  full join DimEmployee e
  on e.EmployeeKey = Q.EmployeeKey
GROUP by e.EmployeeKey

--FactInternetSales
SELECT [ProductKey]
      ,[CustomerKey]
      ,I.[SalesOrderNumber]
      ,DR.SalesReasonName
      ,[SalesAmount]
      ,[TotalProductCost] as InternetProductCost
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] I
  left join FactInternetSalesReason FR 
  on I.SalesOrderNumber = FR.SalesOrderNumber
  LEFT join DimSalesReason DR
  on FR.SalesReasonKey = DR.SalesReasonKey



--DimCustomer
SELECT [CustomerKey]
      ,[GeographyKey]
      ,CONCAT(FirstName,' ',isnull([MiddleName],''),' ',LastName) as CustName
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[YearlyIncome]
      ,[TotalChildren]
      ,[NumberChildrenAtHome]
      ,[EnglishEducation]
      ,[EnglishOccupation]
      ,case ([HouseOwnerFlag]) when 0 then 'unhouse' when 1 then 'house' end  HouseStatus
      ,[AddressLine1]

  FROM [AdventureWorksDW2019].[dbo].[DimCustomer]

  --DimGeography
SELECT  [GeographyKey]
      ,[City]
      ,[StateProvinceCode]
      ,[StateProvinceName]
      ,[CountryRegionCode]
      ,[EnglishCountryRegionName]
      ,[PostalCode]
      ,[SalesTerritoryKey]
  FROM [AdventureWorksDW2019].[dbo].[DimGeography]

