

WITH raw_ratings AS (
    SELECT * FROM NETFLIX.RAW.RAW_RATINGS
)

SELECT 
    userId as user_id,
    movieId as movie_id,
    rating,
    to_timestamp_ltz(timestamp) as rating_timestamp
FROM raw_ratings