
---generate a report that provides an overview of number of stores in each city, sort in descending order of store counts
SELECT city, COUNT(store_id) AS store_count
FROM dbo.dim_stores
GROUP BY city
ORDER BY store_count DESC;
