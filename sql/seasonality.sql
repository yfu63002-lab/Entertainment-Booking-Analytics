-- Aggregate bookings and revenue by season

SELECT
  CASE
    WHEN EXTRACT(MONTH FROM g.startdate) IN (12, 1, 2) THEN 'Winter'
    WHEN EXTRACT(MONTH FROM g.startdate) IN (3, 4, 5) THEN 'Spring'
    WHEN EXTRACT(MONTH FROM g.startdate) IN (6, 7, 8) THEN 'Summer'
    ELSE 'Fall'
  END AS season,
  COUNT(*) AS num_engagements,
  SUM(g.contractprice) AS total_contract_revenue
FROM engagements g
GROUP BY season
ORDER BY num_engagements DESC;

-- Monthly revenue and booking count

SELECT
  EXTRACT(YEAR FROM startdate) AS year_s,
  EXTRACT(MONTH FROM startdate) AS month_s,
  SUM(contractprice) AS total_revenue,
  COUNT(engagementnumber) AS num_engagements
FROM engagements
GROUP BY year_s, month_s
ORDER BY total_revenue DESC;
