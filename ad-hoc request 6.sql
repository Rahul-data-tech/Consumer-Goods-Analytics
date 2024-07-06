select
       i.customer_code,
       c.customer, 
       round(avg(i.pre_invoice_discount_pct)*100,2) as avg_dis_pct 
from fact_pre_invoice_deductions i 
join dim_customer c 
using (customer_code)
where fiscal_year =2021 and c.market="india" 
group by i.customer_code, c.customer
 order by avg_dis_pct desc 
 limit 5; 