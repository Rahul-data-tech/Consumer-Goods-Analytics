SELECT 
CASE 
 WHEN month(date) in (9,10,11) then 'Q1' 
 WHEN month(date) in (12,01,02) then 'Q2' 
 WHEN month(date) in (03,04,05) then 'Q3' 
 ELSE 'Q4' 
 END AS Quarters, 
 SUM(sold_quantity) AS total_sold_qty 
FROM fact_sales_monthly 
WHERE fiscal_year = 2020 
GROUP BY Quarters 
ORDER BY total_sold_qty DESC;. 
