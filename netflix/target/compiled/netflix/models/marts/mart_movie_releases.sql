

WITH ratings AS (
    SELECT * FROM NETFLIX.DEV.fct_ratings
),
dates AS (
    SELECT * FROM NETFLIX.DEV.seed_movie_release_dates
)

SELECT
    r.*,
    CASE
         WHEN d.release_date IS NULL THEN 'Unknown'
         ELSE 'Known'
    END AS release_date_avaialble
FROM ratings r 
LEFT JOIN dates d ON r.movie_id=d.movie_id