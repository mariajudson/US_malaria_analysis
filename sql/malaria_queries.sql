-- ============================================================
-- US Malaria Surveillance — SQL Analysis
-- Data: CDC Reported Malaria Cases by County (2016 & 2017)
-- Author: Dr. Maria Julia Judson, DVM, MSc
-- ============================================================
-- Table structure assumed:
--   malaria (state TEXT, year INTEGER, cases INTEGER)
-- ============================================================


-- ------------------------------------------------------------
-- QUERY 1: Total reported cases per year
-- Concept: SELECT, SUM, GROUP BY
-- ------------------------------------------------------------

SELECT year,
       SUM(cases) AS total_cases
FROM malaria
GROUP BY year
ORDER BY year;


-- ------------------------------------------------------------
-- QUERY 2: Top 10 states by reported cases in 2017
-- Concept: WHERE, ORDER BY, LIMIT
-- ------------------------------------------------------------

SELECT state,
       SUM(cases) AS total_cases_2017
FROM malaria
WHERE year = 2017
GROUP BY state
ORDER BY total_cases_2017 DESC
LIMIT 10;


-- ------------------------------------------------------------
-- QUERY 3: Top 10 states by reported cases in 2016
-- Concept: WHERE, ORDER BY, LIMIT
-- ------------------------------------------------------------

SELECT state,
       SUM(cases) AS total_cases_2016
FROM malaria
WHERE year = 2016
GROUP BY state
ORDER BY total_cases_2016 DESC
LIMIT 10;


-- ------------------------------------------------------------
-- QUERY 4: Year-over-year change by state (absolute)
-- Concept: Self JOIN, calculated columns, aliases
-- ------------------------------------------------------------

SELECT a.state,
       a.cases AS cases_2016,
       b.cases AS cases_2017,
       (b.cases - a.cases) AS change_2016_to_2017
FROM malaria a
JOIN malaria b
  ON a.state = b.state
WHERE a.year = 2016
  AND b.year = 2017
ORDER BY change_2016_to_2017 DESC;


-- ------------------------------------------------------------
-- QUERY 5: States with increased cases from 2016 to 2017
-- Concept: Self JOIN, filtering on calculated result
-- ------------------------------------------------------------

SELECT a.state,
       a.cases AS cases_2016,
       b.cases AS cases_2017,
       (b.cases - a.cases) AS increase
FROM malaria a
JOIN malaria b
  ON a.state = b.state
WHERE a.year = 2016
  AND b.year = 2017
  AND b.cases > a.cases
ORDER BY increase DESC;


-- ------------------------------------------------------------
-- QUERY 6: Percentage change by state (2016 to 2017)
-- Concept: Calculated columns, ROUND, handling division
-- ------------------------------------------------------------

SELECT a.state,
       a.cases AS cases_2016,
       b.cases AS cases_2017,
       ROUND(
           (CAST(b.cases - a.cases AS FLOAT) / NULLIF(a.cases, 0)) * 100,
           1
       ) AS pct_change
FROM malaria a
JOIN malaria b
  ON a.state = b.state
WHERE a.year = 2016
  AND b.year = 2017
ORDER BY pct_change DESC;


-- ------------------------------------------------------------
-- QUERY 7: States above the national average in 2017
-- Concept: Subquery
-- ------------------------------------------------------------

SELECT state,
       SUM(cases) AS total_cases_2017
FROM malaria
WHERE year = 2017
GROUP BY state
HAVING SUM(cases) > (
    SELECT AVG(state_total)
    FROM (
        SELECT SUM(cases) AS state_total
        FROM malaria
        WHERE year = 2017
        GROUP BY state
    )
)
ORDER BY total_cases_2017 DESC;


-- ------------------------------------------------------------
-- QUERY 8: States present in both years (data quality check)
-- Concept: Subquery with IN, data validation
-- ------------------------------------------------------------

SELECT DISTINCT state
FROM malaria
WHERE year = 2016
  AND state IN (
      SELECT DISTINCT state
      FROM malaria
      WHERE year = 2017
  )
ORDER BY state;
