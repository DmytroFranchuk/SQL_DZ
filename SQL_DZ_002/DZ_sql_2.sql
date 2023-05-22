use airliners;
SELECT 
    id, service_class, price
FROM
    tickets
WHERE
    CASE
        WHEN service_class = 'Economy' THEN price BETWEEN 10000 AND 11000
        WHEN service_class = 'PremiumEconomy' THEN price BETWEEN 20000 AND 30000
        WHEN service_class = 'Business' THEN price > 100000
    END;
    -- -----------------------------------------------------------------------------------------
SELECT 
    *
FROM
    airliners;
     -- -----------------------------------------------------------------------------------------
SELECT 
    side_number,
    CASE
        WHEN production_year < 2000 THEN 'Old'
        WHEN production_year BETWEEN 2000 AND 2010 THEN 'Mid'
        ELSE 'New'
    END AS age
FROM
    airliners
WHERE
    ranger <= 10000
ORDER BY age ASC;
 -- -----------------------------------------------------------------------------------------
 SELECT id, trip_id,
    CASE
        WHEN service_class = 'Economy' THEN price * 0.85
        WHEN service_class = 'Business' THEN price * 0.9
        WHEN service_class = 'PremiumEconomy' THEN price * 0.8
        ELSE price
    END AS newprice
FROM tickets
WHERE trip_id IN ('LL4S1G8PQW', '0SE4S0HRRU', 'JQF04Q8I9G');