-- join_enriched.sql
-- Purpose: Enrich weekly calendar metrics with listing attributes for segmentation analysis

SELECT
  w.listing_id,
  w.weekly_date,
  w.available_days,
  w.booked_days,
  w.total_days,
  w.occupancy_rate,
  w.weekly_avg_price,
  l.room_type,
  l.host_response_time,
  l.review_scores_value
FROM `intermediate.weekly_calendar` AS w
LEFT JOIN `raw_data.listing` AS l
  ON l.id = w.listing_id;
