WITH src_ratings AS (
    SELECT * FROM {{ ref('src_ratings') }}
),

src_tags AS (
    SELECT * FROM {{ ref('src_tags') }}
)

SELECT DISTINCT user_id 
FROM (
    SELECT * FROM src_ratings
    UNION
    SELECT * FROM src_tags
)
