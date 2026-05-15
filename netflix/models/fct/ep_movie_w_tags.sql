WITH src_movie_w_tags AS (
    SELECT * FROM {{ ref('dim_movie_w_tags') }}
)

SELECT * FROM src_movie_w_tags