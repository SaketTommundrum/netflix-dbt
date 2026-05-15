

WITH src_ratings AS (
    SELECT * FROM NETFLIX.DEV.src_ratings
)

SELECT 
    user_id,
    movie_id,
    rating,
    rating_timestamp
FROM src_ratings
WHERE rating_timestamp IS NOT NULL


    AND rating_timestamp> (SELECT MAX(rating_timestamp) FROM NETFLIX.DEV.fct_ratings)
