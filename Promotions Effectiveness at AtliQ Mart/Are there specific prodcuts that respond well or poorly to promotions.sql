
---Are there specific prodcuts that respond well or poorly to promotions
SELECT
    dp.product_name,
    SUM(fe.quantity_sold_before_promo) AS total_qty_sold_before_promo,
    SUM(fe.quantity_sold_after_promo) AS total_qty_sold_after_promo,
	 SUM(fe.quantity_sold_before_promo * fe.base_price) AS revenue_before_promo,
    SUM(fe.quantity_sold_after_promo * fe.base_price) AS revenue_after_promo
FROM
    dbo.fact_events fe
JOIN
    dbo.dim_products dp ON fe.product_code = dp.product_code
GROUP BY
    dp.product_name
ORDER BY
    dp.product_name;

