-- Find duplicates in fact_events based on event_id
SELECT event_id, COUNT(*)
FROM dbo.fact_events
GROUP BY event_id
HAVING COUNT(*) > 1;

-- Remove duplicates (based on event_id) from fact_events table
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY event_id ORDER BY event_id) AS row_num
    FROM dbo.fact_events
)
DELETE FROM CTE WHERE row_num > 1;

---checking for duplicates
   SELECT product_code, COUNT(*) AS duplicate_count
FROM dbo.dim_products
GROUP BY product_code
HAVING COUNT(*) > 1;

SELECT campaign_id, COUNT(*) AS duplicate_count
FROM dbo.dim_campaigns
GROUP BY campaign_id
HAVING COUNT(*) > 1;




---Handle NULL Values
UPDATE dbo.fact_events
SET quantity_sold_after_promo = 0
WHERE quantity_sold_after_promo IS NULL;

UPDATE dbo.dim_products
SET product_name = 'Unknown'
WHERE product_name IS NULL;



----Remove Leading/Trailing Spaces
UPDATE dbo.dim_products
SET product_name = LTRIM(RTRIM(product_name)),
    category = LTRIM(RTRIM(category));

	UPDATE dbo.dim_campaigns
SET campaign_name = LTRIM(RTRIM(campaign_name));

---Checking for negative values
SELECT * 
FROM dbo.fact_events
WHERE base_price < 0 
   OR quantity_sold_before_promo < 0 
   OR quantity_sold_after_promo < 0;



