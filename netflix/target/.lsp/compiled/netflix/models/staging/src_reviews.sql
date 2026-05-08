WITH raw_reviews AS (
    SELECT * FROM NETFLIX.RAW.RAW_REVIEWS
)

SELECT 
    userId as user_id,
    movieId as movie_id,
    review,
    to_timestamp_ltz(timestamp) as review_timestamp
FROM raw_reviews