WITH X as(select count(distinct product_code) as unique_products_2020 
from fact_sales_monthly
where fiscal_year=2020),

Y as (select count(distinct product_code) as unique_products_2021 
from fact_sales_monthly
where fiscal_year=2021)
SELECT 
X.unique_products_2020,
Y.unique_products_2021,
round(((Y.unique_products_2021-X.unique_products_2020)/X.unique_products_2020)*100,2) 
as 
percentage_chng 
from X,Y;





