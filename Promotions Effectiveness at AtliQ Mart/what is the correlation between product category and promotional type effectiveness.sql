
---what is the correlation between product category and promotional type effectiveness

WITH SalesComparison AS (
    SELECT
        dp.category AS product_category,
        fe.promo_type,
        SUM(fe.quantity_sold_after_promo * fe.base_price) AS revenue_after_promo,
		SUM(fe.quantity_sold_before_promo * fe.base_price) AS revenue_before_promo

    FROM
        dbo.fact_events AS fe
    JOIN
        dbo.dim_products AS dp ON fe.product_code = dp.product_code
    WHERE
        fe.quantity_sold_after_promo > 0
    GROUP BY
        dp.category,
        fe.promo_type
)
SELECT
    sc.product_category,
    sc.promo_type,
    sc.revenue_after_promo,
	sc.revenue_before_promo
FROM
    SalesComparison AS sc
ORDER BY
    sc.product_category,
    sc.promo_type;

