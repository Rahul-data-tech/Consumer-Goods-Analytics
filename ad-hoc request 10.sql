 WITH x AS 
( 
SELECT P.division, S.product_code, P.product, SUM(S.sold_quantity) AS Total_sold_quanƟty,
RANK() OVER(PARTITION BY P.division ORDER BY SUM(S.sold_quantity) DESC) AS 'Rank_Order' 
FROM dim_product P JOIN fact_sales_monthly S 
ON P.product_code = S.product_code 
WHERE S.fiscal_year = 2021 
GROUP BY P.division, S.product_code, P.product) 
 SELECT * FROM x 
WHERE Rank_Order IN (1,2,3) ORDER BY division, Rank_Order; 