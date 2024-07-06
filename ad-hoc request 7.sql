SELECT 
       monthname(s.date) as month,
       s.fiscal_year,
       round(sum(gross_price*sold_quantity),2) as Gross_sales_amt
FROM fact_sales_monthly s
join fact_gross_price g
using(product_code)
join dim_customer c
using(customer_code)
where customer="Atliq Exclusive"
group by monthname(s.date),s.fiscal_year
order by fiscal_year 