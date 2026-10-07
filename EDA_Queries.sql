CREATE TABLE cookie_cats (
    userid INT PRIMARY KEY,
    version_a_b VARCHAR(20),
    sum_gamerounds INT,
    retention_1 BOOLEAN,
    retention_7 BOOLEAN
);

SELECT * FROM cookie_cats LIMIT 5;

-- Data Quality Check: Verify uniqueness of users to ensure no duplicate tracking.
SELECT 
    COUNT(userid) AS total_rows, 
    COUNT(DISTINCT userid) AS unique_users
FROM cookie_cats;

-- A/B Test Sanity Check: Calculate user distribution percentage between test groups (gate_30 vs gate_40).
SELECT 
    version_a_b, 
    COUNT(userid) AS total_users,
    ROUND((COUNT(userid) * 100.0 / (SELECT COUNT(*) FROM cookie_cats)), 2) AS percentage
FROM cookie_cats
GROUP BY version_a_b;

-- Outlier Detection: Calculate min, max, and average gamerounds to identify overall data anomalies.
SELECT 
    MIN(sum_gamerounds) AS min_rounds,
    MAX(sum_gamerounds) AS max_rounds,
    ROUND(AVG(sum_gamerounds), 2) AS avg_rounds
FROM cookie_cats;

-- Outlier Identification: Retrieve top 5 users by gamerounds to isolate specific extreme values.
SELECT 
    userid, 
    version_a_b, 
    sum_gamerounds
FROM cookie_cats
ORDER BY sum_gamerounds DESC
LIMIT 5;

-- Zero-Round Users: Count the number of users who installed the game but never played a single round.
SELECT
	COUNT(userid) AS userid_never_played
FROM public.cookie_cats
WHERE sum_gamerounds=0;

-- Baseline KPIs: Calculate Day 1 and Day 7 retention rates for each A/B testing group.
SELECT
	version_a_b,
	ROUND(AVG(retention_1::INT)*100, 2) AS retention_1_rates,
	ROUND(AVG(retention_7::INT)*100, 2) AS retention_7_rates
FROM public.cookie_cats
GROUP BY version_a_b;




