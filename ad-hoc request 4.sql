with X as (select 
      p.segment,
      count(distinct s.product_code) as product_count_2020  
from dim_product p 
join fact_sales_monthly s 
on p.product_code=s.product_code 
where fiscal_year=2020
group by p.segment),


Y as (select 
      p.segment,
      count(distinct s.product_code) as product_count_2021 
from dim_product p 
join fact_sales_monthly s 
on p.product_code=s.product_code 
where fiscal_year=2021
group by p.segment)

select 
       X.segment,
       product_count_2020,
       product_count_2021,
	(product_count_2021-product_count_2020) as difference
FROM X
JOIN Y 
ON X.segment=Y.segment
order by difference DESC