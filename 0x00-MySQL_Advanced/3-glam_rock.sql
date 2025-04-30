-- 3. Old school band
-- List all bands with Glam rock style, ranked by lifespan (until 2022)

SELECT band_name, 
       IFNULL(2022 - formed, 0) - IFNULL(2022 - split, 0) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
