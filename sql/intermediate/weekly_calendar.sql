-- weekly_calendar.sql
-- Purpose: Convert daily calendar data into weekly listing-level metrics

SELECT
  listing_id,
  DATE_TRUNC(date, WEEK(MONDAY)) AS weekly_date,
  SUM(CASE WHEN available = TRUE THEN 1 ELSE 0 END) AS available_days,
  SUM(CASE WHEN available = FALSE THEN 1 ELSE 0 END) AS booked_days,
  COUNT(*) AS total_days,
  ROUND(
    SAFE_DIVIDE(
      SUM(CASE WHEN available = FALSE THEN 1 ELSE 0 END),
      COUNT(*)
    ),
    2
  ) AS occupancy_rate,
  CAST(AVG(price) AS INT64) AS weekly_avg_price
FROM `raw_data.calendar`
GROUP BY listing_id, weekly_date
ORDER BY weekly_date;
