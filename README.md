Project Build Process

Data Preparation

Obtain dataset from AdventureWorks
Restore database using MS SqlServerManagement

1. Set Scope of Data
Explore data in MSSQL AzureDataStudio
Scope data to focus on key tables:
FactResellerSales
DimEmployee
FactSalesQuota
DimProduct
DimProductSubcategory
DimProductCategory
FactInternetSales
DimCustomer

2. Set Objectives and KPIs
Define business objectives for an analytical dashboard:
Customer: Identify top spenders in reseller and internet sales, analyze buying patterns, and gather customer reviews for targeted promotions.
Product: Determine most profitable products and their categories to optimize manufacturing and sales.
Employee: Establish KPIs for employee performance, including sales quota and profit, for hiring decisions and workforce regulation.

3. Design
Create a visually appealing dashboard with diverse presentations:
Comparison bar chart
Proportional pie chart
Scatter and boxplot for clustering

4. Tableau Implementation
Connect to MSSQL as the data source
Use custom queries to extract desired tables
Implement drilling down with parameter values and worksheet actions
Apply interactive filters for enhanced dashboard insights
