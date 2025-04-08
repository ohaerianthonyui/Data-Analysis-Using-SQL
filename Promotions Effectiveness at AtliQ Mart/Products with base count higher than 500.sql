


---Provide a list of product with a base price greater than 500 that are featured in promo type of "BOGOF".	
SELECT p.product_name, 
       p.product_code, 
       fe.base_price, 
       fe.promo_type
FROM dbo.fact_events fe
JOIN dbo.dim_products p ON fe.product_code = p.product_code
WHERE fe.base_price > 500 
  AND fe.promo_type = 'BOGOF';
