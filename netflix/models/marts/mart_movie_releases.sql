{{
    config (
        materialized='table'
    )
}}

WITH ratings AS (
    SELECT * FROM {{ ref('fct_ratings') }}
),
dates AS (
    SELECT * FROM {{ ref('seed_movie_release_dates') }}
)

SELECT
    r.*,
    CASE
         WHEN d.release_date IS NULL THEN 'Unknown'
         ELSE 'Known'
    END AS release_date_avaialble
FROM ratings r 
LEFT JOIN dates d ON r.movie_id=d.movie_id
