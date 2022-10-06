-- This SQL queries let us union four season datasets to make a whole year dataset analysis, 
-- which resulted in four interesting insights: the average ride length by each day of the week, 
-- the number of rides by each day of the week, the number of rides by gender and the number of rides by birthyear. 

-- Average ride length by day of the week 
SELECT
  CAST(DATEADD(mi,AVG(DATEDIFF(mi,'00:00:00',end_time - start_time)),'00:00:00') as TIME) AS avg_ride_length, customer_status, day_of_week_name, day_of_week_num
FROM
  (
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q2
  UNION
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q3
  UNION
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q4
  UNION
  SELECT trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2020_q1
  ) AS
  all_year_rides
GROUP BY
  customer_status, day_of_week_name, day_of_week_num
ORDER BY 
  avg_ride_length


-- Number of rides by day of the week -- 
SELECT 
  COUNT(trip_id) AS number_of_rides, customer_status, day_of_week_name, day_of_week_num
FROM
  (
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q2
  UNION
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q3
  UNION
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q4
  UNION
  SELECT trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2020_q1
  ) AS
  all_year_rides
GROUP BY
  customer_status, day_of_week_name, day_of_week_num
ORDER BY 
  number_of_rides


-- Number of rides by gender -- 
SELECT 
  COUNT(trip_id) AS number_of_rides, customer_status, gender
FROM
  (
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q2
  UNION
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q3
  UNION
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q4
  UNION
  SELECT trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2020_q1
  ) AS
  all_year_rides
WHERE
  gender IS NOT NULL
GROUP BY
  customer_status, gender
ORDER BY
  number_of_rides


-- Number of rides by year of birth --
SELECT 
  COUNT(trip_id) AS number_of_rides, customer_status, birth_year
FROM
  (
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q2
  UNION
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q3
  UNION
  SELECT CAST(trip_id as nvarchar(255)) AS trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2019_q4
  UNION
  SELECT trip_id, start_time, end_time, customer_status, ride_length, day_of_week_num, day_of_week_name, gender, birth_year
  FROM cyclistic_project..trips_2020_q1
  ) AS
  all_year_rides
WHERE 
  birth_year IS NOT NULL
GROUP BY
  customer_status, birth_year

