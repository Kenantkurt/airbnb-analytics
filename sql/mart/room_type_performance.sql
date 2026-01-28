-- room_type_performance.sql
-- Purpose: Analyze occupancy and revenue performance by room type

SELECT
  room_type,
  SUM(booked_days) AS total_booked_days,
  SUM(available_days) AS total_available_days,
  SUM(total_days) AS total_days,
  ROUND(AVG(weekly_avg_price), 1) AS avg_price,
  ROUND(SUM(booked_days) * AVG(weekly_avg_price), 1) AS estimated_weekly_revenue,
  ROUND(SAFE_DIVIDE(SUM(booked_days), SUM(total_days)), 2) AS occupancy_rate
FROM `intermediate.join_enriched`
GROUP BY room_type
ORDER BY estimated_weekly_revenue DESC;
