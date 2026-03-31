SELECT name
FROM sqlite_master
WHERE type = 'table';
SELECT *
FROM "airbnb_listings"
LIMIT 10;
SELECT COUNT(*) AS total_rows
FROM "airbnb_listings";
SELECT
    COUNT(*) AS total_rows,
    COUNT(latitude) AS latitude_not_null,
    COUNT(longitude) AS longitude_not_null,
    COUNT(price) AS price_not_null,
    COUNT(neighbourhood_group) AS borough_not_null,
    COUNT(neighbourhood) AS neighbourhood_not_null,
    COUNT(room_type) AS room_type_not_null
FROM "airbnb_listings";
SELECT
    neighbourhood_group,
    COUNT(*) AS listing_count
FROM "airbnb_listings"
GROUP BY neighbourhood_group
ORDER BY listing_count DESC;
SELECT
    neighbourhood_group,
    ROUND(AVG(price), 2) AS avg_price
FROM "airbnb_listings"
GROUP BY neighbourhood_group
ORDER BY avg_price DESC;
SELECT
    room_type,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS avg_price
FROM "airbnb_listings"
GROUP BY room_type
ORDER BY listing_count DESC;
SELECT
    neighbourhood_group,
    neighbourhood,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS avg_price
FROM "airbnb_listings"
GROUP BY neighbourhood_group, neighbourhood
HAVING COUNT(*) >= 10
ORDER BY avg_price DESC
LIMIT 10;
SELECT
    room_type,
    ROUND(AVG(number_of_reviews), 2) AS avg_reviews,
    ROUND(AVG(price), 2) AS avg_price
FROM "airbnb_listings"
GROUP BY room_type
ORDER BY avg_price DESC;
SELECT
    neighbourhood_group,
    ROUND(AVG(availability_365), 2) AS avg_availability
FROM "airbnb_listings"
GROUP BY neighbourhood_group
ORDER BY avg_availability DESC;
CREATE VIEW "airbnb_map_ready" AS
SELECT
    id,
    name,
    host_id,
    host_name,
    neighbourhood_group,
    neighbourhood,
    latitude,
    longitude,
    room_type,
    price,
    minimum_nights,
    number_of_reviews,
    last_review,
    reviews_per_month,
    calculated_host_listings_count,
    availability_365
FROM "airbnb_listings"
WHERE price BETWEEN 10 AND 1000
  AND minimum_nights <= 30
  AND latitude BETWEEN 40.4 AND 41.0
  AND longitude BETWEEN -74.3 AND -73.6;
SELECT COUNT(*) AS cleaned_rows
FROM "airbnb_map_ready";
SELECT
    neighbourhood_group,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(availability_365), 2) AS avg_availability,
    ROUND(AVG(number_of_reviews), 2) AS avg_reviews
FROM "airbnb_map_ready"
GROUP BY neighbourhood_group
ORDER BY listing_count DESC;
SELECT
    room_type,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(number_of_reviews), 2) AS avg_reviews,
    ROUND(AVG(availability_365), 2) AS avg_availability
FROM "airbnb_map_ready"
GROUP BY room_type
ORDER BY listing_count DESC;
SELECT
    neighbourhood_group,
    neighbourhood,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS avg_price
FROM "airbnb_map_ready"
GROUP BY neighbourhood_group, neighbourhood
HAVING COUNT(*) >= 50
ORDER BY avg_price DESC
LIMIT 15;
SELECT
    neighbourhood_group,
    room_type,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS avg_price
FROM "airbnb_map_ready"
GROUP BY neighbourhood_group, room_type
ORDER BY neighbourhood_group, listing_count DESC;
DROP VIEW IF EXISTS "airbnb_borough_summary";

CREATE VIEW "airbnb_borough_summary" AS
SELECT
    neighbourhood_group,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(availability_365), 2) AS avg_availability,
    ROUND(AVG(number_of_reviews), 2) AS avg_reviews
FROM "airbnb_map_ready"
GROUP BY neighbourhood_group;
DROP VIEW IF EXISTS "airbnb_room_type_summary";

CREATE VIEW "airbnb_room_type_summary" AS
SELECT
    room_type,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(number_of_reviews), 2) AS avg_reviews,
    ROUND(AVG(availability_365), 2) AS avg_availability
FROM "airbnb_map_ready"
GROUP BY room_type;
DROP VIEW IF EXISTS "airbnb_top_neighbourhoods_price";

CREATE VIEW "airbnb_top_neighbourhoods_price" AS
SELECT
    neighbourhood_group,
    neighbourhood,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS avg_price
FROM "airbnb_map_ready"
GROUP BY neighbourhood_group, neighbourhood
HAVING COUNT(*) >= 50;
DROP VIEW IF EXISTS "airbnb_borough_roomtype_summary";

CREATE VIEW "airbnb_borough_roomtype_summary" AS
SELECT
    neighbourhood_group,
    room_type,
    COUNT(*) AS listing_count,
    ROUND(AVG(price), 2) AS avg_price
FROM "airbnb_map_ready"
GROUP BY neighbourhood_group, room_type;
DROP VIEW IF EXISTS "airbnb_kpi_summary";

CREATE VIEW "airbnb_kpi_summary" AS
SELECT
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(number_of_reviews), 2) AS avg_reviews,
    ROUND(AVG(availability_365), 2) AS avg_availability
FROM "airbnb_map_ready";
SELECT * FROM "airbnb_kpi_summary";
SELECT * FROM "airbnb_borough_summary";
SELECT * FROM "airbnb_room_type_summary";
SELECT * FROM "airbnb_top_neighbourhoods_price" ORDER BY avg_price DESC LIMIT 10;
SELECT * FROM "airbnb_borough_roomtype_summary";
SELECT * FROM "airbnb_map_ready";
SELECT * FROM "airbnb_kpi_summary";
SELECT * FROM "airbnb_borough_summary";
SELECT * FROM "airbnb_room_type_summary";
SELECT * FROM "airbnb_top_neighbourhoods_price" ORDER BY avg_price DESC LIMIT 10;
SELECT * FROM "airbnb_borough_roomtype_summary";
