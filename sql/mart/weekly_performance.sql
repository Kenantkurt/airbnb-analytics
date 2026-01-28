-- weekly_performance.sql
-- Purpose: Build global weekly occupancy, pricing, and revenue KPIs

SELECT
  weekly_date,
  ROUND(SAFE_DIVIDE(SUM(booked_days), SUM(total_days)), 2) AS global_occupancy_rate,
  SUM(booked_days) AS total_booked_days,
  SUM(available_days) AS total_available_days,
  COUNT(DISTINCT listing_id) AS weekly_active_listing,
  COUNT(DISTINCT listing_id) * 7 AS weekly_max_capacity_days,
  ROUND(AVG(weekly_avg_price), 2) AS avg_weekly_price,
  ROUND(SUM(booked_days) * AVG(weekly_avg_price), 1) AS estimated_weekly_revenue
FROM `intermediate.join_enriched`
GROUP BY weekly_date
ORDER BY weekly_date;
