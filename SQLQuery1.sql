create database test_env

use test_env

select * from [dbo].[Test+Environment+Inventory+Dataset];

select * from [dbo].[Products];

select distinct(product_id) from  [dbo].[Products] 

select tst.[Order_Date_DD_MM_YYYY], tst.[Product_ID], tst.[Availability], tst.[Demand], products.[Product_Name], products.[Unit_Price]
from [dbo].[Test+Environment+Inventory+Dataset] tst
LEFT JOIN [dbo].[Products] products
ON products.product_id = tst.product_id;


select * into New_table from (select tst.[Order_Date_DD_MM_YYYY], tst.[Product_ID], tst.[Availability], tst.[Demand], products.[Product_Name], products.[Unit_Price]
from [dbo].[Test+Environment+Inventory+Dataset] tst
LEFT JOIN [dbo].[Products] products
ON products.product_id = tst.product_id) x ;


select * from New_table;
---------------------------------

create database prod

use prod

select * from [dbo].[Prod+Env+Inventory+Dataset];

select distinct([Order_Date_DD_MM_YYYY]) from [dbo].[Prod+Env+Inventory+Dataset] 
where [Order_Date_DD_MM_YYYY] is null or [Order_Date_DD_MM_YYYY] = '';

select distinct([Product_ID]) from [dbo].[Prod+Env+Inventory+Dataset];

update [dbo].[Prod+Env+Inventory+Dataset]
set product_id = 7 where product_id = 21;

update [dbo].[Prod+Env+Inventory+Dataset]
set product_id = 11 where product_id = 22;

select distinct([Availability]) from [dbo].[Prod+Env+Inventory+Dataset];
select distinct([Demand]) from [dbo].[Prod+Env+Inventory+Dataset];

select * into New_table from (select prd.[Order_Date_DD_MM_YYYY], prd.[Product_ID], prd.[Availability], prd.[Demand], products.[Product_Name], products.[Unit_Price]
from [dbo].[Prod+Env+Inventory+Dataset] prd
LEFT JOIN [dbo].[Products+(1)] products
ON products.product_id = prd.product_id) x ;

